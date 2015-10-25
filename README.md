# README.md

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

1) Ensure that library (data.table) is installed.

2) Ensure that library (dplyr) is insalled

3) The run_analysis.R is a script that converts data collect from the accelerometers and gyroscope from the Samsung Galaxy S smartphone when 30 folks (age group 19-48) went through a series of 6 activities.

4) run_analysis.R expects that data is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It expects the zip file to be extracted.

5)When data is extracted from the zip file it will create a directory called "UCI HAR Dataset"
run_analysis.R is located in the smae direcotry that includes the directory "UCI HAR Dataset"

6) run_analysis.R initially merges all the collected data (test and train) in the correct format. This data is stored in a
data table "alldat" (10299 rows, 561 columns)

7) Later run_analysis.R will select the appropriate columns that incluse the mean and std information. This is stored in 
another table called "reqddat" (10299 rows, 68 columns)

8) Then reqddat is grouped based on subjectid and activity and the means are calculated for all the remaining 66 columns. A new data frame is created called "datmean"" to store this data. (180 rows, 68 columns) 


```r
library(dplyr)
```

```
## Warning: package 'dplyr' was built under R version 3.2.2
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(data.table)
```

```
## 
## Attaching package: 'data.table'
## 
## The following objects are masked from 'package:dplyr':
## 
##     between, last
```

```r
source ("run_analysis.R")
table (reqddat$SubjectID, reqddat$Activity)
```

```
##     
##      LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
##   1      50      47       53      95                 49               53
##   2      48      46       54      59                 47               48
##   3      62      52       61      58                 49               59
##   4      54      50       56      60                 45               52
##   5      52      44       56      56                 47               47
##   6      57      55       57      57                 48               51
##   7      52      48       53      57                 47               51
##   8      54      46       54      48                 38               41
##   9      50      50       45      52                 42               49
##   10     58      54       44      53                 38               47
##   11     57      53       47      59                 46               54
##   12     60      51       61      50                 46               52
##   13     62      49       57      57                 47               55
##   14     51      54       60      59                 45               54
##   15     72      59       53      54                 42               48
##   16     70      69       78      51                 47               51
##   17     71      64       78      61                 46               48
##   18     65      57       73      56                 55               58
##   19     83      73       73      52                 39               40
##   20     68      66       73      51                 45               51
##   21     90      85       89      52                 45               47
##   22     72      62       63      46                 36               42
##   23     72      68       68      59                 54               51
##   24     72      68       69      58                 55               59
##   25     73      65       74      74                 58               65
##   26     76      78       74      59                 50               55
##   27     74      70       80      57                 44               51
##   28     80      72       79      54                 46               51
##   29     69      60       65      53                 48               49
##   30     70      62       59      65                 62               65
```

9) Columns in "datmean" aree renamed to meet the guidelines of tidy data


```r
table (datmean$subjectid, datmean$activity)
```

```
##     
##      LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
##   1       1       1        1       1                  1                1
##   2       1       1        1       1                  1                1
##   3       1       1        1       1                  1                1
##   4       1       1        1       1                  1                1
##   5       1       1        1       1                  1                1
##   6       1       1        1       1                  1                1
##   7       1       1        1       1                  1                1
##   8       1       1        1       1                  1                1
##   9       1       1        1       1                  1                1
##   10      1       1        1       1                  1                1
##   11      1       1        1       1                  1                1
##   12      1       1        1       1                  1                1
##   13      1       1        1       1                  1                1
##   14      1       1        1       1                  1                1
##   15      1       1        1       1                  1                1
##   16      1       1        1       1                  1                1
##   17      1       1        1       1                  1                1
##   18      1       1        1       1                  1                1
##   19      1       1        1       1                  1                1
##   20      1       1        1       1                  1                1
##   21      1       1        1       1                  1                1
##   22      1       1        1       1                  1                1
##   23      1       1        1       1                  1                1
##   24      1       1        1       1                  1                1
##   25      1       1        1       1                  1                1
##   26      1       1        1       1                  1                1
##   27      1       1        1       1                  1                1
##   28      1       1        1       1                  1                1
##   29      1       1        1       1                  1                1
##   30      1       1        1       1                  1                1
```

10) run_analysis.R eventually creates a "datamean.txt" which displays the the contents of datmean.

![](README_files/figure-html/unnamed-chunk-3-1.png) 
