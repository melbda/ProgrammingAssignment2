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