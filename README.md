# Google Capstone Project - 1 (Case Study 1) 

# Ask Phase:
	
  ### Key tasks:
1.  Identify the business task:
       The task is to maximize the number of annual memberships.
2. Consider key stakeholders:
       Key Stakeholders include: Cyclistic executives, Lily Moreno (director of marketing) and Cyclistic marketing analytics team.

### Deliverable:
   #### Business task: 
The stakeholders have asked the director of marketing, Moreno, to find ways to maximize the number of annual memberships. The analytics team is assigned for collecting,         analyzing, and reporting data that helps guide Cyclistic marketing strategy. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to           identify trends.

# Prepare Phase:
	
 ### Key tasks:
  1.	Download data and store it appropriately.
  2.	Identify how it’s organized.
  Data is organized in rows and columns in csv format
  3.	Sort and filter the data
  Sorting data according to start date and filtering out any duplicates and missing values.
  4.	Determine the credibility of the data
  ROCCC
	
### Deliverable: 
 A description of all data sources used.
      
Duration: Previous 12 months of Cyclistic trip data.
The data is publicly available and can be fetched from: https://divvy-tripdata.s3.amazonaws.com/index.html under the license of: Data License Agreement | Divvy Bikes.           The data-privacy issues prohibit anyone other than Motivate International Inc. from using rider’s personally identifiable information. Access to connect pass purchased           to credit card numbers is restricted.  

# Process:

  ### Key tasks:
   1.	Check the data for errors
   Data contain lots of missing values and inconsistent formatting
   2.	Choose your tools
   Spreadsheet & R
   3.	Transform the data ride_length & day_of_week are new attributes
   4.	Document the cleaning process

### Deliverable:
Null/empty/ rows and duplicate entries removed, two new columns added, ride_length and day_of_week respectively. Ride_length = ended_at  –  started_at  & day_of_week =           WEEKDAY(started_at).

## Analyze:
#### Key tasks:
 1.    Aggregate your data so it’s useful and accessible.
 2.    Organize and format your data.
 3.    Perform calculations.
 4.    Identify trends and relationships 

### Deliverable:
	
1.	PostgresSQL – used for querying data to find insights and export relevant data for visualization.
2.	R – used for data cleaning, inserting additional information like ride_length, to better understand how annual members and casual riders use Cyclistic bikes differently?	
3.	Summary of analysis

	 	   
## Share:
### Key tasks:
1. Determine the best way to share your findings. 
2. Create effective data visualizations. 
3. Present your findings. 
4. Ensure your work is accessible. 

### Deliverable:
Tableau: used as a viz software to find and identify patterns in the data.
https://public.tableau.com/views/Cyclistic-GoogleCapstonePorject-1/rideable_typemembervscasual_yearly?:language=en-US&:display_count=n&:origin=viz_share_link

