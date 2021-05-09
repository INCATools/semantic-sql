-- NOTE: these are created automatically if you use rdftab.rs

--CREATE TABLE prefix (
--  prefix TEXT PRIMARY KEY,
--  base TEXT NOT NULL
--);

CREATE TABLE statements (
      stanza TEXT,
      subject TEXT,
      predicate TEXT,
      object TEXT,
      value TEXT,
      datatype TEXT,
      language TEXT,
      PRIMARY KEY(subject, predicate, object, value)
    );
