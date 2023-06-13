Minimum_Point <- function(startingPoint, targetFunction) {
  
  optimizer <- optim(par = startingPoint, fn = targetFunction, method = "L-BFGS-B")
  
  
  minimum_Value <- optimizer$value
  minimum_Point <- optimizer$par
  
  
  return(list("Minimum Point is" = minimum_Point, "Minimum Value is" = minimum_Value))
}


startingPoint <- c(1, 2)


targetFunction <- function(params) {
  x <- params[1]
  y <- params[2]
  
  
  value <- x^2 + y^2
  
  
  if (x < 0 || y < 0) {
    penalty <- 1e6  # Large penalty
    value <- value + penalty
  }
  
  return(value)
}


result <- Minimum_Point(startingPoint, targetFunction)

print(result)