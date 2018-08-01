#R version 3.3.2 
#TSP brute force time consumption
#Try it Online!
    # http://rextester.com/l/r_online_compiler

cities <- 20
rotesPerSecond <- 1000000
  
  
for(i in 1:cities){
  possibilities <- factorial(i)
  seconds <- possibilities/rotesPerSecond
  minutes <- seconds/60 
  hours <- minutes/60
  days <- hours/24
  years <- days/365
        
  if(years > 1) {
    print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",years," years",sep=""));
  } else if(days > 1) { 
    print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",days," days",sep=""));
  } else if(hours > 1) {
    print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(hours,3)," hours",sep=""));
  } else if(minutes > 1) {
    print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(minutes,3)," minutes",sep=""));
  } else {
    print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",round(seconds,3)," seconds",sep=""));
  }
}
