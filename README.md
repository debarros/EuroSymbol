# EuroSymbol
Code to get the Euro currency symbol to appear in a div in a shiny app

The div() function in shiny converts & to &amp;.  
This is problematic if you want to use the html code for a special character, such as the euro symbol.
The functions.R file provides new versions of the radioButtons and generateOptions functions.
This only fixes the error in radioButtons, not in any other situation.
To fix the situation more generally, the generateOptions function would need to be completely replaced with the one included here.
Then, any function that called generateOptions would not have the same problem.
Note that this might create new errors if you are actually passing the & character to something that calls generateOptions.
