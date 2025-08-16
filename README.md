# Central Tendency for Housing Data
In this project, we analyze the mean, median, and mode costs of one-bedroom apartments in three New York City boroughs: Brooklyn, Manhattan, and Queens.  Using these statistics, we draw conclusions about the cost of living in each borough and discuss an important assumption when comparing them.

This project is an exercise from Codecademy’s Learn R course. The data was collected in collaboration with [StreetEasy.com](https://streeteasy.com/). While this project focuses on the cost of one-bedroom apartments, the dataset contains additional information if you want to explore the Brooklyn, Manhattan, and Queens housing markets further.

## Summary

This project demonstrates how to use central tendency measures in R to analyze real-world housing data and think critically about the insights and assumptions behind your analysis.

## What Does Our Data Tell Us?

Now, we use these statistics to make inferences about housing prices in Brooklyn, Queens, and Manhattan:

The average rent is highest in Manhattan and lowest in Queens.

The mean, median, and mode for each borough are fairly close, indicating central clustering around:

Brooklyn: ~$3,300

Manhattan: ~$3,900

Queens: ~$2,300

## Reflecting on Assumptions

Consider the assumptions made when drawing conclusions:

The data from StreetEasy is assumed to represent the entire borough.

However, StreetEasy data only reflects a subset of listings, so this may not be fully representative.

For example, rentcafe.com reports different average rents:

Brooklyn: $2,695

Manhattan: $4,188

Queens: $2,178

This discrepancy suggests potential differences in data sources worth considering.

## Visualizing Your Data

The exercise suggests drawing rough sketches, but I chose to create histograms instead and compare mine to the provided ones.
I used ggplot2 to create histograms of rent prices for Brooklyn, Manhattan, and Queens to better understand the data distribution and variability.

## Rent Price Histograms by Borough

### Queens  
![Queens Rent Histogram](https://github.com/jessfss/Central_Tendency_Housing_Data/blob/main/queens_rent_histogram.png?raw=true)

### Manhattan  
![Manhattan Rent Histogram](https://github.com/jessfss/Central_Tendency_Housing_Data/blob/main/manhattan_rent_histogram.png?raw=true)

### Brooklyn  
![Brooklyn Rent Histogram](https://github.com/jessfss/Central_Tendency_Housing_Data/blob/main/brooklyn_rent_histogram.png?raw=true)


