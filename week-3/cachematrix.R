## These functions create a matrix object that caches its inverse,
## then computes the inverse of the matrix, and checks to see if that value
## is in the cache. If it is, it returns the cached value. If it's not
## it returns the newly calculated value.

## makeCacheMatrix creates a matrix object that caches its inverse, and 
## makes a list of functions that will be used in the cacheSolve function. 

makeCacheMatrix <- function(x = matrix()) {
    inv = NULL
    set = function(y) {
        x <<- y
        inv <<- NULL
    }
    get = function() x
    setinv = function(inverse) inv <<- inverse 
    getinv = function() inv
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## cacheSolve checks to see if the inverse of this matrix
## has been cached. If it has, it returns the cached matrix. 
## If it hasn't, it calcs and returns the inverse of the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv = x$getinv()
    if (!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    mat.data = x$get()
    inv = solve(mat.data, ...)
    x$setinv(inv)
    inv  
}