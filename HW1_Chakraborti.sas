/* Sayan Chakraborti */
/* HW_1 */

/* #1a */
options nodate linesize=78 ;
data mydata;
input name $ Score1 Score2 Score3 Score4 Score5 Final;
datalines;
Gamma1 11.25 9.75 10 10 10 90
Delta1 9.5 7.5 8 10 10 95
Epsilon1 11.5 10 9.75 3.5 10 100
Theta1 12.5 10 9.5 9 10 100
;
run;
proc print data=mydata;
	var name score3 final; 
run; 

/* #1b */
options nodate linesize=78 ;
data mydata2;
input name $ Score1 Score2 Score3 Score4 Score5 Final @@;
datalines;
Gamma1 11.25 9.75 10 10 10 90 Delta1 9.5 7.5 8 10 10 95
Epsilon1 11.5 10 9.75 3.5 10 100 Theta1 12.5 10 9.5 9 10 100
;


/* #2 */
data mydata3;
input name $ 1-14 from $ 16-26 to $ 28-37 pounds_million 39-44;
datalines;
Benjamin Mendy Monaco      Man City   52.0
Alvaro Morata  Real Madrid Chelsea    58.0
Romelu Lukaku  Everton     Man United 75.0
Neymar         Barcelona   PSG        199.8 
;
run;
proc print data=mydata3; 
run;