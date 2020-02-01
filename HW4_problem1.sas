FILENAME study "/folders/myfolders/oil costs hw4.txt";
data oil;
infile study firstobs=5 ;
INPUT date 1-6 dome 7-12 impor 13-18 comp 19-24; 
TITLE "Oil Acquisition Data";

/*Problem 1.a  */
proc ttest data=oil sides=L alpha=0.05  h0=20;
VAR dome;
RUN;

/*The t-statistic for this test is -8.26 and the corresponding p-value is
<0.0001. So we cannot reject the null hypothesis at 5% level and
conclude that the true average of rain is not different from 10.
*/

/*Problem 1.b  */
proc ttest data=oil sides=2 alpha=0.05  h0=15;
VAR impor;
RUN;
/*The t-statistic for this test is 5.40  and the corresponding p-value is
<0.0001. So we cannot reject the null hypothesis at 5% level and
conclude that the true average of rain is not different from 10.
*/

/* Problem 1.c */
PROC MEANS N MEAN STDERR T PRT;
VAR dome impor;
RUN;
/*for both domestic and imported the corresponding p-value is <.0001 so we
reject the null hypothesis at 5% level.  */


FILENAME study2 "/folders/myfolders/oil costs hw4 part 2.txt";
data oil2;
infile study2;
INPUT dome impor; 
TITLE "Oil Acquisition Data Part 2";
/* Problem 1.d  */
PROC TTEST data=oil2;
VAR dome impor;
RUN;

/* Problem 1.e  */
PROC ANOVA DATA=oil2;
CLASS impor;
    /* They do seem to have a relationship because of 
    similar p-values*/
MODEL dome = impor;
MEANS impor / tukey;
run;


