import click
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from src.semsql.sqla import Statements, TextualTransformation

ps = PorterStemmer()


def stem(s: str):
    toks = word_tokenize(s)
    toks = [ps.stem(tok) for tok in toks]
    return " ".join(toks)


@click.command()
@click.argument("inputs", nargs=-1)
def cli(inputs):
    for db in inputs:
        engine = create_engine(f"sqlite:///{db}")
        Session = sessionmaker(bind=engine)
        session = Session()
        for row in (
            session.query(Statements.value)
            .where(Statements.value.isnot(None))
            .distinct()
        ):
            s = row.value
            tv = stem(s)
            tt = TextualTransformation(subject=s, predicate="stem", value=tv)
            session.add(tt)
            # print(tt)
            # session.flush()
        session.commit()


if __name__ == "__main__":
    cli()
