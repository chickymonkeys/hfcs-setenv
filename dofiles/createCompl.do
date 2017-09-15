********************************************************************************
* Utility .do file to merge all the implicates of derived and household        *
* subdatasets of the HFCS dataset, in order to work on descriptive statistics  *
* create charts and tables and more.                                           *
*                                                                              *
* N. B. : It needs the settings in setPath.do                                  *
*                                                                              *
* Author: Alessandro Pizzigolotto                                              *
********************************************************************************

* First Wave
use "$WAVE1\D1.dta", clear
append using "$WAVE1\D2.dta"
append using "$WAVE1\D3.dta"
append using "$WAVE1\D4.dta"
append using "$WAVE1\D5.dta"

save "$WAVE1\D_compl.dta", replace

* First Wave
use "$WAVE2\D1.dta", clear
append using "$WAVE2\D2.dta"
append using "$WAVE2\D3.dta"
append using "$WAVE2\D4.dta"
append using "$WAVE2\D5.dta"

save "$WAVE2\D_compl.dta", replace

* if we need also Households' Detailed Information
*
use "$WAVE1\H1.dta", clear
append using "$WAVE1\H2.dta"
append using "$WAVE1\H3.dta"
append using "$WAVE1\H4.dta"
append using "$WAVE1\H5.dta"
*
merge 1:1 id im0100 using "$WAVE1\D_compl.dta"
drop _merge
save "$WAVE1\D_compl.dta", replace
*
use "$WAVE2\H1.dta", clear
append using "$WAVE2\H2.dta"
append using "$WAVE2\H3.dta"
append using "$WAVE2\H4.dta"
append using "$WAVE2\H5.dta"
*
merge 1:1 id im0100 using "$WAVE2\D_compl.dta"
drop _merge
save "$WAVE2\D_compl.dta", replace
*
