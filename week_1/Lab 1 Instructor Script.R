######################################################
# ESM 206 LAB 1
# Allison Horst
# 9/27/18
######################################################

######################################################
# Step 1. Intro to RStudio Environment
######################################################

### A - Open RStudio
### B - The environment (explain windows, scripts, files, environment, etc.)
### C - Working in the console (why it's quick and dirty, why it's a nightmare for research and collaboration)

######################################################
# Part 2. Projects
######################################################

### Have them create a new project (after making a folder for ESM 206/Labs/Lab Week 1) with File > New Project. 

### When you open the project, R will recognize that as your working directory. Notice that the pathway shows up in the top bar of RStudio, and any files that you save/add are automatically added to that working directory. A folder for the entire project is also created.

### Now we have a project created, and it's waiting for us to actually contribute something to it. We're going to work today in something called a SCRIPT. It's like a text editor (as opposed to the always-active console) and only runs lines of code when you ask it to. It also allows you to keep a clear record of the work you have done. 

######################################################
# Part 3. Scripts - Good habits, organization and other things
######################################################

### A - How scripts work (+ comments)
### B - How to run code in a script (+ shortcuts)
### C - They start creating their own script using great organization
### D - Have them create a couple of variables - note how they show up in the Environment window when stored (create so they can see how saving a script means they can quickly retrieve variables)
### E - Save the script they've started creating (make a point of emphasizing importance of organized folders starting NOW)

### *** Remember show them to wrap text: Tools > Global Options > Code > Soft Wrap R Source Files > Apply ***

######################################################
# Part 4. Loading the package 'tidyverse'
######################################################

### A - Explain briefly what packages are (and why they don't all load automatically)
### B - Load package tidyverse

library(tidyverse)

######################################################
# Part 5. Loading data from .csv files
######################################################

### Loading files into RStudio is EASY if you're working in a project. All you have to do is drag and drop the file (usually a .csv file) into your project folder.

# Have them drag and drop into the project folder, and note that it appears in the 'Files' tab in RStudio automatically. That's because R knows that it's been added to our working directory. 

# Once it's in the Project, then it's easy to load using read_csv().

np_visits <- read_csv("National Park Visitation Data.csv") # Make sure they get used to adding comments after each line of code!

######################################################
# Part 5. Initial data exploration
######################################################

## ALWAYS. EXPLORE. YOUR. DATA. ##

names(np_visits) # Shows variable (column) names
dim(np_visits) # Dimensions of dataset
class(np_visits) # Data class
head(np_visits) # Shows first 6 lines of dataset
tail(np_visits) # Shows last 6 lines of dataset

# Want to know how a function works?

?names # Single question mark brings up R documentation for that function
??name # Will bring up every function that may contain this term

# Single columns can be referred to using a '$'
Reg <- np_visits$Region # A vector only containing information in column 'Region' from NPDF

MaxVis <- max(np_visits$Visitors, na.rm = TRUE) # Finds the maximum value from the 'Visitors' column in the NPDF df (this is a good way to show what can happen if they have NA 'values')

#######################################################
# Part 6. Basic data wrangling (dplyr functions)
#######################################################

df1 <- select(np_visits, State:YearRaw) # Only select columns from State through YearRaw in NPDF data frame, store as a new data frame 'df1'
View(df1) # Remember to look at it!

df2 <- filter(df1, State == "CA" & Type == "National Park" & YearRaw >= 1950) # Filters so that only rows are retained if the State column is 'CA' and the Type column is 'National Park' AND only incudes if Year is 1950 or greater, stores as new subset data frame 'df2'
View(df2) # Always look!

df3 <- arrange(df2, Code, YearRaw) # Arranges data first by alphabetical order in 'Code' column, THEN by ascending value in YearRaw column
View(df3)

df4 <- mutate(df3, kVis = Visitors/1000) # Adds a NEW column called 'kVis' (for thousands of visitors) to 'df3' that is the Visitors column divided by 1000 (convert to units of 1000s of visitors)
View(df4)

df5 <- filter(df4, YearRaw != "Total") # Remove any 'Total' values in the YearRaw column (!= means "does NOT match)
# Look at the class of each of the columns
summary(df5) # Uh oh. YearRaw is stored as a character (because it HAD those 'Total' characters in it). We want it to be stored as a number so that we can use it easily as our x-axis value. 

df5$YearRaw <- as.numeric(df5$YearRaw) # Changes the YearRaw column of df5 to 'numeric' instead of 'character'
class(df5$YearRaw) # Check! Now it returns 'numeric.' Hooray!


### This might seem a little inefficient. Yes, there is a better way. It's called "piping", and it allows you to write more streamlined code for sequential operations on a data frame. 

#####################################################
# Part 7. Introduction to piping
#####################################################

# In the example above, we wrote a separate line of code for each operation to manipulate the national parks data. That's good in some ways, but tedious in others. 

# What if we wanted to only keep national parks in Utah, exclude anything in the 'YearRaw' column that is a "Total", add a column that is millions of visitors, then arrange from high to low AND by type? We could follow the same process as below, or we can use piping. 

# Explain the pipe operator %>%  (command + shift + m)

# Think of this as a code way of saying "and then..."

utah_np <- np_visits %>% 
  select(Name, Visitors, YearRaw) %>% 
  filter(YearRaw != "Total") %>% 
  filter(State == "UT", Type == "National Park") %>% 
  mutate(mill_vis = Visitors/1000000)

utah_np
  

######################################################### 
# Part 8. Our first graph in ggplot
######################################################

# We're going to make a graph of visitation to the parks (in thousands of visitors) over years, with the color dependent on what park we're showing. 

# Three things you must tell R to make a graph in ggplot: 
# (1) That you're using ggplot
# (2) What data you're using (including what should be x and what should be y)
# (3) What type of graph you want to create
# Everything after that is extra to make it beautiful

VisitorGraph <- ggplot(df5, aes(x = YearRaw, y = kVis)) +
  geom_point()

quartz() # will be windows() on a PC!
VisitorGraph

# So that's kind of cool for a first shot, but it is definitely not a finalized graph. Let's start adding levels, and changing the line type, so we can get a graph that's a little nicer. 


VisitorGraph2 <- ggplot(df5, aes(x = YearRaw, y = kVis)) + # Tells R what data to use
  geom_point(aes(colour = Code)) + # Tells ggplot to make a scatterplot graph
  geom_line(aes(colour = Code)) + # ...then add to that a line graph
  ggtitle("California National Parks Visitation\n1950 - 2016") + # Gives it a title
  xlab("\nYear") + # Note that \n just adds a blank line before this label
  ylab("Thousands of Visitors\n") + # Again, but after the label
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) + # These things all 'clean up' graphic area - remove gridlines, background, etc.
  scale_x_continuous(breaks = c(1950,1960,1970,1980,1990,2000,2010,2020)) # Specify where tickmarks should be 

quartz() # will be windows() on a PC!
VisitorGraph2

# Want to create an interactive graph? Use plotly! Omitted for 2018 because students haven't installed plotly yet...

# library(plotly)
# ggplotly(VisitorGraph2)

######################################################
# Part 8. Another ggplot graph (didn't do in lab)
######################################################

VisBoxplot <- ggplot(df5, aes(x = Code, y = kVis)) +
  geom_boxplot(aes(fill = Code)) +
  theme_bw() +
  ggtitle("CA National Park Visitation (1950 - 2016)") +
  xlab("National Park") +
  ylab("Thousands of Visitors") +
  scale_x_discrete(breaks = c("CHIS","DEVA","JOTR","KICA","LAVO","PINN","REDW","SEQU","YOSE"), labels = c("Channel Islands","Death Valley","Joshua Tree","Kings Canyon","Lassen Volcanic","Pinnacles","Redwoods","Sequoia","Yosemite")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45)) 


quartz() # Remember, change to windows() on a PC
VisBoxplot

