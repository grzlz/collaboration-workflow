library(dplyr)
library(ggplot2)

rm(list = ls())









# Scope


funcion_a <- function(a) {
  
  acumulador <- data.frame(var1 = c(), var2 = c())
  for(i in 1:a) {
    print("Hola")
    df_auxiliar <- data.frame(var1 = i, var2 = "Hola")
    acumulador <- rbind(acumulador, df_auxiliar)
  }
  
  return(acumulador)
}

variable1 <- funcion_a(5)





c <- 50

for(i in 1:5) {
  c <- c + 1
}





















sample_data <- data.frame(dates = sample(seq(as.Date('2020-01-01'),
                                             as.Date('2023-01-01'),
                                             by="day"),
                                             60, replace = FALSE),
                          values = sample(400:800, 60))















































# Scope
# For loops dentro de funciones
# Funciones dentro de funciones


# TODO - encontrar un buen ejemplo repetitivo para introducir funciones
# TODO - encontrar un buen ejemplo repetitivo para introducir for loops
# TODO - funciones puras


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

# No olvidar enfasis en acumuladores
# Pero tambien mostrar que podemos prescindir de el 
# si mantenemos un registro del valor maximo en el vector
# al cual agregar solamente 1

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


# en ggplot no es suficiente con indicar el nombre del objeto que queremos
# agregar como capa. aes() es insuficiente. Tenemos que usar algo llamado
# aes_string() para, ahora si, poder utilizar el nombre como texto del objeto
# y finalmente decirle a ggplot que ese es un vector que graficar


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

