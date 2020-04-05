# Steps to create a new project in an automatic way
library(usethis)

# 1. create folder and create a new Rproj there.
create_project(path = "C:/Users/josep.PORTATIL-ISABEL/Documents/R/shiny_game", open = FALSE, rstudio = TRUE)

# 2. Init a local git repo in that directory
use_git()

# 3. create a remote repo in github
use_github(protocol = "ssh")

git_credentials()

my_cred <- git2r::cred_ssh_key(
  publickey = "/Users/josep.PORTATIL-ISABEL/Documents/.ssh/public_git_pep",
  privatekey = "/Users/josep.PORTATIL-ISABEL/Documents/.ssh/private_git_pep.ppk", 
  passphrase = "juliajoel")

use_git_credentials(my_cred)