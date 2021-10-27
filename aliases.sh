# handy aliases for working with the docker file
# and doing other stuff

source secret.sh

alias bu='docker build . -t p1-env --build-arg linux_user_pwd='
alias dr='docker run -v /c/Users/ezhan/Desktop/BIOS-611-Project:/home/rstudio -p 8787:8787 -e PASSWORD= -t p1-env'
alias hc='docker run -p 8711:8000 -v /c/Users/ezhan/Desktop/BIOS-611-Project:/host -it p1-env hovercraft /host/slides.rst'
alias hcb='docker run -v /c/Users/ezhan/Desktop/BIOS-611-Project:/host -it p1-env hovercraft /host/slides.rst /host/html_presentation'
alias py='docker run -p 8765:8765 -v /c/Users/ezhan/Desktop/BIOS-611-Project:/home/rstudio -it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765"'

alias r='docker run -v /c/Users/ezhan/Desktop/BIOS-611-Project:/home/rstudio -e PASSWORD= -it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias b='docker run -v /c/Users/ezhan/Desktop/BIOS-611-Project:/home/rstudio -e PASSWORD=-it p1-env sudo -H -u rstudio /bin/bash -c "cd ~/; /bin/bash"'


start_shiny(){
    docker run -p : -v /c/Users/ezhan/Desktop/BIOS-611-Project:/home/rstudio -e PASSWORD= -it shiny sudo -H -u rstudio /bin/bash -c "cd ~/; PORT= make "
}
