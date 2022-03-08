# universe [![universe status badge](https://ropensci.r-universe.dev/badges/universe)](https://ropensci.r-universe.dev)


> Tools for Working with [R-universe](https://r-universe.dev)

## Installation and docs

You can install the development version of universe from r-universe:

``` r
install.packages("universe", repos = "https://ropensci.r-universe.dev")
```

Documentation is available on https://docs.ropensci.org/universe
 
## Enable a repository

Use `runiverse::add()` to opt-in to a package repository (this will modify your `options('repos')` list).

``` r
# Install a package from r-universe
universe::add("ropensci")
install.packages("magick")
```

For more details see the documentation for [runiverse::add()](https://docs.ropensci.org/universe/reference/add.html).
