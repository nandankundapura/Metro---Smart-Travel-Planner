<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<html>

<head>
  <title>Admin Login</title>
  <link rel="icon" href="https://www.x-workz.in/Logo.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  <style>
    body, html {
      height: 100%;
      margin: 0;
    }

    .carousel-inner,
    .carousel-item,
    .carousel-item img {
      height: 100vh;
      width: 100%;
      object-fit: cover;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      background: rgba(0, 0, 0, 0.45);
      z-index: 1;
    }

    .login-card {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 2;
      width: 360px;
      border-radius: 12px;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.85); /* semi-transparent */
      backdrop-filter: blur(5px); /* glass effect */
    }

    .card-header {
      background: rgba(0, 123, 255, 0.9) !important;
    }
  </style>
</head>

<body>

  <!-- Carousel Background -->
  <div id="carouselBackground" class="carousel slide" data-bs-ride="carousel" data-bs-interval="1800">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="http://i.imgur.com/T2VyYeM.jpg" alt="Metro 1">
      </div>
      <div class="carousel-item">
        <img src="https://maps-washington-dc.com/img/1200/dc-metro-rail-map.jpg" alt="Metro 2">
      </div>
      <div class="carousel-item">
        <img src="https://www.metrorailnews.in/wp-content/uploads/2020/06/697094-jaipur-metro-02-1.jpg" alt="Metro 3">
      </div>
    </div>
    <div class="overlay"></div>
  </div>

  <!-- Login Card -->
  <div class="card login-card shadow-lg">
    <div class="card-header text-center text-white">
      <h5>Admin Login</h5>
    </div>
    <div class="card-body">
      <h6 style="color: green; text-align: center;">${success}</h6>
      <form action="login" method="post">
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email"
            onblur="checkEmail()" value="${enteredEmail}">
          <span id="emailExists"></span>
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" placeholder="Enter your password" name="password">
          <h6 style="color: red; text-align: center;">${loginErrMsg}</h6>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-primary w-100" id="button">Login</button>
          <a href="forgotPassword" style="text-decoration: none; display: block; margin-top: 10px;">Forgotten Password?</a>
        </div>
      </form>
    </div>
  </div>

  <footer class="footer">
    <div class="footer bg-dark py-3 mt-auto position-fixed bottom-0 w-100">
      <div class="container-fluid text-center">
        <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
      </div>
    </div>
  </footer>

  <script>
    const checkEmail = async () => {
      let emailId = document.getElementById("email").value
      var button = document.getElementById("button");
      const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId)
      if (emailId.length < 5) {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "email already exists") {
        document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
        button.removeAttribute("disabled");
      } else {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email not exists</span>";
        button.setAttribute("disabled", "");
      }
      console.log(response.data)
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>

</html>
