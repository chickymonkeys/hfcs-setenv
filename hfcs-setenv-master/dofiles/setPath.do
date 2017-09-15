********************************************************************************
* Version:     1.0.0                                                           *
* Title:       setenv                                                          *
* Author:      Alessandro Pizzigolotto (gitlab: @dubidub)                      *
*                                                                              *
* Description: This is an utility .do file which sets the pathnames to work    *
* at the HFCS dataset, with standard global variables to be used in your       *
* programs. We define the main workspace directory where projects are stored,  *
* the data directory where waves are stored and it defines the projects.       *
* N. B. : Remember to run this standalone file before every main.do file and   *
* every do file to define the working directories.                             *
********************************************************************************

program drop _all
discard

clear
clear matrix

set more off
set matsize 11000, permanently

* set the timer
timer on 1

* set utility folder
global UTILITIES "P:/ECB business areas/DGR/Databases and Programme files/DGR/Alessandro Pizzigolotto/utilities"

* set global macro for HFCS DATA PATHNAMES: locally on the database
global WORKSPACE "P:/ECB business areas/DGR/Databases and Programme files/DGR/Alessandro Pizzigolotto"

* Jirka's Discussion Paper Project
* global WORKSPACE "P:\ECB business areas\DGR\Databases and Programme files\MPR\D - Other projects\Slacalek - DP Distr Effects of MP"

* where the dataset data are collocated
global HFCSDATA  "C:\Users\pizzigo\Documents\hfcs"
* dataset names with path
global WAVE1     "$HFCSDATA\HFCS_UDB_1_3_Stata"
* global WAVE2     "$HFCSDATA\HFCS_User_DataBase_2_0_Stata"
global WAVE2     "$HFCSDATA\HFCS_UDB_2_1_STATA"

cd "$WORKSPACE"

* set the current project ENV MACROS
do "$UTILITIES/setenv/setProject.do"

* load the encodestrings program to convert sa0100 (just in case)
* set the current project ENV MACROS
do "$UTILITIES/datahand/encodestrings.do"

* verify if the xml tool for the tables is already installed (if needed)
* ssc install xml_tab

* verify if outreg2 is already installed (if needed)
* ssc install outreg2

* set a sans-serif fontface as Arial
graph set window fontface "Arial"

* set default scheme for the graphs as the report
set scheme ecb2015

* set a global variable for pre0-determined graph format
global graphFormat "pdf"

* if we need to build a complete derived dataset
* only for strange reasons, use the supplementary files D_compl.dta datasets.
* do "$UTILITIES/setenv/createCompl.do"
* if we need to append the two waves from the different folders
* do "$UTILITIES/datahand/appendWaves.do"

timer off 1
timer list 1
