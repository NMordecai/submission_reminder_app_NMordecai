# submission_reminder_app_NMordecai
 This application helps manage and send reminders about student submissions and it alerts students mostly about assignment deadlines.
## Prerequisites

Before running the application, ensure you have the following:

* A Linux-based operating system (or a compatible environment like WSL on Windows) like UBUNTU.
* Bash shell (usually the default on most Linux distributions).
* Git (for cloning the repository).

## Installation

1. **Clone the Repository:**

   ```bash
   git clone [https://github.com/your_github_username/submission_reminder_app_githusername.git](https://github.com/your_github_username/submission_reminder_app_githusername.git)
Replace your_github_username with your actual GitHub username.

2. Navigate to the Repository Directory:

Bash

cd submission_reminder_app_githusername
3. Run the Environment Setup Script:

Bash

./create_environment.sh
This script will prompt you for your name. It will then create the application directory (e.g., submission_reminder_YourName) and populate it with the necessary files and subdirectories.

4. Navigate to the Application Directory:

Bash

cd submission_reminder_YourName  # Replace YourName with the name you entered
#Configuration
1. config.env: This file contains environment variables used by the application.  Review the contents and modify them as needed.  Pay particular attention to any paths or settings that might need adjustment for your system.

2. submissions.txt: This file contains the list of students and their submission statuses.  The format is crucial for the application to work correctly.  Each line represents a student record.  Ensure you follow the existing format when adding or modifying entries.  You must add at least 5 new student records for testing purposes. Example format: student_id,student_name,submission_status,due_date.

#Running the Application
1. Make the startup.sh Script Executable:

Bash

chmod +x startup.sh
2. Run the Application:

Bash

./startup.sh
This script initializes the environment (sources functions.sh, loads environment variables from config.env) and then executes the reminder.sh script, which handles the core submission reminder logic.

#Application Details
functions.sh: Contains reusable functions used by the reminder.sh script.
reminder.sh: The main script that processes student submissions and sends reminders.
startup.sh: The entry point for running the application. It sets up the necessary environment and launches reminder.sh.
