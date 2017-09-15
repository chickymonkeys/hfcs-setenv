* totally clean the environment before starting
* to put it into the profile.do file, it is not possible to declare them
* into a program (don't use delimiters please, ffs)
capture program drop _all

discard

clear
clear matrix

set more off
set matsize 11000, permanently

* check also for updates
ssc install git
* set web-gw.ecb.de as proxy server in stata, port 8080
* substitute username and password with the internal credentials
* it installs also markdoc and weaver and statax together
* thank you https://github.com/haghish
* don't be scared, he's a nice guy afraid of research replicability
* https://www.stata.com/meeting/switzerland16/slides/haghish-switzerland16.pdf
net install github, from("https://haghish.github.io/github/")

* remember to set .gitignore_global in the home directory
* check also for updates of your own programs
* git install
* net install datahand, from(https://gitlab.com/dubidub/HFCSdatahand.git)

* net from https://mloeffler.github.io/stata/
* net install wordwrap

* NB: use only absolute pathnames, and use slashes
setenv, data("C:/Users/pizzigo/Documents/hfcs") workspace("P:/ECB business areas/DGR/Databases and Programme files/DGR/Alessandro Pizzigolotto/try") gfmt("pdf")