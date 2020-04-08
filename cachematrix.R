## The following functions are used to cache the inverse of a matrix

## The function makeCacheMatrix creates a special "matrix" object that can cache
##its inverse

makeCacheMatrix <- function(x = matrix()) {
  invM<-NULL                
  set<-function(y){   ##setting the value of the Matrix
    x<<-y
    invM<<-NULL
  }
  get<-funtion()x    ##getting the value of the Matrix
  setinverse<-function(inverse) invM<<-inverse  ##setting the value of the inverse
  getinverse<-function() invM   ##getting the value of the inverse
  list(set= set,get= get, setinverse= setinverse,getinverse=getinverse)
  
}


## The following function calculates the inverse of the special "matrix" created 
##with the above function.If the inverse has already been calculated ,it retrieves
##the inverse from the cache and skips the computation. Otherwise, it calculates  
##the inverse  and sets the value of the inverse in the cache via the setinverse
##function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invM<-x$getinverse()
  if (!is.null(invM)){
    message("getting cached data")
    return(invM)
  }
  data<-x$get()
  invM<-solve(data, ...)
  x$setinverse(invM)
  invM
}
