# Load necessary libraries
library(R6)
library(ggplot2)
library(hexbin)

#install.packages("ggplot2")
#install.packages("hexbin")

# DomainClass
Domain <- R6Class("Domain",
                  public = list(
                    data = NULL,
                    
                    initialize = function(file_path) {
                      self$data <- read.csv(file_path)
                    },
                    
                    plotDomain = function(...) {
                      # Hexagonal map.
                      
                      bin <- hexbin(self$data[,1], self$data[,2])
                      plot(bin, main = "Hexagonal Binning", xlab = "First Variable", ylab = "Second Variable", ...)
                    },
                    
                    plotPoints = function(...) {
                      # Original observations.
                      
                      ggplot(self$data, aes(x = self$data[,1], y = self$data[,2])) +
                        geom_point() +
                        theme_minimal() +
                        labs(title = "Original Observations", x = "First Variable", y = "Second Variable") +
                        theme(plot.title = element_text(hjust = 0.6), legend.position = "none")
                    }
                  )
)


domain_1 <- Domain$new("C:/Users/FX505DT/Downloads/test_data_00.csv")
domain_1$plotDomain()
domain_1$plotPoints()

domain_2 <- Domain$new("C:/Users/FX505DT/Downloads/test_data_01.csv")
domain_2$plotDomain()
domain_2$plotPoints()

domain_3 <- Domain$new("C:/Users/FX505DT/Downloads/test_data_02.csv")
domain_3$plotDomain()
domain_3$plotPoints()