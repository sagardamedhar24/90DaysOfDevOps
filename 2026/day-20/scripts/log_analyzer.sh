#!/bin/bash
# Log Analyzer and Report generator

set -euo pipefail

#Task 1: Input and validation

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

# Creating function for Log analysis
function log_analyzer(){
	# Task 2: Error Count
	echo "------- Total Errors Occurances -------"
	
	#grep -n "ERROR" sample_test.log | grep "PaymentGateway"
	error_count=$(grep -iEc "ERROR|Failed" $log_file)
	echo "ERROR Count: $error_count"
	
	#Task 3: Critical Events
	echo "------- Total occurances for CRITICAL events -------"
	#grep -n "CRITICAL" sample_test.log | grep "PaymentGateway"
	critical_event_count=$(grep -ic "CRITICAL" $log_file)
	echo "Crticial Event Count: $critical_event_count"
	echo ""
	echo "----- Showing top 10 Critical Events ----"
	grep -n "CRITICAL" $log_file | head -n 10
	echo ""

	#Task 4: Top Error Messages
	echo "------- Top Error Messages --------" 
	grep -iE "ERROR|FAILED" $log_file | awk '{$1=$2=$3=$4="";print}' | sort | uniq -c | sort -rn | head -n 5
	echo ""



}

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

# Function call
log_analyzer
log_summary_report
archive_log_file

