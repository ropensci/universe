
<!-- README.md is generated from README.Rmd. Please edit that file -->

# universe

<!-- badges: start -->

[![universe status
badge](https://ropensci.r-universe.dev/badges/universe)](https://ropensci.r-universe.dev)
[![R-CMD-check](https://github.com/ropensci/universe/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ropensci/universe/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/ropensci/universe/graph/badge.svg)](https://app.codecov.io/gh/ropensci/universe)
<!-- badges: end -->

> Tools for Working with [R-universe](https://r-universe.dev) and its
> APIs.

## Installation and docs

You can install the development version of universe from r-universe:

``` r
install.packages("universe", repos = "https://ropensci.r-universe.dev")
```

Or the development version of universe from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ropensci/universe")
```

Documentation is available on <https://docs.ropensci.org/universe>.

## Enable a repository

Use `runiverse::add()` to opt-in to a package repository (this will
modify your `options('repos')` list).

``` r
# Install a package from r-universe
universe::add("ropensci")
install.packages("magick")
```

For more details see the documentation for
[runiverse::add()](https://docs.ropensci.org/universe/reference/add.html).

## Get data from the APIs

### All packages in an universe

``` r
library(universe)
#> 
#> Attaching package: 'universe'
#> The following object is masked from 'package:base':
#> 
#>     remove
universe_ls("jeroen")
#>  [1] "RAppArmor" "V8"        "badgen"    "base64"    "bcrypt"    "brotli"   
#>  [7] "curl"      "gpg"       "js"        "jsonlite"  "maketools" "mongolite"
#> [13] "openssl"   "protolite" "rjade"     "sys"       "unix"      "webp"     
#> [19] "webutils"
```

### Info on all packages in an universe

``` r
universe_all_packages("jeroen", limit = 1) |>
  str(max.level = 2)
#> List of 1
#>  $ :List of 77
#>   ..$ Package           : chr "V8"
#>   ..$ Type              : chr "Package"
#>   ..$ Title             : chr "Embedded JavaScript and WebAssembly Engine for R"
#>   ..$ Version           : chr "6.0.0"
#>   ..$ Authors@R         : chr "c(\nperson(\"Jeroen\", \"Ooms\", role = c(\"aut\", \"cre\"), email = \"jeroenooms@gmail.com\",\ncomment = c(ORC"| __truncated__
#>   ..$ Description       : chr "An R interface to V8 <https://v8.dev>: Google's open\nsource JavaScript and WebAssembly engine. This package ca"| __truncated__
#>   ..$ License           : chr "MIT + file LICENSE"
#>   ..$ URL               : chr "https://jeroen.r-universe.dev/V8"
#>   ..$ BugReports        : chr "https://github.com/jeroen/v8/issues"
#>   ..$ SystemRequirements: chr "V8 engine version 6+ is needed for ES6 and WASM\nsupport. On Linux you can build against libv8-dev (Debian) or\"| __truncated__
#>   ..$ NeedsCompilation  : chr "yes"
#>   ..$ VignetteBuilder   : chr "knitr"
#>   ..$ RoxygenNote       : chr "7.3.1"
#>   ..$ Roxygen           : chr "list(load = \"installed\", markdown = TRUE)"
#>   ..$ Language          : chr "en-US"
#>   ..$ Encoding          : chr "UTF-8"
#>   ..$ Biarch            : chr "true"
#>   ..$ Repository        : chr "https://jeroen.r-universe.dev"
#>   ..$ RemoteUrl         : chr "https://github.com/jeroen/v8"
#>   ..$ RemoteRef         : chr "HEAD"
#>   ..$ RemoteSha         : chr "8d5312779708b6bc13970b199363296d0776fb86"
#>   ..$ Packaged          :List of 2
#>   ..$ Author            : chr "Jeroen Ooms [aut, cre] (<https://orcid.org/0000-0002-4035-0289>),\nJan Marvin Garbuszus [ctb]"
#>   ..$ Maintainer        : chr "Jeroen Ooms <jeroenooms@gmail.com>"
#>   ..$ MD5sum            : chr "b3e85490797b360b69df1da61f516c6c"
#>   ..$ _user             : chr "jeroen"
#>   ..$ _type             : chr "src"
#>   ..$ _file             : chr "V8_6.0.0.tar.gz"
#>   ..$ _fileid           : chr "b3e85490797b360b69df1da61f516c6c"
#>   ..$ _filesize         : int 196083
#>   ..$ _sha256           : chr "57e4fdd75a66b70e1acfb642252435e7b9f67e1deb596ce7c3979b276712df67"
#>   ..$ _created          : chr "2024-10-12T10:13:37.000Z"
#>   ..$ _published        : chr "2024-10-12T21:19:45.180Z"
#>   ..$ _buildurl         : chr "https://github.com/r-universe/jeroen/actions/runs/11304816202"
#>   ..$ _status           : chr "success"
#>   ..$ _windevel         : chr "success"
#>   ..$ _linuxdevel       : chr "success"
#>   ..$ _wasmbinary       : chr "none"
#>   ..$ _macbinary        : chr "success"
#>   ..$ _winbinary        : chr "success"
#>   ..$ _pkgdocs          : chr "skipped"
#>   ..$ _upstream         : chr "https://github.com/jeroen/v8"
#>   ..$ _commit           :List of 5
#>   ..$ _maintainer       :List of 6
#>   ..$ _distro           : chr "noble"
#>   ..$ _host             : chr "GitHub-Actions"
#>   ..$ _registered       : logi TRUE
#>   ..$ _dependencies     :List of 8
#>   ..$ _owner            : chr "jeroen"
#>   ..$ _selfowned        : logi TRUE
#>   ..$ _usedby           : int 311
#>   ..$ _updates          :List of 13
#>   ..$ _tags             : list()
#>   ..$ _topics           :List of 3
#>   ..$ _stars            : int 199
#>   ..$ _contributions    :List of 10
#>   ..$ _userbio          :List of 4
#>   ..$ _downloads        :List of 2
#>   ..$ _mentions         : int 2
#>   ..$ _devurl           : chr "https://github.com/jeroen/v8"
#>   ..$ _searchresults    : int 496
#>   ..$ _assets           :List of 11
#>   ..$ _homeurl          : chr "https://github.com/jeroen/v8"
#>   ..$ _realowner        : chr "jeroen"
#>   ..$ _cranurl          : logi TRUE
#>   ..$ _releases         :List of 49
#>   ..$ _exports          :List of 6
#>   ..$ _help             :List of 3
#>   ..$ _readme           : chr "https://github.com/jeroen/v8/raw/HEAD/README.md"
#>   ..$ _rundeps          :List of 3
#>   ..$ _sysdeps          :List of 2
#>   ..$ _vignettes        :List of 2
#>   ..$ _score            : num 15.5
#>   ..$ _indexed          : logi TRUE
#>   ..$ _nocasepkg        : chr "v8"
#>   ..$ _universes        :List of 1
#>   ..$ _binaries         :List of 9
```

### Info on a single package in an universe

``` r
universe_one_package("jeroen", package = "curl") |>
  str(max.level = 1)
#> List of 75
#>  $ Package           : chr "curl"
#>  $ Type              : chr "Package"
#>  $ Title             : chr "A Modern and Flexible Web Client for R"
#>  $ Version           : chr "5.3.0"
#>  $ Authors@R         : chr "c(\nperson(\"Jeroen\", \"Ooms\", role = c(\"aut\", \"cre\"), email = \"jeroenooms@gmail.com\",\ncomment = c(ORC"| __truncated__
#>  $ Description       : chr "The curl() and curl_download() functions provide highly\nconfigurable drop-in replacements for base url() and\n"| __truncated__
#>  $ License           : chr "MIT + file LICENSE"
#>  $ SystemRequirements: chr "libcurl: libcurl-devel (rpm) or\nlibcurl4-openssl-dev (deb)."
#>  $ URL               : chr "https://jeroen.r-universe.dev/curl https://curl.se/libcurl/"
#>  $ BugReports        : chr "https://github.com/jeroen/curl/issues"
#>  $ VignetteBuilder   : chr "knitr"
#>  $ RoxygenNote       : chr "7.3.0"
#>  $ Encoding          : chr "UTF-8"
#>  $ Language          : chr "en-US"
#>  $ Roxygen           : chr "list(markdown = TRUE)"
#>  $ Repository        : chr "https://jeroen.r-universe.dev"
#>  $ RemoteUrl         : chr "https://github.com/jeroen/curl"
#>  $ RemoteRef         : chr "HEAD"
#>  $ RemoteSha         : chr "37aca3b93d3082209794eed27c99212c4903b84e"
#>  $ NeedsCompilation  : chr "yes"
#>  $ Packaged          :List of 2
#>  $ Author            : chr "Jeroen Ooms [aut, cre] (<https://orcid.org/0000-0002-4035-0289>),\nHadley Wickham [ctb],\nRStudio [cph]"
#>  $ Maintainer        : chr "Jeroen Ooms <jeroenooms@gmail.com>"
#>  $ MD5sum            : chr "88721d8a74b9afab9b3e59d918296792"
#>  $ _user             : chr "jeroen"
#>  $ _type             : chr "src"
#>  $ _file             : chr "curl_5.3.0.tar.gz"
#>  $ _fileid           : chr "88721d8a74b9afab9b3e59d918296792"
#>  $ _filesize         : int 312593
#>  $ _sha256           : chr "d762b7b7a7f40530c9f604d0639e5e3f15050b26513ea46dc5ca8c8b08885b5a"
#>  $ _created          : chr "2024-10-11T16:17:13.000Z"
#>  $ _published        : chr "2024-10-12T11:35:18.760Z"
#>  $ _buildurl         : chr "https://github.com/r-universe/jeroen/actions/runs/11295724327"
#>  $ _status           : chr "success"
#>  $ _windevel         : chr "success"
#>  $ _linuxdevel       : chr "success"
#>  $ _wasmbinary       : chr "none"
#>  $ _macbinary        : chr "success"
#>  $ _winbinary        : chr "success"
#>  $ _pkgdocs          : chr "skipped"
#>  $ _upstream         : chr "https://github.com/jeroen/curl"
#>  $ _commit           :List of 5
#>  $ _maintainer       :List of 6
#>  $ _distro           : chr "noble"
#>  $ _host             : chr "GitHub-Actions"
#>  $ _registered       : logi TRUE
#>  $ _dependencies     :List of 9
#>  $ _owner            : chr "jeroen"
#>  $ _selfowned        : logi TRUE
#>  $ _usedby           : int 5564
#>  $ _updates          :List of 14
#>  $ _tags             :List of 2
#>  $ _stars            : int 216
#>  $ _contributions    :List of 20
#>  $ _userbio          :List of 4
#>  $ _downloads        :List of 2
#>  $ _mentions         : int 21
#>  $ _devurl           : chr "https://github.com/jeroen/curl"
#>  $ _searchresults    : int 3392
#>  $ _assets           :List of 11
#>  $ _homeurl          : chr "https://github.com/jeroen/curl"
#>  $ _realowner        : chr "jeroen"
#>  $ _cranurl          : logi TRUE
#>  $ _releases         :List of 46
#>  $ _exports          :List of 41
#>  $ _help             :List of 18
#>  $ _readme           : chr "https://github.com/jeroen/curl/raw/HEAD/README.md"
#>  $ _rundeps          : list()
#>  $ _sysdeps          :List of 1
#>  $ _vignettes        :List of 2
#>  $ _score            : num 19.6
#>  $ _indexed          : logi TRUE
#>  $ _nocasepkg        : chr "curl"
#>  $ _universes        :List of 1
#>  $ _binaries         :List of 9
```

### Search within a single universe

``` r
universe_search("ropensci", query = 'needs:httr2', limit = 1) |>
  str(max.level = 2)
#> List of 5
#>  $ results:List of 1
#>   ..$ :List of 15
#>  $ query  :List of 2
#>   ..$ _universes: chr "ropensci"
#>   ..$ _rundeps  : chr "httr2"
#>  $ skip   : int 0
#>  $ limit  : int 1
#>  $ total  : int 32
```

### Search among all universes

``` r
global_search(query = '"weather data"', limit = 1) |>
  str(max.level = 2)
#> List of 5
#>  $ results:List of 1
#>   ..$ :List of 16
#>  $ query  :List of 1
#>   ..$ $text:List of 2
#>  $ skip   : int 0
#>  $ limit  : int 1
#>  $ total  : int 70
```
