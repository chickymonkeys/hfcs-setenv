# hfcs-setenv
A Stata package to configure a good env to work with the HFCS, setting a
standard project. It set the standard environment in order to work at every HFCS
dataset, with standard pathnames save in the sclass and global macros to refer
at your project directories in a simple way.

Syntax
======

__`setenv`__ _data_(string) _workspace_(string) \[ _gfmt_(string) \]

The **setenv** command takes three arguments at maximum, two are compulsory and
the third is optional:

    arguments               Description
    ---------------------------------------------------------------------------
    data(_pathname_)        the absolute `PATHNAME` where the root folder of
                            the dataset is located as a string __`PATHNAME`__
    workspace(_pathaname_)  the absolute `PATHNAME` where you want to set your
                            workspace as a string __`PATHNAME`__ (created if
                            does not exists)
    gfmt(_graphFormat_)     the file format for your exported graphs during the
                            analysis
    ---------------------------------------------------------------------------

N.B. Remember to ALWAYS use only absolute pathnames when you specify the
location of the directories, otherwise it does not work. This has been
set like that to save the full pathnames in the s() class.

Description
===========

**setenv** simplifies the analysis on the HFCS dataset by setting a
standard environement in which you can perform your analysis. It allows
to create the directory tree at the specified **PATHNAME** when the
command is run:

./workspace ./workspace/data ./workspace/data/graphs
./workspace/data/tables ./workspace/references ./workspace/programs
./workspace/text

It also saves the absolute **PATHNAME** of those folders in the s()
class, as also the **PATHNAME** of the dataset's root directory. The
**PATHNAME** of the single waves is also saved in s(wave2) and s(wave2)
whether the datasets are inside the folders **wave1** and **wave2** in
the specified dataset root directory.

Stored Results
==============

setenv stores the following in s(): Macros\
e(survey) absolute PATHNAME of the HFCS datasets' root folder e(wave1)
absolute PATHNAME of the HFCS first wave dataset's root folder e(wave2)
absolute PATHNAME of the HFCS second wave dataset's root folder
e(workspace) absolute PATHNAME of the workspace's root folder e(data)
absolute PATHNAME of the workspace output's subfolder e(graphs) absolute
PATHNAME of the workspace output graphs' subfolder e(tables) absolute
PATHNAME of the workspace output tables' subfolder e(programs) absolute
PATHNAME of the workspace dofiles' subfolder e(references) absolute
PATHNAME of the workspace documentation's subfolder e(text) absolute
PATHNAME of the workspace subfolder for comments and working papers
e(graphFormat) preferred graph format's extension

Author
======

Alessandro Pizzigolotto
(c) European Central Bank

------------------------------------------------------------------------

This help file was dynamically produced by [MarkDoc Literate Programming
package](http://www.haghish.com/markdoc/)
