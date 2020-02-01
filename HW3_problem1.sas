/* Sayan Chakraborti
   HW3 
*/

/* Problem 1.1 */
FILENAME study "/folders/myfolders/wine.data";
DATA wine;
Infile study delimiter=",";
INPUT iden alco mali ash alca magn tota flav nonf proa colo hue OD28 prol; 
LABEL iden='Identifier' alco='Alcohol' mali='Malic acid' ash='Ash'
alca='Alcalinity of ash' magn='Magnesium' tota='Total phenols'
flav='Flavanoids' nonf='Nonflavanoid phenols' proa='Proanthocyanins'
colo='Color intensity' hue='Hue' OD28='OD280/OD315 of diluted wines' 
prol='Proline';
/* Problem 1.2 */
TITLE 'Wine Summary Data';
RUN;
PROC PRINT data=wine LABEL NOOBS;
RUN;
/* Problem 1.3 */
PROC means data=wine;
run;
/* Problem 1.4 */
proc univariate data=wine normal plot;
var mali;
run;
/* Problem 1.5 */
PROC CHART data=wine;
VBAR mali/subgroup=iden;
RUN;
/* Problem 1.6 */
proc sgplot data=wine;
 scatter x=mali y=ash / group=iden;
run;



