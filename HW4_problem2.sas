FILENAME study "/folders/myfolders/oil costs hw4.txt";
data oil;
infile study firstobs=5 ;
INPUT date 1-6 dome 7-12 impor 13-18 comp 19-24; 
TITLE "Oil Acquisition Data";
/*Problem 2.a  */
PROC PLOT data=oil;
plot dome*date;
run;
/*Problem 2.b  */
PROC PLOT data=oil;
plot impor*date;
run;
/*Problem 2.c  */
PROC PLOT data=oil;
plot dome*date impor*date / overlay;
run;