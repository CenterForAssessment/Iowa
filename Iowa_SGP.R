#############################################################
###
### Script to perform initial SGP analyses for Iowa
###
#############################################################

### Load SGP Package

require(SGP)


### Load LONG data

load("Iowa_Data_LONG.Rdata")


### prepareSGP

Iowa_SGP <- prepareSGP(Iowa_Data_LONG, fix.duplicates="KEEP.ALL")

save(Iowa_SGP, file="Iowa_SGP.Rdata")


### analyzeSGP

Iowa_SGP <- analyzeSGP(Iowa_SGP
		sgp.percentiles=TRUE,
		sgp.projections=TRUE,
		sgp.projections.lagged=TRUE,
		sgp.percentiles.baseline=FALSE,
		sgp.projections.baseline=FALSE,
		sgp.projections.lagged.baseline=FALSE)

save(Iowa_SGP, file="Iowa_SGP.Rdata")


### combineSGP

Iowa_SGP <- combineSGP(Iowa_SGP, sgp.target.scale.scores=TRUE)

save(Iowa_SGP, file="Iowa_SGP.Rdata")


### visualizeSGP

visualizeSGP(Iowa_SGP, plot.types=c("growthAchievementPlot", "studentGrowthPlot"), sgPlot.demo.report=TRUE)
