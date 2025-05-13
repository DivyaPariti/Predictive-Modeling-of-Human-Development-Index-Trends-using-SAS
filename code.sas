/* COVER PAGE */
options nodate nonumber;
ods escapechar='^';

proc odstext;
  p '^{newline 15}';
  p "STAT40840 - Data Programming with SAS" / 
    style=[font_size=20pt font_face='Times New Roman' fontweight=bold just=c];
  p "Final Project" / 
    style=[font_size=20pt font_face='Times New Roman' fontweight=bold just=c];
  p "Divya Pariti - 23200831" / 
    style=[font_size=18pt font_face='Times New Roman' just=c];
  p '^{newline 15}';
  p "I have read and understood the Honesty Code and 
      have neither received nor given assistance in any way 
      with the work contained in this submission." / 
    style=[font_size=14pt font_face='Times New Roman' font_style=italic just=c];
run;

/**********************************************************************************/

title1 color=darkgreen bcolor=brpk Height=14pt "Data Analysis Task 1";
title2 color=biv bcolor=cornsilk height=10pt "Task-1 : Loading the data into SAS";
footnote "source: hdro_indicators_swd.csv";

proc import datafile='/home/u63920100/sasuser.v94/FinalProject/hdro_indicators_swd.csv'
    out=work.hdro_data
    dbms=csv
    replace;
    getnames=yes;
run;

proc print data=work.hdro_data(firstobs = 1 obs = 5);
run;

/* Task 1: Text */
proc odstext;
P "The Human Development Indicators dataset has been loaded successfully using a PROC import step."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

/* Converting the variables into appropriate data types for proper analysis */

/*Step 1 : Converting year into numerical value */
data work.hdro_data;
    set work.hdro_data;
    /* Convert year from character to numeric */
    year_numeric = input(year, 8.);
    drop year; /* drop the old year variable */
    rename year_numeric = year; /* Rename the variable */
run;

/*Step 2 : Converting value into numerical value */
data work.hdro_data;
    set work.hdro_data;
    /* Convert value from character to numeric */
    value_numeric = input(value, best32.);
    drop value; /*drop the old value variable */
    rename value_numeric = value; /* Rename the variable */
run;


/**********************************************************************************/

title1 color=biv bcolor=cornsilk Height=10pt "Task-2 : Analysing the data";
title2 color=darkred bcolor=burlywood "Printing Contents table";
/* Step 1: Create an output dataset from PROC CONTENTS */
proc contents data=work.hdro_data out=contents;
run;

/* Task 2: Text */
proc odstext;
P "We have successfully converted the value and year variables into their proper data types(numerical). "
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Table 3 from the default output we can see that there are 8 variables."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "6 variables are categorical variables and 2 are numerical variables."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk Height=10pt "Task-3 : Creating tabluar summaries for the numerical variables";

/* Creating tabluar summaries for the numerical variables */
proc means data=work.hdro_data mean median std min max;
    var value year;
run;

/* Task 3: Text */
proc odstext;
P "Summary of tabluar summaries for the numerical values from the dataset have been printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the table the mean of value variable is 7032.23. Followed by the largest standard deviation of 20343.33."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "After careful observation we can conclude that the distribution is skewed due to its lower median value with a range of -8.00 to 84820.40"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "year variable has a mean of 2008.80 with a standard deviation of 9.62."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From this we can conclude that the distribution is concetrated around a particular value, here, the mean value of 2008.80"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk Height=10pt "Task-4 : Creating frequency table summaries for the categorical variables";

proc freq data=work.hdro_data;
    tables country_name country_code index_id index_name indicator_id indicator_name;
run;

/* Task 4: Text */
proc odstext;
P "Frequency tables for all the categorical variables have been printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the above table, we can say that the HDI indicators dataset of Switzerland contains 894 records."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "There are 5 different indicators that used to measure different aspects like Gender Development(GDI), Gender Inequality(GII), Human Developer Index(HDI), Inequality adjusted Human Development Index(IHDI) and Planetary pressures-adjusted Human Development Index(PHDI)."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the analysis we can say that the most frequent indicator is GDI with 37.09% followed by GII at 29.61%. The least being PHDI with 11.17%"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

/*Task-5 : Generating scatterplots for Categorical Variables */

proc sgplot data=work.hdro_data;
    scatter x=year y=value;
    title1 "Scatter Plot of Value vs. Year";
    xaxis label="Year";
    yaxis label="Value";
run;

/* Task 5: Text */
proc odstext;
P "A Scatter Plot showing the relatioship between value and year is visualized successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The graph shows how the value variable performs across the past three decades."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the above graph we can say that most of the data points follow a similar trends(Due to the bands) in the years 1990-2022."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Value variable increases over the years."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Alot of values are clustered at the bottom of the graph indicating an index where the values remain low."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=darkgreen bcolor=brpk Height=14pt "Data Analysis Task 2";
title2 color=biv bcolor=cornsilk height=12pt "Task-1";
title3 color=darkred bcolor=burlywood height=10pt "Step-1 : Loading the data into SAS. Printing first 5 observations and first 5 variables from the dataset";
footnote "souce: universities.csv";

proc import datafile='/home/u63920100/sasuser.v94/FinalProject/universities.csv'
    out=work.university
    dbms=csv
    replace;
    getnames=yes;
    guessingrows=max;
run;

proc print data=university(firstobs=1 obs=5);
    var university_name year world_rank country national_rank;
run;

/* Task 1: Text */
proc odstext;
P "Universities dataset has been loaded successfully using PROC IMPORT step."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};


/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=darkred bcolor=burlywood height=10pt "Step-2 : sort the variables in creation order.";
proc contents data=university varnum;
run; 

/* Task 1: Text */
proc odstext;
P "The variables are sorted in creation order."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-2";
title2 color=darkred bcolor=burlywood height=10pt  "Student/Staff Ratio";

/*Step-1*/
/*Converting the variables to proper data types*/
data university;
    set university;
    /* Converting staff to student ratio into numerical*/
    student_staff_ratio_num = input(student_staff_ratio, best12.);
    drop student_staff_ratio;
    rename student_staff_ratio_num = student_staff_ratio;
run;

/*Step-2*/
/* Calculate the mean, standard deviation, minimum, and maximum */
proc means data=university mean std min max maxdec=2;
    var student_staff_ratio;
run;

/* Task 2: Text */
proc odstext;
P "The table provides a summary of the student-to-staff ratio, highlighting key statistics such as the mean, standard deviation, as well as the minimum and maximum values."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The average student to staff ratio is 15.99. The variability in the above ratio is 10.23"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The dataset shows a minimum staff-student ratio of 2.9 and a maximum of 70.4."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-3";
title2 color=darkred bcolor=burlywood height=10pt  "Univariate Analysis of number of students";
/*Step-1*/
/*Converting the variables to proper data types*/
data university;
    set university;
    /* Convert num_students from character to numeric */
    num_students_num = input(num_students, best12.);
    drop num_students;
    rename num_students_num = num_students;
run;

/*Step-2*/
/*Producing relevant plots*/
proc sgplot data=university;
    histogram num_students;
    density num_students;
    title3 "Plot of Number of students";
run;

/* Task 3: Text */
proc odstext;
P "Histogram illustrates the distribution of variable number of students"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the above graph we can say that the univariate analysis depicts a right-skewed distribution."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Most of the student population is concentrated between 10,000 and 40,000. There is a peak around 25,000 suggesting that it is the most common value in the dataset."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "This skewness indicates that most institutions fall within a moderate range of student populations, a few have significantly larger or smaller enrollments."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-4";
title2 color=darkred bcolor=burlywood height=10pt  "Correlation Analysis";

/*Step-1*/
/* Converting the variables to proper data types and calculating correlations */
proc corr data=university nosimple;
    var score award pub teaching;
    title3 "Correlation Table for Score, Awards, Publications, and Teaching";
run;

/* Task 4: Text */
proc odstext;
P "Correlation table between score, awards, publications, and teaching is printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "We can see strong positive correlations between all pairs of variables: score, awards, publications, and teaching"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The correlations are statistically significantly different from 0."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "All correlations are statistically significant, with p-values less than 0.0001."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P " higher values in score are associated with higher values in the others (awards, publications, teaching), reflecting that there is a possibility that they are interconnected."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-5";
title2 color=darkred bcolor=burlywood height=10pt  "Hypothesis Test";

/* Step 1: Filter data for USA and UK universities */
data usa_uk_universities;
    set university;
    where country in ('USA', 'United Kingdom');
run;


/* Step 2: Perform a t-test to compare means */
/* Null Hypothesis (H0): Mean number of students in USA = Mean number of students in UK */
/* Alternative Hypothesis (H1): Mean number of students in USA ≠ Mean number of students in UK */
proc ttest data=usa_uk_universities alpha=0.01;
    class country;
    var num_students;
    /* Include Levene's test for equality of variances */
    ods select Equality;
run;

/* Step 3: Checking normality and distribution of data */
proc univariate data=usa_uk_universities;
    class country;
    var num_students;
    histogram num_students / normal;
    probplot num_students / normal;
    title "Normality Check: Histogram and Probability Plot of Number of Students";
run;

/* Step 4: Creating boxplots for number of students in USA and UK universities*/
proc sgplot data=usa_uk_universities;
    vbox num_students / category=country;
    title "Box Plot of Number of Students in USA and UK Universities";
run;

/* Task 5: Text */
proc odstext;
P "Summaries of the hypothesis tests are printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "From the analysis, the reports indicate a statistically significant difference between the mean number of students in USA and UK universities."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The box plot also illustrates the differences in student populations between the two countries with outliers in USA data."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The p-value associated with the t-test is less than the significance level of 0.01, leading to the rejection of the null hypothesis."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The normality assumption results show that the data for both countries USA and UK did not perfectly follow a normal distribution."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "F test indicates a significant difference in variances between the groups with F-value = 4.85, and p < 0.0001, suggesting that the assumption of equal variances is not met."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The normality assumption results show that the data for both countries USA and UK did not perfectly follow a normal distribution."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-6";
title2 color=darkred bcolor=burlywood height=10pt  "Subsetted Dataset of United Kingdom, Germany, and Italy";

/* Create a subset containing only universities from the United Kingdom, Germany, and Italy */
data uni1;
    set university;
    where country in ('United Kingdom', 'Germany', 'Italy');
run;

/* Print the first few observations to display the title */
proc print data=uni1 (obs=5);
    var university_name world_rank country year quality_of_education;
run;

/* Task 6: Text */
proc odstext;
P "First few observations from universities dataset is printed successfully using PROC PRINT step."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};


/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=darkred bcolor=burlywood height=10pt "Step-1 : Printing observations from 10 to 17 and the first 5 variables.";
/* Printing only observations from 10 to 17 and the first 5 variables*/
proc print data=uni1 (firstobs=10 obs=17);
    var university_name world_rank country year quality_of_education;
run; 

/* Task 6: Text */
proc odstext;
P "Observations from 10 to 17 from universities dataset is printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=darkred bcolor=burlywood height=10pt "Step-2 : Printing highest ranked Italian university.";

/* Sort the dataset by world_rank */
proc sort data=uni1 out=sorted_uni1;
    by world_rank;
run;

/* Filter for the highest-ranked Italian university */
proc print data=sorted_uni1(obs=1);
    where country = 'Italy';
    var university_name world_rank country;
    title2 "Highest Ranked Italian University";
    
run;

/* Task 6: Text */
proc odstext;
P "Sapienza University of Rome is the highest ranked Italian university. It is ranked 112th in the world."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-7";
title2 color=darkred bcolor=burlywood height=10pt  "Mean Quality of Education";

proc means data=uni1 mean maxdec=2;
    var quality_of_education;
    title3 "Mean Quality of Education for the Whole uni1 Dataset";
run;
proc means data=uni1 mean maxdec=2;
    where quality_of_education > 100;
    var quality_of_education;
    title4 "Mean Quality of Education for Universities with Quality of Education > 100";
run;

/* Task 7: Text */
proc odstext;
P "Mean tables for mean quality for education for universities with quality education is printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The mean quality of education for this new dataset(uni1) is 213.55"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "The mean quality of education greater than 100 is 286.37"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-8";
title2 color=darkred bcolor=burlywood height=10pt  "Summary Statistics for the Patents variable";

proc means data=uni1 n mean std min max maxdec=2;
    class country;
    var patents;
run;

/* Task 8: Text */
proc odstext;
P "The Summary statistics summary table for the patents variable has been printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Italy has the highest mean number of patents, while UK has the widest and highest number of patents"
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Germany shows moderate valyes with a narrower range."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};


/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/

title1 color=biv bcolor=cornsilk height=12pt "Task-9";
title2 color=darkred bcolor=burlywood height=10pt  "Plot of the publications variable by countr";

proc sgpanel data=uni1;
    panelby country / columns=1 spacing=5;
    histogram pub / scale=count;
    colaxis label="Number of Publications";
    rowaxis label="Frequency";
    title3 "Histograms of Publications by Country";
run;

/* Task 9: Text */
proc odstext;
P "Histogram displaying the distribution of number of pulications by country has been printed successfully."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Germany's distribution is uniform but with a narrow range. Most of the publicaitons are concentrated between 30 and 60."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "Italy follows the similar trend but contains variability and wider spread."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

P "UK's distribution is more varied, most of the publications are concentrated between 30-40."
/ Style={font_size= 12pt font_face='Times New Roman' just= c};

/**********************************************************************************/

/* Clear any previous titles and footnotes */
title;
footnote;

/**********************************************************************************/
/* Insert titles directly into the output using ODS TEXT */
ods text = "^S={font_weight=bold font_size=14pt foreground=darkgreen background=brpk} Data Analysis Task 3";
ods text = "^S={font_weight=bold font_size=12pt foreground=biv background=cornsilk} Tasks & Utilities : Data Mining";
ods text = "^S={font_weight=bold font_size=10pt foreground=darkred background=burlywood} Task-1 : Rapid Predictive Modeler";
/*
 *
 * Task code generated by SAS Studio 3.8 
 *
 * Generated on '8/14/24, 8:06 PM' 
 * Generated by 'u63920100' 
 * Generated on server 'ODAWS02-EUW1.ODA.SAS.COM' 
 * Generated on SAS platform 'Linux LIN X64 5.14.0-284.30.1.el9_2.x86_64' 
 * Generated on SAS version '9.04.01M7P08062020' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36' 
 * Generated on web client 'https://odamid-euw1.oda.sas.com/SASStudio/main?locale=en_US&zone=GMT%252B01%253A00&ticket=ST-86131-CwEb4K4sWn6gHDTJdkqX-cas' 
 *
 */

ods noproctitle;
%let em_vardelta = WORK.IDS_VARIABLEATTRIBUTE;
%let em_decdata = WORK.IDS_DECDATA;
%let em_rpmscorefolder =;

/* Save list of data sets in WORK library  */;

proc sql noprint;
	select memname into :_memberlist_ separated by ' ' from sashelp.vmember where 
		libname='WORK';
quit;

%let em_traindata = WORK.HDRO_DATA;

data &em_vardelta;
	length variable $64 attributename $32 attributevalue $64;
	variable='index_id';
	attributename="ROLE";
	attributevalue="TARGET";
	output;
run;

ods exclude all;
ods HTML5 (ID=WEB) exclude all;
filename RPM56197 catalog 'SASHELP.EMRPM.EM_RPM.SOURCE';
%inc RPM56197;
filename RPM56197;
%EM_RPM(flow=basic, projpath=%nrbquote(), projname=%nrbquote(), 
	taskid=c25caa53-0d9c-48c2-813f-c6765c8f800e, data=&em_traindata, 
	variabledelta=&em_vardelta, targetlevel=, decdata=&em_decdata, prior=none, 
	decision=inverse, event=%nrbquote() );
filename RPM56197 catalog 'SASHELP.EMRPM.EM_RPMREPORT.SOURCE';
%inc RPM56197;
filename RPM56197;
ods exclude none;
ods listing close;
%EM_RPMREPORT(modelType=BASIC
, modelSummarization=N, classification=N, liftChart=N, varRanking=N, 
	crossTabs=N, fitStats=N, compareMdl=N);

/* Clean up WORK library */
proc datasets library=work noprint nowarn;
	save &_memberlist_;
	run;

proc odstext;
P "Data Mining using SAS Rapid Predicitive Modeler on Human Development Indicators dataset of Switzerland."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "Rapid Predictive Modeler is designed to automate the process of predictive modelling."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "Here we will demonstrate how to analyze the dataset, build the predicitive model and evaluate the performance using RPM."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The purpose of the data mining task is streamiling the creation of predictive models. RPM reduces the complexity of predictive modeling."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The selected dataset is Human Development Indicators dataset of Switzerland where the variable `index_id` is used for the predicitions."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The system then automatically identifies other variables(here value and year) such as inputs that contribute towards building the predicitive model."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "RPM selects appropriate features from the dataset, runns the standard modeling procedures and then automatically determines the best model type based on the data and task requirements."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The primary metric that is used to evaluate the performance is Average Squared Error. In our case it is calculated as `3.7411555E-7`. This lower value suggests that the model performed well."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "This suggests that the model predictions were highly accurate, with minimal deviation from the actual target values in the dataset. "
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "Key variables such as the Gender Inequality Index and the Human Development Index were identified as significant contributors to the model's predictions. "
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "Gender Inequality Index (GII) and Human Development Index (HDI) were among the top variables contributing to the model's predictions."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "he scorecard provides a detailed breakdown of the points assigned to each variable based on their importance in the model. It allows for a clear comparison of how different variables contribute to the final prediction."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The ROC curve for the validation data shows a sharp increase from (0,0) to (0,1), indicating that the model achieves perfect sensitivity with no false positives. "
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "From the ROC plot, The KS Statistic of 1 suggests that there is a perfect distinction between the positive and negative classes in the validation set."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The gains chart shows a steep rise in the cumulative captured response rate within the first two deciles, reaching close to 100% by the second decile."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "This indicates that the model is extremely effective in ranking the positive responses."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The steepness of the curve in the first few deciles and the flatness thereafter imply that the model is highly effective in concentrating positive responses at the top of the ranking."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The green line being significantly above the diagonal baseline line throughout the chart confirms that the model is performing much better than random guessing."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The detailed table under the graph shows that the model captures 100% of positive responses by the 4th decile"
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "The cumulative lift values confirm that most of the lift is achieved within the first two deciles, which is typical for a highly effective model."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

P "These findings collectively highlight the strengths of using the SAS Rapid Predictive Modeler for data mining tasks, particularly its ability to automate complex processes while maintaining a high level of accuracy in its predictions."
/ Style={font_size= 12pt font_face='Times New Roman' just= l};

