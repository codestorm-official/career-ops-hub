![CareerOps Cloud](https://img.shields.io/badge/AI--Agent-CareerOps_Cloud-blue?style=for-the-badge&logo=anthropic)
![Ubuntu](https://img.shields.io/badge/Ubuntu-Latest-E95420?style=for-the-badge&logo=ubuntu)
![Railway](https://img.shields.io/badge/Railway-Supported-000000?style=for-the-badge&logo=railway)

# 💼 CareerOps Cloud
**Your AI-Powered Job Search Command Center in the Cloud.**

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/career-ops-cloud)

## 📖 Description
**CareerOps Cloud** brings the power of the [santifer/career-ops](https://github.com/santifer/career-ops) system to a seamless, browser-based cloud environment. No local setup, no terminal configuration—just a fully automated AI agent ready to hunt for your next career move 24/7.

Built on top of **Claude Code** and **Ubuntu**, this template provides a dedicated workspace for scanning job portals, tailoring CVs with precision, and managing your application pipeline directly from your web browser.

---

## 🎖️ Credits & Acknowledgments
This project is a cloud-ready implementation of the original **Career-Ops** created by [Santiago Fernández](https://github.com/santifer). We highly encourage you to visit the original repository for detailed documentation on the AI logic:

👉 **Original Repository:** [https://github.com/santifer/career-ops](https://github.com/santifer/career-ops)

---

## ✨ Key Features
- 🤖 **Agentic Job Hunting:** Integrated with **Claude Code** for smart job analysis and CV tailoring.
- 🌐 **Browser Terminal:** Access your command center from any device via a secure web terminal.
- 📄 **PDF Automation:** Pre-installed **Playwright & Chromium** for instant high-quality CV generation.
- 💾 **Permanent Workspace:** Integrated with Railway Volumes to keep your `cv.md` and generated PDFs safe across redeploys.
- 🚀 **Performance Optimized:** Clean Ubuntu environment with Node.js 20 LTS.

---

## 🛠️ Setup & Usage Guide

### 1. Configuration (Environment Variables)
Before deploying, set these variables in your Railway dashboard:

| Variable         | Default                    | Description                              |
| :--------------- | :------------------------- | :--------------------------------------- |
| **USERNAME**     | `admin`                    | Username for web terminal access.        |
| **PASSWORD**     | `admin`                    | Secure password for web terminal access. |
| **CLAUDE_MODEL** | `claude-3-5-sonnet-latest` | The AI model used for processing.        |

### 2. Getting Started in the Terminal
Once deployed, open your web terminal and follow these steps:

1.  **Authenticate Claude:**
    Type `claude` and follow the OAuth link provided to login to your Anthropic account.
2.  **Configure Your Profile:**
    Go to the config folder: `cd config`.
    Edit your profile: `nano profile.yml` (Fill in your target roles and preferences).
3.  **Prepare Your CV:**
    Create/Edit your master CV: `nano /root/workspace/cv.md` (Paste your CV in Markdown format).
4.  **Run the Agent:**
    Paste a job URL or run the automation: `/career-ops`.

---

## 📂 Data Persistence (Important)
To ensure your profile and generated CVs are never lost, please:
1. Create a **Railway Volume**.
2. Mount it to the path: `/root/workspace`.
3. All your data inside this folder will persist permanently.

---

## 🤝 Common Use Cases
- **Portal Scanning:** Automatically evaluate jobs from Greenhouse, Ashby, Lever, etc.
- **Scoring System:** Let AI grade (A-F) job opportunities based on your specific profile.
- **Tailored CVs:** Generate job-specific PDFs optimized for ATS (Applicant Tracking Systems).
- **Interview Prep:** Use the built-in modes to prepare STAR method stories for upcoming interviews.

---

## 📦 Tech Stack
- **AI Agent:** Claude Code (Anthropic)
- **Base OS:** Ubuntu Latest
- **Runtime:** Node.js 20 LTS
- **Browser Engine:** Playwright (Chromium)
- **Terminal Engine:** `ttyd` (Web-based terminal)

---

## 🛡️ License
Distributed under the **MIT License**. Original career-ops logic by Santifer. Cloud template implementation by **ASEP SAPUTRA**.