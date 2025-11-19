<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(to right, #2575fc, #6a11cb);
            color: white;
            padding: 25px;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .form-container {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: all 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #2575fc;
            box-shadow: 0 0 0 2px rgba(37, 117, 252, 0.2);
            outline: none;
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }

        .radio-option {
            display: flex;
            align-items: center;
        }

        .radio-option input {
            width: auto;
            margin-right: 8px;
        }

        .form-footer {
            margin-top: 30px;
            text-align: center;
        }

        .submit-btn {
            background: linear-gradient(to right, #2575fc, #6a11cb);
            color: white;
            border: none;
            padding: 14px 30px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .submit-btn:disabled {
            background: #cccccc;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .form-note {
            margin-top: 15px;
            color: #666;
            font-size: 14px;
        }

        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        .success-message {
            color: #2ecc71;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        .validation-icon {
            position: absolute;
            right: 15px;
            top: 40px;
            font-size: 18px;
            display: none;
        }

        .valid {
            color: #2ecc71;
        }

        .invalid {
            color: #e74c3c;
        }

        .loader {
            display: none;
            width: 20px;
            height: 20px;
            border: 3px solid #f3f3f3;
            border-top: 3px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            position: absolute;
            right: 15px;
            top: 40px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .container {
                margin: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Your Account</h1>
        </div>

        <div class="form-container">
            <form id="registrationForm">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name *</label>
                        <input type="text" id="firstName" name="firstName" required>
                        <div class="error-message" id="firstNameError">First name is required</div>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name *</label>
                        <input type="text" id="lastName" name="lastName" required>
                        <div class="error-message" id="lastNameError">Last name is required</div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
                    <div class="loader" id="phoneLoader"></div>
                    <span class="validation-icon valid" id="phoneValid">✓</span>
                    <span class="validation-icon invalid" id="phoneInvalid">✗</span>
                    <div class="error-message" id="phoneError">Please enter a valid 10-digit phone number</div>
                    <div class="error-message" id="phoneDuplicateError">This phone number is already registered</div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" required>
                    <div class="loader" id="emailLoader"></div>
                    <span class="validation-icon valid" id="emailValid">✓</span>
                    <span class="validation-icon invalid" id="emailInvalid">✗</span>
                    <div class="error-message" id="emailError">Please enter a valid email address</div>
                    <div class="error-message" id="emailDuplicateError">This email address is already registered</div>
                </div>

                <div class="form-group">
                    <label for="address">Address *</label>
                    <textarea id="address" name="address" rows="3" required></textarea>
                    <div class="error-message" id="addressError">Address is required</div>
                </div>

                <div class="form-group">
                    <label>Gender *</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input type="radio" id="male" name="gender" value="male" required>
                            <label for="male">Male</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" id="female" name="gender" value="female">
                            <label for="female">Female</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" id="other" name="gender" value="other">
                            <label for="other">Other</label>
                        </div>
                    </div>
                    <div class="error-message" id="genderError">Please select your gender</div>
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth *</label>
                    <input type="date" id="dob" name="dob" required>
                    <div class="error-message" id="dobError">Date of birth is required</div>
                </div>

                <div class="form-footer">
                    <button type="submit" class="submit-btn" id="submitBtn">Register Now</button>
                    <p class="form-note">By registering, you agree to our Terms of Service and Privacy Policy</p>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Simulated database of existing users
        const existingUsers = [
            { email: "john.doe@example.com", phone: "1234567890" },
            { email: "jane.smith@example.com", phone: "0987654321" },
            { email: "mike.jones@example.com", phone: "5551234567" }
        ];

        // DOM elements
        const form = document.getElementById('registrationForm');
        const submitBtn = document.getElementById('submitBtn');
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');

        // Validation state
        let isEmailValid = false;
        let isPhoneValid = false;
        let isEmailUnique = false;
        let isPhoneUnique = false;

        // Function to validate email format
        function validateEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // Function to validate phone format
        function validatePhone(phone) {
            const phoneRegex = /^\d{10}$/;
            return phoneRegex.test(phone);
        }

        // Function to check if email is unique
        function checkEmailUnique(email) {
            return new Promise((resolve) => {
                // Show loading indicator
                document.getElementById('emailLoader').style.display = 'block';
                document.getElementById('emailValid').style.display = 'none';
                document.getElementById('emailInvalid').style.display = 'none';

                // Simulate API call delay
                setTimeout(() => {
                    const isUnique = !existingUsers.some(user => user.email === email);

                    // Hide loading indicator
                    document.getElementById('emailLoader').style.display = 'none';

                    if (isUnique) {
                        document.getElementById('emailValid').style.display = 'inline';
                        document.getElementById('emailDuplicateError').style.display = 'none';
                    } else {
                        document.getElementById('emailInvalid').style.display = 'inline';
                        document.getElementById('emailDuplicateError').style.display = 'block';
                    }

                    resolve(isUnique);
                }, 1000);
            });
        }

        // Function to check if phone is unique
        function checkPhoneUnique(phone) {
            return new Promise((resolve) => {
                // Show loading indicator
                document.getElementById('phoneLoader').style.display = 'block';
                document.getElementById('phoneValid').style.display = 'none';
                document.getElementById('phoneInvalid').style.display = 'none';

                // Simulate API call delay
                setTimeout(() => {
                    const isUnique = !existingUsers.some(user => user.phone === phone);

                    // Hide loading indicator
                    document.getElementById('phoneLoader').style.display = 'none';

                    if (isUnique) {
                        document.getElementById('phoneValid').style.display = 'inline';
                        document.getElementById('phoneDuplicateError').style.display = 'none';
                    } else {
                        document.getElementById('phoneInvalid').style.display = 'inline';
                        document.getElementById('phoneDuplicateError').style.display = 'block';
                    }

                    resolve(isUnique);
                }, 1000);
            });
        }

        // Function to update submit button state
        function updateSubmitButton() {
            const allFieldsFilled =
                document.getElementById('firstName').value.trim() !== '' &&
                document.getElementById('lastName').value.trim() !== '' &&
                document.getElementById('phone').value.trim() !== '' &&
                document.getElementById('email').value.trim() !== '' &&
                document.getElementById('address').value.trim() !== '' &&
                document.querySelector('input[name="gender"]:checked') !== null &&
                document.getElementById('dob').value !== '';

            if (allFieldsFilled && isEmailValid && isPhoneValid && isEmailUnique && isPhoneUnique) {
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }
        }

        // Event listeners for real-time validation
        emailInput.addEventListener('blur', async () => {
            const email = emailInput.value.trim();

            if (email === '') {
                document.getElementById('emailError').style.display = 'block';
                isEmailValid = false;
            } else if (!validateEmail(email)) {
                document.getElementById('emailError').style.display = 'block';
                isEmailValid = false;
            } else {
                document.getElementById('emailError').style.display = 'none';
                isEmailValid = true;
                isEmailUnique = await checkEmailUnique(email);
            }

            updateSubmitButton();
        });

        phoneInput.addEventListener('blur', async () => {
            const phone = phoneInput.value.trim();

            if (phone === '') {
                document.getElementById('phoneError').style.display = 'block';
                isPhoneValid = false;
            } else if (!validatePhone(phone)) {
                document.getElementById('phoneError').style.display = 'block';
                isPhoneValid = false;
            } else {
                document.getElementById('phoneError').style.display = 'none';
                isPhoneValid = true;
                isPhoneUnique = await checkPhoneUnique(phone);
            }

            updateSubmitButton();
        });

        // Add event listeners to all required fields
        const requiredFields = form.querySelectorAll('input[required], textarea[required]');
        requiredFields.forEach(field => {
            field.addEventListener('input', updateSubmitButton);
            field.addEventListener('change', updateSubmitButton);
        });

        // Gender radio buttons event listener
        const genderRadios = form.querySelectorAll('input[name="gender"]');
        genderRadios.forEach(radio => {
            radio.addEventListener('change', () => {
                document.getElementById('genderError').style.display = 'none';
                updateSubmitButton();
            });
        });

        // Form submission
        form.addEventListener('submit', function(event) {
            event.preventDefault();

            // Final validation
            let isValid = true;

            // Check all required fields
            if (document.getElementById('firstName').value.trim() === '') {
                document.getElementById('firstNameError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('firstNameError').style.display = 'none';
            }

            if (document.getElementById('lastName').value.trim() === '') {
                document.getElementById('lastNameError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('lastNameError').style.display = 'none';
            }

            if (document.getElementById('address').value.trim() === '') {
                document.getElementById('addressError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('addressError').style.display = 'none';
            }

            if (document.querySelector('input[name="gender"]:checked') === null) {
                document.getElementById('genderError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('genderError').style.display = 'none';
            }

            if (document.getElementById('dob').value === '') {
                document.getElementById('dobError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('dobError').style.display = 'none';
            }

            if (isValid && isEmailValid && isPhoneValid && isEmailUnique && isPhoneUnique) {
                // In a real application, you would send the data to a server here
                alert('Registration successful!');
                form.reset();
                submitBtn.disabled = true;

                // Reset validation states
                isEmailValid = false;
                isPhoneValid = false;
                isEmailUnique = false;
                isPhoneUnique = false;

                // Hide validation icons
                document.querySelectorAll('.validation-icon').forEach(icon => {
                    icon.style.display = 'none';
                });
            } else {
                alert('Please fix the errors in the form before submitting.');
            }
        });

        // Initialize submit button as disabled
        submitBtn.disabled = true;
    </script>
</body>
</html>