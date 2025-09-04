/******************************************************************************************************/
/* Program Name - USCS_ASCII_INPUT_PROGRAM.SAS                                                        */
/******************************************************************************************************/
/* ICF, May 2025                                                                                      */
/******************************************************************************************************/
/* Purpose - To read 11 ascii text files to create appropriate SAS datasets. The users need to assign */
/* the specific location where the text files are saved. The users also need to assign the libname    */
/* pointing to the directory to hold the new SAS files.                                               */
/******************************************************************************************************/
/* Update on 2025 production 																		  */
/* Years included - 1999-2022 for incidence data; 1999-2023 for mortality data.                       */
/* Race Categories                                                                                    */
/* 	Incidence: Bridged Race 																		  */
/*               Non-Hispanic White 																  */
/*               Non-Hispanic Black																	  */
/*               Non-Hispanic American Indian/Alaska Native											  */
/*               Non-Hispanic Asian/Pacific Islander												  */
/*               Hispanic of any race                                        						  */
/*  Mortality: 1999-2017 Bridged Race     															  */
/*             	 Non-Hispanic White 																  */
/*               Non-Hispanic Black																	  */
/*               Non-Hispanic American Indian/Alaska Native											  */
/*               Non-Hispanic Asian/Pacific Islander												  */
/*               Hispanic of any race                                        						  */
/*             2018-2023 Single Race:																  */
/*               White, Non-Hispanic 																  */
/*               Black, Non-Hispanic 																  */
/*				 American Indian/Alaska Native, Non-Hispanic										  */
/*				 Asian, Non Hispanic 																  */
/*				 Native Hawaiinn or other Pacific Islander, Non- Hispanic							  */
/*				 Hispanic																			  */
/******************************************************************************************************/

/***********************************************************************************************/
/* Assign libname to hold SAS files                                                            */
/***********************************************************************************************/
libname out "The location where SAS files will be saved";

/***********************************************************************************************/
/* Assign the location where ASCII files are saved.                                            */
/***********************************************************************************************/
%let textpath=The location where ASCII files are saved;

%MACRO SASREAD(FILE);
PROC IMPORT OUT= OUT.&FILE
            DATAFILE= "&TEXTPATH\&FILE..TXT"
            DBMS=DLM REPLACE;
     DELIMITER='|';
     GETNAMES=YES;
     DATAROW=2;
     GUESSINGROWS=1000000;
RUN;
%MEND SASREAD;

%SASREAD(BRAINBYSITE)
%SASREAD(BYAGE)
%SASREAD(BYAREA)
%SASREAD(BYAREA_COUNTY)
%SASREAD(BYSITE)
%SASREAD(CHILDBYAGE_ADJ)
%SASREAD(CHILDBYAGE_CR)
%SASREAD(CHILDBYSITE)
%SASREAD(ICCCBYAGE_ADJ)
%SASREAD(ICCCBYAGE_CR)
%SASREAD(ICCCBYSITE)
