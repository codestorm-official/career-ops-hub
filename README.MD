![CareerOps Hub](https://img.shields.io/badge/AI--Agent-CareerOps_Hub-blue?style=for-the-badge&logo=anthropic)
![Ubuntu](https://img.shields.io/badge/Ubuntu-Latest-E95420?style=for-the-badge&logo=ubuntu)
![Railway](https://img.shields.io/badge/Railway-Supported-000000?style=for-the-badge&logo=railway)

# 💼 CareerOps Hub
**The Ultimate AI-Powered Job Search Command Center.**

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/career-ops-hub)

## 📖 Description
**CareerOps Hub** is a cloud-native central command station built upon the powerful [santifer/career-ops](https://github.com/santifer/career-ops) framework. It provides a dedicated, always-on environment to manage your entire job search lifecycle—from automated portal scanning to AI-driven CV tailoring—all accessible directly from your web browser.

By combining **Claude Code**, **Ubuntu**, and **Playwright**, this hub eliminates the friction of local setups, allowing you to focus on what matters: landing your next big role.

---

## 🎖️ Credits & Acknowledgments
This project is a cloud-ready implementation and enhancement of the original **Career-Ops** created by [Santiago Fernández](https://github.com/santifer). We highly respect and acknowledge the original work that made this automation possible.

👉 **Original Repository:** [https://github.com/santifer/career-ops](https://github.com/santifer/career-ops)

---

## ✨ Key Features
- 🤖 **Agentic Strategy:** Powered by **Claude Code** for intelligent job evaluation and strategic CV adjustments.
- 🌐 **Centralized Access:** A secure web terminal that serves as your personal career dashboard from any device.
- 📄 **ATS-Ready PDFs:** Automated PDF generation via **Playwright & Chromium**, pre-installed and ready to go.
- 💾 **Persistent Workspace:** Fully integrated with Railway Volumes to keep your career assets (CVs, profiles, and logs) safe permanently.
- 🚀 **High-Performance Base:** Runs on a streamlined Ubuntu Latest environment with Node.js 20 LTS.

---

## 🛠️ Setup & Usage Guide

### 1. Configuration (Environment Variables)
Set these variables in your Railway dashboard to secure your Hub:

| Variable         | Default                    | Description                                 |
| :--------------- | :------------------------- | :------------------------------------------ |
| **USERNAME**     | `admin`                    | Your custom username for Hub access.        |
| **PASSWORD**     | `admin`                    | Your secure password for Hub access.        |
| **CLAUDE_MODEL** | `claude-3-5-sonnet-latest` | The AI engine driving your career analysis. |

### 2. Launching Your Command Center
Once deployed, access your web terminal and follow these steps:

1.  **Authorize AI:**
    Run `claude` and follow the OAuth link to connect your Anthropic account.
2.  **Define Your Profile:**
    Navigate to `cd config` and edit `profile.yml` using `nano` to set your career targets.
3.  **Deploy Your CV:**
    Create your master CV file: `nano /root/workspace/cv.md` (Paste your CV in Markdown).
4.  **Execute Operations:**
    Simply paste a job URL into the terminal or run the `/career-ops` command to start the engine.

---

## 📂 Data Persistence (Highly Recommended)
To ensure your **CareerOps Hub** retains all its data across deployments:
1. Create a **Railway Volume** in your project.
2. Mount it to: `/root/workspace`.
3. Your CVs, tailored PDFs, and configuration files will remain safe and sound.

---

## 🤝 Use Cases
- **Smart Job Scoring:** Let the AI grade opportunities (A-F) based on your unique profile.
- **Bulk Application Prep:** Evaluate and prepare dozens of applications in parallel.
- **STAR Method Prep:** Generate interview stories and negotiation scripts tailored to specific roles.
- **ATS Optimization:** Create job-specific CVs that pass through recruiter filters with ease.

---

## 📦 Tech Stack
- **AI Brain:** Claude Code (Anthropic)
- **Host OS:** Ubuntu Latest
- **Environment:** Node.js 20 LTS
- **Engine:** Playwright & `ttyd`

---

## 🛡️ License
Distributed under the **MIT License**. Original logic by Santifer. Cloud Hub implementation by **ASEP SAPUTRA**.