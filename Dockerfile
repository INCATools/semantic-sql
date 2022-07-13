FROM obolibrary/odkfull
LABEL maintainer="cjmungall@lbl.gov" \
      name="semanticsql" \
      version="0.0.1"

WORKDIR /semsql

RUN pip install semsql

COPY *Makefile .
COPY reports/obo.tsv ./reports/


CMD [ "make -k all RUN=" ]
