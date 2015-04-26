cacheSolve <- function(x = matrix(), ...) {
  ##This function computes the inverse of the special 
  ##matrix returned by `makeCacheMatrix`. If the inverse has
  ##already been calculated (and the matrix has not changed), 
  ##then the cachesolve should retrieve the inverse from the cache.
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