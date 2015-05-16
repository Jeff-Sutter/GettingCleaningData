require(dplyr)
require(tidyr)
run_Analysis <- function()
{
  ######################################################  
  # PART 1: LOADING DATA FILES
  # file paths
  test_data_location    <- "UCI HAR Dataset\\test\\X_test.txt"
  test_subj_location    <- "UCI HAR Dataset\\test\\subject_test.txt"
  test_acti_location    <- "UCI HAR Dataset\\test\\y_test.txt"
  train_data_location   <- "UCI HAR Dataset\\train\\X_train.txt"
  train_subj_location   <- "UCI HAR Dataset\\train\\subject_train.txt"
  train_acti_location   <- "UCI HAR Dataset\\train\\y_train.txt"
  features_location     <- "UCI HAR Dataset\\features.txt"  
  activity_location     <- "UCI HAR Dataset\\activity_labels.txt"  
  
  # load test and train data
  print("loading test data ..")
  test_data     <- tbl_df(read.csv(test_data_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  test_subj     <- tbl_df(read.csv(test_subj_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  test_acti     <- tbl_df(read.csv(test_acti_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  names(test_subj) <- c("SUBJECT")
  names(test_acti) <- c("ACTIVITY_ID")
  
  print("loading train data ..")
  train_data      <- tbl_df(read.csv(train_data_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  train_subj      <- tbl_df(read.csv(train_subj_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  train_acti      <- tbl_df(read.csv(train_acti_location, stringsAsFactors=FALSE, sep="", head=FALSE, colClasses=c("numeric")))
  names(train_subj) <- c("SUBJECT")
  names(train_acti) <- c("ACTIVITY_ID")
  
  print("loading features and activities ..")
  features    <- tbl_df(read.csv(features_location, stringsAsFactors=FALSE, sep="", head=FALSE))
  activity    <- tbl_df(read.csv(activity_location, stringsAsFactors=FALSE, sep="", head=FALSE))
  names(activity) <- c("ACTIVITY_ID", "ACTIVITY")
  names(features) <- c("ID", "Name")  
  

  ######################################################
  # PART 2: REDUCING DATA TO TARGET VARIABLE TYPES
  # select only columns ending in -mean() or -std()
  features <- filter(features, grepl('-mean\\(\\)|-std\\(\\)', Name))
  
  # reduce xtest and xtrain to just the desired features
  featureIDVector <- c(t(select(features, ID)))
  featureNameVector <- c(t(select(features, Name)))

  # friendly names of target variables
#   featureFriendlyNameVector <-c(
#     "Body Acceleration-mean()-X",             "Body Acceleration-mean()-Y",            "Body Acceleration-mean()-Z",      "Body Acceleration-std()-X",             "Body Acceleration-std()-Y",           
#     "Body Acceleration-std()-Z",            	"GravityAcc-mean()-X",        			"GravityAcc-mean()-Y",        		"GravityAcc-mean()-Z",        			 "GravityAcc-std()-X",        
#     "GravityAcc-std()-Y",         				"GravityAcc-std()-Z",         			"Body Acceleration Jerk-mean()-X",  "Body Acceleration Jerk-mean()-Y",       "Body Acceleration Jerk-mean()-Z",      
#     "Body Acceleration Jerk-std()-X",        	"Body Acceleration Jerk-std()-Y",    	"Body Acceleration Jerk-std()-Z",   "Body Gyroscopic-mean()-X",          	 "Body Gyroscopic-mean()-Y",         
#     "Body Gyroscopic-mean()-Z",          		"Body Gyroscopic-std()-X",           	"Body Gyroscopic-std()-Y",          "Body Gyroscopic-std()-Z",           	 "Body Gyroscopic Jerk-mean()-X",     
#     "Body Gyroscopic Jerk-mean()-Y",      		"Body Gyroscopic Jerk-mean()-Z",     	"Body Gyroscopic Jerk-std()-X",     "Body Gyroscopic Jerk-std()-Y",       	 "Body Gyroscopic Jerk-std()-Z",      
#     "Body AccelerationMag-mean()",          	"Body AccelerationMag-std()",        	"GravityAccMag-mean()",       		"GravityAccMag-std()",        			 "Body Acceleration Jerk Magnetic-mean()",     
#     "Body Acceleration Jerk Magnetic-std()",   "Body Gyroscopic Magnetic-mean()",   	"Body Gyroscopic Magnetic-std()",   "Body Gyroscopic Jerk Magnetic-mean()",  "Body Gyroscopic Jerk Magnetic-std()",     
#     "Body Acceleration-mean()-X",           	"Body Acceleration-mean()-Y",        	"Body Acceleration-mean()-Z",       "Body Acceleration-std()-X",             "Body Acceleration-std()-Y",           
#     "Body Acceleration-std()-Z",            	"Body Acceleration Jerk-mean()-X",   	"Body Acceleration Jerk-mean()-Y",  "Body Acceleration Jerk-mean()-Z",       "Body Acceleration Jerk-std()-X",       
#     "Body Acceleration Jerk-std()-Y",        	"Body Acceleration Jerk-std()-Z",    	"Body Gyroscopic-mean()-X",         "Body Gyroscopic-mean()-Y",              "Body Gyroscopic-mean()-Z",         
#     "Body Gyroscopic-std()-X",           		"Body Gyroscopic-std()-Y",           	"Body Gyroscopic-std()-Z",          "Body AccelerationMag-mean()",           "Body AccelerationMag-std()",          
#     "Body Acceleration Jerk Magnetic-mean()",  "Body Acceleration Jerk Magnetic-std()", "Body Gyroscopic Magnetic-mean()", "Body Gyroscopic Magnetic-std()",        "Body Gyroscopic Jerk Magnetic-mean()",
#     "Body Gyroscopic Jerk Magnetic-std()"
#     )
   featureFriendlyNameVector <-c(
     "Body Acceleration-mean()-X", 				"Body Acceleration-mean()-Y", 				"Body Acceleration-mean()-Z", 		"Body Acceleration-std()-X", 			"Body Acceleration-std()-Y",  
     "Body Acceleration-std()-Z",   				"Gravity Acceleration-mean()-X",    		"Gravity Acceleration-mean()-Y", 	"Gravity Acceleration-mean()-Z", 		"Gravity Acceleration-std()-X",    
     "Gravity Acceleration-std()-Y", 			"Gravity Acceleration-std()-Z", 			"Body Acceleration Jerk-mean()-X", 	"Body Acceleration Jerk-mean()-Y", 		"Body Acceleration Jerk-mean()-Z",  
     "Body Acceleration Jerk-std()-X",    		"Body Acceleration Jerk-std()-Y",   		"Body Acceleration Jerk-std()-Z", 	"Body Gyroscopic-mean()-X", 	 		"Body Gyroscopic-mean()-Y", 
     "Body Gyroscopic-mean()-Z", 				"Body Gyroscopic-std()-X",  				"Body Gyroscopic-std()-Y", 			"Body Gyroscopic-std()-Z",  	 		"Body Gyroscopic Jerk-mean()-X", 
     "Body Gyroscopic Jerk-mean()-Y",  			"Body Gyroscopic Jerk-mean()-Z", 			"Body Gyroscopic Jerk-std()-X", 	"Body Gyroscopic Jerk-std()-Y",   		"Body Gyroscopic Jerk-std()-Z",  
     "Body AccelerationMag-mean()", 				"Body AccelerationMag-std()",    			"Gravity AccelerationMag-mean()", 	"Gravity AccelerationMag-std()", 		"Body Acceleration Jerk Magnetic-mean()", 
     "Body Acceleration Jerk Magnetic-std()", 	"Body Gyroscopic Magnetic-mean()",  		"Body Gyroscopic Magnetic-std()", 	"Body Gyroscopic Jerk Magnetic-mean()", "Body Gyroscopic Jerk Magnetic-std()", 
     "Body Acceleration-mean()-X", 				"Body Acceleration-mean()-Y",    			"Body Acceleration-mean()-Z", 		"Body Acceleration-std()-X", 			"Body Acceleration-std()-Y",  
     "Body Acceleration-std()-Z", 				"Body Acceleration Jerk-mean()-X",  		"Body Acceleration Jerk-mean()-Y", 	"Body Acceleration Jerk-mean()-Z", 		"Body Acceleration Jerk-std()-X",   
     "Body Acceleration Jerk-std()-Y",    		"Body Acceleration Jerk-std()-Z",   		"Body Gyroscopic-mean()-X", 		"Body Gyroscopic-mean()-Y", 			"Body Gyroscopic-mean()-Z", 
     "Body Gyroscopic-std()-X",  				"Body Gyroscopic-std()-Y",  				"Body Gyroscopic-std()-Z", 			"Body AccelerationMag-mean()", 			"Body AccelerationMag-std()", 
     "Body Acceleration Jerk Magnetic-mean()", 	"Body Acceleration Jerk Magnetic-std()",	"Body Gyroscopic Magnetic-mean()", 	"Body Gyroscopic Magnetic-std()", 		"Body Gyroscopic Jerk Magnetic-mean()",
     "Body Gyroscopic Jerk Magnetic-std()"			
   )


  
  # subset data
  test_data   <- test_data[,featureIDVector]
  train_data  <- train_data[,featureIDVector]

  # set friendly names
  names(test_data)  <- featureFriendlyNameVector
  names(train_data) <- featureFriendlyNameVector
  

  ######################################################
  # PART 3: APPENDING METADATA (training vs testing data, activity, and subject)
  # add a SOURCE column  to distinguish the type of data and union sets
  test_data$SOURCE = "TEST"
  train_data$SOURCE = "TRAIN"

  # add the subject and activity cols
  test_data  <- tbl_df(cbind(test_subj, test_acti, test_data))
  train_data <- tbl_df(cbind(train_subj, train_acti, train_data))

  ######################################################
  # PART 4: DATA FORMING AND SHAPING
  # union test and train data
  xall <- union(test_data,train_data)   

  # convert feature columns into rows  
  xall <- gather(xall, "MEASURE", "VALUE", -c(SUBJECT, ACTIVITY_ID, SOURCE))
  
  # add "TYPE" to specify std or mean
  xstd <- (xall %>%  filter(grepl('-std\\(\\)', MEASURE)) %>% mutate(TYPE="STD")) 
  xmean <- (xall %>%  filter(grepl('-mean\\(\\)', MEASURE)) %>% mutate(TYPE="MEAN")) 

  # union std and mean and add activity label via join
  xall <- union(xstd,xmean)   
  xall <- inner_join(xall, activity)
  
  ######################################################
  #PART 5: FINAL DATA SETS
  # tidy data for part 4 of assingment specification
  xall <- select(xall, -ACTIVITY_ID)
  
  # averaged data for part 5 of assingment specification
  grp_cols <- c("MEASURE",  "ACTIVITY", "SUBJECT")
  dots <- lapply(grp_cols, as.symbol)
  xall %>% group_by_(.dots=dots) %>% summarise(AVERAGE = mean(VALUE))
  
}