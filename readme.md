# 🚀 AutoGit Pro

**AutoGit Pro** is a Bash script that automates the full Git workflow.
It automatically adds, commits, pulls, and pushes your changes to GitHub.

This tool helps developers save time and avoid typing multiple Git commands manually.

---

# ✨ Features

* ✅ Automatically adds all files (`git add -A`)
* ✅ Creates commit with your message
* ✅ Pulls latest changes (`git pull --rebase`)
* ✅ Pushes to GitHub (`git push`)
* ✅ Automatically sets upstream branch
* ✅ Dry-run mode (test without executing)
* ✅ Force push option
* ✅ Error checking

---

# 📦 Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/autogit-pro.git
```

Go to folder:

```bash
cd autogit-pro
```

Make executable:

```bash
chmod +x autogit.sh
```

---

# ⚙️ Usage

Basic usage:

```bash
./autogit.sh "your commit message"
```

Or:

```bash
./autogit.sh
```

Script will ask for commit message.

---

# 🧪 Options

Dry run mode:

```bash
./autogit.sh -n "test"
```

Force push:

```bash
./autogit.sh -f "update"
```

---

# 📋 Example

```bash
./autogit.sh "update README"
```

Output:

```
Adding files...
Creating commit...
Pulling latest changes...
Pushing...
SUCCESS: Git updated
```

---

# 🛠 Requirements

* Linux / Ubuntu / MacOS
* Git installed
* GitHub repository connected

Check Git:

```bash
git --version
```

---

# 📁 Project Structure

```
autogit-pro/
│
├── autogit.sh
└── README.md
```

---

# 👨‍💻 Author

Armen Gevorgyan

GitHub:
https://github.com/YOUR_USERNAME

---

# ⭐ Why use AutoGit Pro?

Instead of typing:

```bash
git add -A
git commit -m "message"
git pull --rebase
git push
```

Just type:

```bash
./autogit.sh "message"
```

---

# 📜 License

Free to use for learning and personal projects.

---

# 🔥 DevOps Practice Script

This project was created for learning Git, Bash, and DevOps automation.

