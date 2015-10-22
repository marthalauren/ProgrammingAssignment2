## makeCacheMatrix makes a "special"  matrix wherein an inverse can be stored
## cacheSolve solves the inverse of the  matrix and stores it in the special matrix

## makeCAcheMatrix converts a matrix into  a "special matrix" wherein the matrix is converted into 
#a list containing 4 functions: 1. setting the matrix into the list, 2. getting the matrix that was set, 
#3. setting the inverse matrix into the list, 4. getting the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        
        #this sets a matrix y into the special 
        matrix
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        # this returns the matrix set into the "special matrix"
        get <- function() x
        
        # this sets the inverse matrix 
        setinv <- function(inv) i <<- inv
        
        # this returns the inverse matrix and places the properties in list of the  "special matrix"  
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve retrieves or gets the inverse matrix from the list set in our "special matrix"
# if the inverse is not yet set, the function solves for the inverse and sets it in the list

cacheSolve <- function(x, ...)  {
        ## this checks if the cache has any value
        i <- x$getinv()
        ## this returns the cached inverse matrix
        if(!is.null(i)) {c
                message("getting cached data")
                return(i)
        }
        ## otherwise when the cache is empty the  inverse is calculated and stored in the cache
        else{
                data <- x$get()
                i <- solve(data, ...)
                x$setinv(i)
                i
                
        }
        
}