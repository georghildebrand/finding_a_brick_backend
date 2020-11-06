# Evaluating a graph backend for brickschema

I am currently researching what database backend is best for storing ontologies like Brick. This repo documents some on the notes and learning during the search for appropriate database backend.

Features I am looking for are:

- SHACL validation
- SPARQL api
- turtle / RDF import
- Integration of RDF and OWL standards
- Scaling and distributed
- under active development

A discussion is also available here: https://groups.google.com/g/brickschema/c/duu8E2sTnrw

**Keywords**: GraphDatabase, GraphBackend, DigitalTwin

## DataBases to consider

A good list of graph databases (incl. triple stores) is provided here: https://github.com/jbmusso/awesome-graph

### HodDB

This database was build by the Brick team itself to overcome some shortcomings of traditional graph databases. So its for sure worth a look! Eg. brick graphs are usually small compared to other RDF graphs, so complex SPO-hexaindexing is overhead. Also regarding SPARQL requirements Brick has special reqs..

Sadly at the time of this writing (11/2020) HodDB is not really under active dev.

The following paper gives a good introduction to the topic and nice overview on how Brickschema is involved technically:https://brickschema.org/papers/HodDB-TOSN-2018-Fierro.pdf

HodDb website:
http://hoddb.org/making/

### Stardog

Stardog is an proprietary graph database targeting especially towards applications around Knowledge graphs, Digital Twins etc.

A good getting started section is found her: https://www.stardog.com/get-started/ and https://www.stardog.com/docs/#_starting_stardog

```bash
make pull.stardog
make run.stardog
make run.stardog.import.ghc
run.stardog.import.ghc
```

Open: http://localhost:5820 (User: admin, pw: admin )

### Dgraph

Open source and completely written with performance, scale and resiliency in mind. Dgraph seems to be a good fit for everyone interested in building a knowledge graph.
