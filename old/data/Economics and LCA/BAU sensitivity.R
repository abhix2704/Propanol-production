# library
library(tidyverse)
library(readxl)
library(RColorBrewer)
library(gridExtra)

data = read_excel("Economics plot data.xlsx", sheet = 8)

p <- ggplot(data, aes(x = NG, y = 1, fill = Propanol))
p <- p + geom_tile() 
p <- p + scale_fill_distiller(palette = "Spectral", direction = +1, name = NULL)
p <- p + scale_x_continuous(expand = c(0, 0), limits = c(data$NG[1], tail(data$NG, n = 1))) 
p <- p + theme_bw() 
p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size = 1))
p <- p + theme(text = element_text(size = 15)) 
p <- p + labs(x = "Natural gas price [$/t]", y = "Production cost [$/t propanol]")
p <- p + theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())
p <- p +  geom_vline(xintercept = 542.4274, size = 1.5)
p <- p +  geom_vline(xintercept = 1520.8, size = 1.5)
p <- p + geom_point(aes(x = 1520.8), shape = 4, size = 3, stroke = 2)
p <- p + geom_point(aes(x = 1752.4), shape = 4, size = 3, stroke = 2)

p

x1 <- c(542.4274,542.4274)
y1 <- c(0,1710.3783)
x2 <- c(0,542.4274)
y2 <- c(1710.3783,1710.3783)
d1 <- data.frame(x1, y1, x2, y2)

p2 <- ggplot(data, aes(x = NG, y = Ethylene))
p2 <- p2 + geom_point() 
p2 <- p2 + geom_line(data = d1, aes(x1, y1), color = "red", size = 1.5)
p2 <- p2 + geom_line(data = d1, aes(x2, y2), color = "red", size = 1.5)
p2 <- p2 + theme_bw() 
p2 <- p2 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_rect(colour = "black", size = 1))
p2 <- p2 + theme(text = element_text(size = 15)) 
p2 <- p2 + labs(x = "Natural gas price [$/t]", y = "Ethylene price [$/t]")
p2 <- p2 + scale_x_continuous(expand = c(0, 0), limits = c(0, 2100)) 
p2 <- p2 + scale_y_continuous(expand = c(0, 0), limits = c(0, 5000)) 
grid.arrange(p2, p, ncol = 2)