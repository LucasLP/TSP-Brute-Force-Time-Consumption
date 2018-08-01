#R version 3.3.2 
#TSP brute force time consumption
#Try it Online!
    # http://rextester.com/l/r_online_compiler

    #or execute in you desktop application
    #Rscript Script.R
#=====================================================
#           Parameters
#=====================================================

#General Informations
cities <- 25
currency <- "R$"
kiloWattHour <- 0.81 #in your currency

#CPU informations
ghz <- 2.5
cores <- 4
TDP <- 25 #watts

#Number of CPU able to compute
parallelCPUs <- 10
  

#=====================================================
possibilities <- 1

for(i in 1:cities){
    instructionNumber <- i  #number of instruction will need to generate one rote
    rotesPerSecond <- (ghz * 1000000 * cores * parallelCPUs) / instructionNumber

    possibilities <- possibilities * i # <- factorial(i)
    
    seconds <- possibilities/rotesPerSecond
    minutes <- seconds/60 
    hours <- minutes/60
    days <- hours/24
    years <- days/365
    myears <- years/1000000
    
        
    result <- paste("N. Cities: ",i,"   N. possibilities: ",possibilities,sep="")
    if(myears > 1){
        result <- (paste(result,"   time: ",round(myears,3)," million of years",sep=""));
    }else if(years > 1) {
        result <- (paste(result,"   time: ",round(years,3)," years",sep=""));
    } else if(days > 1) { 
        result <- (paste(result,"   time: ",round(days)," days and ", round((days %% 1)*24)," hours",sep=""));
    } else if(hours > 1) {
        result <- (paste(result,"   time: ",round(hours)," hours and ",round((hours %% 1)*60)," minutes",sep=""));
    } else if(minutes > 1) {
        result <- (paste(result,"   time: ",round(minutes)," minutes and ",round((minutes %% 1)*60)," seconds",sep=""));
    } else {
        result <- (paste(result,"   time: ",round(seconds,3)," seconds",sep=""));
    }
        
    cost <- round(hours*TDP*kiloWattHour,2)
    if(cost>1000000){
        cost<-cost/1000000
        cost <- format(cost, nsmall = 0)
        result <- paste(result,"    Total Cost: ",currency," ",cost," Milhões",sep="");
    }else{
        cost <- format(cost, nsmall = 2)
        result <- paste(result,"    Total Cost: ",currency," ",cost,sep="");
    }
    print(result)
}
