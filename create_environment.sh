#!/bin/bash
#Asking and entering the  github username
read -p 'Enter your github username: ' username
#Creating the submission_reminder directory
momo=submission_reminder_$username
mkdir -p $momo
#Creating subdirectories
mkdir -p $momo/app $momo/modules $momo/assets $momo/config
#Creating reminder.sh script
cat << 'EOF' > $momo/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF
cat << 'EOF' > $momo/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $assignment assignment!"
        elif [[ $status" == ""submitted" ]]; then
            echo "Reminder: $student has submitted the $assignment assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF
cat << 'EOF' > $momo/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Uwase, speech presentation, submitted
Gloria, computer science, not submitted
Ishimwe, History assignment, submitted
Shema, SDL, not submitted
Elise, library notes, not submitted
Belyse, Maths assignment, submitted
Denyse, Physics individual work, not submitted
Bebe, English assignment, submitted
Lucy, Biology work, not submitted
EOF
cat << 'EOF' > $momo/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
cat << 'EOF' > $momo/startup.sh
#!/bin/bash
# startup.sh - Starts the submission reminder application when executed

echo "Starting submission reminder application..."
./$momo/app/reminder.sh
EOF
#Making all files executable
chmod +x $momo/startup.sh $momo/app/reminder.sh $momo/modules/functions.sh
#appropriate feedback
echo 'Environment is created'
