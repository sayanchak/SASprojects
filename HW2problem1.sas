/* Sayan Chakraborti */
/* HW2 */

/* Problem 1.1 */
FILENAME roster "/folders/myfolders/tennis for hw2.dat";
DATA tennis;
INFILE roster firstobs=3;
INPUT name $1-21 matches wins losses bagels_served bagels_eaten male;
RUN;
PROC PRINT data=tennis;
RUN;

/* Problem 1.2 */
DATA tennis1;
SET tennis;
KEEP name matches wins losses male;
RUN;
PROC PRINT DATA=tennis1;
RUN;

/* Problem 1.3 */
DATA tennis2;
SET tennis;
pct=wins/matches;
IF male=1 then tour="ATP";
IF male=0 then tour="WTA";
KEEP name matches wins losses male pct tour;
RUN;
PROC PRINT DATA=tennis2;
RUN;

/* Problem 1.4 */
PROC SORT DATA=tennis2 OUT=tennis3 NODUPKEY;
BY DESCENDING pct;
Run;
PROC PRINT DATA=tennis3;
Run;

/* Problem 1.5 */
DATA atpdata wtadata; /*Create two datasets */
SET tennis3;
IF male=1 THEN OUTPUT atpdata;
ELSE OUTPUT wtadata;
RUN;
PROC PRINT DATA=atpdata;
Run;
RUN;
PROC PRINT DATA=wtadata;
Run;

/* Problem 1.6 */
FILENAME dataout "/folders/myfolders/atp_rankings.txt";
DATA dataout;
FILE dataout;
SET atpdata;
keep name pct;
PUT name $ pct;
;
RUN;
PROC PRINT DATA=dataout;
Run;
