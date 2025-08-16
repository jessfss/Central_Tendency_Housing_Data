---
title: "Mode in R"
output: html_notebook
---
```{r message=FALSE, warning=FALSE, error=TRUE}
# Load libraries
library(readr)
library(dplyr)
library(DescTools)
library(ggplot2)
```
```{r message=FALSE, warning=FALSE, error=TRUE}
# Read in housing data
brooklyn_one_bed <- read_csv('brooklyn-one-bed.csv')
brooklyn_price <- brooklyn_one_bed$rent

manhattan_one_bed <- read_csv('manhattan-one-bed.csv')
manhattan_price <- manhattan_one_bed$rent

queens_one_bed <- read_csv('queens-one-bed.csv')
queens_price <- queens_one_bed$rent

```

```{r error=TRUE}
#Calculate Mean
brooklyn_mean <- mean(brooklyn_price)
manhattan_mean <- mean(manhattan_price)
queens_mean <- mean(queens_price)
```

```{r error=TRUE}
#Calculate Median
brooklyn_median <- median(brooklyn_price)
manhattan_median <- median(manhattan_price)
queens_median <- median(queens_price)
```

```{r error=TRUE}
#Calculate Mode
brooklyn_mode <- Mode(brooklyn_price)
manhattan_mode <- Mode(manhattan_price)
queens_mode <- Mode(queens_price)
```

```{r error=TRUE}
# Checks
# Mean
if(exists('brooklyn_mean')) {
  print(paste("The mean price in Brooklyn is" , round(brooklyn_mean, digits=2))) 
}else{
    print("The mean price in Brooklyn is not yet defined.")
}

if(exists("manhattan_mean")) {
    print(paste("The mean price in Manhattan is", round(manhattan_mean,digits=2)))
} else {
    print("The mean in Manhattan is not yet defined.")
}
if(exists("queens_mean")) {
    print(paste("The mean price in Queens is" , round(queens_mean,digits=2)))
} else {
  print("The mean price in Queens is not yet defined.")
}   
    
# Median
if(exists("brooklyn_median")) {
  print(paste("The median price in Brooklyn is" , brooklyn_median)) 
}else{
    print("The median price in Brooklyn is not yet defined.")
}

if(exists("manhattan_median")) {
    print(paste("The median price in Manhattan is", manhattan_median))
} else {
    print("The median in Manhattan is not yet defined.")
}
if(exists("queens_median")) {
    print(paste("The median price in Queens is" , queens_median))
} else {
  print("The median price in Queens is not yet defined.")
} 
    
#Mode
if(exists("brooklyn_mode")) {
  print(paste("The mode price in Brooklyn is" , brooklyn_mode)) 
}else{
    print("The mode price in Brooklyn is not yet defined.")
}

if(exists("manhattan_median")) {
    print(paste("The mode price in Manhattan is", manhattan_mode))
} else {
    print("The mode in Manhattan is not yet defined.")
}
if(exists("queens_median")) {
    print(paste("The mode price in Queens is" , queens_mode))
} else {
  print("The mode price in Queens is not yet defined.")
} 
```
```{r}
# Function to create histogram with mean, median, mode 
plot_rent_histogram <- function(data, borough) {
  # Filter out zero or missing rents
  data_clean <- data[!is.na(data) & data > 0]

  # Calculate statistics
  mean_val <- mean(data_clean)
  median_val <- median(data_clean)
  mode_val <- Mode(data_clean)
  
  # Prepare data frame for vertical lines (on plot)
  stats_df <- data.frame(
    stat = c("mean", "median", "mode"),
    x = c(mean_val, median_val, mode_val),
    xend = c(mean_val, median_val, mode_val),
    y = 0,
    yend = Inf
  )
  
  ggplot(data.frame(rent = data_clean), aes(x = rent)) +
    geom_histogram(
      binwidth = (max(data_clean) - min(data_clean)) / 30, 
      fill = "#D0E6F7", color = "#1B3B6F", alpha = 0.8
    ) +
    geom_segment(
      data = stats_df,
      aes(x = x, xend = xend, y = y, yend = yend, color = stat),
      size = 1.5, show.legend = TRUE
    ) +
    scale_color_manual(
      name = "Statistics",
      values = c(
        mean = "#E63946",   # soft red
        median = "#457B9D", # muted blue
        mode = "#2A9D8F"    # teal
      ),
      labels = c("Mean", "Median", "Mode")
    ) +
    guides(color = guide_legend(
      override.aes = list(
        x = 0, xend = 1, y = 0, yend = 0,  # horizontal lines in legend
        size = 1.8
      )
    )) +
    labs(
      title = paste("Rent Prices in", borough),
      x = "Rent ($)",
      y = "Count"
    ) +
    theme_minimal() +
    theme(
      legend.position = "right",
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      legend.title = element_text(face = "bold"),
      legend.text = element_text(size = 11)
    )
}

```
```{r}
# Plot and save Brooklyn
p_brooklyn <- plot_rent_histogram(brooklyn_one_bed$rent, "Brooklyn")
ggsave("brooklyn_rent_histogram.png", plot = p_brooklyn, width = 8, height = 6, dpi = 300, bg = "white")

# Plot and save Manhattan
p_manhattan <- plot_rent_histogram(manhattan_one_bed$rent, "Manhattan")
ggsave("manhattan_rent_histogram.png", plot = p_manhattan, width = 8, height = 6, dpi = 300, bg = "white")

# Plot and save Queens
p_queens <- plot_rent_histogram(queens_one_bed$rent, "Queens")
ggsave("queens_rent_histogram.png", plot = p_queens, width = 8, height = 6, dpi = 300, bg = "white")

```

