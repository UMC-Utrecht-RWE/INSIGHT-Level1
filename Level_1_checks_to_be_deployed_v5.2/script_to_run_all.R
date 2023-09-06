rm(list=ls())


if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")


########################
#STEP 1.0
#######################
#Load the METADATA table and look at the report. 

setwd(projectFolder)
Rmd_META<-paste0(pre_dir,"/METADATA.v04.28_03_2021.Rmd")
system.time(render(Rmd_META, output_dir = output_dir, output_file = "METADATA.html")) 

print("End METADATA")

####################################################################################################################################

rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

########################
##STEP 1 to STEP 3
#######################

setwd(projectFolder)
Rmd_1to3<-paste0(pre_dir,"/Step1to3-v18.25_04_2021.Rmd")
system.time(render(Rmd_1to3, output_dir = output_dir, output_file = "STEP_1to3.html")) 

print("End STEP_1to3")

####################################################################################################################################

rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

########################
#CDM_SOURCE and INSTANCE
########################

setwd(projectFolder)
Rmd_CDM_INS<-paste0(pre_dir,"/CDM_SOURCEandINSTANCE.v03.28_03_2021.Rmd")
system.time(render(Rmd_CDM_INS, output_dir = output_dir, output_file = "CDM_SOURCEandINSTANCE.html")) 

print("End CDM_SOURCEandINSTANCE")

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

########################
#EVENTS table
#######################
table<-"EVENTS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
   k=k+1
  } 
}
    
if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_EVE<-paste0(pre_dir,"/Step4to5-EVENTS.v12.13_05_2021.Rmd")
  system.time(render(Rmd_EVE, output_dir = output_dir, output_file = "EVENTS.html")) 
  print("End EVENTS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################

rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))
###########################
#MEDICAL_OBSERVATIONS table
###########################
table<-"MEDICAL_OBSERVATIONS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_MO<-paste0(pre_dir,"/Step4to5-MEDICAL_OBSERVATIONS.v05.14_05_2021.Rmd")
  system.time(render(Rmd_MO, output_dir = output_dir, output_file = "MEDICAL_OBSERVATIONS.html")) 
  
  print("End MEDICAL_OBSERVATIONS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#OBSERVATION_PERIODS table
###########################
table<-"OBSERVATION_PERIODS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_OBSPER<-paste0(pre_dir,"/Step4to5-OBSERVATION_PERIODS.v05.16_05_2021.Rmd")
  system.time(render(Rmd_OBSPER, output_dir = output_dir, output_file = "OBSERVATION_PERIODS.html")) 
  
  print("End OBSERVATION_PERIODS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#PERSONS table
###########################
table<-"PERSONS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_PER<-paste0(pre_dir,"/Step4to5-PERSONS.v04.16_05_2021.Rmd")
  system.time(render(Rmd_PER, output_dir = output_dir, output_file = "PERSONS.html")) 
  
  print("End PERSONS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################

rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))


###########################
#VISIT_OCCURRENCE table
###########################
table<-"VISIT_OCCURRENCE"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_VISOCC<-paste0(pre_dir,"/STEP4to5-VISIT_OCCURRENCE.v10.16_05_2021.Rmd")
  system.time(render(Rmd_VISOCC, output_dir = output_dir, output_file = "VISIT_OCCURRENCE.html")) 
  
  print("End VISIT_OCCURRENCE")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#MEDICINES table
###########################
table<-"MEDICINES"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_MED<-paste0(pre_dir,"/Step4to5-MEDICINES.v07.14_05_2021.Rmd")
  system.time(render(Rmd_MED, output_dir = output_dir, output_file = "MEDICINES.html")) 
  
  print("End MEDICINES")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#PROCEDURES table
###########################
table<-"PROCEDURES"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_PROC<-paste0(pre_dir,"/Step4to5-PROCEDURES.v06.14_04_2021.Rmd")
  system.time(render(Rmd_PROC, output_dir = output_dir, output_file = "PROCEDURES.html")) 
  
  print("End PROCEDURES")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))


###########################
#SURVEY_ID table
###########################
table<-"SURVEY_ID"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_SURVID<-paste0(pre_dir,"/Step4to5-SURVEY-ID.v05.16_05_2021.Rmd")
  system.time(render(Rmd_SURVID, output_dir = output_dir, output_file = "SURVEY_ID.html")) 
  
  print("End SURVEY_ID")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}


####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#SURVEY_OBSERVATIONS table
###########################
table<-"SURVEY_OBSERVATIONS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_SURVOBS<-paste0(pre_dir,"/Step4to5-SURVEY_OBSERVATIONS.v06.16_05_2021.Rmd")
  system.time(render(Rmd_SURVOBS, output_dir = output_dir, output_file = "SURVEY_OBSERVATIONS.html")) 
  
  print("End SURVEY_OBSERVATIONS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#VACCINES table
###########################
table<-"VACCINES"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_VACC<-paste0(pre_dir,"/Step4to5-VACCINES.v07.16_05_2021.Rmd")
  system.time(render(Rmd_VACC, output_dir = output_dir, output_file = "VACCINES.html")) 
  
  print("End VACCINES")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#PERSON_RELATIONSHIPS table
###########################
table<-"PERSON_RELATIONSHIPS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_PR<-paste0(pre_dir,"/Step4to5-PERSON_RELATIONSHIPS.v05.16_05_2021.Rmd")
  system.time(render(Rmd_PR, output_dir = output_dir, output_file = "PERSON_RELATIONSHIPS.html")) 
  
  print("End PERSON_RELATIONSHIPS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}

####################################################################################################################################


rm(list=ls())

if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("packages.R")
source("99_path.R")

files<-sub('\\.csv$', '', list.files(path_dir))

###########################
#PRODUCTS table
###########################
table<-"PRODUCTS"

k=0
for (i in 1:length(files)) {
  if (str_detect(files[i], paste0("^",table))) {
    k=k+1
  } 
}

if(k!=0){
  print(paste0(table," IS PRESENT, CHECK for ",table," is RUNNING"))
  setwd(projectFolder)
  Rmd_PRODUCTS<-paste0(pre_dir,"/Step4to5-PRODUCTS.v04.16_05_2021.Rmd")
  system.time(render(Rmd_PRODUCTS, output_dir = output_dir, output_file = "PRODUCTS.html")) 
  
  print("End PRODUCTS")
  
} else { 
  print(paste0(table," NOT present, PLEASE skip to next check")) 
}






