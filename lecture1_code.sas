DATA mydata;
    INPUT Id Height Weight;
    DATALINES;
    53 42 41
    54 46 35
    55 40 35
    ;
RUN;
PROC print data=mydata;
    var Height Weight;
RUN;
PROC means data=mydata;
    var Height;
RUN;

DATA ToadJump_1;
    INPUT name $ Weight Jump1 Jump2 Jump3;
    DATALINES;
    Lucky 2.3 1.9 . 3.0
    Spot 4.6 2.5 3.1 0.5
    Tubs 7.1 . . 3.8
    Hop 4.5 3.2 1.9 2.6
    Noisy 3.8 1.3 1.8 1.5
    ;
RUN;

DATA ToadJump_2;
    INPUT name $ Weight Jump1 Jump2 Jump3 @@;
    DATALINES;
    Lucky 2.3 1.9 . 3.0 Spot 4.6 2.5 3.1 0.5
    Tubs 7.1 . . 3.8 Hop 4.5 3.2 1.9 2.6
    Noisy 3.8 1.3 1.8 1.5
    ;
RUN;

DATA ToadJump_3;
    INPUT name $ 1-5 Weight 7-9 Jump1 11-13 Jump2 15-17
             Jump3 19-21  birthday $ 23-34;
    DATALINES;
    —-
    Lucky 2.3 1.9 .   3.0 Aug 12 2013
    Spot  4.6 2.5 3.1 0.5 Jul 31 2013
    Tubs  7.1   .   . 3.8 Nov 13 2010
    Hop   4.5 3.2 1.9 2.6 Aug 24 2013
    Noisy 3.8 1.3 1.8 1.5 Sep 10 2009
    ;
RUN;

DATA ToadJump_4;
    INPUT @1 name $5. @7 (Weight Jump1 Jump2
        Jump3) (4.1)  birthday $char11.;
    DATALINES;
    Lucky 2.3 1.9 .   3.0 Aug 12 2013
    Spot  4.6 2.5 3.1 0.5 Jul 31 2013
    Tubs  7.1 .   .   3.8 Nov 13 2010
    Hop   4.5 3.2 1.9 2.6 Aug 24 2013
    Noisy 3.8 1.3 1.8 1.5 Sep 10 2009
    ;
RUN;

DATA ToadJump;
    INPUT @1 name $5. @7 (Weight Jump1 Jump2
        Jump3) (4.1)  birthday $char11.;
    DATALINES;
    Lucky 2.3 1.9 .   3.0 Aug 12 2013
    Spot  4.6 2.5 3.1 0.5 Jul 31 2013
    Tubs  7.1   .   . 3.8 Nov 13 2010
    Hop   4.5 3.2 1.9 2.6 Aug 24 2013
    Noisy 3.8 1.3 1.8 1.5 Sep 10 2009
    ;
RUN;
PROC print data = ToadJump;
   var name Weight birthday;
RUN;