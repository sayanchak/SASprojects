FILENAME study "/folders/myfolders/car final project-new.txt";
data car_data;
infile study firstobs=2 ;
INPUT car $ 1-30 weig 31-36 disp 37-42 mile 43-51 fuel 52-60 type $;
run;

proc loess data=car_data;
   MODEL mile = disp;
run;