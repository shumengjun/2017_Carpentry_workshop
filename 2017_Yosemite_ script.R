## Mengjun Shu 
## 2017 Yosemite workshop
##08/18/2017

## download.file("https://ndownloader.figshare.com/files/2292169",
##            "data/portal_data_joined.csv")


surveys <- read.csv("data/portal_data_joined.csv")

## Explore data
head(surveys)
tail(surveys)
tail(surveys, 12)
str(surveys)
summary(surveys)
dim(surveys)
nrow(surveys)
ncol(surveys)

names(surveys)

head(surveys$weight)
tail(surveys$weight)
str(surveys$weight)
summary(surveys$weight)


plot(surveys$year, surveys$weight)
plot(surveys$hindfoot_length, surveys$weight)


summary(surveys$month)
hist(surveys$month)


summary(surveys$taxa)
levels(surveys$taxa)
nlevels(surveys$taxa)
hist(survey)

class(surveys$taxa)
table(surveys$taxa)

## subset in base R ----
## [rows, colums]

##return all the columns
surveys[surveys$genus == 'Ammodramus', ]


##return part the columns

surveys[surveys$genus == 'Ammodramus', c('record_id', 'month', 'weight')]

#Different ways to figure out how many month is January or February
nrow(surveys[surveys$month < 3, ]) 

surveys[surveys$month == 1, ]

table(surveys$month < 3)

month_new <- surveys[surveys$month < 3, ]

length(which(surveys$month < 3))




