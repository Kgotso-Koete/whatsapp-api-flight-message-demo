# 🌛 WhatsApp Flight Confirmation Demo (Flask + Meta API)

This is a demo Python Flask application for sending WhatsApp messages using the Meta (Facebook) Cloud API. It simulates a flight ticket purchase flow, where clicking on a flight sends a WhatsApp message to a test phone number — either a welcome message or a template-based flight confirmation.

Inspired by:

- [Sending Messages with WhatsApp in Your Python Applications By Dmitry Vinnik](https://developers.facebook.com/blog/post/2022/10/24/sending-messages-with-whatsapp-in-your-python-applications/)

---

## 📆 Features

- Send standard text messages to a WhatsApp test recipient
- Send template-based messages with PDF attachments and flight details
- Interactive UI to select and simulate flight ticket purchase
- Asynchronous message handling via `aiohttp`

---

## ⚙️ Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/kgotso-koete/whatsapp-api-flight-message-demo.git
cd whatsapp-flight-demo
```

---

## 🐍 Setting Up Your Python Environment

### 2. Set Up a Virtual Environment (venv)

Create a virtual environment to isolate dependencies:

```bash
python3 -m venv venv
```

Activate it:

- **On macOS/Linux:**

  ```bash
  source venv/bin/activate
  ```

- **On Windows:**

  ```bash
  venv\Scripts\activate
  ```

---

### 3. Install Dependencies

Use the `requirements.txt` file to install the required packages:

```bash
pip install -r requirements.txt
```

### 4. Save Dependencies Info (Optional)

After every change in packages, clear the `requirements.txt` file and `env_info.txt` file then run:

```bash
save_env.sh
```

---

### 4. Create a Configuration File

Create a file named `config.json` in the root directory with your Meta app credentials:

```json
{
  "APP_ID": "YOUR-WHATSAPP-BUSINESS-APP-ID",
  "APP_SECRET": "YOUR-WHATSAPP-BUSINESS-APP-SECRET",
  "RECIPIENT_WAID": "YOUR-TEST-PHONE-NUMBER",
  "VERSION": "v13.0",
  "PHONE_NUMBER_ID": "YOUR-WHATSAPP-BUSINESS-PHONE-NUMBER-ID",
  "ACCESS_TOKEN": "YOUR-SYSTEM-USER-ACCESS-TOKEN"
}
```

> 🔐 This file is ignored via `.gitignore` and should never be committed to version control.

---

### 5. Run the Flask App

Make sure you're in the virtual environment, then start the app:

```bash
flask run
```

Visit [http://127.0.0.1:5000](http://127.0.0.1:5000) to interact with the app.

---

## 💬 WhatsApp Template Setup (Required for Templated Messages)

To send templated flight confirmations:

1. Go to [WhatsApp Manager – Message Templates](https://business.facebook.com/wa/manage/message-templates)
2. Create a new template with:
   - **Name**: `sample_flight_confirmation`
   - **Language**: `en_US`
   - **Header**: Document upload (PDF)
   - **Body**: 3 text parameters (origin, destination, time)
3. Wait for Meta to approve the template
4. Ensure the name in your code matches exactly

---

## ⚠️ Pitfalls to Avoid

| Issue                                    | Cause                                 | Solution                                         |
| ---------------------------------------- | ------------------------------------- | ------------------------------------------------ |
| ✅ Message "sent" but not received       | Test number not registered            | Add number in WhatsApp Developer dashboard       |
| ❌ 404 or "Template name does not exist" | Incorrect or unapproved template name | Check name and language code in WhatsApp Manager |
| ⏳ No delivery after 24 hours            | Outside the 24-hour session window    | Use an approved message template                 |
| 🔒 Sensitive data in Git                 | `config.json` or `venv/` committed    | Covered by `.gitignore` — do not push secrets!   |

---

## 🧪 Developer Tips

- Export all installed packages with:

  ```bash
  pip freeze > requirements.txt
  ```

- Save Python and pip versions with:

  ```bash
  python --version > env_info.txt
  pip --version >> env_info.txt
  ```

---

## 🙏 Thanks & Attribution

Special thanks to **Dmitry Vinnik** and **Meta Platforms Inc.** for their WhatsApp Cloud API and official tutorials, which inspired this project.

- [Sending Messages with WhatsApp in Your Python Applications By Dmitry Vinnik](https://developers.facebook.com/blog/post/2022/10/24/sending-messages-with-whatsapp-in-your-python-applications/)

---

## 📂 Project Structure

```
├── app.py                  # Main Flask app
├── config.json             # 🔐 API credentials (not tracked)
├── message_helper.py       # WhatsApp message logic
├── flights.py              # Mock flight data
├── templates/
│   ├── index.html
│   └── catalog.html
├── requirements.txt        # Dependencies
├── venv/                   # Virtual environment (not tracked)
└── .gitignore              # To protect secrets and local files
```

---

## 📂 License

MIT License - See [LICENSE](LICENSE).  
**Disclaimer**: Not affiliated with Meta/Facebook. Use WhatsApp API in compliance with [Meta's Policies](https://developers.facebook.com/docs/whatsapp/policy-overview).

---
