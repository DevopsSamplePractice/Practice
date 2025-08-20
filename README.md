# Devops_Practice
These are the sample bash scripts which I am making during my Devops Learnings


# For ResourceTracker_CronJob

# 🌐 AWS Resource Tracker

A lightweight automation tool to track your **AWS resources** (EC2 Instances, S3 Buckets, and Lambda Functions) with scheduled logging via **cron jobs**.  

This repository contains:  
- `aws_resource_tracker.sh` → Shell script to fetch AWS resources  
- `aws_resource_tracker.log` → Sample execution logs 

---

## 📂 Project Structure

ResourceTracker_CronJob/
- aws_resource_tracker.sh # Main script
- aws_resource_tracker.log # Log file (proof of execution it is optional keeping it, you can create your own log file)


---

## ⚙️ Prerequisites

Before using this project, ensure you have:

- ✅ Linux/Unix environment  
- ✅ [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed  
- ✅ AWS credentials configured (`aws configure`)  
- ✅ Permissions to list EC2, S3, and Lambda resources  

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```git clone https://github.com/DevopsSamplePractice/Practice/tree/main/ResourceTracker_CronJob```

### 2️⃣ Make the Script Executable

```chmod +x aws_resource_tracker.sh```

### 3️⃣ Run Manually (Optional)

```./aws_resource_tracker.sh```


### 🕒 Automating with Cron
### 1️⃣ Open Crontab

```crontab -e```

### 2️⃣ Add an Entry

Run the script every hour and log results:

```0 * * * * /bin/bash /absolute/path/ResourceTracker_CronJob/aws_resource_tracker.sh >> /absolute/path/ResourceTracker_CronJob/aws_resource_tracker.log 2>&1```

👉 Replace /absolute/path/ResourceTracker_CronJob with your actual path.


