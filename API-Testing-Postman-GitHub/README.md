# Fake Store API Testing with Postman

## Overview
This repository contains a complete Postman test suite for the Fake Store API.
It covers positive and negative test scenarios across multiple endpoints to validate both correct functionality and error handling of the API.
The goal is to ensure the API behaves as expected according to its documentation, identify discrepancies, and highlight any unexpected behavior.
The tests cover actions like creating users, authenticating users, fetching products and carts, creating and deleting carts, and handling invalid requests properly.

## Endpoints Tested

### Positive Test Cases

| Test Name | Method | Endpoint | Expected Result | Actual Result | Status |
|-----------|--------|----------|----------------|--------------|--------|
| Create User | POST | /users |  200 OK with user ID | 200 OK with user ID | ✅ Passed  |
| Get All Users | GET | /users | 200 OK with non-empty array | 200 OK with user array | ✅ Passed |
| Login User | POST | /auth/login | 200 OK with token | 200 OK with token | ✅ Passed |
| Get All Products | GET | /products | 200 OK with non-empty array | 200 OK with product array | ✅ Passed |
| Get Product by ID | GET | /products/1 | 200 OK with product data with tittle | 200 OK with product data with tittle| ✅ Passed |
| Create Cart | POST | /carts | 201 Created with cart ID | 200 OK with cart ID | ⚠️ Wrong status code |
| Get Single Cart | GET | /carts/id | 200 OK with full product details | 200 OK with limited product data | ⚠️ Incomplete product data |
| Delete a Cart | DELETE | /carts/id | 200 OK | 200 OK | ✅ Passed |
| Get All Carts | GET | /carts | 200 OK with carts and full product details | 200 OK with limited product data | ⚠️ Incomplete product data |

### Negative Test Cases 


| Test Name | Method | Endpoint | Expected Result | Actual Result | Status |
|-----------|--------|----------|----------------|--------------|--------|
| Invalid Create User (without username) | POST | /users | 400 Bad Request | 200 OK | ❌ Failed |
| Invalid Create User (with invalid email) | POST | /users | 400 Bad Request | 200 OK | ❌ Failed |
| Invalid Get All Users | GET | /users/invalidPath | 400 Bad Request | 400 Bad Request | ✅ Passed |
| Invalid Login Username | POST | /auth/login | 401 Unauthorized | 401 Unauthorized with message "username or password is incorrect" | ✅ Passed |
| Login User not JSON | POST | /auth/login | 400 Bad Request | 400 Bad Request | ✅ Passed |  
| Invalid Get All Products | GET | /products/invalidPath | 406 Not Acceptable | 200 OK | ❌ Failed |
| Invalid Get Product By ID (non-integer) | GET | /products/9.9 | 400 Bad Request | 200 OK | ❌ Failed |
| Invalid Get Product By ID (non-existent) | GET | /products/{huge_number} | 400 Bad Request | 200 OK | ❌ Failed |
| Invalid Create Car | POST | /carts | 400 Bad Request | 200 OK | ❌ Failed |
| Invalid Create Cart (empty cart) | POST | /carts | 400 Bad Request | 200 OK | ❌ Failed |  
| Invalid Get Single Cart By ID (no ID) | GET | /carts | 400 Bad Request | 200 OK with ID 1 data | ❌ Failed |
| Invalid Get Single Cart By ID (non-integer) | GET | /carts/1.9 | 400 Bad Request | 200 OK with null | ❌ Failed |
| Invalid Get Single Cart By ID (non-existent) | GET | /carts/9000000000000000 | 400 Bad Request | 200 OK with null | ❌ Failed |
| Invalid Delete Cart (non-integer) | DELETE | /carts/1.9 | 400 Bad Request | 200 OK with null | ❌ Failed |
| Invalid Delete Cart (non-existent) | DELETE | /carts/9000 | 400 Bad Request | 200 OK with null | ❌ Failed |
| Invalid Get All Carts (invalid path) | GET | /carts/invalid | 400 Bad Request | 400 Bad Request with error message | ✅ Passed |

## Test Results Summary
| Result | Count | Percentage |
|--------|-------|------------|
| ✅ Passed | 10 | 40% |
| ⚠️ Status or content mismatch | 3 | 12% |
| ❌ Failed | 12 | 48% |

## API Deficiencies Identified

1. **Incorrect status codes**: Many endpoints return 200 OK instead of appropriate status codes (201 Created, 400 Bad Request)
2. **Poor validation**: The API accepts invalid inputs (missing username, invalid email, non-integer IDs)
3. **Inconsistent data**: Cart endpoints return limited product data instead of full details as documented
4. **Improper error handling**: Many invalid requests return success responses instead of errors

## How to Use the Postman Collection

1. **Open Postman**  
   Ensure you have Postman installed. You can download it from [the Postman website](https://www.postman.com/downloads/).

2. **Import the Collection**  
   - Open Postman
   - Click on the "Import" button
   - Select the provided Postman collection file (`FakeStoreAPI.postman_collection.json`) and import it

3. **Import the Environment File (Optional)**  
   - If your tests rely on environment variables (such as base URLs or authentication tokens), import the environment file, if provided
   - To import it, click on the gear icon in Postman, then select **Import**, and choose the environment file

4. **Run the Requests**  
   - Once the collection and environment (if any) are imported, you can run each request
   - Click on the collection to see all the available requests and select the one you want to run
   - Hit the "Send" button to execute the request and check the results

5. **Run the Entire Collection**
   - To run all tests at once, right-click on the collection and select "Run Collection"
   - Review the test results to see which tests passed and which failed


