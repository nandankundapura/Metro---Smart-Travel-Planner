<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<html>

<head>
    <title>Metro Dashboard</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-bg: #1a1a2e;
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://bangaloretoday.in/wp-content/uploads/2019/03/bangalore-metro-stations-980x735.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            display: flex;
            min-height: calc(100vh - 120px);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: rgba(26, 26, 46, 0.9);
            padding: 20px 0;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(52, 152, 219, 0.2);
            color: #fff;
            border-left: 3px solid var(--secondary-color);
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
        }

        .welcome-section {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }

        .stat-card i {
            font-size: 2rem;
            margin-bottom: 10px;
            color: var(--secondary-color);
        }

        .stat-card h3 {
            font-size: 1.8rem;
            margin: 10px 0;
        }

        .feature-tiles {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .feature-tile {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 200px;
        }

        .feature-tile:hover {
            transform: translateY(-8px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .feature-tile i {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: var(--secondary-color);
        }

        .feature-tile h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .feature-tile p {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Header Styles */
        .navbar {
            background: rgba(26, 26, 46, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 10px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .nav-link:hover {
            border-bottom: 2px solid var(--secondary-color);
        }

        /* Footer Styles */
        footer {
            margin-top: auto;
            background: rgba(26, 26, 46, 0.9);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                margin-bottom: 20px;
            }

            .stats-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .stats-container {
                grid-template-columns: 1fr;
            }

            .feature-tiles {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <!-- Header -->
    <header class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">


                    <li class="nav-item dropdown">
                        <div class="d-flex align-items-center">
                            <img src="getImage/${details.fileName}" class="rounded-circle mx-2" alt="img" width="60"
                                data-bs-toggle="modal" data-bs-target="#imageModal" style="cursor: pointer;" />
                            <a class="btn btn-sm btn-secondary dropdown-toggle mx-2" href="#" role="button"
                                id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                ${details.fname}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="profileUpdate?email=${details.email}">
                                    <i class="fas fa-user-edit"></i> Profile
                                </a>
                                <a class="dropdown-item" href="loginOut">
                                    <i class="fas fa-sign-out-alt"></i> Log out
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <!-- Profile Modal -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">Profile Picture</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img src="getImage/${details.fileName}" class="img-fluid rounded" alt="Profile Image" />
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h4><i class="fas fa-tachometer-alt"></i> Dashboard</h4>
            </div>
            <ul class="sidebar-menu">
                <li><a href="viewSmartCardRequests?email=${details.email}"><i class="fas fa-id-card"></i> Smart Cards</a></li>
                <li><a href="addLocations?email=${details.email}"><i class="fas fa-map-marker-alt"></i> Locations</a></li>
                <li><a href="addTimings?email=${details.email}"><i class="fas fa-clock"></i> Timings</a></li>
                <li><a href="addTrainType?email=${details.email}"><i class="fas fa-train"></i> Trains</a></li>
                <li><a href="addPriceList?email=${details.email}"><i class="fas fa-tag"></i> Pricing</a></li>
                <li><a href="readTrain?email=${details.email}"><i class="fas fa-database"></i> View Data</a></li>
                <li><a href="profileUpdate?email=${details.email}"><i class="fas fa-user-cog"></i> Profile</a></li>
            </ul>

            <div class="sidebar-footer px-3">
                <div class="card bg-dark text-white">
                    <div class="card-body text-center">
                        <h6>Metro Status</h6>
                        <div class="mt-2">
                            <span class="badge bg-success">Operational</span>
                            <p class="small mt-2">All lines running normally</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h2>Welcome back, ${details.fname}!</h2>
                        <p class="mb-0">Manage your metro system efficiently with this comprehensive dashboard.</p>
                    </div>
                    <div class="col-md-4 text-end">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5>Today's Date</h5>
                                <p id="current-date" class="mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="stats-container">
                <div class="stat-card">
                    <i class="fas fa-users"></i>
                    <h3>1,254</h3>
                    <p>Daily Commuters</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-train"></i>
                    <h3>42</h3>
                    <p>Active Trains</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-id-card"></i>
                    <h3>89</h3>
                    <p>Smart Card Requests</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>24</h3>
                    <p>Metro Stations</p>
                </div>
            </div>

            <!-- Quick Actions -->
            <h3 class="mb-3">Quick Actions</h3>
            <div class="feature-tiles">
                <div class="feature-tile" onclick="location.href='addLocations?email=${details.email}'">
                    <i class="fas fa-map-marker-alt"></i>
                    <h5>Locations</h5>
                    <p>Add or update station locations</p>
                </div>

                <div class="feature-tile" onclick="location.href='addTimings?email=${details.email}'">
                    <i class="fas fa-clock"></i>
                    <h5>Timings</h5>
                    <p>Manage train schedules</p>
                </div>

                <div class="feature-tile" onclick="location.href='addTrainType?email=${details.email}'">
                    <i class="fas fa-train"></i>
                    <h5>Add Train</h5>
                    <p>Register new trains to the system</p>
                </div>

                <div class="feature-tile" onclick="location.href='addPriceList?email=${details.email}'">
                    <i class="fas fa-tag"></i>
                    <h5>Price List</h5>
                    <p>Update fare and pricing information</p>
                </div>

                <div class="feature-tile" onclick="location.href='readTrain?email=${details.email}'">
                    <i class="fas fa-database"></i>
                    <h5>View Data</h5>
                    <p>Access and analyze system data</p>
                </div>

                <div class="feature-tile" onclick="location.href='viewSmartCardRequests.jsp'">
                    <i class="fas fa-id-card"></i>
                    <h5>Smart Cards</h5>
                    <p>Manage card requests and approvals</p>
                </div>
            </div>

            <!-- Recent Activity Section -->
            <div class="mt-5">
                <h3 class="mb-3">Recent Activity</h3>
                <div class="card bg-dark text-white">
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item bg-transparent text-white border-secondary">
                                <i class="fas fa-check-circle text-success me-2"></i>
                                New smart card request received - 10 mins ago
                            </li>
                            <li class="list-group-item bg-transparent text-white border-secondary">
                                <i class="fas fa-train text-info me-2"></i>
                                Train schedule updated for Green Line - 2 hours ago
                            </li>
                            <li class="list-group-item bg-transparent text-white border-secondary">
                                <i class="fas fa-map-marker-alt text-warning me-2"></i>
                                New station added to Blue Line - Yesterday
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer bg-dark py-3 mt-5">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <p class="text-white mb-0">Metro Management System &copy; 2024, All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

    <script>
        // Display current date
        document.getElementById('current-date').textContent = new Date().toLocaleDateString('en-US', {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });

        // Add active class to current page in sidebar
        document.addEventListener('DOMContentLoaded', function() {
            const currentPage = window.location.pathname.split('/').pop();
            const menuItems = document.querySelectorAll('.sidebar-menu a');

            menuItems.forEach(item => {
                if (item.getAttribute('href').includes(currentPage)) {
                    item.classList.add('active');
                }
            });
        });
    </script>

</body>
</html>