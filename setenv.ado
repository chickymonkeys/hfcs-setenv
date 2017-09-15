********************************************************************************
* Version: 1.0.0                                                               *
* Title: setenv                                                                *
* Author: Alessandro Pizzigolotto (gitlab: @dubidub)                           *
* Description: set the environment to work at your HFCS dataset, with standard *
* global variables to be used in your programmes                               *
********************************************************************************

* NB: use only absolute pathnames
* cap prog drop setenv
*! setenv v1.0.1 APizzigolotto 11sep2017
program define setenv, sclass
    * version 1.0.1
    * set env datapath workspace graphformat, wave(1 OR 2 OR both)
    * capture syntax, data(string) work(string) [fmt(string)]
    * capture syntax anything(min=2 max=3 strL)
    syntax, data(string) workspace(string) [gfmt(string)]

    if _rc {
        di as err "there's an error in the syntax or the pathnames"
        exit 198
    }

    * clear smacros
    sreturn clear
    * save in smacros the main paths
    sreturn local survey      = "`data'"
    sreturn local workspace   = "`workspace'"
    sreturn local graphFormat = "`fmt'"


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
