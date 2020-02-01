/* Sayan Chakraborti
   HW3 
*/
FILENAME study "/folders/myfolders/corn.txt";
data corndata;
Infile study; 
input year yield rain;
RUN;
PROC PRINT data=corndata;
RUN;
DATA corndata2;
SET corndata;
if yield < 32 then catyield = "poor";
if yield >= 32 then catyield = "good";
if rain < = 9.7 then catrain = "drought";
if 9.7 < rain < = 12 then catrain = "normal";
if rain >12 then catrain = "wet";
RUN;
PROC PRINT data=corndata2;
RUN;

/* Problem 2.1
	The SAS output returns a two way table with its
	corresponding relative frequencies. Using this chart
	I will be able to make inferences on our data.
*/
PROC FREQ data=corndata2;
TABLES catyield catyield*catrain;
/* Problem 2.1
	I will use some conditional probability to arrive at a conclusion.
	P(good|drought)= 4/9 = .444
	P(good|normal)= 6/7 =  .857
	P(good|wet)= 2/3 =     .666
	P(poor|drought)= 5/9 = .555
	P(poor|normal)= 1/7 =  .142
	P(poor|wet)= 1/3 =     .333
	
 After looking at some conditional probabilities I can see that you are 
 the most likely to have a "good" catyield given that you have a "normal"
 catrain. You are the least likely to have a "good" catyield given that 
 you have a "drought" catrain
 
 You are also most likely to have a "poor" catyield given that you have a
 "drought" catrain. You are also least likely to have a "poor" catyield given 
 that you have a "normal" catrain.
*/



