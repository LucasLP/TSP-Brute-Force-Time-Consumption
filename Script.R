#R version 3.3.2 
#TSP brute force time consumption
#Try it Online!
    # http://rextester.com/l/r_online_compiler

cities <- 10
rotesPerSecond <- 1000000
  
  
for(i in 1:cities){
  possibilities <- factorial(i)
  pos <- c(pos, possibilities)
  time <- possibilities/rotesPerSecond
    
  time <- time/60 #seconds
  time <- time/60 #minutes
  time <- time/60 #hours
  time <- time/24 #days
  time <- time/365 #years
    
  print(paste("N. Cities: ",i,"   N. possibilities: ",possibilities,"   time: ",time," years",sep=""));
}
