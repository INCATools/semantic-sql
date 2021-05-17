#!/bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
db=""
verbose=0

while getopts "h?fvrd:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    f)  force=1
        ;;
    v)  verbose=1
        ;;
    r)  report=1
        ;;
    d)  db=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift


if [[ $verbose == 1 ]]; then
   echo "verbose=$verbose, db='$db', Files: $@"
fi

if [[ "$db" == "" ]]; then
    echo "Must pass --db"
    exit -1
fi

if [[ -f $db ]]; then
    if [[ $force == 1 ]]; then
        if [[ $verbose == 1 ]]; then
            echo "Replacing: $db"
        fi
        rm $db
    else
        echo "ERROR: file exists: $db"
        echo "Use -f to force replacement"
        exit -1
    fi
fi

cat ddl/semsql.sql | sqlite3 $db
sqlite3 $db -cmd ".mode csv" -cmd ".import prefixes/prefixes.csv prefix" "SELECT COUNT(*) FROM prefix"

echo loading "$@"
if [[ "$@" == "" ]]; then
    echo "No files to load; exiting"
    exit 0
fi

for owlf in "$@"
do
    if [[ $verbose == 1 ]]; then
        echo "Loading: $owlf"
    fi
    ./bin/rdftab $db < $owlf
    echo "Counting statements"
    sqlite3 $db "SELECT COUNT(*) FROM statements"
    echo "Loading relation-graph inferences"
    bn="$(basename $owlf .owl)"
    inf_file="inferences/$bn-inf.tsv"
    if [[ -f $inf_file ]]; then
        echo "Loading inferences $inf_file"
        sqlite3 $db -cmd '.separator "\t"' ".import $inf_file entailed_edge"
        sqlite3 $db "SELECT COUNT(*) AS num_edges FROM entailed_edge"        
    else
        echo "No inference file: $inf_file"
        echo "TODO: add ability to run command to generate this"
    fi
done
echo "## Indexing"
cat sql/indexes.sql | sqlite3 $db

if [[ $report == 1 ]]; then
    echo "## Problems"
    sqlite3 $db "SELECT * FROM all_problems"
    echo "## Predicates"
    sqlite3 $db "SELECT * FROM count_of_predicates"
    echo "## Class Count"
    sqlite3 $db "SELECT * FROM count_of_instantiated_classes"
    echo ## Reports
    sqlite3 -cmd ".echo on" -cmd ".headers on" $db < reports/query-semsql.sql  > reports/out.txt 2> reports/err.txt
    if grep -q "Error" reports/err.txt; then
        echo "ERRORS"
        cat reports/err.txt
        exit -1
    else
        exit 0
    fi
fi
