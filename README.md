I recently set up Robot Framework on my laptop for a session where I'll be demonstrating keyword-based automation. While going through the setup, I faced some challenges finding a clear, step-by-step reference to get the Browser library running on my IDE. 

So, I've put together this guide to help anyone looking to start with the Robot Framework and overcome similar challenges!

## Step-by-Step Installation Guide

1. **Download Python**: Install the latest version of Python from [here](https://www.python.org/downloads/). Make sure to check the option to "Add Python to PATH" during installation.

2. **Download Node.js** (required if you plan to use the Browser library): Install the latest version from [here](https://nodejs.org/en/download/prebuilt-installer).

3. **Install Robot Framework**: Open Command Prompt and install Robot Framework with:
   ```bash
   py -m pip install robotframework
   ```

4. **Install Browser Library**: In Command Prompt, use:
   ```bash
   py -m pip install robotframework-browser
   ```

5. **Update Environment Variables**: Go to your Environment Variables and add both the Node.js and Python **Scripts** folder (found in Python’s installation folder) to your PATH, if they’re not already there.

6. **Set Up IDE (recommended: IntelliJ)**:
   - Install the **RobotFramework support** plugin on IntelliJ or your preferred IDE.
   
7. **Create a New Project**:
   - Choose **Python** as the language and **existing environment**.
   - In the interpreter option, select **Add Interpreter > Add Local Interpreter**. Then, choose **System Interpreter** and set the path to `python.exe`.

8. **Initialize Browser Library**: Open the terminal within your IDE and run:
   ```bash
   rfbrowser init
   ```
   Now you're all set to use the Robot Framework Browser Library in your test automation!

If you want to experiment with a sample project, feel free to clone this project onto your machine.
**Or use this code in a file with .robot extension**
```Python
*** Settings ***
  Library    Browser

*** Variables ***
  ${WIDTH}         1920
  ${HEIGHT}        1080
  ${URL}    https://automationexercise.com/
  ${loginTabButton}   //a[@href="/login"]
  ${emailTextField}   //input[@data-qa="login-email"]
  ${passwordTextField}   //input[@data-qa="login-password"]
  ${loginButton}  //button[@data-qa="login-button"]
  ${logoutButton}   //a[@href="/logout"]
  ${loginHeader}  //div[@class="login-form"]//h2
  ${headerExpectedText}   Login to your acco


*** Test Cases ***
Open Example Website
    New Browser    chromium    headless=${False}
    New Page    ${URL}
    Set Viewport Size    ${WIDTH}    ${HEIGHT}
    Click   ${loginTabButton}
    ${headerActualText}=  Get Text    ${loginHeader}
    Run Keyword And Continue On Failure    Should Be Equal    ${headerActualText}    ${headerExpectedText}
    Fill Text    ${emailTextField}    mostafa.elkholy@gmail.com
    Fill Text    ${passwordTextField}    abcd123456
    Click    ${loginButton}
    Get Element States    ${logoutButton}   validate    visible
    Close Browser
```

For documentation on the Browser library keywords, refer to [this link](https://marketsquare.github.io/robotframework-browser/Browser.html).

Happy test automation!
