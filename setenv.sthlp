{smcl}
{right:version 1.0.1}
{title:Title}

{phang}
{cmd:setenv} {hline 2} {c 96}"set the standard environment in order to work at every HFCS dataset,"{c 39} {c 96}"with standard pathnames save in the sclass and global macros to refer at your"{c 39}
 {c 96}"project directories in a simple way."{c 39}
 {c 96}"[GitHub](http://www.github.com/chickymonkeys/hfcs-setenv) website"{c 39}
 {c 96}"(c) European Central Bank"{c 39}
 


{title:{c 96}"Syntax:"{c 39}}

{c 96}"{cmd:setenv}, {it:data}(help strings) {it:workspace}(help strings) [ {it:gfmt}(help strings) ]"{c 39}

{c 96}"The {bf:setenv} command takes three arguments at maximum, where two are compulsory"{c 39}
{c 96}"and the third is optional:"{c 39}

{c 96}"{synoptset 20 tabbed}{...}"{c 39}

{c 96}"{synoptline}"{c 39}

{c 96}"{synopt:{opt data(help string)}}specify the {bf:PATHNAME} of the dataset root"{c 39}
{c 96}"folder in absolute terms with a string. {p{it:end}"{c 39}

{c 96}"{synopt:{opt workspace(help string)}}specify the {bf:PATHNAME} of the workspace"{c 39}
{c 96}"root folder in absolute terms (created if it does not exists). {p{it:end} "{c 39}

{c 96}"{synopt:{opt gfmt(help string)}}specify the file format for your exported graphs"{c 39}
{c 96}"during the analysis. {p{it:end}"{c 39}

{c 96}"N. B. : Remember to ALWAYS use only absolute pathnames when you specify"{c 39}
{c 96}"the location of the directories, otherwise there could be issues in referring to"{c 39}
{c 96}"the folders. This has be set to save the full pathnames in the {c 96}s(){c 96} class and"{c 39}
{c 96}"the global macros."{c 39}


{title:{c 96}"Folder Tree Description:"{c 39}}


{c 96}"{bf:setenv} simplifies the beginning of the analysis on the HFCS dataset by setting"{c 39}
{c 96}"a standard environment in which performing it, for a working paper or whatever else."{c 39}
{c 96}"It allows to create the directory tree at the specified {bf:PATHNAME} when the"{c 39}
{c 96}"command is run:"{c 39}

{c 96}"{phang}{c 29}"{c 39}
    {cmd: ~ /workspace}
    {cmd: ~ /workspace/data}
    {cmd: ~ /workspace/data/graphs}
    {cmd: ~ /workspace/data/tables}
    {cmd: ~ /workspace/references}
    {cmd: ~ /workspace/programs}
    {cmd: ~ /workspace/text}
{c 96}"{p{it:end}"{c 39}


{c 96}"It also saves the absolute {bf:PATHNAME} of those folders in the {cmd:s()} class,"{c 39}
{c 96}"as also the {bf:PATHNAME} of the dataset{c 39}s root directory. The {bf:PATHNAME} of"{c 39}
{c 96}"the single waves is also saved in {cmd:s(wave2)} and {cmd:s(wave2)} whether"{c 39}
{c 96}"the datasets are inside the folders {bf:wave1} and {bf:wave2} in the specified"{c 39}
{c 96}"dataset root directory."{c 39}


{title:{c 96}"Stored Results"{c 39}}

{c 96}"{marker results}{...}"{c 39}

{c 96}"{cmd:setenv} stores the following in {cmd:s()}:"{c 39}
{c 96}"{synoptset 20 tabbed}{...}"{c 39}
{c 96}"{p2col 5 20 24 2: Macros}{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(survey)}}absolute PATHNAME of the HFCS datasets{c 39} root folder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(wave1)}}absolute PATHNAME of the HFCS first wave dataset{c 39}s root folder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(wave2)}}absolute PATHNAME of the HFCS second wave dataset{c 39}s root folder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(workspace)}}absolute PATHNAME of the workspace{c 39}s root folder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(data)}}absolute PATHNAME of the workspace output{c 39}s subfolder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(graphs)}}absolute PATHNAME of the workspace output graphs{c 39} subfolder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(tables)}}absolute PATHNAME of the workspace output tables{c 39} subfolder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(programs)}}absolute PATHNAME of the workspace dofiles{c 39} subfolder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(references)}}absolute PATHNAME of the workspace documentation{c 39}s subfolder{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(text)}}absolute PATHNAME of the workspace subfolder for comments and working papers{p{it:end}"{c 39}
{c 96}"{synopt:{cmd:e(graphFormat)}}preferred graph format{c 39}s extension{p{it:end}"{c 39}
{c 96}"{p2colreset}{...}"{c 39}


{title:{c 96}"Author"{c 39}}

{c 96}"Alessandro Pizzigolotto"{c 39}
{c 96}"[GitHub](http://www.github.com/chickymonkeys/hfcs-setenv) website"{c 39}
{c 96}"(c) European Central Bank"{c 39}

{c 96}"- - -"{c 39}

{c 96}"This help file was dynamically produced by"{c 39}
{c 96}"[MarkDoc Literate Programming package](http://www.haghish.com/markdoc/)"{c 39}


