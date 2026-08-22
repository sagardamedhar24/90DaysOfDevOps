#!/bin/bash

# Default to 250 lines, or use the first argument passed (e.g., ./make_logs.sh 500)
LINE_COUNT="${1:-250}"
OUTFILE="sample_test.log"

# Clear or create the target file
> "$OUTFILE"

services=("AppServer" "Database" "AuthService" "CacheService" "PaymentGateway" "StorageCluster" "CronJob" "ApiGateway" "Worker" "Security")
levels=("INFO" "MAIN" "DEBUG" "WARN" "WARNING" "ERROR" "CRITICAL")
msgs=(
  "Application startup completed successfully."
  "Connection timed out after 3000ms."
  "Retry attempt failed to reach remote host."
  "Transaction Failed: Insufficient funds or invalid token."
  "Disk space on /data dropped below threshold."
  "Write operations failed: Disk partition is read-only."
  "Backup process failed: File permission denied."
  "Database deadlock detected on table 'orders'."
  "Secondary node failed to sync replication logs."
  "502 Bad Gateway response returned for API route."
  "Health check failed for critical downstream service."
  "Multiple failed authentication attempts detected."
  "Worker node initialization failed: Image pull error."
  "User session terminated due to inactivity."
  "Garbage collection executed and memory reclaimed."
  "System health check complete. Status: OK."
  "Application startup initiated"
  "Application startup initiated"
)

echo "Generating $LINE_COUNT lines into $OUTFILE..."

for i in $(seq 1 "$LINE_COUNT"); do
  # Calculate advancing timestamp (12-second intervals)
  sec=$((i * 12))
  hh=$(printf "%02d" $(( (10 + sec / 3600) % 24 )))
  mm=$(printf "%02d" $(( (sec / 60) % 60 )))
  ss=$(printf "%02d" $(( sec % 60 )))
  ts="2026-08-22 ${hh}:${mm}:${ss}"
  
  # Select log entries
  lvl=${levels[$((i % ${#levels[@]}))]}
  srv=${services[$((i % ${#services[@]}))]}
  msg=${msgs[$((i % ${#msgs[@]}))]}
  
  echo "$ts $lvl [$srv] $msg" >> "$OUTFILE"
done

echo "Done! File '$OUTFILE' created with $(wc -l < "$OUTFILE") lines."
