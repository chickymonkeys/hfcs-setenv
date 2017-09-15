********************************************************************************
* This .do file defines the working directory where you store the PROJECT,     *
* which contains the .do files in the directory "dofiles", other documents in  *
* the directory "docs" and outputs in the direcotry "output", divided between  *
* graphs and tables. This is the standard configuration of my projects         *
*                                                                              *
* Author: Alessandro Pizzigolotto                                              *
********************************************************************************

* save the project name
* global PROJECTNAME "Household Fragility in the Euro Area"
global PROJECTNAME "Household Heterogeneity and the Transmission of Monetary Policy"

* save the project root pathname
* Miguel Household Fragility ESRB Note
* global PROJECTS "$WORKSPACE\Household-Fragility"
* Jirka Discussion Paper on the Transmission of Monetary Policy
* global PROJECTS "$WORKSPACE\Distributional-Effect-MP"
* -> in Jirka's Workspace Folder
* global PROJECTS "$WORKSPACE"
* Oreste Tasks
global PROJECTS "$WORKSPACE\Oreste"

* we work on our workspace in the virtual hard drive
* standard configuration of the project folder
global DOCS      "$PROJECTS\docs"
global TABLES    "$PROJECTS\output\tables"
global GRAPHS    "$PROJECTS\output\graphs"
global DOFILES   "$PROJECTS\dofiles"

* Jirka's Discussion Paper Project
* global DOCS        "$PROJECTS\references"
* global TABLES      "$PROJECTS\data\tables"
* global GRAPHS      "$PROJECTS\data\graphs"
* global DOFILES     "$PROJECTS\programs"

