!/bin/bash

# Define your email address
TO_EMAIL="pavanmuri8@gmail.com"

# Define thresholds (you can adjust these as needed)
CPU_THRESHOLD=90
MEMORY_THRESHOLD=90
DISK_THRESHOLD=90
NETWORK_THRESHOLD=90

# Function to send email alerts
send_email_alert() {
    SUBJECT="Performance Alert: $1"
    BODY="Resource: $1 is above the threshold.\n\nCurrent Usage: $2%\n\nTimestamp: $(date)"
    echo -e "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"
}

# Define thresholds (you can adjust these as needed)
CPU_THRESHOLD=90
MEMORY_THRESHOLD=90
DISK_THRESHOLD=90
NETWORK_THRESHOLD=90

# Function to send email alerts
send_email_alert() {
    SUBJECT="Performance Alert: $1"
    BODY="Resource: $1 is above the threshold.\n\nCurrent Usage: $2%\n\nTimestamp: $(date)"
    echo -e "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"
}
while true; do
    # Monitor CPU usage
    CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print $2}' | cut -d. -f1)

    # Monitor Memory usage
    MEMORY_USAGE=$(free | awk '/Mem/ {print $3/$2*100}' | cut -d. -f1)

    # Monitor Disk I/O usage
    DISK_USAGE=$(df | awk '/root/ {print $5}' | cut -d% -f1)

    # Monitor Network usage (example for eth0, replace with your network interface)
    NETWORK_USAGE=$(ifstat -i eth0 1 1 | tail -n 1 | awk '{print $7}' | cut -d. -f1)

    # Check if any metric crosses the threshold
    if [ $CPU_USAGE -ge $CPU_THRESHOLD ]; then
        send_email_alert "CPU usage" "$CPU_USAGE"
    fi

    if [ $MEMORY_USAGE -ge $MEMORY_THRESHOLD ]; then
        send_email_alert "Memory usage" "$MEMORY_USAGE"
    fi

    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]; then
        send_email_alert "Disk usage" "$DISK_USAGE"
    fi

    if [ $NETWORK_USAGE -ge $NETWORK_THRESHOLD ]; then
        send_email_alert "Network usage" "$NETWORK_USAGE"
    fi
      sleep 300  # Sleep for 5 minutes (adjust as needed)
done
