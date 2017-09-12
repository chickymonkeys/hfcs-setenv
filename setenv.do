* totally clean the environment before starting
* to put it into the profile.do file, it is not possible to declare them
* into a program (don't use delimiters please, ffs)
capture program drop _all

discard

clear
clear matrix

set more off
set matsize 11000, permanently


*! setenv v1.0.1 APizzigolotto 11sep2017
program define setenv, sclass
    version 1.0.1
    * set env datapath workspace graphformat, wave(1 OR 2 OR both)
    capture syntax, data(string) dir(string) [fmt(string)]

    if _rc {
        di as err "there's an error in the syntax or the pathnames"
        exit 198
    }

    * divide in proper local macros the string
    * and clear s() macros
    sreturn clear
    sreturn local data        = "`1'"
    sreturn local workspace   = "`2'"
    sreturn local graphFormat = "`3'"

    * standard project scheme in the documentation
    local subdir    = "data programs references text"
    local subsubdir = "graphs tables"

    * assumption: datasets subfolders are named after the wave as wave1 or wave2
    * no matter the database version, then we save the value pathname of the
    * folder of the two waves (if there is the distinction between the two waves,
    * otherwise I set only the datapath)
    capture confirm file "`data'"
    if _rc {
        di "error: there's no data folder at the indicated path. end."
        exit
    }

    cd "`data'"
    di "... datasets are situated in `data' (pathname saved in data)"
    forvalues i = 1/2 {
        capture confirm file "`data'/wave`i'"
        if !_rc {
            sreturn local wave`i' = "`data'/wave`i'"
            di "... wave `i' is situated in `data'/wave`i' (pathname saved in wave`i')."
        }
    }

    * build the workspace (if does not exist)
    capture confirm file "`workspace'"
    if _rc {
        mkdir "`workspace'"
        scalar flag = 1
        * to generate a line break, it is a good practice to use carriage return
        * char(13) and line feed char(10) together
        di "... workspace folder does not exist at the indicated path... new folder created." + char(13) + char(10)
    }

    cd "`workspace'"
    foreach d in `subdir' {

        capture confirm file "`workspace'/`d'/nul"

        if _rc {

            mkdir "`workspace'/`d'/"
            di "... subfolder `d' added to the workspace."

            if "`d'" == "data" {
                foreach dd in `subsubdir' {
                    mkdir "`workspace'/`d'/`dd'"
                    di "... subfolder `d'/`dd' added to the workspace."
                }
            }

        }

        sreturn local `d' = "`workspace'/`d'/"

        foreach dd in `subsubdir' {
            capture confirm file "`workspace'/`d'/`dd'/nul"

            if _rc {
                mkdir "`workspace'/`d'/`dd'"
                di "... subfolder `d'/`dd' added to the workspace."
            }

            sreturn local `dd' = "`workspace'/`d'/`dd'"

        }

    }

    * some graph settings:
    * set a sans-serif fontface as Arial
    graph set window fontface "Arial"
    * set default scheme for the graphs as the report (if exists)
    capture set scheme ecb2015

    di "the following shortcuts has been created:" + char(13) + char(10)
    sreturn list

end


* NB: use only absolute pathnames, and use slashes
setenv, data("C:/Users/pizzigo/Documents/hfcs") dir("P:/ECB business areas/DGR/Databases and Programme files/DGR/Alessandro Pizzigolotto/try") fmt("pdf")
