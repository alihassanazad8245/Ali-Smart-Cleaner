# 🧹 Ali Smart Cleaner

A lightweight, fast, and user-friendly **Windows system cleaning utility** built using **Windows Batch Scripting** and **PowerShell**.

Ali Smart Cleaner provides a simple command-line interface for cleaning temporary files, performing deep system cleanup, selecting specific cleanup tasks, checking disk storage, and viewing cleaning activity logs.

---

## ✨ Features

### 🧹 Normal Clean

Provides a quick and safe basic cleanup.

It cleans:

- User temporary files
- Windows temporary files
- Recycle Bin

A simple loading animation is displayed while the cleaning process is running.

---

### 🧽 Deep Clean

Performs a more extensive system cleanup after asking the user for confirmation.

It cleans:

- User Temp files
- Windows Temp files
- Windows Prefetch files
- Thumbnail Cache
- DNS Cache
- Recycle Bin

Deep Clean is intended for a more complete cleanup than the Normal Clean option.

---

### 🎯 Selective Clean

Allows the user to choose a specific cleanup operation instead of running all cleaning tasks.

Available options:

```text
[1] Temp Files
[2] Windows Temp
[3] Prefetch
[4] Recycle Bin
[5] Back
````

This gives the user more control over which type of temporary data should be removed.

---

### 💾 Disk Space Information

The Disk Space feature allows the user to check storage information for available Windows drives.

The Disk Space menu contains:

```text
[1] C Drive
[2] Select a Drive
[3] Back
```

#### C Drive

The C Drive option directly displays the storage information of the system drive.

The report includes:

* Drive letter
* Drive name
* Total space
* Used space
* Free space
* Used percentage

Example:

```text
=================================================
                C DRIVE REPORT
=================================================

Drive       : C:
Name        : Windows
Total Space : 237.88 GB
Used Space  : 150.42 GB
Free Space  : 87.46 GB
Used        : 63.23%

-------------------------------------------------
```

#### Select a Drive

The application automatically detects available local drives.

The user can select a drive from the detected list instead of manually typing a drive letter.

Example:

```text
[1] C:  Windows
[2] D:  Data
[3] E:  Backup
```

After selecting a drive, the application displays:

* Drive letter
* Drive name
* Total space
* Used space
* Free space
* Used percentage

The drive list is dynamic, so it can adapt to different computers with different drive configurations.

#### BitLocker Support

The application does not attempt to unlock BitLocker-protected drives.

If a BitLocker drive is locked or inaccessible, Windows may prevent the application from reading its storage information.

To check a BitLocker drive:

1. Unlock the drive through Windows.
2. Return to Ali Smart Cleaner.
3. Open **Show Disk Space**.
4. Select **Select a Drive** again.

---

### 📝 Activity Logs

Ali Smart Cleaner keeps a simple activity log of cleaning operations.

The log records the date and time of completed operations.

Examples include:

```text
[date time] Normal Clean Started
[date time] Normal Clean Completed
[date time] Deep Clean Started
[date time] Deep Clean Completed
[date time] Selective Temp Cleaned
```

The log file is stored as:

```text
cleaner_log.txt
```

---

### 🔄 Loading Animation

Cleaning operations include a simple processing animation.

This provides visual feedback while the selected cleaning operation is running.

---

### 🛡️ Administrator Privileges

Some Windows system locations require administrator permissions.

Ali Smart Cleaner automatically checks whether it is running with administrator privileges.

If administrator access is required, Windows automatically requests elevated permissions.

This allows the application to access protected system locations when necessary.

---

## 🖥️ Main Menu

When Ali Smart Cleaner starts, it displays the main menu:

```text
=================================================
             ALI SMART CLEANER
=================================================

  [1] Normal Clean   (Fast & Safe)
  [2] Deep Clean     (Full Junk Clean)
  [3] Selective Clean
  [4] Show Disk Space
  [5] View Logs
  [6] Exit

-------------------------------------------------
```

<!-- Add your Main Menu screenshot here. -->

---

## 🛠️ Technologies Used

| Technology           | Purpose                                           |
| -------------------- | ------------------------------------------------- |
| Windows Batch (.bat) | Main application and menu system                  |
| PowerShell           | Disk-space information and Recycle Bin operations |
| Windows CMD          | Command-line execution                            |
| Git                  | Version control                                   |
| GitHub               | Source code hosting                               |

---

## 💻 Requirements

* Windows 10 or Windows 11
* Windows Command Prompt
* Windows PowerShell
* Administrator privileges

No additional libraries, frameworks, or package installations are required.

---

## 🚀 How to Run

### Method 1 — Clone the Repository

Clone the repository using Git:

```bash
git clone https://github.com/alihassanazad8245/Ali-Smart-Cleaner.git
```

Open the project directory:

```bash
cd Ali-Smart-Cleaner
```

Run the application:

```text
Ali-Smart-Cleaner.bat
```

You can also simply double-click the `.bat` file from Windows File Explorer.

If Windows asks for administrator permission, select **Yes**.

---

### Method 2 — Download ZIP

1. Open the GitHub repository.
2. Click **Code**.
3. Select **Download ZIP**.
4. Extract the downloaded ZIP file.
5. Open the extracted project folder.
6. Double-click the `.bat` file.
7. Allow administrator access if Windows asks for it.

---

## 📂 Project Structure

```text
Ali-Smart-Cleaner/
│
├── Ali-Smart-Cleaner.bat
├── cleaner_log.txt
└── README.md
```

### File Description

**`Ali-Smart-Cleaner.bat`**

The main application file containing the menu system, cleaning operations, disk-space functionality, loading animation, administrator elevation, and logging.

**`cleaner_log.txt`**

Stores the activity history generated by the cleaner.

**`README.md`**

Contains project documentation, features, requirements, and instructions for running the application.

---

## 🔐 Safety Notes

Ali Smart Cleaner is designed to clean temporary and cache-related files from Windows.

Before using the cleaner:

* Save important work before performing a Deep Clean.
* Run the application with administrator privileges when required.
* Do not modify the cleaning commands unless you understand their purpose.
* Make sure important files are backed up before performing system maintenance.
* BitLocker drives should be unlocked through Windows before checking their storage information.
* The application does not attempt to bypass, decrypt, or unlock BitLocker protection.

---

## 📊 Disk Space Calculation

The Disk Space feature calculates used storage using:

```text
Used Space = Total Space - Free Space
```

The used percentage is calculated as:

```text
Used Percentage = (Used Space / Total Space) × 100
```

Example:

```text
Total Space : 237.88 GB
Used Space  : 150.42 GB
Free Space  : 87.46 GB
Used        : 63.23%
```

---

## 🎯 Project Goals

The main goals of Ali Smart Cleaner are to:

* Provide a simple Windows cleaning utility
* Make common system cleanup tasks easier
* Provide quick and deep cleaning options
* Allow selective cleanup
* Provide useful disk-space information
* Automatically detect available drives
* Maintain basic cleaning activity logs
* Provide a simple command-line user interface
* Practice Windows Batch scripting and system automation

---

## 🔮 Future Improvements

Possible future improvements include:

* Graphical User Interface (GUI)
* Advanced junk-file detection
* Browser cache cleaning
* Startup application management
* Storage visualization
* More detailed system information
* Custom cleanup profiles
* Scheduled cleaning
* Improved error handling
* Additional Windows maintenance tools

---

## 👨‍💻 Author

**Ali Hassan**

Aspiring Software Engineer

---

