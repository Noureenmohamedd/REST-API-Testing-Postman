# UI Automation Testing – Robot Framework & Selenium

## Overview
Automated web UI test scenarios for AliExpress using Robot Framework and SeleniumLibrary. Created as part of a Software Testing & QA course assignment.

## Test Scenarios
- Search for products
- Filter results by price range
- Add a product to the cart
- Change website language
- Sign in to an account
- Change currency and other site settings

## Tools
Robot Framework, SeleniumLibrary, Microsoft Edge.

## Setup
1. Install Python and a compatible Edge browser.
2. Install dependencies: `pip install robotframework robotframework-seleniumlibrary`
3. Supply **test-only** login credentials without committing real credentials. The placeholders `LOGIN_EMAIL` and `LOGIN_PASSWORD` can be overridden at runtime with Robot Framework variables.
4. Run: `robot TestSuite1.robot`

## Notes
- The website UI and its selectors may have changed since the assignment was written, so the suite may require updates before it runs successfully today.
- Only the test scripts are included. Original saved HTML/XML reports were excluded because they came from a separate sample browser test and do not document the listed AliExpress scenarios.
- Never commit personal login details or passwords to a public repository.
