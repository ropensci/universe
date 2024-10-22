
<!-- README.md is generated from README.Rmd. Please edit that file -->

# universe

<!-- badges: start -->

[![universe status
badge](https://ropensci.r-universe.dev/badges/universe)](https://ropensci.r-universe.dev)
[![R-CMD-check](https://github.com/ropensci/universe/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ropensci/universe/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/ropensci/universe/branch/main/graph/badge.svg)](https://codecov.io/gh/ropensci/universe)
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
#>  $ :List of 75
#>   ..$ Package           : chr "curl"
#>   ..$ Type              : chr "Package"
#>   ..$ Title             : chr "A Modern and Flexible Web Client for R"
#>   ..$ Version           : chr "5.3.0"
#>   ..$ Authors@R         : chr "c(\nperson(\"Jeroen\", \"Ooms\", role = c(\"aut\", \"cre\"), email = \"jeroenooms@gmail.com\",\ncomment = c(ORC"| __truncated__
#>   ..$ Description       : chr "The curl() and curl_download() functions provide highly\nconfigurable drop-in replacements for base url() and\n"| __truncated__
#>   ..$ License           : chr "MIT + file LICENSE"
#>   ..$ SystemRequirements: chr "libcurl: libcurl-devel (rpm) or\nlibcurl4-openssl-dev (deb). Version 7.80 or up is recommended."
#>   ..$ URL               : chr "https://jeroen.r-universe.dev/curl https://curl.se/libcurl/"
#>   ..$ BugReports        : chr "https://github.com/jeroen/curl/issues"
#>   ..$ VignetteBuilder   : chr "knitr"
#>   ..$ RoxygenNote       : chr "7.3.2.9000"
#>   ..$ Encoding          : chr "UTF-8"
#>   ..$ Language          : chr "en-US"
#>   ..$ Roxygen           : chr "list(markdown = TRUE)"
#>   ..$ Repository        : chr "https://jeroen.r-universe.dev"
#>   ..$ RemoteUrl         : chr "https://github.com/jeroen/curl"
#>   ..$ RemoteRef         : chr "HEAD"
#>   ..$ RemoteSha         : chr "ee5ce3b97d73da6fa92975119ae33c1c1b19f5bf"
#>   ..$ NeedsCompilation  : chr "yes"
#>   ..$ Packaged          :List of 2
#>   ..$ Author            : chr "Jeroen Ooms [aut, cre] (<https://orcid.org/0000-0002-4035-0289>),\nHadley Wickham [ctb],\nRStudio [cph]"
#>   ..$ Maintainer        : chr "Jeroen Ooms <jeroenooms@gmail.com>"
#>   ..$ MD5sum            : chr "fc77e48f3d8c559cb5649120466da2fe"
#>   ..$ _user             : chr "jeroen"
#>   ..$ _type             : chr "src"
#>   ..$ _file             : chr "curl_5.3.0.tar.gz"
#>   ..$ _fileid           : chr "2155dffab35bc6b30bf226849e74243cbc66f0c22ba72704e99efa5319b8be81"
#>   ..$ _filesize         : int 314837
#>   ..$ _sha256           : chr "2155dffab35bc6b30bf226849e74243cbc66f0c22ba72704e99efa5319b8be81"
#>   ..$ _created          : chr "2024-10-22T13:24:39.000Z"
#>   ..$ _published        : chr "2024-10-22T13:36:33.941Z"
#>   ..$ _buildurl         : chr "https://github.com/r-universe/jeroen/actions/runs/11461117523"
#>   ..$ _status           : chr "success"
#>   ..$ _windevel         : chr "success"
#>   ..$ _linuxdevel       : chr "success"
#>   ..$ _wasmbinary       : chr "none"
#>   ..$ _macbinary        : chr "success"
#>   ..$ _winbinary        : chr "success"
#>   ..$ _pkgdocs          : chr "skipped"
#>   ..$ _upstream         : chr "https://github.com/jeroen/curl"
#>   ..$ _commit           :List of 5
#>   ..$ _maintainer       :List of 6
#>   ..$ _distro           : chr "noble"
#>   ..$ _host             : chr "GitHub-Actions"
#>   ..$ _registered       : logi TRUE
#>   ..$ _dependencies     :List of 9
#>   ..$ _owner            : chr "jeroen"
#>   ..$ _selfowned        : logi TRUE
#>   ..$ _usedby           : int 5590
#>   ..$ _updates          :List of 15
#>   ..$ _tags             :List of 2
#>   ..$ _stars            : int 216
#>   ..$ _contributions    :List of 20
#>   ..$ _userbio          :List of 4
#>   ..$ _downloads        :List of 2
#>   ..$ _mentions         : int 21
#>   ..$ _devurl           : chr "https://github.com/jeroen/curl"
#>   ..$ _searchresults    : int 3424
#>   ..$ _assets           :List of 11
#>   ..$ _homeurl          : chr "https://github.com/jeroen/curl"
#>   ..$ _realowner        : chr "jeroen"
#>   ..$ _cranurl          : logi TRUE
#>   ..$ _releases         :List of 46
#>   ..$ _exports          :List of 42
#>   ..$ _help             :List of 19
#>   ..$ _readme           : chr "https://github.com/jeroen/curl/raw/HEAD/README.md"
#>   ..$ _rundeps          : list()
#>   ..$ _sysdeps          :List of 1
#>   ..$ _vignettes        :List of 2
#>   ..$ _score            : num 19.6
#>   ..$ _indexed          : logi TRUE
#>   ..$ _nocasepkg        : chr "curl"
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
#>  $ SystemRequirements: chr "libcurl: libcurl-devel (rpm) or\nlibcurl4-openssl-dev (deb). Version 7.80 or up is recommended."
#>  $ URL               : chr "https://jeroen.r-universe.dev/curl https://curl.se/libcurl/"
#>  $ BugReports        : chr "https://github.com/jeroen/curl/issues"
#>  $ VignetteBuilder   : chr "knitr"
#>  $ RoxygenNote       : chr "7.3.2.9000"
#>  $ Encoding          : chr "UTF-8"
#>  $ Language          : chr "en-US"
#>  $ Roxygen           : chr "list(markdown = TRUE)"
#>  $ Repository        : chr "https://jeroen.r-universe.dev"
#>  $ RemoteUrl         : chr "https://github.com/jeroen/curl"
#>  $ RemoteRef         : chr "HEAD"
#>  $ RemoteSha         : chr "ee5ce3b97d73da6fa92975119ae33c1c1b19f5bf"
#>  $ NeedsCompilation  : chr "yes"
#>  $ Packaged          :List of 2
#>  $ Author            : chr "Jeroen Ooms [aut, cre] (<https://orcid.org/0000-0002-4035-0289>),\nHadley Wickham [ctb],\nRStudio [cph]"
#>  $ Maintainer        : chr "Jeroen Ooms <jeroenooms@gmail.com>"
#>  $ MD5sum            : chr "fc77e48f3d8c559cb5649120466da2fe"
#>  $ _user             : chr "jeroen"
#>  $ _type             : chr "src"
#>  $ _file             : chr "curl_5.3.0.tar.gz"
#>  $ _fileid           : chr "2155dffab35bc6b30bf226849e74243cbc66f0c22ba72704e99efa5319b8be81"
#>  $ _filesize         : int 314837
#>  $ _sha256           : chr "2155dffab35bc6b30bf226849e74243cbc66f0c22ba72704e99efa5319b8be81"
#>  $ _created          : chr "2024-10-22T13:24:39.000Z"
#>  $ _published        : chr "2024-10-22T13:36:33.941Z"
#>  $ _buildurl         : chr "https://github.com/r-universe/jeroen/actions/runs/11461117523"
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
#>  $ _usedby           : int 5590
#>  $ _updates          :List of 15
#>  $ _tags             :List of 2
#>  $ _stars            : int 216
#>  $ _contributions    :List of 20
#>  $ _userbio          :List of 4
#>  $ _downloads        :List of 2
#>  $ _mentions         : int 21
#>  $ _devurl           : chr "https://github.com/jeroen/curl"
#>  $ _searchresults    : int 3424
#>  $ _assets           :List of 11
#>  $ _homeurl          : chr "https://github.com/jeroen/curl"
#>  $ _realowner        : chr "jeroen"
#>  $ _cranurl          : logi TRUE
#>  $ _releases         :List of 46
#>  $ _exports          :List of 42
#>  $ _help             :List of 19
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
#>  $ total  : int 33
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
#>  $ total  : int 69
```
