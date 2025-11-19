<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
  <title>Profile | Metro Portal</title>
  <link rel="icon" href="https://www.x-workz.in/Logo.png">

  <!-- Bootstrap & Tailwind -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Google Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Axios -->
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  <style>
    body {
      background: radial-gradient(circle at top left, #0a0f1e, #0f1a33);
      color: #e2e8f0;
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
    }

    /* Header */
    header {
      background: rgba(15, 23, 42, 0.8);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    header h1 {
      color: #38bdf8;
      font-weight: 600;
      letter-spacing: 1px;
    }

    /* Metro Card */
    .metro-card {
      background: rgba(255, 255, 255, 0.08);
      border-radius: 15px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      box-shadow: 0 4px 25px rgba(0, 0, 0, 0.4);
      backdrop-filter: blur(10px);
      opacity: 0;
      transform: translateY(40px);
      animation: fadeSlideIn 1s ease forwards;
      color: #e2e8f0;
    }

    @keyframes fadeSlideIn {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Neon Train Line */
    .train-line {
      position: relative;
      height: 3px;
      background: linear-gradient(90deg, transparent, #38bdf8, transparent);
      border-radius: 2px;
      overflow: hidden;
      box-shadow: 0 0 10px #38bdf8;
      margin-bottom: 15px;
    }

    .train {
      position: absolute;
      top: -8px;
      width: 25px;
      height: 15px;
      background: #38bdf8;
      border-radius: 3px;
      box-shadow: 0 0 15px #38bdf8, 0 0 25px #3b82f6 inset;
      animation: moveTrain 3s linear infinite;
    }

    @keyframes moveTrain {
      0% { left: -30px; }
      100% { left: 100%; }
    }

    /* Inputs */
    .form-control {
      background-color: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: #f8fafc;
    }

    .form-control:focus {
      border-color: #38bdf8;
      box-shadow: 0 0 8px #38bdf8;
      background-color: rgba(255, 255, 255, 0.15);
    }

    label {
      color: #cbd5e1;
      font-weight: 500;
    }

    /* Profile Image */
    .profile-pic {
      border-radius: 50%;
      height: 140px;
      width: 140px;
      object-fit: cover;
      border: 3px solid #38bdf8;
      box-shadow: 0 0 25px rgba(56, 189, 248, 0.6);
      transition: transform 0.3s;
    }

    .profile-pic:hover {
      transform: scale(1.05);
    }

    /* Buttons */
    .btn-metro {
      background: linear-gradient(90deg, #3b82f6, #06b6d4);
      border: none;
      color: #fff;
      font-weight: 600;
      border-radius: 8px;
      transition: all 0.3s ease;
      box-shadow: 0 0 15px rgba(56, 189, 248, 0.4);
    }

    .btn-metro:hover {
      background: linear-gradient(90deg, #06b6d4, #3b82f6);
      transform: scale(1.05);
      box-shadow: 0 0 25px #38bdf8;
    }

    /* Footer */
    footer {
      background: rgba(15, 23, 42, 0.9);
      color: #94a3b8;
      border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

  </style>
</head>

<body>

  <!-- Header -->
  <header class="text-white py-3 px-4 d-flex justify-content-center align-items-center shadow">
    <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 45px;" class="me-3">
    <h1 class="mb-0">Metro Profile Portal</h1>
  </header>

  <!-- Main Section -->
  <section class="container my-5">
    <div class="metro-card p-4 mx-auto" style="max-width: 750px;">
      <div class="train-line">
        <div class="train"></div>
      </div>

      <h5 class="text-center mb-4 uppercase tracking-wider" style="color: #93c5fd; letter-spacing: 1px;">
        <span class="material-icons align-middle me-2">account_circle</span>
        PROFILE DETAILS
      </h5>

      <form action="updateAdminDetails" method="post" enctype="multipart/form-data">
        <div class="text-center mb-4">
          <img src="getImage/${dto.fileName}" class="profile-pic" alt="Profile Image">
        </div>

        <input type="text" class="form-control" id="id" name="id" value="${dto.id}" hidden>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="fName">First Name</label>
            <input type="text" class="form-control" id="fName" name="fname" value="${dto.fname}"
                   onchange="fNameValidation()" required>
            <span id="firstName"></span>
          </div>
          <div class="col-md-6 mb-3">
            <label for="lName">Last Name</label>
            <input type="text" class="form-control" id="lName" name="lname" value="${dto.lname}"
                   onchange="lNameValidation()" required>
            <span id="lastName"></span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label>Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${dto.email}" readonly>
          </div>
          <div class="col-md-6 mb-3">
            <label>Contact Number</label>
            <input type="number" class="form-control" id="phNo" name="phNo" value="${dto.phNo}"
                   onblur="phone()" required>
            <span id="ph"></span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label>Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" value="${dto.dob}" required>
          </div>
          <div class="col-md-6 mb-3">
            <label>City</label>
            <input type="text" class="form-control" id="city" name="city" value="${dto.city}"
                   onchange="cityName()" required>
            <span id="cityName"></span>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label>Pincode</label>
            <input type="number" class="form-control" id="pinCode" name="pinCode"
                   value="${dto.pinCode}" onchange="pinCodeValid()" required>
            <span id="pin"></span>
          </div>

          <div class="col-md-6 mb-3">
            <label>Profile Picture</label>
            <input type="file" name="file" id="fileInput" class="form-control" onchange="validateFileSize()">
            <span id="fileSizeError" style="color:red;"></span>
          </div>
        </div>

        <div class="text-center mt-4">
          <button id="button" type="submit" class="btn btn-metro px-4 me-2">Update</button>
          <a href="getUserPage?email=${dto.email}" class="btn btn-outline-info px-4">Back</a>
        </div>
      </form>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-3 text-center">
    <p class="mb-0">© 2025 Metro Management System — All Rights Reserved</p>
  </footer>

  <!-- JS Validation (unchanged) -->
  <script>
    // your validation + axios functions remain exactly as before
  </script>

</body>
</html>
