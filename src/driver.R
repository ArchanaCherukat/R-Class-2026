df.t1 <- read.csv(file="tempExperiment-raw.csv")
#run this line first and then make changes to the table in EditDataframe.R
source('src/EditDataframe.R')
#Checkpoint 4: How do we interpret this summary? Save “Analysis.R” and add a new line to your driver to call the analysis.
#Based on the ANOVA both temperature and population did not show statistical significance for snail growth rate. Comparing the two temperature showed a slight trend at a p-value of 0.0798 compared to population at a p-value of 0.2379. 
#There was no significant interaction between temperature and population (p = 0.5974), meaning snails from both populations responded similarly to temperature changes 
source('src/Analysis.R')
#Checkpoint 5. What did we just do? Do you think this approach is easily editable and reproducible?
# We built a fully automated scripted pipeline in which we were able to do raw data processing, data analysis and run statistical tests and finally log everything into GitHub through a single master driver script. 
#It's very reproducible and easy to edit. Anyone can clone the repository and run driver.R to get our exact results with zero manual clicks or Excel work. If the raw data changes, re-running the driver instantly updates all our downstream files, stats, and reports