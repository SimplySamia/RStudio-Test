makecachematrix <- function(x = matrix()){
  
    inv <- NULL
    set<- function(y){
      x <<- y
      inv <<- NULL
    }
    
    get <- function() {x}
    setInverse <- function(inverse) {inc <<- inverse}
    getInverse <- function() {inv}
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cachesolve <- function(x,...){
  
    inv <- x$getInverse()
    if(!is.null(inv)){
      message("getting cached data")
      return(inv)
      
    }
    mat <- x$get()
    inv <- solve(mat,...)
    x$setInverse(inv)
    inv

}

#Example: 

matrix1 <- makecachematrix(matrix(1:4, nrow = 2,ncol = 2))
matrix1$get()
matrix1$getInverse()
cachesolve((matrix1))
