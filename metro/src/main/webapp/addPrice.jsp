<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <title>Add Price | Metro Portal</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        body {
            background: radial-gradient(circle at top left, #0a0f1e, #0f1a33);
            color: #e2e8f0;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        /* Header / Navbar */
        header {
            background: rgba(15, 23, 42, 0.8);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        nav a {
            color: #e2e8f0 !important;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        nav a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            left: 0;
            bottom: -4px;
            background: #38bdf8;
            transition: 0.3s;
            box-shadow: 0 0 8px #38bdf8;
        }

        nav a:hover::after {
            width: 100%;
        }

        nav a:hover {
            color: #38bdf8 !important;
            transform: translateY(-2px);
        }

        /* Card Section */
        .metro-card {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            opacity: 0;
            transform: translateY(40px);
            animation: fadeSlideIn 1s ease forwards;
        }

        @keyframes fadeSlideIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .metro-card h5 {
            color: #93c5fd;
            letter-spacing: 1px;
            font-weight: 600;
            position: relative;
            text-transform: uppercase;
        }

        /* Neon Train Line Animation */
        .train-line {
            position: relative;
            height: 3px;
            background: linear-gradient(90deg, transparent, #38bdf8, transparent);
            border-radius: 2px;
            overflow: hidden;
            box-shadow: 0 0 10px #38bdf8;
            margin-bottom: 10px;
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
            box-shadow: 0 0 5px #38bdf8;
            background-color: rgba(255, 255, 255, 0.15);
        }

        label {
            color: #cbd5e1;
        }

        /* Buttons */
        .btn-metro {
            background: linear-gradient(90deg, #3b82f6, #06b6d4);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-metro:hover {
            background: linear-gradient(90deg, #06b6d4, #3b82f6);
            transform: scale(1.05);
            box-shadow: 0 0 10px #38bdf8;
        }

        /* Footer */
        footer {
            background: rgba(15, 23, 42, 0.9);
            color: #94a3b8;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Profile dropdown */
        .dropdown-menu {
            background-color: #1e293b;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .dropdown-menu a {
            color: #e2e8f0 !important;
        }

        .dropdown-menu a:hover {
            background-color: #334155;
        }
    </style>
</head>

<body>
<header class="text-white py-3 px-4 d-flex justify-content-between align-items-center shadow">
    <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

    <nav class="d-flex justify-content-center align-items-center">
        <a href="viewSmartCardRequests?email=${details.email}"><i class="fas fa-id-card"></i> Smart Cards</a></li>
        <a href="addLocations?email=${dto.email}" class="mx-2">Locations</a>
        <a href="addTimings?email=${dto.email}" class="mx-2">Timings</a>
        <a href="addTrainType?email=${dto.email}" class="mx-2">Add Train</a>
        <a href="addPriceList?email=${dto.email}" class="mx-2">Price</a>
        <a href="readTrain?email=${dto.email}" class="mx-2">View Data</a>
    </nav>

    <div class="d-flex align-items-center">
        <img src="getImage/${dto.fileName}" class="rounded-circle me-2 border border-primary"
             alt="img" width="50" data-bs-toggle="modal" data-bs-target="#imageModal" />
        <div class="dropdown">
            <a class="btn btn-sm btn-outline-info dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
               data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ${dto.fname}
            </a>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="${dto.fname}">
                <a class="dropdown-item" href="profileUpdate?email=${dto.email}">Profile</a>
                <a class="dropdown-item" href="loginOut">Log out</a>
            </div>
        </div>
    </div>
</header>

<!-- Profile Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-slate-800 text-white">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="imageModalLabel">Profile Picture</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img src="getImage/${dto.fileName}" class="img-fluid rounded-lg shadow" alt="Profile Image" />
            </div>
        </div>
    </div>
</div>

<!-- Form Section -->
<section class="container my-5">
    <div class="metro-card p-4 mx-auto" style="max-width: 700px;">
        <div class="train-line">
            <div class="train"></div>
        </div>

        <h5 class="text-center mb-4">
            <span class="material-icons align-middle me-2">payments</span>
            ADD PRICE LIST
        </h5>

        <form action="price/${dto.email}" id="myForm" method="post">
            <input type="text" name="email" value="${dto.email}" hidden>

            <div class="mb-3">
                <label for="trainType" class="form-label">Train Type</label>
                <select name="trainType" id="trainType" class="form-control" required>
                    <option value="">Select Train Type</option>
                    <option value="Purple">Purple</option>
                    <option value="Green">Green</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="fromStation" class="form-label">From Station</label>
                <select name="fromStation" id="fromStation" class="form-control" required>
                    <option value="">Select From Station</option>
                    <option value="Baiyappanahalli">Baiyappanahalli</option>
                    <option value="Indiranagar">Indiranagar</option>
                    <option value="Halasuru">Halasuru</option>
                    <option value="Trinity">Trinity</option>
                    <option value="MG Road">M.G. Road</option>
                    <option value="Yeshwanthpur">Yeshwanthpur</option>
                    <option value="Jayanagar">Jayanagar</option>
                    <option value="Banashankari">Banashankari</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="toStation" class="form-label">To Station</label>
                <select name="toStation" id="toStation" class="form-control" required>
                    <option value="">Select To Station</option>
                    <option value="Baiyappanahalli">Baiyappanahalli</option>
                    <option value="Indiranagar">Indiranagar</option>
                    <option value="Halasuru">Halasuru</option>
                    <option value="Trinity">Trinity</option>
                    <option value="MG Road">M.G. Road</option>
                    <option value="Yeshwanthpur">Yeshwanthpur</option>
                    <option value="Jayanagar">Jayanagar</option>
                    <option value="Banashankari">Banashankari</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Ticket Price</label>
                <input type="number" name="price" id="price" class="form-control" placeholder="Enter Ticket Price" required />
            </div>

            <div class="text-center">
                <button type="submit" id="button" class="btn btn-metro px-4">Add</button>
            </div>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="py-3 text-center fixed-bottom">
    <p class="mb-0">© 2025 Metro Management System — All Rights Reserved</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
