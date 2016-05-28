# --------------------------------
# This function creates a special "matrix" object that can cache its inverse.
#
# Parameter x is an invertible matrix.
# Return a special "matrix" object that can cache its inverse.
# --------------------------------
makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setinverse <- function(inverse) {
    inv <<- inverse
  }
  
  getinverse <- function() {
    inv
  }

  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# --------------------------------
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated (and the matrix has not changed),
# then the cachesolve should retrieve the inverse from the cache.
#
# Parameter x is a special matrix object created by makeCacheMatrix function.
# Return inversed matrix (if there is cached value then retern it).
# --------------------------------
cacheSolve <- function(x, ...) {
  
  # check cache and if there is cached inverse matrix then retern it.
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached matrix")
    return(inv)
  }
  
  # calcurate inverse matrix, cache the answer and return it. 
  # Assumed that the matrix supplied is always invertible.
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setinverse(inv)
  return(inv)
}

# --------------------------------
# Code for test
# --------------------------------
executeTest <- function() {

  message("Test 1: Check the calculated value is correct. Expected result is 6 x 6 identity matrix.")
  m <- matrix(rnorm(36), nrow=6, ncol=6)
  specialMatrix <- makeCacheMatrix(m)
  print(round(m %*% cacheSolve(specialMatrix), digit=4))

  message("Test 2: Check using cached value. Expected result is message 'getting cached matrix' and 6 x 6 identity matrix")
  print(round(m %*% cacheSolve(specialMatrix), digit=4))
}