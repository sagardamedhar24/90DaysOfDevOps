# Day 20 – Bash Scripting Challenge: Log Analyzer and Report Generator
You are a system administrator responsible for managing a network of servers. Every day, a log file is generated on each server containing important system events and error messages. 
Your job is to analyze these log files, identify specific events, and generate a summary report.

Write a Bash script (log_analyzer.sh) that automates the process of analyzing log files and generating a daily summary report.

I have created a single log_analyzer shell script: [Here is the Script](day-20/scripts/log_analyzer.sh)

## Task 1: Input and Validation
* Your script should:
1. Accept the path to a log file as a command-line argument
2. Exit with a clear error message if no argument is provided
3. Exit with a clear error message if the file doesn't exist
* **Script Code:**
  ```bash
  display_usage(){
  echo "Error: No argument provide"
  echo "Usage: ./log_analyzer.sh /path/to/log_file"
  }
  
  # Check if argument is provied or not
  if [ $# -eq 0 ]; then
  	display_usage
  fi
  
  log_file=$1
  
  # Check if file exist or not
  if [ ! -f "$log_file" ]; then
  	echo "Error: File $log_file is not exists."
  	exit 1
  fi
  ```
* **Output:**

  <img width="541" height="73" alt="argument_check" src="https://github.com/user-attachments/assets/c3d95ff6-d753-4d56-a2bb-53bcf1825b42" />

  <img width="682" height="47" alt="file_check" src="https://github.com/user-attachments/assets/915750e5-8376-42d2-84c5-6286ac048e07" />

## Task 2: Error Count
1. Count the total number of lines containing the keyword ERROR or Failed
2. Print the total error count to the console
* **Script Code:**
  ```bash
	echo "------- Total Errors Occurances -------"
	
	#grep -n "ERROR" sample_test.log | grep "PaymentGateway"
	error_count=$(grep -iEc "ERROR|Failed" $log_file)
	echo "ERROR Count: $error_count"
  ```
* **Output:**

  <img width="526" height="38" alt="image" src="https://github.com/user-attachments/assets/729345be-5c11-4d71-94ac-7b9769ddee6b" />

## Task 3: Critical Events
1. Search for lines containing the keyword CRITICAL
2. Print those lines along with their line number
* **Script Code:**
  ```bash
	echo "------- Total occurances for CRITICAL events -------"
	#grep -n "CRITICAL" sample_test.log | grep "PaymentGateway"
	critical_event_count=$(grep -ic "CRITICAL" $log_file)
	echo "Crticial Event Count: $critical_event_count"
	echo ""
	echo "----- Showing top 10 Critical Events ----"
	grep -n "CRITICAL" $log_file | head -n 10
	echo ""
  ```
* **Output:**

  <img width="573" height="205" alt="image" src="https://github.com/user-attachments/assets/68e8587f-26cd-4c60-ab18-521fb173e7d0" />

## Task 4: Top Error Messages
1. Extract all lines containing ERROR
2. Identify the top 5 most common error messages
3. Display them with their occurrence count, sorted in descending order
* **Script Code:**
  ```bash
  #Task 4: Top Error Messages
	echo "------- Top Error Messages --------" 
	grep -iE "ERROR|FAILED" $log_file | awk '{$1=$2=$3=$4="";print}' | sort | uniq -c | sort -rn | head -n 5
	echo ""
  ```
* **Output:**

  <img width="556" height="76" alt="image" src="https://github.com/user-attachments/assets/e7494210-f343-466f-bbce-a445100dbfd2" />

## Task 5: Summary Report
Generate a summary report to a text file named log_report_<date>.txt (e.g., log_report_2026-02-11.txt). The report should include:
1. Date of analysis
2. Log file name
3. Total lines processed
4. Total error count
5. Top 5 error messages with their occurrence count
6. List of critical events with line numbers

* **Script Code:**
  ```bash
  # Task 5 : Summary Report
  # Creating function for report printing
  function log_summary_report(){
	
	analysis_date=$(date)
	total_lines_processed=$(wc -l < "$log_file")
	top_errors=$(grep -iE "ERROR|FAILED" $log_file | awk '{$1=$2=$3=$4="";print}' | sort | uniq -c | sort -rn | head -n 5)
	critical_events=$(grep -n "CRITICAL" $log_file | head -n 10)
	
	mkdir -p Reports
	#Generating Summary Report under Reports folder
	summary_report="Reports/Log_Report_$(date +%Y-%m-%d).txt"

	#Redirecting output to report file:
	{
	echo "--------- Log Analysis Report ---------- "
	echo "Date of Analysis: $analysis_date"
	echo "Log File Name: $log_file"
	echo "Total Lines Processed: $total_lines_processed"
	echo "Total Error Count: $error_count"
	echo ""
	echo "----- Top 5 error messages -----"
	echo "$top_errors"
	echo ""
	echo "---- Critical Events ----"
	echo "Total Critical Events: $critical_event_count"
	echo "----- Showing top 10 Critical Events ----"
	echo ""
	echo "$critical_events"
	echo ""
	} > "$summary_report"

	echo "Log Summary Report Successfully generated and saved to: $summary_report"
	echo ""
  }
  ```
* **Output:**

  <img width="635" height="443" alt="archive-and-report-show" src="https://github.com/user-attachments/assets/25c55b20-fa0c-4860-8e4f-c768108160de" />

## Task 6 (Optional): Archive Processed Logs
* Add a feature to:
1. Create an archive/ directory if it doesn't exist
2. Move the processed log file into archive/ after analysis
3. Print a confirmation message
* **Script Code:**
  ```bash
  function archive_log_file(){
	
	# Check if summary report is generated or not and process log file archive
	if [ -f "$summary_report" ]; then
	
	# Create archive directory if it is not exist
	mkdir -p archive

	#Move processed log file to archieve
	mv "$log_file" archive/
	
	echo "Moved $log_file into archive..."
	echo " Log Analysis Completed ...!!!"
  else 
  	echo "Error: Log report summary $summary_report is not found. Skipping Archive."
  	
  fi
  }
  ```
* **Output:**

  <img width="635" height="443" alt="archive-and-report-show" src="https://github.com/user-attachments/assets/c7b520e0-c042-4924-8b19-a87814fb3911" />

## What you Learned
1. Through this hands on practice, I learned how we can build a giant script by building smaller modules for each and every tasks.
2. Understood, how we can easily analyze the logs by using shell script and create a easily understandable log report, that will help to everyone.
3. By using date function, how to create unique reports for each and every run and redirect the output to this report file.
4. How we can easily analyze the logs and format our logs as per the requirement using `awk`, `grep`, `wc -l`, `uniq`, `sort`, etc.
5. After, completing the log analysis for daily generated logs files, how to archive them for better organization.
