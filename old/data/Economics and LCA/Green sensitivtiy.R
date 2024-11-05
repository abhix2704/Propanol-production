# library
library(tidyverse)
library(readxl)
library(RColorBrewer)
library(gridExtra)

data = read_excel("Economics plot data.xlsx", sheet = 9)

p <- ggplot(data, aes(x = CO2, y = Hydrogen, fill = Propanol))
p <- p + geom_tile() 
p <- p + scale_fill_distiller(palette = "Spectral", direction = -1, name = "Propanol [$/t]")
p <- p + scale_x_continuous(expand = c(0, 0), limits = c(-500,750))
p <- p + scale_y_continuous(expand = c(0, 0), limits = c(0,7000))
p <- p + theme_bw() 
p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 1))
p <- p + theme(text = element_text(size = 15)) 
p <- p + labs(x = "Carbon dioxide price [$/t]", y = "Hydrogen price [$/t]")
p <- p + geom_contour(aes(z = Propanol), breaks = 0, col = "black", size = 1.2, linetype = 2)
p <- p + geom_contour(aes(z = Propanol), breaks = 1250.2768, col = "black", size = 1.2)
p <- p + geom_point(aes(x = 106.2207, y = 4709.1621), shape = 4, size = 4, stroke = 2)
p <- p + geom_point(aes(x = 217.2035, y = 4709.1621), shape = 4, size = 4, stroke = 2)


data = read_excel("Economics plot data.xlsx", sheet = 10)

p2 <- ggplot(data, aes(x = CO2, y = Hydrogen, fill = Propanol))
p2 <- p2 + geom_tile() 
p2 <- p2 + scale_fill_distiller(palette = "Spectral", direction = -1, name = "Propanol [$/t]")
p2 <- p2 + scale_x_continuous(expand = c(0, 0), limits = c(-500,750))
p2 <- p2 + scale_y_continuous(expand = c(0, 0), limits = c(0,7000))
p2 <- p2 + theme_bw() 
p2 <- p2 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
               panel.background = element_rect(colour = "black", size = 1))
p2 <- p2 + theme(text = element_text(size = 15)) 
p2 <- p2 + labs(x = "Carbon dioxide price [$/t]", y = "Hydrogen price [$/t]")
p2 <- p2 + geom_contour(aes(z = Propanol), breaks = 0, col = "black", size = 1.2, linetype = 2)
p2 <- p2 + geom_contour(aes(z = Propanol), breaks = 1250.2768, col = "black", size = 1.2)
p2 <- p2 + geom_point(aes(x = 106.2207, y = 4709.1621), shape = 4, size = 4, stroke = 2)
p2 <- p2 + geom_point(aes(x = 217.2035, y = 4709.1621), shape = 4, size = 4, stroke = 2)


p3 <- ggplot(data, aes(x = CO2, y = Hydrogen, fill = Ethylene))
p3 <- p3 + geom_tile() 
p3 <- p3 + scale_fill_distiller(palette = "Spectral", direction = -1, name = "Ethylene [$/t]")
p3 <- p3 + scale_x_continuous(expand = c(0, 0), limits = c(-500,750))
p3 <- p3 + scale_y_continuous(expand = c(0, 0), limits = c(0,7000))
p3 <- p3 + theme_bw() 
p3 <- p3 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_rect(colour = "black", size = 1))
p3 <- p3 + theme(text = element_text(size = 15)) 
p3 <- p3 + labs(x = "Carbon dioxide price [$/t]", y = "Hydrogen price [$/t]")
p3 <- p3 + geom_contour(aes(z = Ethylene), breaks = 0, col = "black", size = 1.2, linetype = 2)
p3 <- p3 + geom_contour(aes(z = Ethylene), breaks = 1710.3783, col = "black", size = 1.2)
p3 <- p3 + geom_point(aes(x = 106.2207, y = 4709.1621), shape = 4, size = 4, stroke = 2)
p3 <- p3 + geom_point(aes(x = 217.2035, y = 4709.1621), shape = 4, size = 4, stroke = 2)

grid.arrange(p, p2, ncol = 2)
