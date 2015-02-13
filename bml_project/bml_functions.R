#################################################################################
#### Functions for BML Simulation Study


#### Initialization function.
## Input : size of grid [r and c] and density [p]
## Output : A matrix [m] with entries 0 (no cars) 1 (red cars) or 2 (blue cars)
## that stores the state of the system (i.e. location of red and blue cars)

bml.init <- function(r, c, p){
  red <- p/2
  blue <- p/2
  white <- (1-p)
  total.spots <- r*c
  placement <- sample(0:2, size=total.spots, replace=TRUE, prob=c(white, red, blue))
  m <- matrix(placement, nrow=r, ncol=c)
  return(m)
}

###testing for bml.step() 
r <- 5
c <- 5
p <- .5
m <- bml.init(r, c, p)
m #this will be the matrix inputed into bml.step(m)
  #of course m can be any matrix but for this exercise, save matrix from bml.init() to test in bml.step()

#print image of test assigning white-empty, red-1, blue-2
image(m, col = c("white", "red", "blue")) 

#rotate matrx 90 degrees to the left to make it easier to read the image
rotate.90.left <- function(bml.init){
  apply(bml.init,1,rev)
}
rotate.90.left(m)


#### Function to move the system one step (east and north)
## Input : a matrix [m] of the same type as the output from bml.init()
## Output : TWO variables, the updated [m] and a logical variable
## [grid.new] which should be TRUE if the system changed, FALSE otherwise.

## NOTE : the function should move the red cars once and the blue cars once,
## you can write extra functions that do just a step north or just a step east.

bml.step <- function(m){
  #easier to work with as a vector
  #create data frame of x coordinates, y coordinates, colors
  x <- rep(seq(1:r), c) #x coordinates
  y <- rep(1:c, each=r) #y coordinates
  color <- as.vector(m) #color vector
  cars <- data.frame(x, y, color) #data frame
  for(i in 1:2) { #2 timesteps (one odd timestep and one even timestep)
    if(i %% 2 == 1) { #odd timestep
      cars = cars[order(cars$x, cars$y),] #read horizontally to make moving to the right easier
      reds <- which(cars$color == 1) #subset positions of red cars
      reds = which(cars$color == 1)
      right.edge = which(reds %% c == 0) #s
      inside = if(length(right.edge) != 0) reds[-right.edge] else reds
      right.edge = reds[right.edge]
      
      movecarsmove = cars
      
      # move red cars on right edge
      if(length(right.edge) != 0){
        movecarsmove$color[right.edge[cars[right.edge - (c-1), 3] == 0] - (c-1)] = 1
        movecarsmove$color[right.edge[cars[right.edge - (c-1), 3] == 0]] = 0 
      }
      
      # move red cars not on right edge
      if (length(inside) != 0){
        movecarsmove$color[inside[cars[inside+1, 3] == 0] + 1] = 1 
        movecarsmove$color[inside[cars[inside+1, 3] == 0]] = 0 
      }
      
      cars = movecarsmove
      
    } else {
      cars = cars[order(cars$y, cars$x),] 
      blues = which(cars$color == 2) #subset positions of blue cars
      bottom.edge = which(blues %% r == 0) 
      inside = if(length(bottom.edge) != 0) blues[-bottom.edge] else blues #subset blues on edge
      bottom.edge = blues[bottom.edge] #subset blues not on bottom edge
      
      movecarsmove = cars 
      
      #move blue cars on bottom edge
      if (length(bottom.edge) != 0) {
        movecarsmove$color[bottom.edge[cars[bottom.edge-(r-1), 3] == 0] - (r-1)] = 2 
        movecarsmove$color[bottom.edge[cars[bottom.edge-(r-1), 3] == 0]] = 0 
      }
      
      # move blue cars not on bottom edge
      if (length(inside) != 0) {
        movecarsmove$color[inside[cars[inside+1, 3] == 0] + 1] = 2 
        movecarsmove$color[inside[cars[inside+1, 3] == 0]] = 0 
      }
      
      cars = movecarsmove
      new.matrix = matrix(cars$color, nrow=r, ncol=c)
      
    }  
  }
  w <- m == new.matrix
  p <- as.vector(w)
  grid.new <- any(w == FALSE)
  m = new.matrix
  
  return(list(m, grid.new))
}

#### Function to do a simulation for a given set of input parameters
## Input : size of grid [r and c] and density [p]
## Output : *up to you* (e.g. number of steps taken, did you hit gridlock, ...)

## n = number of steps taken
## n can be substituted any number
bml.sim <- function(r, c, p, n){
  m0 <- bml.init(r, c, p) #create intial matrix
  m1 <- bml.step(m0) #perform first step on m0
  i=1 #first iteration
  while(m1[[2]] == TRUE & i < n){ #loop as long as grid.new==TRUE and have not reached maximum steps n
    bml.step(m1[[1]]) 
    m1 <- bml.step(m1[[1]]) #update m1 to be looped again
    i <- i+1 #tracks that iteration has been performed
  }
  return(list(m1, steps.until.gridlock = i))
}