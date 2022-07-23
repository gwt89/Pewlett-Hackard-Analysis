# Pewlett-Hackard-Analysis
## Overview Of The Analysis
The purpose of this analysis is to determine the number of retiring employees per title, and identify employees who are eligible to paticipate in a mentorship program. I’ll then write a report that summarizes my analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.
## Results
First I wrote code to create a retirement_titles table. To create the table I retrieved the emp_no, first_Name, and last_name columns from the the Employees table. I then retrieved the title, from_date, and to_date columns from the Titles table. I created a new table using the INTO clause. I then filtered the data on the birth_date column to retrieve employees who were born between 1952 and 1955.

![retirement_titles_code](https://user-images.githubusercontent.com/105949411/180580479-70118ac9-0fda-40df-997b-b4ff55dcdd70.png)

![retirement_titles_table](https://user-images.githubusercontent.com/105949411/180580463-e9aa0c42-af42-4480-931f-92fc68bc5f62.png)

Second I wrote code to create the unique_titles table. To create the table I retrieved the emp_no, first_name, last_name, and the title columns from the Retirement Titles table. I then used the DISTINCT ON statement to retrieve the first occurrence of the employee number for each ste of rows as defined by the ON () clause. I then excluded employees who have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.

![unique_titles_code](https://user-images.githubusercontent.com/105949411/180580914-ed4cbf66-d801-4866-974b-47ec8392b378.png)

![unique_titles_table](https://user-images.githubusercontent.com/105949411/180580924-3b86d0b7-582b-47c3-97cf-63a07ea29d77.png)

Thirdly I wrote code to create the retiring_titles table. I first had to retrieve the number of titles from the Unique Titles table. I then created the retiring_titles table to hold the required information. I then grouped the table by title and then sorted the count column in descending order. 

![retiring_titles_code](https://user-images.githubusercontent.com/105949411/180581131-edee9da1-7f21-4174-80bd-0b40389db461.png)

![retiring_titles_table](https://user-images.githubusercontent.com/105949411/180581141-af982662-417b-410f-8b2d-62c261852639.png)

Lastly I wrote the code for the mentorship_eligibility table. To create the table I had to retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table. I then had to retrieve the from_date, and the to_date columns from the Department Employees table. Lastly, I had to retrieve the title column from the Titles table. I then had to use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows as defined by the ON () clause. I then joined the Employees and Department Employee tables on the primary key. I then filtered the data on the to_date colum to all current employees whose birth dates are between January 1, 1965 and December 31, 1965. Finally I ordered the table by the employee number.

![mentorship_eligibility_query](https://user-images.githubusercontent.com/105949411/180581555-da042b97-6453-493a-9cac-e26e1245651c.png)

![mentorship_eligibility_table](https://user-images.githubusercontent.com/105949411/180581560-7b61e6be-8a2c-4708-b7a4-a68492220b96.png)

### Summary
How many roles will need to be filled as the "silver tsunami" begins to make an impact?

There are 1,940 employees eligible for the mentorship program. In the retiring_titles table that was created earlier it shows there are 90,398 people who are set to retire. But this information is actually a bit misleading because it takes into account people who are no longer with the company. In actuality there are only only 33,118 people who are up for retirement. So the task of hiring new employees to replace those that are retiring is not as daunting as it first appears.

![current_count_title_code](https://user-images.githubusercontent.com/105949411/180583659-d030bb08-9921-49c1-b850-76ada2ac0b85.png)

![current_count_title_table](https://user-images.githubusercontent.com/105949411/180583602-5d29dfcf-f0f3-471a-a604-635670543ceb.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Since it is unlikely that everyone will retire at once Pewlett Hackard should be able to keep on enough retiring employees as mentors as new employees are hired to fill in the gaps.
