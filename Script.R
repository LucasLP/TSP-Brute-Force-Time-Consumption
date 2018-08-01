#R version 3.3.2 
#TSP brute force time consumption
#Try it Online!
    # http://rextester.com/l/r_online_compiler


#=====================================================
#           Parameters
#=====================================================

cities <- 25

#CPU informations
ghz <- 2.5
cores <- 4
TDP <- 25 #watts
kiloWattHour <- 0.81

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
    
    cost <- format(round(hours*TDP*kiloWattHour,2), nsmall = 2)
        
    if(myears > 1){
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(myears,3)," million of years    Total Cost: R$",cost,sep=""));
    }else if(years > 1) {
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(years,3)," years    Total Cost: R$",cost,sep=""));
    } else if(days > 1) { 
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(days)," days and ", round((days %% 1)*24)," hours    Total Cost: R$",cost,sep=""));
    } else if(hours > 1) {
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(hours)," hours and ",round((hours %% 1)*60)," minutes    Total Cost: R$",cost,sep=""));
    } else if(minutes > 1) {
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(minutes)," minutes and ",round((minutes %% 1)*60)," seconds    Total Cost: R$",cost,sep=""));
    } else {
        print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(seconds,3)," seconds    Total Cost: R$",cost,sep=""));
    }
}
