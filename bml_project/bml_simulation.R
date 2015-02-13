#################################################################################
#### BML Simulation Study

#### Put in this file the code to run the BML simulation study for a set of input parameters.
#### Save some of the output data into an R object and use save() to save it to disk for reference
#### when you write up your results.
#### The output can e.g. be how many steps the system took until it hit gridlock or
#### how many steps you observered before concluding that it is in a free flowing state.

### NOTES 

#My bml.step() function moves reds once east and then blues once north.
#I considered one odd timestep and one even timestep as one whole step.
#Thus, the steps.until.gridlock displays the number of times each color car moved until it reached gridlock.
#If steps.until.gridlock = n, the matrix never hits gridlock.

### PARAMETER: DENSITY p
### testing with low probability (will most likely not gridlock)
r <- 100
c <- 100
p <- .2

bml.sim(r, c, p, n=10000)

# image of initial low.p
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix density p = 0.2", 
      xlab = "X", ylab = "Y")
# image of final low.p
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix density p = 0.2", xlab = "X", ylab = "Y")

### testing with medium p (sometimes gridlock)
r <- 100
c <- 100
p <- .35
medium.p <- bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial medium.p
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix density p = 0.35",
      xlab = "X", ylab = "Y")
#image of final medium.p
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix density p = 0.35", xlab = "X", ylab = "Y")

### testing with high p (will probably gridlock before reach maximum number of steps n)
r <- 100
c <- 100
p <- .7

bml.sim(r, c, p, n=10000)

# image of initial high.p
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix density p = 0.70",
      xlab = "X", ylab = "Y")
#image of final high.p
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix density p = 0.70", xlab = "X", ylab = "Y")

### PARAMETER: SIZE [r x c]
### use all
### p = 0.35
### n = 10,000
p <- 0.35
n = 10000

# [70 x 130]
r <- 70
c <- 130

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial 70x130
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix 70 x 130",
      xlab = "X", ylab = "Y")
#image of final 70x130
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix 70 x 130", xlab = "X", ylab = "Y")

# [130 x 70]
r <- 130
c <- 70

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial 130x70
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix 130 x 70",
      xlab = "X", ylab = "Y")
#image of final 130x70
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix 130 x 70", xlab = "X", ylab = "Y")

# [50 x 150]
r <- 50
c <- 150

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial 50x150
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix 50 x 150",
      xlab = "X", ylab = "Y")
#image of final 50x150
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix 50 x 150", xlab = "X", ylab = "Y")

# [150 x 50]
r <- 150
c <- 50

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial 150x50
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix 150 x 50",
      xlab = "X", ylab = "Y")
#image of final 150x50
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix 150 x 50", xlab = "X", ylab = "Y")

# [100 x 100]
r <- 100
c <- 100

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial 100x100
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix 100 x 100",
      xlab = "X", ylab = "Y")
#image of final 100x100
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix 100 x 100", xlab = "X", ylab = "Y")

### PARAMETER number of steps: n
### use all
### r = 100
### c = 100
### p = 0.35
r <- 100
c <- 100
p <- 0.35

# n = 1,000
n = 1000

bml.init(r, c, p)
bml.sim(r, c, p, n=1000)

# image of initial n = 1000
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix n = 1000",
      xlab = "X", ylab = "Y")
#image of final n = 1000
image(bml.sim(r, c, p, n=1000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix n = 1000", xlab = "X", ylab = "Y")

# n = 5,000
n = 5000

bml.init(r, c, p)
bml.sim(r, c, p, n=5000)

# image of initial n = 5000
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix n = 5000",
      xlab = "X", ylab = "Y")
#image of final n = 5000
image(bml.sim(r, c, p, n=5000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix n = 5000", xlab = "X", ylab = "Y")

#n = 10000
n = 10000

bml.init(r, c, p)
bml.sim(r, c, p, n=10000)

# image of initial n = 10000
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix n = 10000",
      xlab = "X", ylab = "Y")
#image of final n = 10000
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix n = 10000", xlab = "X", ylab = "Y")

# n = 20,000
n = 20000

bml.init(r, c, p)
bml.sim(r, c, p, n=20000)

# image of initial n = 20000
image(bml.init(r, c, p), col=c("white", "red", "blue"), main = "Initial matrix n = 20000",
      xlab = "X", ylab = "Y")
#image of final n = 20000
image(bml.sim(r, c, p, n=20000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "Final matrix n = 20000", xlab = "X", ylab = "Y")

### testing densities 
r <- 50
c <- 50
n <- 10000

p <- 0.25
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.25", xlab = "X", ylab = "Y")

p <- 0.30
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.30", xlab = "X", ylab = "Y")

p <- 0.33
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.33", xlab = "X", ylab = "Y")

p <- 0.35
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.35", xlab = "X", ylab = "Y")

p <- 0.37
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.37", xlab = "X", ylab = "Y")

p <- 0.40
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.40", xlab = "X", ylab = "Y")

p <- 0.45
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.45", xlab = "X", ylab = "Y")

p <- 0.50
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.50", xlab = "X", ylab = "Y")

p <- 0.55
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.55", xlab = "X", ylab = "Y")

p <- 0.60
image(bml.sim(r, c, p, n=10000)[[1]][[1]], col=c("white", "red", "blue"),
      main = "density p = 0.60", xlab = "X", ylab = "Y")

### how many simulation steps

r <- 75
c <- 75
n <- 10000

p <- 0.25
bml.sim(r, c, p, n=10000)[2]
#steps.until.gridlock returned 100000

p <- 0.30
bml.sim(r, c, p, n=10000)[2]
#returned 10000

p <- 0.33
bml.sim(r, c, p, n=10000)[2]
#returned 10000

p <- 0.35
bml.sim(r, c, p, n=10000)[2]
#returned 10000

p <- 0.37
bml.sim(r, c, p, n=10000)[2]
#returned 10000

p <- 0.40
bml.sim(r, c, p, n=10000)[2]
#returned 7229

p <- 0.45
bml.sim(r, c, p, n=10000)[2]
#returned 832

p <- 0.50
bml.sim(r, c, p, n=10000)[2]
#returned 277

p <- 0.55
bml.sim(r, c, p, n=10000)[2]
#returned 203

p <- 0.60
bml.sim(r, c, p, n=10000)[2]
#returned 178

