# SauceDemo Test Automation (Robot Framework)

This repository contains automated test cases for the [SauceDemo](https://www.saucedemo.com/) sample web application.  
The suite is built using **Robot Framework** with **SeleniumLibrary**.

---

## 📋 Prerequisites

Before running the tests, ensure the following are installed on your system:

- **Python 3.9+** (tested on Python 3.13.7)
- **pip** (Python package manager)
- **Google Chrome** (or Safari / Microsoft Edge)
- **WebDrivers** for your browser of choice:
  - [ChromeDriver](https://chromedriver.chromium.org/downloads) for Chrome
  - SafariDriver (bundled with macOS, must be enabled via `safaridriver --enable`)
  - [EdgeDriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/) for Microsoft Edge

---

## ⚙️ Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/xblade20/saucedemo_tests.git
   cd saucedemo_tests
   ```

2. Create and activate a virtual environment (recommended):

   ```bash
   python -m venv venv
   source venv/bin/activate     # macOS/Linux
   venv\Scripts\activate        # Windows (PowerShell)
   ```

3. Install dependencies from `requirements.txt`:

   ```bash
   pip install -r requirements.txt  # use pip3 if pip doesn't work
   ```

---

## ▶️ Running Tests

From the project root (`saucedemo_tests`), run:

```bash
robot -d results tests/
```

- `-d results` → stores all reports (`log.html`, `report.html`, `output.xml`) in the **results/** folder.
- Screenshots (captured on test failure) will also be stored under results (or in a configured subfolder).

### Running in a specific browser

By default, tests run in **Chrome**.  
To run in another browser, pass the `BROWSER` variable:

- Safari:
  ```bash
  robot -v BROWSER:safari -d results tests/
  ```
- Edge:
  ```bash
  robot -v BROWSER:edge -d results tests/
  ```

---

## 📂 Project Structure

```
saucedemo_tests/
├── resources/          # Common keywords, locators, variables
├── tests/              # Test suites (.robot files)
├── results/            # Reports and logs (created after test run)
├── requirements.txt    # Python dependencies
├── robot.conf          # Default Robot Framework configuration (if used)
└── README.md
```

---

## 🐞 Known Quirks

- **Empty Cart Checkout**  
  The SauceDemo site allows proceeding to checkout even when the cart is empty.  
  In a real-world application this would be considered a bug.  
  The test case `Attempt checkout without items - prevented` will fail because of this behavior.  
  You can:
  - Keep it as a *negative test* (documenting the issue), or
  - Skip it in your runs if you want clean reports.

---

## 📊 Reports

After running tests, open:

- `results/log.html` → detailed step-by-step execution log  
- `results/report.html` → high-level test execution summary  

Example:
```bash
open results/log.html
```

---

## 🙌 Contributing

This repo is for demo/test practice. Feel free to extend with:
- More negative and regression test cases
- Support for additional browsers
- Parallel execution with [Pabot](https://pabot.org)

---
