## These two functions cache the computation of an inverse matrix
## using the R scoping rules

## This function creates the cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set = set, get = get, 
		 setinv = setinv, 
		 getinv = getinv)
}


## This function calculates the inverse matrix or gets the cached one

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
        	message("getting cached data")
        	return(m)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinv(inv)
        inv
}
