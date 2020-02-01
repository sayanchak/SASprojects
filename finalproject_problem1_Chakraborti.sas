FILENAME study "/folders/myfolders/car final project-new.txt";
data car_data;
infile study firstobs=2 ;
INPUT car $ 1-30 weig 31-36 disp 37-42 mile 43-51 fuel 52-60 type $;
run;


/* part 1 */
PROC GLM data=car_data;               
CLASS type;
MODEL mile = weig disp fuel type;
MEANS type;
RUN;


/* part 2*/
Data car_data_2;
set  car_data;
keep car weig disp mile fuel;
run;
proc reg data=car_data_2;
MODEL mile = weig disp fuel;
run;


/* part 3 */
proc reg data=car_data_2;
MODEL mile = weig disp fuel
/ collin collinoint influence vif tol;
run;
