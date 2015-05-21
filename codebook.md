CODEBOOK FOR COURSERA CLASS: "Getting and Cleaning Data"
--------------------
STUDENT	: 	DOUGLAS HALE
--------------------
DATE	:	05/15/2015
--------------------
VARIABLES
--------------------
	(1) "MEASURE"
			DESCRIPTION		: The feature measured
			FORMAT			: TEXT
			POSSIBLE VALUES	:
				"Body Acceleration-mean()-X", 				
				"Body Acceleration-mean()-Y", 				
				"Body Acceleration-mean()-Z", 		
				"Body Acceleration-std()-X", 			
				"Body Acceleration-std()-Y",  
				"Body Acceleration-std()-Z",   				
				"Gravity Acceleration-mean()-X",    		
				"Gravity Acceleration-mean()-Y", 	
				"Gravity Acceleration-mean()-Z", 		
				"Gravity Acceleration-std()-X",    
				"Gravity Acceleration-std()-Y", 			
				"Gravity Acceleration-std()-Z", 			
				"Body Acceleration Jerk-mean()-X", 	
				"Body Acceleration Jerk-mean()-Y", 		
				"Body Acceleration Jerk-mean()-Z",  
				"Body Acceleration Jerk-std()-X",    		
				"Body Acceleration Jerk-std()-Y",   		
				"Body Acceleration Jerk-std()-Z", 	
				"Body Gyroscopic-mean()-X", 	 		
				"Body Gyroscopic-mean()-Y", 
				"Body Gyroscopic-mean()-Z", 				
				"Body Gyroscopic-std()-X",  				
				"Body Gyroscopic-std()-Y", 			
				"Body Gyroscopic-std()-Z",  	 		
				"Body Gyroscopic Jerk-mean()-X", 
				"Body Gyroscopic Jerk-mean()-Y",  			
				"Body Gyroscopic Jerk-mean()-Z", 			
				"Body Gyroscopic Jerk-std()-X", 	
				"Body Gyroscopic Jerk-std()-Y",   		
				"Body Gyroscopic Jerk-std()-Z",  
				"Body AccelerationMag-mean()", 				
				"Body AccelerationMag-std()",    			
				"Gravity AccelerationMag-mean()", 	
				"Gravity AccelerationMag-std()", 		
				"Body Acceleration Jerk Magnetic-mean()", 
				"Body Acceleration Jerk Magnetic-std()", 	
				"Body Gyroscopic Magnetic-mean()",  		
				"Body Gyroscopic Magnetic-std()", 	
				"Body Gyroscopic Jerk Magnetic-mean()", 
				"Body Gyroscopic Jerk Magnetic-std()", 
				"Body Acceleration-mean()-X", 				
				"Body Acceleration-mean()-Y",    			
				"Body Acceleration-mean()-Z", 		
				"Body Acceleration-std()-X", 			
				"Body Acceleration-std()-Y",  
				"Body Acceleration-std()-Z", 				
				"Body Acceleration Jerk-mean()-X",  		
				"Body Acceleration Jerk-mean()-Y", 	
				"Body Acceleration Jerk-mean()-Z", 		
				"Body Acceleration Jerk-std()-X",   
				"Body Acceleration Jerk-std()-Y",    		
				"Body Acceleration Jerk-std()-Z",   		
				"Body Gyroscopic-mean()-X", 		
				"Body Gyroscopic-mean()-Y", 			
				"Body Gyroscopic-mean()-Z", 
				"Body Gyroscopic-std()-X",  				
				"Body Gyroscopic-std()-Y",  				
				"Body Gyroscopic-std()-Z", 			
				"Body AccelerationMag-mean()", 			
				"Body AccelerationMag-std()", 
				"Body Acceleration Jerk Magnetic-mean()", 	
				"Body Acceleration Jerk Magnetic-std()",	
				"Body Gyroscopic Magnetic-mean()", 	
				"Body Gyroscopic Magnetic-std()", 		
				"Body Gyroscopic Jerk Magnetic-mean()",
				"Body Gyroscopic Jerk Magnetic-std()"			
				
		
	(2) "ACTIVITY" 	
			DESCRIPTION		: The activity being perfored by the subject when the measure was taken
			FORMAT			: TEXT
			POSSIBLE VALUES	: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

	(3) "SUBJECT" 	
			DESCRIPTION		: Number identifying the subject performing the activity
			FORMAT			: INTEGER
			POSSIBLE VALUES	: [1,30] step 1 
	
	(4) "AVERAGE" 	
			DESCRIPTION		: Average of variable for each activity and each subject.
			FORMAT			: REAL
			POSSIBLE VALUES	: [-1,1]
