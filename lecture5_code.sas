/* Example 5.1*  */
OPTIONS LINESIZE=65 NODATE;

TITLE 'Class Example';
DATA CLASS;
INPUT Name $ Height Weight Age @@;
DATALINES;
Alfred 69.0 112.5 14 Alice 56.5 84.0 13  Barbara 65.3 98.0 13
Carol 62.8 102.5 14 Henry 63.5 102.5 14 James 57.3 83.0 12
Jane 59.8 84.5 12 Janet 62.5 112.5 15 Jeffrey 62.5 84.0 13
John 59.0 99.5 12 Joyce 51.3 50.5 11 Judy 64.3 90.0 14
Louise 56.3 77.0 12 Mary 66.5 112.0 15 Philip 72.0 150.0 16
Robert 64.8 128.0 12 Ronald 67.0 133.0 15 Thomas 57.5 85.0 11
William 66.5 112.0 15
;
RUN;


PROC PLOT DATA=class HPCT=50 VPCT=50;
PLOT (weight height age);
RUN;

PROC CORR DATA=class;
VAR WEIGHT HEIGHT AGE;
RUN;  

/* Example 5.2 */
PROC REG data=Class;
MODEL Weight = Height ;
OUTPUT out = outdata r = resid p = yhat;
RUN;


proc print data=outdata;
run;

proc plot data = outdata;
plot resid*yhat;
title 'Model Checking - Residuals vs Y-hat';
run;

proc univariate normal data=outdata;
var resid;
probplot resid  / normal(mu=est sigma=est);
title 'Model checking - Normal test and plot';
run;
*/



/* Example 5.3 */ 

title 'Tree Example';
DATA tree;
INPUT diameter height volume @@;
x1 = log(diameter);
if (log(height)> 4.4) then x2 = '3';
else if (log(height)> 4.2) then x2 = '2';
else x2 = '1';
y = log(volume);
label x2 = 'CATEGORIZED LOG-HEIGHT: 1 = SHORT 2 = MEDIAN 3 = TALL';
datalines;
8.3 70 10.3 8.6 65 10.3 8.8 63 10.2 10.5 72 16.4 10.7 81 18.8 10.8 83 19.7
11.0 66 15.6 11.0 75 18.2 11.1 80 22.6 11.2 75 19.9 11.3 79 24.2 11.4 76 21.0
11.4 76 21.4 11.7 69 21.3 12.0 75 19.1 12.9 74 22.2 12.9 85 33.8 13.3 86 27.4
13.7 71 25.7 13.8 64 24.9 14.0 78 34.5 14.2 80 31.7 14.5 74 36.3 16.0 72 38.3
16.3 77 42.6 17.3 81 55.4 17.5 82 55.7 17.9 80 58.3 18.0 80 51.5 18.0 80 51.0
20.6 87 77.0
;
RUN;

PROC PRint data=tree;run;

PROC PLOT HPCT = 50 VPCT = 33;
PLOT y*(x1 x2) = '*';
RUN;

PROC GLM;               
CLASS x2;
MODEL y = x1 x2;
OUTPUT out = outdata r = resid p = yhat;  
MEANS x2;
RUN;

/*Use another procedure to do model checking*/
PROC PLOT DATA = outdata HPCT = 50 VPCT = 33;
PLOT resid*(x1 x2 yhat) = '*';
RUN;

PROC UNIVARIATE DATA = outdata plot;
VAR resid;
RUN;
