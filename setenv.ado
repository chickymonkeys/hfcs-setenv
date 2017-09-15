/*** DO NOT EDIT THIS LINE -----------------------------------------------------
Version: 1.0.1
Title: setenv
Author: Alessandro Pizzigolotto (github: @chickymonkeys)
Desription: set the standard environment in order to work at every HFCS
dataset, with standard pathnames save in the sclass to refer at your project
directories in a simple way.
[GitHub](http://www.github.com/chickymonkeys/hfcs-setenv) website
(c) European Central Bank
----------------------------------------------------- DO NOT EDIT THIS LINE ***/

/***
Syntax:
======

{p}
{cmd: setenv} {it:data{(help strings:string)}} {it:workspace({help strings:string)}} [ {it:gfmt({help strings:string)}} ]
{p_end}

The __setenv__ command takes three arguments at maximum, two are compulsory and
the third is optional:

{marker arguments}{...}
{synoptset 20 tabbed}{...}
{synopthdr:arguments}
{synoptline}
{synopt:{opt data(_pathname_)}} the absolute `PATHNAME` where the root folder
of the dataset is located as a string __`PATHNAME`__ {p_end}
{synopt:{opt workspace(_pathaname_)}} the absolute `PATHNAME` where you want to
set your workspace as a string __`PATHNAME`__ (created if does not exists) {p_end}
{synopt:{opt gfmt(_graphFormat_)}} the file format for your exported graphs
during the analysis {p_end}
{synoptline}
{p2colreset}{...}

N.B. Remember to ALWAYS use only absolute pathnames when you specify the
location of the directories, otherwise it does not work. This has been set like
that to save the full pathnames in the s() class.

Description
===========

__setenv__ simplifies the analysis on the HFCS dataset by setting a standard
environement in which you can perform your analysis. It allows to create the
directory tree at the specified __PATHNAME__ when the command is run:

./workspace
./workspace/data
./workspace/data/graphs
./workspace/data/tables
./workspace/references
./workspace/programs
./workspace/text

It also saves the absolute __PATHNAME__ of those folders in the {cmd:s()} class,
as also the __PATHNAME__ of the dataset's root directory. The __PATHNAME__ of
the single waves is also saved in {cmd:s(wave2)} and {cmd:s(wave2)} whether
the datasets are inside the folders __wave1__ and __wave2__ in the specified
dataset root directory.

Stored Results
==============

{marker results}{...}

{cmd:setenv} stores the following in {cmd:s()}:
{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(survey)}}absolute PATHNAME of the HFCS datasets' root folder{p_end}
{synopt:{cmd:e(wave1)}}absolute PATHNAME of the HFCS first wave dataset's root folder{p_end}
{synopt:{cmd:e(wave2)}}absolute PATHNAME of the HFCS second wave dataset's root folder{p_end}
{synopt:{cmd:e(workspace)}}absolute PATHNAME of the workspace's root folder{p_end}
{synopt:{cmd:e(data)}}absolute PATHNAME of the workspace output's subfolder{p_end}
{synopt:{cmd:e(graphs)}}absolute PATHNAME of the workspace output graphs' subfolder{p_end}
{synopt:{cmd:e(tables)}}absolute PATHNAME of the workspace output tables' subfolder{p_end}
{synopt:{cmd:e(programs)}}absolute PATHNAME of the workspace dofiles' subfolder{p_end}
{synopt:{cmd:e(references)}}absolute PATHNAME of the workspace documentation's subfolder{p_end}
{synopt:{cmd:e(text)}}absolute PATHNAME of the workspace subfolder for comments and working papers{p_end}
{synopt:{cmd:e(graphFormat)}}preferred graph format's extension{p_end}
{p2colreset}{...}

Author
======

Alessandro Pizzigolotto
European Central Bank

- - -

This help file was dynamically produced by
[MarkDoc Literate Programming package](http://www.haghish.com/markdoc/)

***/

* cap prog drop setenv
* to launch markdoc, use db markdoc which launches its GUI
* or markdoc "path.ado" , export(sthlp) helplayout replace install build date noisily
* before running it change cd to the directory of the ado file

*! setenv v1.0.1 APizzigolotto 11sep2017
program define setenv, sclass
    * version 1.0.1
    * set env datapath workspace graphformat, wave(1 OR 2 OR both)
    * capture syntax, data(string) work(string) [fmt(string)]
    * capture syntax anything(min=2 max=3 strL)
    capture syntax, data(string) workspace(string) [gfmt(string)]

    if _rc {
        di as err "there's an error in the syntax or the pathnames"
        exit 198
    }

    * clear smacros
    sreturn clear
    * save in smacros the main paths
    sreturn local survey      = "`data'"
    sreturn local workspace   = "`workspace'"
    * TODO check if gfmt exists
    sreturn local graphFormat = "`gfmt'"


    * standard project scheme in the documentation
    local subdir    = "data programs references text"
    local subsubdir = "graphs tables"

    * assumption: datasets subfolders are named after the wave as wave1 or wave2
    * no matter the database version, then we save the value pathname of the
    * folder of the two waves (if there is the distinction between the two waves,
    * otherwise I set only the datapath)
    capture confirm file "`s(survey)'/nul"
    if _rc {
        di "error: there's no data folder at the indicated path. end."
        exit
    }

    qui cd "`s(survey)'"
    di "... datasets are situated in `s(survey)' (pathname saved in survey)"
    forvalues i = 1/2 {
        capture confirm file "`s(survey)'/wave`i'/nul"
        if !_rc {
            sreturn local wave`i' = "`s(survey)'/wave`i'"
            di "... wave `i' is situated in `s(survey)'/wave`i' (pathname saved in wave`i')"
        }
    }

    di char(13) char(10)

    * build the workspace (if does not exist)
    capture confirm file "`s(workspace)'/nul"
    if _rc {
        mkdir "`s(workspace)'"
        scalar flag = 1
        * to generate a line break, it is a good practice to use carriage return
        * char(13) and line feed char(10) together
        di "... workspace folder does not exist at the indicated path... new folder created." char(13) char(10)
    }

    qui cd "`s(workspace)'"
    foreach d in `subdir' {

        capture confirm file "`s(workspace)'/`d'/nul"

        if _rc {

            mkdir "`s(workspace)'/`d'"
            di "... subfolder `d' added to the workspace."

            if "`d'" == "data" {
                foreach dd in `subsubdir' {
                    mkdir "`s(workspace)'/`d'/`dd'"
                    di "... subfolder `d'/`dd' added to the workspace."
                }
            }

        }

        if "`d'" == "data" {
            foreach dd in `subsubdir' {
                capture confirm file "`s(workspace)'/`d'/`dd'/nul"

                if _rc {
                    mkdir "`s(workspace)'/`d'/`dd'"
                    di "... subfolder `d'/`dd' added to the workspace."
                }

                sreturn local `dd' = "`s(workspace)'/`d'/`dd'"

            }
        }

        sreturn local `d' = "`s(workspace)'/`d'"

    }

    * some graph settings:
    * set a sans-serif fontface as Arial
    graph set window fontface "Arial"
    * set default scheme for the graphs as the report (if exists)
    capture set scheme ecb2015

    di "the following shortcuts has been created:"
    sreturn list

end
