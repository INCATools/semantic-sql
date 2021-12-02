# semantic-sql etc. for subgraph visualizations

*Note: The steps below were executed on a system that already had  `semantic-sql` installed. In order to simulate a fresh install, `semantic-sql` and its dependencies `rdftab` and `relation-graph` were either deleted, moved out of the system execution path, or renamed.*

*Additionally:*

```shell
pip cache purge
brew uninstall jena npm graphviz
```



**Whether you have any of these components installed or not, those cleanup steps shouldn't be required.**



## versions used

- macOS BigSur 11.6
- `python` 3.9.9
- `sqlite3` 3.32.3 2020-06-18 14:16:19


| Hardware | Attributes |
| ---- | ---- |
| Model Identifier | MacBookPro16,1 |
| Processor Name | 8-Core Intel Core i9 |
| Processor Speed | 2.4 GHz |
| Hyper-Threading Technology | Enabled |
| Memory | 32 GB |



Most of the installation steps should apply to most computers with contemporary, mainstream hardware and operating systems. The installation of `jena` uses the `homebrew` package manager on MacOS.

Windows systems or MacOS systems using a different package manager will require a different approach. 



**TODO: document installation of `jena` etc. on Ubuntu Linux**



----

 

In the root of my GitHub repos folder:

```shell
git clone git@github.com:cmungall/semantic-sql.git

cd semantic-sql
```

 

*The repo seems to start off with a broken link bin/relation-graph. Delete that before making the dependencies*

```shell
rm -f bin/relation-graph
make bin/relation-graph
make bin/rdftab
```



Then put these dependencies on your path, either temporarily 

```shell
export PATH="$PATH:./bin"
```

*Or persistently by modifying your shell (Bash, zsh, whatever) startup script(s)*

 

Install `jena`. For MacOS systems with the homebrew package manager installed:

```shell
brew install jena
```



Configure python environment:

```shell
python3 -m venv venv 
source venv/bin/activate
pip install wheel
pip install -r requirements.txt
brew install npm
```



Get a sample data and go through the experience of processing it with `semantic-sql`

```shell
curl -L -s http://purl.obolibrary.org/obo/pato.owl > owl/pato.owl
make db/pato.db
```



Here's a query that show that inferred realtionships have been materialized:

```she
sqlite3 db/pato.db "select * from entailed_edge limit 10"
```

**TODO: join with labels**



Run the tests for tehir own sake, and also to prepare a database with a "nucleus subset" of the Gene Ontology:

```she
make test
```

*Lots of output but "Ran 0 tests in 0.000s"*

 

Confirm that the `go-nucleus.db` database has been built by the tests:

```shell
sqlite3 tests/inputs/go-nucleus.db "select * from statements limit 10"
```



Confirm that the `subgraph` utility works

```shell
utils/subgraph -d tests/inputs/go-nucleus.db -m label nucle% -p s,BFO:0000050
```

*Generates reasonable output like* 

> GO:0005635 "nuclear envelope" --[BFO:0000050 "part of"]--> GO:0005634 "nucleus"

But

> utils/subgraph: line 3: conda: command not found
>
> utils/subgraph: line 4: conda: command not found

*Harmless helpers for users that have conda installed?*

 

Now try creating an obographviz with subgraph:

*Note more additions to the temporary system path and more use of the `jena` package manager*

```shell
npm install obographviz
export PATH="$PATH:./node_modules/obographviz/bin"
brew install graphviz
./utils/subgraph \
	-d tests/inputs/go-nucleus.db \
	-m label nucle% \
	-f viz \
	-p s,BFO:0000050 \
	-s conf/obograph-style.json \
	-C 'containmentRelations: [rdfs:subClassOf]'
```

*Note: the README suggests installing `obographviz` with `npm`'s -g flag.*



## More things to try

- See the notes for using within Docker on the README
- Try `attach`ing other SQLite databases (also in the README)
- Try to configure `s3cmd` and use it to pull some pre-built `semantic-sql` databases



```she
brew install s3cmd 
```

*May require a brew force operation to link the Python six module*

```shell
s3cmd ls s3://bbop-sqlite
```

*Full path = https://s3.amazonaws.com/bbop-sqlite/*

*Requires some setup… credentials?*



## Errors when following the README verbatim

```shell
make bin/relation-graph
```

> *ln: ./relation-graph: File exists*
>
> **make: *** [bin/relation-graph] Error 1*



```shell
make target/pato.views
```

> make: *** No rule to make target `target/pato.views'. Stop.

 

```shell
sqlite3 db/pato.db -cmd "SELECT * FROM problems"
```

> Error: no such table: problems

*There is a problem table, but that's empty*

> sqlite> select * from problem ;
>
> sqlite>  

