Analysis workflow
================
Pep Porrà
May 9, 2020

Goal
----

To investigate tools to implement a DS analysis workflow that makes as easy as possible to start an analysis in `R` that:

1.  It is sharable
2.  It is reproducible
3.  It is extensible

Tools and Packages
------------------

### `installr` package

It makes it easier to upgrade `R` and other packages, for instance RTools [link](https://cran.r-project.org/web/packages/installr/index.html)

``` r
library(installr)
```

    ## Warning: package 'installr' was built under R version 3.5.3

    ## Loading required package: stringr

    ## Warning: package 'stringr' was built under R version 3.5.3

    ## 
    ## Welcome to installr version 0.22.0
    ## 
    ## More information is available on the installr project website:
    ## https://github.com/talgalili/installr/
    ## 
    ## Contact: <tal.galili@gmail.com>
    ## Suggestions and bug-reports can be submitted at: https://github.com/talgalili/installr/issues
    ## 
    ##          To suppress this message use:
    ##          suppressPackageStartupMessages(library(installr))

### `RTools`

`RTools` package is required to build packages that work in Windows [link](https://cran.r-project.org/bin/windows/Rtools/history.html). A new version exist for `R` 4.0.0 [link](https://cran.r-project.org/bin/windows/Rtools/)

We first check if `RTools` is installed using the `find_rtools` function in `devtools` package

``` r
library(devtools)
```

    ## Warning: package 'devtools' was built under R version 3.5.3

    ## Loading required package: usethis

    ## Warning: package 'usethis' was built under R version 3.5.3

``` r
find_rtools()
```

    ## [1] TRUE

``` r
warning_1 <- 'WARNING: Rtools is required to build R packages, but is not currently installed.
Please download and install Rtools custom from http://cran.r-project.org/bin/windows/Rtools/.'
```

fucntion `install_Rtools(check = TRUE)` does not work. I downloaded version 3.5 directly from [RTools](https://cran.r-project.org/bin/windows/Rtools/history.html). Download the version required and execute it. I have chosen to add it to path and not to add it to registry.

### R version info

We can obatin info about the session we are in with the function in the package `utils`

``` r
R.version
```

    ##                _                           
    ## platform       x86_64-w64-mingw32          
    ## arch           x86_64                      
    ## os             mingw32                     
    ## system         x86_64, mingw32             
    ## status                                     
    ## major          3                           
    ## minor          5.2                         
    ## year           2018                        
    ## month          12                          
    ## day            20                          
    ## svn rev        75870                       
    ## language       R                           
    ## version.string R version 3.5.2 (2018-12-20)
    ## nickname       Eggshell Igloo

### R session info

Using the package `utils`,

``` r
sessionInfo()
```

    ## R version 3.5.2 (2018-12-20)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 18362)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=Spanish_Spain.1252  LC_CTYPE=Spanish_Spain.1252   
    ## [3] LC_MONETARY=Spanish_Spain.1252 LC_NUMERIC=C                  
    ## [5] LC_TIME=Spanish_Spain.1252    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] devtools_2.2.2  usethis_1.5.1   installr_0.22.0 stringr_1.4.0  
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_1.0.4.6      knitr_1.21        magrittr_1.5     
    ##  [4] pkgload_1.0.2     R6_2.3.0          rlang_0.4.5      
    ##  [7] fansi_0.4.0       tools_3.5.2       pkgbuild_1.0.6   
    ## [10] xfun_0.4          sessioninfo_1.1.1 cli_2.0.2        
    ## [13] withr_2.1.2       remotes_2.1.1     htmltools_0.4.0  
    ## [16] ellipsis_0.3.0    rprojroot_1.3-2   yaml_2.2.0       
    ## [19] digest_0.6.18     assertthat_0.2.0  crayon_1.3.4     
    ## [22] processx_3.4.2    callr_3.4.3       ps_1.3.0         
    ## [25] fs_1.3.2          testthat_2.3.2    memoise_1.1.0    
    ## [28] glue_1.3.0        evaluate_0.12     rmarkdown_1.11   
    ## [31] stringi_1.2.4     compiler_3.5.2    backports_1.1.3  
    ## [34] desc_1.2.0        prettyunits_1.0.2

Using devtools package

``` r
session_info()
```

    ## - Session info ----------------------------------------------------------
    ##  setting  value                       
    ##  version  R version 3.5.2 (2018-12-20)
    ##  os       Windows 10 x64              
    ##  system   x86_64, mingw32             
    ##  ui       RTerm                       
    ##  language (EN)                        
    ##  collate  Spanish_Spain.1252          
    ##  ctype    Spanish_Spain.1252          
    ##  tz       Europe/Berlin               
    ##  date     2020-05-09                  
    ## 
    ## - Packages --------------------------------------------------------------
    ##  package     * version date       lib source        
    ##  assertthat    0.2.0   2017-04-11 [1] CRAN (R 3.5.2)
    ##  backports     1.1.3   2018-12-14 [1] CRAN (R 3.5.2)
    ##  callr         3.4.3   2020-03-28 [1] CRAN (R 3.5.3)
    ##  cli           2.0.2   2020-02-28 [1] CRAN (R 3.5.3)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.5.2)
    ##  desc          1.2.0   2018-05-01 [1] CRAN (R 3.5.2)
    ##  devtools    * 2.2.2   2020-02-17 [1] CRAN (R 3.5.3)
    ##  digest        0.6.18  2018-10-10 [1] CRAN (R 3.5.2)
    ##  ellipsis      0.3.0   2019-09-20 [1] CRAN (R 3.5.3)
    ##  evaluate      0.12    2018-10-09 [1] CRAN (R 3.5.2)
    ##  fansi         0.4.0   2018-10-05 [1] CRAN (R 3.5.2)
    ##  fs            1.3.2   2020-03-05 [1] CRAN (R 3.5.3)
    ##  glue          1.3.0   2018-07-17 [1] CRAN (R 3.5.2)
    ##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.5.3)
    ##  installr    * 0.22.0  2019-08-02 [1] CRAN (R 3.5.3)
    ##  knitr         1.21    2018-12-10 [1] CRAN (R 3.5.2)
    ##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.5.2)
    ##  memoise       1.1.0   2017-04-21 [1] CRAN (R 3.5.2)
    ##  pkgbuild      1.0.6   2019-10-09 [1] CRAN (R 3.5.3)
    ##  pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.5.2)
    ##  prettyunits   1.0.2   2015-07-13 [1] CRAN (R 3.5.2)
    ##  processx      3.4.2   2020-02-09 [1] CRAN (R 3.5.3)
    ##  ps            1.3.0   2018-12-21 [1] CRAN (R 3.5.2)
    ##  R6            2.3.0   2018-10-04 [1] CRAN (R 3.5.2)
    ##  Rcpp          1.0.4.6 2020-04-09 [1] CRAN (R 3.5.3)
    ##  remotes       2.1.1   2020-02-15 [1] CRAN (R 3.5.3)
    ##  rlang         0.4.5   2020-03-01 [1] CRAN (R 3.5.3)
    ##  rmarkdown     1.11    2018-12-08 [1] CRAN (R 3.5.2)
    ##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.5.2)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.5.2)
    ##  stringi       1.2.4   2018-07-20 [1] CRAN (R 3.5.2)
    ##  stringr     * 1.4.0   2019-02-10 [1] CRAN (R 3.5.3)
    ##  testthat      2.3.2   2020-03-02 [1] CRAN (R 3.5.3)
    ##  usethis     * 1.5.1   2019-07-04 [1] CRAN (R 3.5.3)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.2)
    ##  xfun          0.4     2018-10-23 [1] CRAN (R 3.5.2)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.2)
    ## 
    ## [1] C:/Users/josep.PORTATIL-ISABEL/Documents/R/win-library/3.5
    ## [2] C:/Program Files/R/R-3.5.2/library

### A proposed workflow

The package `usethis` <https://usethis.r-lib.org/index.html> simplifies the setup of a project by:

-   Creating a folder for the analysis
-   Creating an RStudio project in the new folder
-   Initializing a local git repo in that folder
-   Opening a new RStudio session for the new project (so, working directory is in the new folder)

These workflows are well explained in [Happy Git and GitHub for the useR](https://happygitwithr.com/)

#### GitHub first (SSH)

1.  Create a Github new repo.
2.  Clone it as ssh. It searches for the key at: %HOME%/.ssh and must have name: id\_rsa
3.  Copy the ssh string in the clone with ssh
4.  In RStudio, Create New project as git repo.
5.  Copy the test in the git URL, chose the folder
6.  You can commit any chnage to your local repo and push it later to remote.
7.  Every time we push, it will ask for the passphrase.
8.  To avoid it, we can run pageant and add the key we are using (It does not work)

#### GitHub first (HTTPS)

1.  Create a Github new repo.
2.  Clone it as https.
3.  Copy the https string in the clone with https
4.  In RStudio, Create New project as git repo.
5.  Copy the test in the git URL, chose the folder
6.  You can commit any change to your local repo and push it later to remote.
7.  The PAT (github token must passed to .Renviron, see how to check it below)

#### Using `usethis`

Three steps

*1* Create the new Rstudio project and folder. A new session of Rstusio will be open

``` r
# 1. create folder and create a new Rproj there.
create_project(path = "C:/Users/josep.PORTATIL-ISABEL/Documents/R/...", open = TRUE, rstudio = TRUE)
```

*2* Create a local git repository. Rstudio will be rebooted to add the Git tab in Rstudio

``` r
# 2. Init a local git repo in that directory
use_git()
```

*3* Finally, create the GitHub repo. We can choose if connect via HTTPS (recommended) or ssh. Github repo will open. We can modifiy repo description

``` r
#3. create a remote repo in github 
use_github()
```

We can checnk all the project setup with

``` r
usethis::git_sitrep()
```

    ## Git user
    ## * Name: 'pep1024'
    ## * Email: 'josepmporra@gmail.com'
    ## * Vaccinated: FALSE
    ## usethis + git2r
    ## * Default usethis protocol: <unset>
    ## * git2r supports SSH: TRUE
    ## * Credentials: '<usethis + git2r default behaviour>'
    ## GitHub
    ## * Personal access token: '<found in env var>'
    ## * User: 'pep1024'
    ## * Name: <unset>
    ## Repo
    ## * Path: 'C:/Users/josep.PORTATIL-ISABEL/Documents/R/create_project/.git'
    ## * Local branch -> remote tracking branch: 'master' -> 'origin/master'
    ## GitHub pull request readiness
    ## * origin: pep1024/create_project, can push
    ## * upstream: '<no such remote>'
