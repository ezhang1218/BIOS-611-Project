# BIOS-611-Project

Bike sharing systems create an easy way for users to rent and return bikes through a network of kiosk locations. Due to the nature of covariates involved
in the decision making of renting a bike, this becomes an interesting problem for researchers to tackle. 

## Aliases
Before we begin, you will need to create a local secret.sh file to define your password. This file should contain: 

  `#!/bin/bash` 

  `export MYPWD=<yourdesiredpassword>`

Please replace <yourdesiredpassword> with your own password.
Once you have created your secret.sh file, run:

  `source aliases.sh`
 
 The aliases.sh file will be used to work with the Docker file and help set up the git repository. 

## Usage

To run this project, you will need Docker and the ability to run Docker as your current user. Please begin by building the docker container based on rocker/verse and run the R studio server. 


  `docker build . -t project1-env` 
 
  `docker run -v $(pwd):/home/rstudio -p 8787:8787 -e PASSWORD=<MYPWD> -t project1-env`


Then, connect to the machine using port 8787 by going to [http://localhost:8787/](http://localhost:8787/). The username and password will be as following:

  `Username: rstudio` 
 
  `Password: MYPWD (the one you set earlier)`


Now, you should be able to access my files in my folder which contains all the files for this project.  


## Makefile

The makefile will help build components of the report. To build figures, run in Rstudio terminal the command

  `make Figures/<figurename>.png`
  
For example, to create the correlation matrix figure, run in Rstudio terminal:
  
  `make Figures/correlation_matrix.png`
  


## Running Shiny App

The shiny app allows us to understand the nature of the data through a k-means clustering, grouping certain continuous variables together given a number of clusters.

Please start the Shiny app by first launching docker:

  `docker run -v $(pwd):/home/rstudio -e PASSWORD=<MYPWD> -p 8787:8787 -p 8788:8788 -t project1-env`

Then, go to [http://localhost:8787/](http://localhost:8787/). 

Finally, use Rstudio terminal in the server and enter 

 `PORT=8788 make shiny_app`

Rstudio terminal should then output with a website.

To run the app, please click the website link. Or, go to [http://localhost:8788/ ](http://localhost:8788/).  


  



