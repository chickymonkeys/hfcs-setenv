# hfcs-setenv
A Stata package to configure a good env to work with the HFCS, setting a
standard project. It set the standard environment in order to work at every HFCS
dataset, with standard pathnames save in the sclass and global macros to refer
at your project directories in a simple way.

Syntax
======

__`setenv`__, _data_( _string_ ) _workspace_( _string_ ) \[ _gfmt_( _string_ ) \]

The **setenv** command takes three arguments at maximum, two are compulsory and
the third is optional:

    arguments          Description
    ---------------------------------------------------------------------------
    data(string)       the absolute PATHNAME where the root folder of
                            the dataset is located as a string PATHNAME
    workspace(string)  the absolute PATHNAME where you want to set your
                            workspace as a string PATHNAME (created if
                            does not exists)
    gfmt(string)       the file format for your exported graphs during the
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

`~/workspace`
`~/workspace/data`
`~/workspace/data/graphs`
`~/workspace/data/tables`
`~/workspace/references`
`~/workspace/programs`
`~/workspace/text`

It also saves the absolute **PATHNAME** of those folders in the s()
class, as also the **PATHNAME** of the dataset's root directory. The
**PATHNAME** of the single waves is also saved in s(wave2) and s(wave2)
whether the datasets are inside the folders **wave1** and **wave2** in
the specified dataset root directory.

Stored Results
==============

setenv stores the following in `s()` and global macros:

__Macros__ and __Global Macros__:

__`e(survey)`__, __`$SURVEY`__           absolute __PATHNAME__ of the HFCS datasets' root folder
__`e(wave1)`__, __`$WAVE1`__             absolute __PATHNAME__ of the HFCS first wave dataset's root folder
__`e(wave2)`__, __`$WAVE2`__             absolute __PATHNAME__ of the HFCS second wave dataset's root folder
__`e(workspace)`__, __`$WORKSPACE`__     absolute __PATHNAME__ of the workspace's root folder
__`e(data)`__, __`$DATA`__               absolute __PATHNAME__ of the workspace output's subfolder
__`e(graphs)`__, __`$GRAPHS`__           absolute __PATHNAME__ of the workspace output graphs' subfolder
__`e(tables)`__, __`$TABLES`__           absolute __PATHNAME__ of the workspace output tables' subfolder
__`e(programs)`__, __`$PROGRAMS`__       absolute __PATHNAME__ of the workspace dofiles' subfolder
__`e(references)`__, __`$REFERENCES`__   absolute __PATHNAME__ of the workspace documentation's subfolder
__`e(text)`__, __`$TEXT`__               absolute __PATHNAME__ of the workspace subfolder for comments and working papers
__`e(graphFormat)`__, __`$GRAPHFORMAT`__ preferred graph format's extension

Author
======

Alessandro Pizzigolotto
(c) European Central Bank

------------------------------------------------------------------------

This help file was dynamically produced by [MarkDoc Literate Programming
package](http://www.haghish.com/markdoc/)
