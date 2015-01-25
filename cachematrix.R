## This first function sets the contents of a matrixs and calculates its inverse

## set the matrix, set its inverse, and get its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- null
  set <- function(y) {
    x <<- y
    m <<- null
  }
  get <- function() x
  setinverse <- function(solve) m <<- inverse
  getinverse <- function () m
  list(set = set, get = get,
       setinverse = setinverse, getinverse = getinverse)
}


## calculate the inverse of the matrix, if it hasn't already been calculated

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m ## Return a matrix that is the inverse of 'x'
}

mat <- matrix(rnorm(100), 10, 10)

cacheSolve(mat)
