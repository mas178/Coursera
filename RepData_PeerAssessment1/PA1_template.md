# Reproducible Research: Peer Assessment 1

## Loading and preprocessing the data

```r
unzip("activity.zip", files = "activity.csv")
act <- read.csv("activity.csv", colClasses = c("numeric", "Date", "numeric"))
actExceptNA <- na.omit(act)
```

## What is mean total number of steps taken per day?

```r
stepsPerDay <- aggregate(actExceptNA$steps, list(actExceptNA$date), sum)
colnames(stepsPerDay) <- c("Date", "Steps")
```

the mean is

```r
mean(stepsPerDay$Steps)
```

```
## [1] 10766
```

the median is

```r
median(stepsPerDay$Steps)
```

```
## [1] 10765
```


```r
hist(stepsPerDay$Steps)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


## What is the average daily activity pattern?

```r
stepsPer5Min <- aggregate(actExceptNA$steps, list(actExceptNA$interval), mean)
colnames(stepsPer5Min) <- c("5-minute interval", "Steps")
plot(stepsPer5Min, type = "l")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

## Imputing missing values
Fill in na value by median for that day.

```r
actFilledIn <- act
actFilledIn$steps[is.na(actFilledIn$steps)] <- median(stepsPerDay$Steps)/nrow(stepsPer5Min)
```

## Are there differences in activity patterns between weekdays and weekends?

```r
Sys.setlocale("LC_TIME", "C")  # for multi byte environment
```

```
## [1] "C"
```

```r
actAllday <- data.frame(actFilledIn$steps, weekdays(actFilledIn$date), actFilledIn$interval)
colnames(actAllday) <- c("steps", "date", "interval")

actWeekday <- subset(actAllday, !date %in% c("Saturday", "Sunday"))
actWeekend <- subset(actAllday, date %in% c("Saturday", "Sunday"))

stepsWeekday <- aggregate(actWeekday$steps, list(actWeekday$interval), mean)
stepsWeekend <- aggregate(actWeekend$steps, list(actWeekend$interval), mean)
colnames(stepsWeekday) <- c("5-minute interval", "Steps")
colnames(stepsWeekend) <- c("5-minute interval", "Steps")

par(mfrow = c(2, 1))
plot(stepsWeekday, type = "l", main = "Activity patterns in Weekdays")
plot(stepsWeekend, type = "l", main = "Activity patterns in Weekends")
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 

As above graph, there are difference in activity patterns between weekdays and weekends.  
In weekdays, the activities peek is higher than weekends and it's in AM.  
In weekends, the activities are scattered from AM to PM.
