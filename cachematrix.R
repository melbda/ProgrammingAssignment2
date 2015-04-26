## Matrix inversion.  The pair of functions makeCacheMatrix and
## cacheSolve cache and return the inverse of a matrix.  This is an
## alternative to computing the inverse repeatedly.

## This function makeCacheMatrix creates a special "matrix" object 
## that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve(i, ...)) i <<- solve
  getinverse <- function() i
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function cacheSolve computes the inverse of the special 
## matrix returned by the function makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## The inverse of the matrix x is returned

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  y <- x$get()
  x$set(y)
  x$setinverse(i)
  i
}
