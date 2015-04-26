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