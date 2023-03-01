library(dplyr)
library(ggplot2)

rm(list = ls())

# Las funciones pueden tomar/leer variables definidas fuera de su scope 
# Pero no pueden modificarlas

external_var <- 202301
my_f <- function(iterations) {
  c <- data.frame(x = external_var, idx = 0)
  accum <- 0
  for(i in 1:iterations) {
    accum <- accum + 1
    a <- data.frame(x = external_var + accum, idx = i)
    c <- rbind(c, a)
  }
  return(c)
}

a <- my_f(5)


# For loops tienen acceso al global scope a menos que 
# no esten dentro de una funcion. Entonces pueden alterar
# variables que esten fuera del propio loop

b <- 5

bfun <- function() {
  for(i in 1:5) {
    b <- b +1
  }
  return(b)
}



b_fun <- bfun()




display_plot <- function() {
  
  my_plot <- list()
  columns <- names(mtcars)
  for(column in columns) {
    mp <- ggplot(mtcars, aes_string(x = mtcars$wt, y = column)) + geom_point()
    my_plot[[column]] <- mp
  }
  
  return(my_plot)
}


xv <- "mtcars$wt"

ggplot(mtcars, aes(x = xv, y = mtcars$mpg)) + geom_point()



a <- display_plot()

