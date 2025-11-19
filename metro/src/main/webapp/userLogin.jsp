<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<html>

<head>
  <title>User Login</title>
  <link rel="icon" href="https://www.x-workz.in/Logo.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Sliding background */
    .bg-carousel {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      overflow: hidden;
    }

    .bg-carousel img {
      position: absolute;
      width: 100%;
      height: 100%;
      object-fit: cover;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .bg-carousel img.active {
      opacity: 1;
    }

    /* Login card */
    .login-card {
      background: rgba(255, 255, 255, 0.85);
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 0 20px rgba(0,0,0,0.5);
      max-width: 400px;
      margin: auto;
    }

    /* Center container */
    .main-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 50px 0;
    }

  </style>
</head>

<body>
  <header class="bg-dark">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="col-auto">
          <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
        </div>
        <div class="col text-center">
          <h1 class="my-0 text-white">X-Workz</h1>
        </div>
        <div class="col-auto d-flex">
          <button type="button" class="btn btn-primary me-2">
            <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
          </button>
        </div>
      </div>
    </div>
  </header>

  <!-- Sliding background -->
  <div class="bg-carousel">
    <img src="https://www.tripsavvy.com/thmb/n2oAmjOEl-P3r8VXiuv2hu9bqZc=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1081803176-fd11b444454a416ca43a88be77eaeed6.jpg" class="active">
    <img src="https://planodemetro.com/wp-content/uploads/2020/05/metro-bangalore-fotos.jpg">
    <img src="https://english.bmrc.co.in/images/metro/homepage/about-us.jpg">
  </div>

  <!-- Centered login card -->
  <div class="main-container">
    <div class="card login-card">
      <div class="card-body">
        <h5 class="card-title text-center text-primary mb-4">User Login</h5>

        <form action="User" class="row g-3">
          <div class="mb-3">
            <label for="email" class="form-label">User Email*</label>
            <input type="email" id="email" onblur="checkEmail()" name="email" placeholder="User@gmail.com"
                   class="form-control" required value="${email.email}">
            <span id="emailExists"></span>
          </div>
          <div class="d-flex justify-content-center mb-3">
            <button type="submit" name="button" id="button1" class="btn btn-primary btn-sm rounded-sm">
              Get OTP
            </button>
          </div>
        </form>

        <h6 style="color: green;text-align: center;">${message}</h6>
        <h6 style="color: red;text-align: center;">${emailError}</h6>

        <form action="loginHere">
          <input type="email" id="email" name="email" value="${email.email}" hidden>
          <input type="number" id="id" name="id" value="${email.id}" hidden>
          <div class="mb-3">
            <input type="text" placeholder="Enter OTP" name="otp" class="form-control">
          </div>
          <div class="d-flex justify-content-center">
            <button type="submit" id="button" class="btn btn-dark btn-sm rounded-pill">Submit</button>
          </div>
        </form>

        <div class="text-center mt-3">
          <span>Don't have an account? <a href="userRegister" class="text-decoration-none">Register</a></span>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer bg-dark py-3">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-md-6 text-center">
          <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
        </div>
      </div>
    </div>
  </footer>

  <script>
    const checkEmail = async () => {
      let emailId = document.getElementById("email").value;
      var button = document.getElementById("button1");
      const response = await axios("http://localhost:8080/metro/findEmail?email=" + emailId);

      if (emailId.length < 5) {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "email already exists") {
        document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
        button.removeAttribute("disabled");
      } else {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email doesn't exists</span>";
        button.setAttribute("disabled", "");
      }
      console.log(response.data);
    }

    // Sliding background logic
    let current = 0;
    const slides = document.querySelectorAll(".bg-carousel img");
    setInterval(() => {
      slides[current].classList.remove("active");
      current = (current + 1) % slides.length;
      slides[current].classList.add("active");
    }, 2000);
  </script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
