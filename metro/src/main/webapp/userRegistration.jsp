<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
  <title>Register | Metro Portal</title>
  <link rel="icon" href="https://www.x-workz.in/Logo.png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f0f7ff, #e6f0fa);
      color: #333;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Header */
    header {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(10px);
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    header h1 {
      color: #0078d7;
      font-weight: 600;
      letter-spacing: 1px;
    }

    header .btn {
      background: linear-gradient(90deg, #0078d7, #00bcd4);
      border: none;
      border-radius: 8px;
      transition: 0.3s;
    }

    header .btn:hover {
      transform: scale(1.05);
      box-shadow: 0 0 8px rgba(0, 120, 215, 0.4);
    }

    header .btn a {
      color: white;
      text-decoration: none;
      font-weight: 500;
    }

    /* Card */
    .form-card {
      background: rgba(255, 255, 255, 0.75);
      border: 1px solid rgba(0, 120, 215, 0.15);
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
      backdrop-filter: blur(12px);
      transition: all 0.3s ease;
    }

    .form-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
    }

    .form-label {
      font-weight: 500;
      color: #333;
    }

    .form-control {
      border-radius: 10px;
      border: 1px solid #ccc;
      transition: all 0.3s;
    }

    .form-control:focus {
      border-color: #0078d7;
      box-shadow: 0 0 0 0.2rem rgba(0, 120, 215, 0.25);
    }

    /* Buttons */
    .btn-primary {
      background: linear-gradient(90deg, #0078d7, #00bcd4);
      border: none;
      border-radius: 10px;
      padding: 10px 25px;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 18px rgba(0, 120, 215, 0.3);
    }

    /* Footer */
    footer {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(8px);
      box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.05);
      text-align: center;
      padding: 12px;
      color: #555;
      margin-top: auto;
    }

    a {
      color: #0078d7;
      text-decoration: none;
      font-weight: 500;
    }

    a:hover {
      text-decoration: underline;
    }

    h3 {
      color: #0078d7;
      font-weight: 600;
    }
  </style>
</head>

<body class="d-flex flex-column min-vh-100">

  <!-- Header -->
  <header class="py-3 px-4">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="col-auto">
          <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
        </div>
        <div class="col text-center">
          <h1 class="my-0">Metro Portal</h1>
        </div>
        <div class="col-auto d-flex align-items-center">
          <button class="btn me-2">
            <a href="indexPage">Home</a>
          </button>
          <button class="btn">
            <a href="userCanLoginHere">Login</a>
          </button>
        </div>
      </div>
    </div>
  </header>

  <!-- Register Form -->
  <main class="container my-5" style="max-width: 700px;">
    <div class="form-card p-4">
      <form action="userRegistration" method="post" onsubmit="return form(event)">
        <h3 class="text-center mb-4">Register User</h3>

        <div class="row">
          <span id="formMessage"></span>

          <div class="col-md-6 mb-3">
            <label class="form-label">First Name</label>
            <input type="text" class="form-control" id="fName" placeholder="Enter your first name"
              onchange="fNameValidation()" name="firstName" required>
            <span id="firstName"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lName" placeholder="Enter your last name"
              onchange="lNameValidation()" name="lastName" required>
            <span id="lastName"></span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" id="email" placeholder="Enter your email"
              onblur="checkEmail()" name="email" required>
            <span id="emailExists"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label">Contact Number</label>
            <input type="number" class="form-control" id="phNo" placeholder="Enter your contact number"
              name="mobileNumber" onblur="phone()" required>
            <span id="ph"></span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Date Of Birth</label>
            <input type="date" class="form-control" id="dob" name="dateOfBirth" required>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label">Gender</label>
            <div>
              <input type="radio" id="male" name="gender" value="male">
              <label for="male">Male</label>
              <input type="radio" id="female" name="gender" value="female">
              <label for="female">Female</label>
              <span id="genderError"></span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Enter your password"
              name="password" onchange="passwordEntry()" required>
            <span id="pass"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password"
              onblur="confirm()" name="confirmPassword" required>
            <span id="confirmPass"></span>
          </div>
        </div>

        <div class="text-center mt-3">
          <button id="button" type="submit" class="btn btn-primary me-2" disabled>Register</button>
          <button type="reset" class="btn btn-outline-primary">Reset</button>
          <div class="mt-3">
            Already have an account?
            <a href="userCanLoginHere">Login</a>
          </div>
        </div>
      </form>
    </div>
  </main>

  <!-- Footer -->
  <footer>
    © 2025 Metro Portal — All Rights Reserved
  </footer>

  <!-- JS Validations (unchanged) -->
  <script>
    // your same JavaScript validation logic remains here
  </script>

</body>
</html>
