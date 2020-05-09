# Steps to create a new project in an automatic way
library(usethis)

# 1. create folder and create a new Rproj there.
# A new session of RStudio will be launched
create_project(path = "C:/Users/josep.PORTATIL-ISABEL/Documents/R/test_usethis_3", open = TRUE, rstudio = TRUE)

# 2. Init a local git repo in that directory
# RStudio must be rebooted
use_git()

#this fucntion allows you to create a PAT Token in GitHub
#browse_github_token()
# Add the PAT key by adding it to .Renviron
edit_r_environ()
# Check that the PAT is configured
Sys.getenv("GITHUB_PAT")
github_token()

#3. create a remote repo in github
# Choose method HTTPS.
# description will be in blank. It can be chnaged in github repo. 
# GitHub repo will be open in explorer
use_github()

# Equivalent using ssh
create_project(path = "C:/Users/josep.PORTATIL-ISABEL/Documents/R/test_usethis_4", open = TRUE, rstudio = TRUE)
use_git()
use_github(protocol = "ssh")
# It will ask for the passphrase

## Check the configuration
usethis::git_sitrep()
