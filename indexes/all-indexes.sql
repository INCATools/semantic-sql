CREATE INDEX statements_spo ON statements(subject,predicate,object);
CREATE INDEX statements_spv ON statements(subject,predicate,value);
CREATE INDEX statements_p ON statements(predicate);

CREATE INDEX entailed_edge_spo on entailed_edge(subject, predicate, object);
CREATE INDEX entailed_edge_sp on entailed_edge(subject, predicate);
