# read this excelent article on make
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

help: ## Shows commands help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Default - top level rule is what gets ran when you run just `make`
pull.stardog:
> mkdir ~/stardog-home
> docker pull stardog/stardog:latest
> docker run -ti -v ~/stardog-home/:/var/opt/stardog -p 5820:5820 stardog/stardog

run.stardog:
> docker run --name stardog -d -v ~/stardog-home/:/var/opt/stardog -p 5820:5820 stardog/stardog

run.stardog.get-ghc:
> curl https://brickschema.org/ttl/gtc_brick.ttl -o ~/stardog-home/ghc.ttl

run.stardog.import.ghc:
> docker exec -ti stardog /opt/stardog/bin/stardog-admin db create -n myDB /var/opt/stardog/ghc.ttl

run.stardog.query.ghc:
> docker exec -ti stardog /opt/stardog/bin/stardog query myDB "SELECT DISTINCT ?s WHERE { ?s ?p ?o } LIMIT 10"

cleanup:
> docker stop stardog
> docker rm -f stardog stardog/stardog
> rm -rf ~/stardog-home
