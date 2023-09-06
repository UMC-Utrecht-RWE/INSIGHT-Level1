if(!require(rstudioapi)){install.packages("rstudioapi")}
library(rstudioapi)

projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)

dir.create(paste(projectFolder,"/g_txt/", sep=""))

## Script that can be used to store a basic 'log', containing R / R-studio version and package version numbers, for debugging purposes
## Commands and output are *not* stored.
logInfo <- function(log.location, inRStudio = F){
  info.name <- paste0(log.location, '/Rlog_Info.txt')
  info.name <- gsub('//', '/', info.name)
  if(!inRStudio){
    #capture.output(list(Sys.time(), installed.packages(), sessionInfo(), paste0('R-studio version: (not applicable); R-studio mode: (not applicable)')), file = info.name)
    capture.output(list(Sys.time(), as.data.frame(installed.packages()[, c(1, 3:4)]), sessionInfo(), paste0('R-studio version: (not applicable); R-studio mode: (not applicable)')), file = info.name)
    } 
  if(inRStudio){
    if(!require('rstudioapi')) install.packages('rstudioapi', repos = 'https://cloud.r-project.org')
    library('rstudioapi')
    RstudioVer <- versionInfo()
    #capture.output(list(Sys.time(), installed.packages(), sessionInfo(), paste0('R-studio version: ', RstudioVer$version, '; R-studio mode: ', RstudioVer$mode)), file = info.name)
    capture.output(list(Sys.time(), as.data.frame(installed.packages()[, c(1, 3:4)]), sessionInfo(), paste0('R-studio version: ', RstudioVer$version, '; R-studio mode: ', RstudioVer$mode)), file = info.name)
    }}

## When called from R-studio, use:
#logInfo(log.location = 'Y:/Studies/ConcePTION/B_Documentation/2 Protocol_DSMB_Monitoring/WP 7.6 Data Characterization SAP/tmp_RB/LoggingScript_V1/', inRStudio = T)
logInfo(log.location = paste0(projectFolder,"/g_txt/"), inRStudio = T)

## When not called from RStudio (e.g. from RGui), use:
logInfo(log.location = 'C:/Users/clabar/Seafile/ConcepTION/work/WP7/ConcePTION_programming/development/MWE_LoggingScript/3_test/', inRStudio = F)
