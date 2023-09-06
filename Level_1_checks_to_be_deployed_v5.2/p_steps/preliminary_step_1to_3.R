if(!require(data.table)){install.packages("data.table")}
suppressPackageStartupMessages(library(data.table))
if(!require(plyr)){install.packages("plyr")}
suppressPackageStartupMessages(library(plyr))
if(!require(DT)){install.packages("DT")}
suppressPackageStartupMessages(library(DT))


##########################
#1.0 Check for presence of variables
##########################
#Function that checks if a variable is present as name
presence_check<-function(dt, list_var){
  a<-data.table("variable_name"=list_var, "presence"= list_var %in% tolower(colnames(dt)))
  return(a)
}

##########################
#1.1 Lowercase check
##########################

#Function
lowercase_check<-function(dt){
  a<-data.table(variable_name=colnames(dt), lowercase=colnames(dt)==tolower(colnames(dt)))
  return(a)
}


#Function that checks if a variable is present as name and checks if variables are written in lowercase
#Run the presence check over all tables of the CDM
presence_lowercase_check<-function(tables_list, tables_CDM){
  Res<-vector(mode="list", length=length(tables_CDM))
  Res_lowercase<-vector(mode="list", length=length(tables_CDM))
  if ("VISIT_OCCURRENCE" %in% names(tables_list)){
    Res.1<-vector(mode="list", length=length(tables_list$VISIT_OCCURRENCE))
    Res.l.1<-vector(mode="list", length=length(tables_list$VISIT_OCCURRENCE))
    for (i in 1:length(tables_list$VISIT_OCCURRENCE)){
      df<-fread(paste(path_dir, tables_list$VISIT_OCCURRENCE[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="VISIT_OCCURRENCE", variable_name]
      Res.1[[i]]<-data.table(table_name=tables_list$VISIT_OCCURRENCE[i],presence_check(df, var))
      Res.l.1[[i]]<-cbind(table_name=tables_list$VISIT_OCCURRENCE[i],lowercase_check(dt=df))
    }
    Res[[1]]<-Res.1
    Res_lowercase[[1]]<-Res.l.1
  }
  if ("EVENTS" %in% names(tables_list)){
    Res.2<-vector(mode="list", length=length(tables_list$EVENTS))
    Res.l.2<-vector(mode="list", length=length(tables_list$EVENTS))
    for (i in 1:length(tables_list$EVENTS)){
      df<-fread(paste(path_dir, tables_list$EVENTS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="EVENTS", variable_name]
      Res.2[[i]]<-data.table(table_name=tables_list$EVENTS[i],presence_check(df, var))
      Res.l.2[[i]]<-cbind(table_name=tables_list$EVENTS[i],lowercase_check(dt=df))
    }
    Res[[2]]<-Res.2
    Res_lowercase[[2]]<-Res.l.2
  }
  if ("MEDICINES" %in% names(tables_list)){
    Res.3<-vector(mode="list", length=length(tables_list$MEDICINES))
    Res.l.3<-vector(mode="list", length=length(tables_list$MEDICINES))
    for (i in 1:length(tables_list$MEDICINES)){
      df<-fread(paste(path_dir, tables_list$MEDICINES[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="MEDICINES", variable_name]
      Res.3[[i]]<-data.table(table_name=tables_list$MEDICINES[i],presence_check(df, var))
      Res.l.3[[i]]<-cbind(table_name=tables_list$MEDICINES[i],lowercase_check(dt=df))
    }
    Res[[3]]<-Res.3
    Res_lowercase[[3]]<-Res.l.3
  }
  if ("PROCEDURES" %in% names(tables_list)){
    Res.4<-vector(mode="list", length=length(tables_list$PROCEDURES))
    Res.l.4<-vector(mode="list", length=length(tables_list$PROCEDURES))
    for (i in 1:length(tables_list$PROCEDURES)){
      df<-fread(paste(path_dir, tables_list$PROCEDURES[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="PROCEDURES", variable_name]
      Res.4[[i]]<-data.table(table_name=tables_list$PROCEDURES[i],presence_check(df, var))
      Res.l.4[[i]]<-cbind(table_name=tables_list$PROCEDURES[i],lowercase_check(dt=df))
    }
    Res[[4]]<-Res.4
    Res_lowercase[[4]]<-Res.l.4
  }
  if ("VACCINES" %in% names(tables_list)){
    Res.5<-vector(mode="list", length=length(tables_list$VACCINES))
    Res.l.5<-vector(mode="list", length=length(tables_list$VACCINES))
    for (i in 1:length(tables_list$VACCINES)){
      df<-fread(paste(path_dir, tables_list$VACCINES[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="VACCINES", variable_name]
      Res.5[[i]]<-data.table(table_name=tables_list$VACCINES[i],presence_check(df, var))
      Res.l.5[[i]]<-cbind(table_name=tables_list$VACCINES[i],lowercase_check(dt=df))
    }
    Res[[5]]<-Res.5
    Res_lowercase[[5]]<-Res.l.5
  }
  if ("MEDICAL_OBSERVATIONS" %in% names(tables_list)){
    Res.6<-vector(mode="list", length=length(tables_list$MEDICAL_OBSERVATIONS))
    Res.l.6<-vector(mode="list", length=length(tables_list$MEDICAL_OBSERVATIONS))
    for (i in 1:length(tables_list$MEDICAL_OBSERVATIONS)){
      df<-fread(paste(path_dir, tables_list$MEDICAL_OBSERVATIONS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="MEDICAL_OBSERVATIONS", variable_name]
      Res.6[[i]]<-data.table(table_name=tables_list$MEDICAL_OBSERVATIONS[i],presence_check(df, var))
      Res.l.6[[i]]<-cbind(table_name=tables_list$MEDICAL_OBSERVATIONS[i],lowercase_check(dt=df))
    }
    Res[[6]]<-Res.6
    Res_lowercase[[6]]<-Res.l.6
  }
  if ("EUROCAT" %in% names(tables_list)){
    Res.7<-vector(mode="list", length=length(tables_list$EUROCAT))
    Res.l.7<-vector(mode="list", length=length(tables_list$EUROCAT))
    for (i in 1:length(tables_list$EUROCAT)){
      df<-fread(paste(path_dir, tables_list$EUROCAT[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="EUROCAT", variable_name]
      Res.7[[i]]<-data.table(table_name=tables_list$EUROCAT[i],presence_check(df, var))
      Res.l.7[[i]]<-cbind(table_name=tables_list$EUROCAT[i],lowercase_check(dt=df))
    }
    Res[[7]]<-Res.7
    Res_lowercase[[7]]<-Res.l.7
  }
  if ("EUROmediCAT" %in% names(tables_list)){
    Res.7<-vector(mode="list", length=length(tables_list$EUROmediCAT))
    Res.l.7<-vector(mode="list", length=length(tables_list$EUROmediCAT))
    for (i in 1:length(tables_list$EUROmediCAT)){
      df<-fread(paste(path_dir, tables_list$EUROmediCAT[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="EUROmediCAT", variable_name]
      Res.7[[i]]<-data.table(table_name=tables_list$EUROmediCAT[i],presence_check(df, var))
      Res.l.7[[i]]<-cbind(table_name=tables_list$EUROmediCAT[i],lowercase_check(dt=df))
    }
    Res[[7]]<-Res.7
    Res_lowercase[[7]]<-Res.l.7
  }
  if ("SURVEY_ID" %in% names(tables_list)){
    Res.8<-vector(mode="list", length=length(tables_list$SURVEY_ID))
    Res.l.8<-vector(mode="list", length=length(tables_list$SURVEY_ID))
    for (i in 1:length(tables_list$SURVEY_ID)){
      df<-fread(paste(path_dir, tables_list$SURVEY_ID[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="SURVEY_ID", variable_name]
      Res.8[[i]]<-data.table(table_name=tables_list$SURVEY_ID[i],presence_check(df, var))
      Res.l.8[[i]]<-cbind(table_name=tables_list$SURVEY_ID[i],lowercase_check(dt=df))
    }
    Res[[8]]<-Res.8
    Res_lowercase[[8]]<-Res.l.8
  }
  if ("SURVEY_OBSERVATIONS" %in% names(tables_list)){
    Res.9<-vector(mode="list", length=length(tables_list$SURVEY_OBSERVATIONS))
    Res.l.9<-vector(mode="list", length=length(tables_list$SURVEY_OBSERVATIONS))
    for (i in 1:length(tables_list$SURVEY_OBSERVATIONS)){
      df<-fread(paste(path_dir, tables_list$SURVEY_OBSERVATIONS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="SURVEY_OBSERVATIONS", variable_name]
      Res.9[[i]]<-data.table(table_name=tables_list$SURVEY_OBSERVATIONS[i],presence_check(df, var))
      Res.l.9[[i]]<-cbind(table_name=tables_list$SURVEY_OBSERVATIONS[i],lowercase_check(dt=df))
    }
    Res[[9]]<-Res.9
    Res_lowercase[[9]]<-Res.l.9
  }  
  if ("PERSONS" %in% names(tables_list)){
    Res.10<-vector(mode="list", length=length(tables_list$PERSONS))
    Res.l.10<-vector(mode="list", length=length(tables_list$PERSONS))
    for (i in 1:length(tables_list$PERSONS)){
      df<-fread(paste(path_dir, tables_list$PERSONS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="PERSONS", variable_name]
      Res.10[[i]]<-data.table(table_name=tables_list$PERSONS[i],presence_check(df, var))
      Res.l.10[[i]]<-cbind(table_name=tables_list$PERSONS[i],lowercase_check(dt=df))
    }
    Res[[10]]<-Res.10
    Res_lowercase[[10]]<-Res.l.10
  }
  if ("OBSERVATION_PERIODS" %in% names(tables_list)){
    Res.11<-vector(mode="list", length=length(tables_list$OBSERVATION_PERIODS))
    Res.l.11<-vector(mode="list", length=length(tables_list$OBSERVATION_PERIODS))
    for (i in 1:length(tables_list$OBSERVATION_PERIODS)){
      df<-fread(paste(path_dir, tables_list$OBSERVATION_PERIODS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="OBSERVATION_PERIODS", variable_name]
      Res.11[[i]]<-data.table(table_name=tables_list$OBSERVATION_PERIODS[i],presence_check(df, var))
      Res.l.11[[i]]<-cbind(table_name=tables_list$OBSERVATION_PERIODS[i],lowercase_check(dt=df))
    }
    Res[[11]]<-Res.11
    Res_lowercase[[11]]<-Res.l.11
  }
  if ("PERSON_RELATIONSHIPS" %in% names(tables_list)){
    Res.12<-vector(mode="list", length=length(tables_list$PERSON_RELATIONSHIPS))
    Res.l.12<-vector(mode="list", length=length(tables_list$PERSON_RELATIONSHIPS))
    for (i in 1:length(tables_list$PERSON_RELATIONSHIPS)){
      df<-fread(paste(path_dir, tables_list$PERSON_RELATIONSHIPS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="PERSON_RELATIONSHIPS", variable_name]
      Res.12[[i]]<-data.table(table_name=tables_list$PERSON_RELATIONSHIPS[i],presence_check(df, var))
      Res.l.12[[i]]<-cbind(table_name=tables_list$PERSON_RELATIONSHIPS[i],lowercase_check(dt=df))
    }
    Res[[12]]<-Res.12
    Res_lowercase[[12]]<-Res.l.12
  }
  if ("PRODUCTS" %in% names(tables_list)){
    Res.13<-vector(mode="list", length=length(tables_list$PRODUCTS))
    Res.l.13<-vector(mode="list", length=length(tables_list$PRODUCTS))
    for (i in 1:length(tables_list$PRODUCTS)){
      df<-fread(paste(path_dir, tables_list$PRODUCTS[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="PRODUCTS", variable_name]
      Res.13[[i]]<-data.table(table_name=tables_list$PRODUCTS[i],presence_check(df, var))
      Res.l.13[[i]]<-cbind(table_name=tables_list$PRODUCTS[i],lowercase_check(dt=df))
    }
    Res[[13]]<-Res.13
    Res_lowercase[[13]]<-Res.l.13
  }
  if ("CDM_SOURCE" %in% names(tables_list)){
    Res.14<-vector(mode="list", length=length(tables_list$CDM_SOURCE))
    Res.l.14<-vector(mode="list", length=length(tables_list$CDM_SOURCE))
    for (i in 1:length(tables_list$CDM_SOURCE)){
      df<-fread(paste(path_dir, tables_list$CDM_SOURCE[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="CDM_SOURCE", variable_name]
      Res.14[[i]]<-data.table(table_name=tables_list$CDM_SOURCE[i],presence_check(df, var))
      Res.l.14[[i]]<-cbind(table_name=tables_list$CDM_SOURCE[i],lowercase_check(dt=df))
    }
    Res[[14]]<-Res.14
    Res_lowercase[[14]]<-Res.l.14
  }
  if ("INSTANCE" %in% names(tables_list)){
    Res.15<-vector(mode="list", length=length(tables_list$INSTANCE))
    Res.l.15<-vector(mode="list", length=length(tables_list$INSTANCE))
    for (i in 1:length(tables_list$INSTANCE)){
      df<-fread(paste(path_dir, tables_list$INSTANCE[i], sep=""), stringsAsFactors = FALSE, nrows = 1)
      
      var<-total_var[table_name=="INSTANCE", variable_name]
      Res.15[[i]]<-data.table(table_name=tables_list$INSTANCE[i],presence_check(df, var))
      Res.l.15[[i]]<-cbind(table_name=tables_list$INSTANCE[i],lowercase_check(dt=df))
    }
    Res[[15]]<-Res.15
    Res_lowercase[[15]]<-Res.l.15
  }
  
  suppressPackageStartupMessages(library(plyr))
  Res<-compact(Res)
  for(i in 1:length(Res)){
    Res[[i]]<-do.call(rbind, Res[[i]])
  }
  Res_lowercase<-compact(Res_lowercase)
  for(i in 1:length(Res_lowercase)){
    Res_lowercase[[i]]<-do.call(rbind, Res_lowercase[[i]])
  }
  output<-list("PRESENCE"=Res, "LOWERCASE"=Res_lowercase)
  return(output)
}

#####################################################################
#Step 1:Check if variables are present an dwritten correctly
Res<-presence_lowercase_check(actual_tables, tables_CDM)

Res.lowercase<-data.table(do.call(rbind,Res$LOWERCASE)) 
Res.lowercase<-Res.lowercase[lowercase==FALSE]

Res.presence<-do.call(rbind,Res$PRESENCE)
Res.presence<-Res.presence[presence==FALSE]


#Update list of tables if issues have been found
#If Res.lowercase has more than 0 rows the script below will update the actual_tables
if (Res.lowercase[,.N]==0){
  actual_tables.l<-actual_tables
  directory_CDM.l<-directory_CDM
} else {
  remove<-Res.lowercase[lowercase==FALSE,table_name]
  directory_CDM.l<-directory_CDM[!directory_CDM %in% remove]
  actual_tables.l<-sapply(tables_CDM, function(y){directory_CDM.l[grepl(pattern = y, x = directory_CDM.l)]})
  for (i in length(actual_tables.l):1){
    if (length(actual_tables.l[[i]])==0){
      actual_tables.l[[i]]<-NULL
    }
  }
}

if (Res.presence[,.N]==0){
  actual_tables.p<-actual_tables.l
  directory_CDM.p<-directory_CDM.l
} else {
  remove<-Res.presence[,table_name]
  directory_CDM.p<-directory_CDM.l[!directory_CDM.l %in% remove]
  actual_tables.p<-sapply(tables_CDM, function(y){directory_CDM.p[grepl(pattern = y, x = directory_CDM.p)]})
  for (i in length(actual_tables.p):1){
    if (length(actual_tables.p[[i]])==0){
      actual_tables.p[[i]]<-NULL
    }
  }
}

rm(actual_tables, actual_tables.l, Res, directory_CDM, directory_CDM.l, lowercase_check, presence_check, presence_lowercase_check)
##########################################################################
#Number of fields function
field_character_check<- function(tables_list, tables_CDM){
  Res_field<-vector(mode="list", length=length(tables_CDM))
  Res_format<-vector(mode="list", length=4) #only for MEDICINES, PRODUCTS, EUROCAT, EUROmediCAT, CDM_SOURCE
  
  #Numeric variables
  #MEDICINES: disp_number_medicinal_product, presc_quantity_per_day, presc_duration_days
  #PRODUCTS: unit_of_presentation_num, subst1_amount_per_form, subst2_amount_per_form, subst3_amount_per_form, subst1_concentration, subst2_concentration, subst3_concentration, concentration_total_content
  #CDM_SOURCE: instance_number
  #EUROCAT/EUROmediCAT:weight, gestlength, agemo, bmi, agedisc, hba1c
  
  if ("VISIT_OCCURRENCE" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$VISIT_OCCURRENCE))
    
    for (i in 1:length(tables_list$VISIT_OCCURRENCE)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$VISIT_OCCURRENCE[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$VISIT_OCCURRENCE[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      df<-df[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        if (no - ac.no == 1){
          first_row <-ac.no + 1
        } else {
          first_row<- ac.no + 2
        }
      }
      
      
      Res.fld[[i]]<-data.table(cdm_table="VISIT_OCCURRENCE", table_name=tables_list$VISIT_OCCURRENCE[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[1]]<-Res.fld
  }
  
  if ("EVENTS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$EVENTS))
    
    for (i in 1:length(tables_list$EVENTS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$EVENTS[i], sep = ""))) -1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$EVENTS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      df<-df[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="EVENTS", table_name=tables_list$EVENTS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[2]]<-Res.fld
  }
  
  if ("MEDICINES" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$MEDICINES))
    Res.form<-vector(mode="list", length=length(tables_list$MEDICINES))
    
    for (i in 1:length(tables_list$MEDICINES)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$MEDICINES[i], sep = ""))) -1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$MEDICINES[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      df<-df[, lapply(.SD, FUN=function(x) gsub("^$|^ $", NA, x))]
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="MEDICINES", table_name=tables_list$MEDICINES[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      #Save number of missing data before transformation of numeric variables
      no.mis.orig<-data.table(cdm_table="MEDICINES", table_name=tables_list$MEDICINES[i],variable_name=c("disp_number_medicinal_product","presc_quantity_per_day", "presc_duration_days"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("disp_number_medicinal_product","presc_quantity_per_day", "presc_duration_days")])))
      setnames(no.mis.orig, "count.V1", "no.mis_orig")
      #Transform into numeric variables
      suppressWarnings(df[,disp_number_medicinal_product:=as.numeric(disp_number_medicinal_product)])
      suppressWarnings(df[,presc_quantity_per_day:=as.numeric(presc_quantity_per_day)])
      suppressWarnings(df[,presc_duration_days:=as.numeric(presc_duration_days)])
      #Save results no.miss_num
      no.mis.num<-data.table(cdm_table="MEDICINES", table_name=tables_list$MEDICINES[i],variable_name=c("disp_number_medicinal_product","presc_quantity_per_day", "presc_duration_days"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("disp_number_medicinal_product","presc_quantity_per_day", "presc_duration_days")])))
      setnames(no.mis.num, "count.V1", "no.mis_num")
      Res.form[[i]]<-merge(no.mis.orig, no.mis.num, by=c("cdm_table", "table_name", "variable_name"))
      Res.form[[i]][,non.numeric:=no.mis_num-no.mis_orig]
      Res.form[[i]][non.numeric>0,error:=TRUE][non.numeric==0, error:=FALSE]
    }
    Res_field[[3]]<-Res.fld
    Res_format[[1]]<-Res.form
  }  
  
  if ("PROCEDURES" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$PROCEDURES))
    
    for (i in 1:length(tables_list$PROCEDURES)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$PROCEDURES[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$PROCEDURES[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="PROCEDURES", table_name=tables_list$PROCEDURES[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      
    }
    Res_field[[4]]<-Res.fld
    
  }
  
  if ("VACCINES" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$VACCINES))
    
    for (i in 1:length(tables_list$VACCINES)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$VACCINES[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$VACCINES[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      
      Res.fld[[i]]<-data.table(cdm_table="VACCINES", table_name=tables_list$VACCINES[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[5]]<-Res.fld
  }
  
  if ("MEDICAL_OBSERVATIONS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$MEDICAL_OBSERVATIONS))
    
    for (i in 1:length(tables_list$MEDICAL_OBSERVATIONS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$MEDICAL_OBSERVATIONS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$MEDICAL_OBSERVATIONS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="MEDICAL_OBSERVATIONS", table_name=tables_list$MEDICAL_OBSERVATIONS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[6]]<-Res.fld
  }
  
  if ("EUROCAT" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$EUROCAT))
    Res.form<-vector(mode="list", length=length(tables_list$EUROCAT))
    
    for (i in 1:length(tables_list$EUROCAT)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$EUROCAT[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$EUROCAT[i], sep=""), stringsAsFactors = FALSE))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROCAT[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      
      #Save number of missing data before transformation of numeric variables
      no.mis.orig<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROCAT[i],variable_name=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c")])))
      setnames(no.mis.orig, "count.V1", "no.mis_orig")
      #Transform into numeric variables
      suppressWarnings(df[,weight:=as.numeric(weight)])
      suppressWarnings(df[,gestlength:=as.numeric(gestlength)])
      suppressWarnings(df[,agemo:=as.numeric(agemo)])
      suppressWarnings(df[,bmi:=as.numeric(bmi)])
      suppressWarnings(df[,agedisc:=as.numeric(agedisc)])
      suppressWarnings(df[,hba1c:=as.numeric(hba1c)])
      
      #Save results no.miss_num
      no.mis.num<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROCAT[i],variable_name=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c")])))
      setnames(no.mis.num, "count.V1", "no.mis_num")
      Res.form[[i]]<-merge(no.mis.orig, no.mis.num, by=c("cdm_table", "table_name", "variable_name"))
      Res.form[[i]][,non.numeric:=no.mis_num-no.mis_orig]
      Res.form[[i]][non.numeric>0,error:=TRUE][non.numeric==0, error:=FALSE]
    }
    Res_field[[7]]<-Res.fld
    Res_format[[2]]<-Res.form
  }
  
  if ("EUROmediCAT" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$EUROmediCAT))
    Res.form<-vector(mode="list", length=length(tables_list$EUROmediCAT))
    
    for (i in 1:length(tables_list$EUROmediCAT)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$EUROmediCAT[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$EUROmediCAT[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROmediCAT[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      
      #Save number of missing data before transformation of numeric variables
      no.mis.orig<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROmediCAT[i],variable_name=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c")])))
      setnames(no.mis.orig, "count.V1", "no.mis_orig")
      #Transform into numeric variables
      suppressWarnings(df[,weight:=as.numeric(weight)])
      suppressWarnings(df[,gestlength:=as.numeric(gestlength)])
      suppressWarnings(df[,agemo:=as.numeric(agemo)])
      suppressWarnings(df[,bmi:=as.numeric(bmi)])
      suppressWarnings(df[,agedisc:=as.numeric(agedisc)])
      suppressWarnings(df[,hba1c:=as.numeric(hba1c)])
      
      #Save results no.miss_num
      no.mis.num<-data.table(cdm_table="EUROCAT", table_name=tables_list$EUROmediCAT[i],variable_name=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("weight","gestlength", "agemo", "bmi", "agedisc", "hba1c")])))
      setnames(no.mis.num, "count.V1", "no.mis_num")
      Res.form[[i]]<-merge(no.mis.orig, no.mis.num, by=c("cdm_table", "table_name", "variable_name"))
      Res.form[[i]][,non.numeric:=no.mis_num-no.mis_orig]
      Res.form[[i]][non.numeric>0,error:=TRUE][non.numeric==0, error:=FALSE]
    }
    Res_field[[7]]<-Res.fld
    Res_format[[2]]<-Res.form
  }
  
  if ("SURVEY_ID" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$SURVEY_ID))
    
    for (i in 1:length(tables_list$SURVEY_ID)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$SURVEY_ID[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$SURVEY_ID[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      
      Res.fld[[i]]<-data.table(cdm_table="SURVEY_ID", table_name=tables_list$SURVEY_ID[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[8]]<-Res.fld
  }
  
  if ("SURVEY_OBSERVATIONS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$SURVEY_OBSERVATIONS))
    
    for (i in 1:length(tables_list$SURVEY_OBSERVATIONS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$SURVEY_OBSERVATIONS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$SURVEY_OBSERVATIONS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="SURVEY_OBSERVATIONS", table_name=tables_list$SURVEY_OBSERVATIONS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[9]]<-Res.fld
  }
  
  if ("PERSONS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$PERSONS))
    
    for (i in 1:length(tables_list$PERSONS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$PERSONS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$PERSONS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="PERSONS", table_name=tables_list$PERSONS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[10]]<-Res.fld
  }
  
  if ("OBSERVATION_PERIODS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$OBSERVATION_PERIODS))
    
    for (i in 1:length(tables_list$OBSERVATION_PERIODS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$OBSERVATION_PERIODS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$OBSERVATION_PERIODS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="OBSERVATION_PERIODS", table_name=tables_list$OBSERVATION_PERIODS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[11]]<-Res.fld
  }
  
  if ("PERSON_RELATIONSHIPS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$PERSON_RELATIONSHIPS))
    
    for (i in 1:length(tables_list$PERSON_RELATIONSHIPS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$PERSON_RELATIONSHIPS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$PERSON_RELATIONSHIPS[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="PERSON_RELATIONSHIPS", table_name=tables_list$PERSON_RELATIONSHIPS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[12]]<-Res.fld
  }
  
  if ("PRODUCTS" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$PRODUCTS))
    Res.form<-vector(mode="list", length=length(tables_list$PRODUCTS))
    
    for (i in 1:length(tables_list$PRODUCTS)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$PRODUCTS[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$PRODUCTS[i], sep=""), stringsAsFactors = FALSE))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="PRODUCTS", table_name=tables_list$PRODUCTS[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      
      #Save number of missing data before transformation of numeric variables
      no.mis.orig<-data.table(cdm_table="PRODUCTS", table_name=tables_list$PRODUCTS[i],variable_name=c("unit_of_presentation_num","subst1_amount_per_form", "subst2_amount_per_form", "subst3_amount_per_form", "subst1_concentration", "subst2_concentration", "subst3_concentration", "concentration_total_content"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("unit_of_presentation_num","subst1_amount_per_form", "subst2_amount_per_form", "subst3_amount_per_form", "subst1_concentration", "subst2_concentration", "subst3_concentration", "concentration_total_content")])))
      setnames(no.mis.orig, "count.V1", "no.mis_orig")
      #Transform into numeric variables
      suppressWarnings(df[,unit_of_presentation_num:=as.numeric(unit_of_presentation_num)])
      suppressWarnings(df[,subst1_amount_per_form:=as.numeric(subst1_amount_per_form)])
      suppressWarnings(df[,subst2_amount_per_form:=as.numeric(subst2_amount_per_form)])
      suppressWarnings(df[,subst3_amount_per_form:=as.numeric(subst3_amount_per_form)])
      suppressWarnings(df[,subst1_concentration:=as.numeric(subst1_concentration)])
      suppressWarnings(df[,subst2_concentration:=as.numeric(subst2_concentration)])
      suppressWarnings(df[,subst3_concentration:=as.numeric(subst3_concentration)])
      suppressWarnings(df[,concentration_total_content:=as.numeric(concentration_total_content)])
      #Save results no.miss_num
      no.mis.num<-data.table(cdm_table="PRODUCTS", table_name=tables_list$PRODUCTS[i],variable_name=c("unit_of_presentation_num","subst1_amount_per_form", "subst2_amount_per_form", "subst3_amount_per_form", "subst1_concentration", "subst2_concentration", "subst3_concentration", "concentration_total_content"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("unit_of_presentation_num","subst1_amount_per_form", "subst2_amount_per_form", "subst3_amount_per_form", "subst1_concentration", "subst2_concentration", "subst3_concentration", "concentration_total_content")])))
      setnames(no.mis.num, "count.V1", "no.mis_num")
      Res.form[[i]]<-merge(no.mis.orig, no.mis.num, by=c("cdm_table", "table_name", "variable_name"))
      Res.form[[i]][,non.numeric:=no.mis_num-no.mis_orig]
      Res.form[[i]][non.numeric>0,error:=TRUE][non.numeric==0, error:=FALSE]
      
    }
    Res_field[[13]]<-Res.fld
    Res_format[[3]]<-Res.form
  }
  
  if ("CDM_SOURCE" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$CDM_SOURCE))
    Res.form<-vector(mode="list", length=length(tables_list$CDM_SOURCE))
    
    for (i in 1:length(tables_list$CDM_SOURCE)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$CDM_SOURCE[i], sep = "")))-1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$CDM_SOURCE[i], sep=""), stringsAsFactors = FALSE))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="CDM_SOURCE", table_name=tables_list$CDM_SOURCE[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
      
      #Save number of missing data before transformation of numeric variables
      no.mis.orig<-data.table(cdm_table="CDM_SOURCE", table_name=tables_list$CDM_SOURCE[i],variable_name=c("instance_number"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("instance_number")])))
      setnames(no.mis.orig, "count.V1", "no.mis_orig")
      #Transform into numeric variables
      suppressWarnings(df[,instance_number:=as.numeric(instance_number)])
      #Save results no.miss_num
      no.mis.num<-data.table(cdm_table="CDM_SOURCE", table_name=tables_list$CDM_SOURCE[i],variable_name=c("instance_number"), count=as.data.table(t(df[, lapply(.SD, FUN=function(x) sum(is.na(x))), .SDcols=c("instance_number")])))
      setnames(no.mis.num, "count.V1", "no.mis_num")
      Res.form[[i]]<-merge(no.mis.orig, no.mis.num, by=c("cdm_table", "table_name", "variable_name"))
      Res.form[[i]][,non.numeric:=no.mis_num-no.mis_orig]
      Res.form[[i]][non.numeric>0,error:=TRUE][non.numeric==0, error:=FALSE]
      
    }
    Res_field[[14]]<-Res.fld
    Res_format[[4]]<-Res.form
  }
  
  if ("INSTANCE" %in% names(tables_list)){
    Res.fld<-vector(mode="list", length=length(tables_list$INSTANCE))
    
    for (i in 1:length(tables_list$INSTANCE)){
      #Get the number of rows of the csv file without opening the file
      no <-length(readLines(paste(path_dir, tables_list$INSTANCE[i], sep = ""))) - 1
      #Load the file and then get the number of rows (if the number of fields is not correct r imports till the error occurs)
      suppressWarnings(df<-fread(paste(path_dir, tables_list$INSTANCE[i], sep=""), stringsAsFactors = FALSE, colClasses = "character"))
      ac.no <-nrow(df)
      #Check if the number of rows match
      #The first_row shows the first line of the csv file that has a problem(it incorporates the header and the next line)
      if (no == ac.no) {
        error <- FALSE
        first_row <- "N/A"
      } else { 
        error <- TRUE
        first_row<- ac.no + 2
      }
      
      Res.fld[[i]]<-data.table(cdm_table="INSTANCE", table_name=tables_list$INSTANCE[i], 
                               csv_rows = no, current_table_rows = ac.no, first_row_error =first_row, error = error)
    }
    Res_field[[15]]<-Res.fld
  }
  
  suppressPackageStartupMessages(library(plyr))
  Res_field<-compact(Res_field)
  for(i in 1:length(Res_field)){
    Res_field[[i]]<-do.call(rbind, Res_field[[i]])
  }
  
  Res_format<-compact(Res_format)
  for(i in 1:length(Res_format)){
    Res_format[[i]]<-do.call(rbind, Res_format[[i]])
  }
  output<-list("FIELD"=Res_field, "FORMAT"=Res_format)
  return(output)
}
###########################################################################
#Step 2: Check if files contain the same number of fields and format
  
Res.fl.form<-field_character_check(tables_list = actual_tables.p, tables_CDM = tables_CDM)

rm(field_character_check)
  Res.fields<-do.call(rbind,Res.fl.form$FIELD)
  Res.fields<-Res.fields[error==TRUE]

  Res.format<-do.call(rbind,Res.fl.form$FORMAT)
  Res.format[non.numeric>0, error:=TRUE][non.numeric==0, error:=FALSE]
  Res.format<-Res.format[error==TRUE]

  
  if (Res.fields[,.N]==0){
    actual_tables.r<-actual_tables.p
    directory_CDM.r<-directory_CDM.p
  } else {
    remove<-Res.fields[,table_name]
    directory_CDM.r<-directory_CDM.p[!directory_CDM.p %in% remove]
    actual_tables.r<-sapply(tables_CDM, function(y){directory_CDM.r[grepl(pattern = y, x = directory_CDM.r)]})
    for (i in length(actual_tables.r):1){
      if (length(actual_tables.r[[i]])==0){
        actual_tables.r[[i]]<-NULL
      }
    }
  }
rm(actual_tables.p, Res.fl.form)  
  
  
