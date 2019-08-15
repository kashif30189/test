# I am going to create a qq plot

# what the hell was i even trying
# Here adding another line
# This is so that we can have two commits ahead
# Edited for merging

# First lets get the variable in one uniform and one normal
 var1 <- runif(30,100,200)
 var2 <- rnorm(30,mean = mean(var1),sd = sd(var1))
# Now I will create nearly 100 quantiles and there z value for norm
 z_values <- qnorm(seq(0,1,1/100))
# for these values i need to find the real values
 real_values <- mean(var1) + z_values*sd(var1)
 library(ggplot2)
 var1_order <- var1[order(var1)]
var2_order <- var2[order(var2)] 
quantiles_values <- seq(0,1,1/29)
z_quantile <- qnorm(quantiles_values)
df1 <- data.frame(x = z_values, y =  real_values)
df2 <- data.frame(Quantiles = quantiles_values, Variable1 = var1_order,
                  Variable2 = var2_order, z = z_quantile)
p <- ggplot(df1,aes(x,y)) + geom_line()
p1 <- p + geom_point(data=df2,aes(z,Variable1),color="red")
p1 + geom_point(data=df2,aes(z,Variable2))
