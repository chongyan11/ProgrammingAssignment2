## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this functions

## Mirrors makeVector function given in example
## 1. Get Matrix
## 2. Set Matrix
## 3. Get Inverse
## 4. Set Inverse
makeCacheMatrix <- function(x = matrix()) {
# by default, x is an empty matrix initialised
  inv <- NULL
  
  ## Set Matrix - if a new matrix is keyed in, refresh the cache
  set <- function (y) {
    x <<- y
    inv <<- NULL
    print(x)
  }
  
  ## Get Matrix - retrieves stored matrix
  get <- function () {
    x
  }
  
  ## Set Inverse - Called by CacheSolve
  setInv <- function (mean) {
    inv <<- mean
  }
  
  ## Get Inverse - retrieves stored inverse
  getInv <- function () {
    inv
  }
  
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function
# Works with makeCacheInverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return (inv)
  }
  a <- x$get()
  inv <- solve(a, ...)
  x$setInv(inv)
  inv
}
