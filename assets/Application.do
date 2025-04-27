import delimited "\\tsclient\Drives\2024 York RA\Jorda 2005\is_new.csv", clear
save "\\tsclient\Drives\2024 York RA\Jorda 2005\is_new.dta", replace

clear
graph drop _all
cap drop all
use "\\tsclient\Drives\2024 York RA\Jorda 2005\is_new.dta"
describe
summarize

* might need to install this package for eststo
* ssc install estout

* Choose impulse response horizon
local hmax = 12

/* Generate LHS variables for the LPs */

* levels
* variable EM
tsset time
forvalues h = 0/`hmax' {
	gen y_`h' = f`h'.y 
}
 
/* Run the LPs */
* Levels
eststo clear
cap drop b u d Years Zero
gen Years = _n-1 if _n<=`hmax'
gen Zero =  0    if _n<=`hmax'
gen b=0
gen u=0
gen d=0
forv h = 0/`hmax' {
	* output gap p=4 shock = infl
	* pick (0/4) and (1/3) as replicated from Jorda LP_example code
	 newey y_`h' l(0/4).infl l(1/3).y l(1/3).inte, lag(`h')
replace b = _b[infl]                    if _n == `h'+1
replace u = _b[infl] + 1.645* _se[infl]  if _n == `h'+1
replace d = _b[infl] - 1.645* _se[infl]  if _n == `h'+1
eststo
}
* nois esttab , se nocons keep(gs1)
gen b_level = b

twoway ///
(rarea u d  Years,  ///
fcolor(gs13) lcolor(gs13) lw(none) lpattern(solid)) ///
(line b Years, lcolor(blue) ///
lpattern(solid) lwidth(thick)) ///
(line Zero Years, lcolor(black)), legend(off) ///
title("Impulse response of Output gap to Inflation", color(black) size(medsmall)) ///
ytitle("Percent", size(medsmall)) xtitle("Year", size(medsmall)) ///
graphregion(color(white)) plotregion(color(white))