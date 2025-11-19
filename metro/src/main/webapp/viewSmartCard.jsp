<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Smart Card Requests</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta http-equiv="refresh" content="30">

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

        .page-header {
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

        /* Table Styles */
        .requests-table {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .table {
            margin-bottom: 0;
            color: white;
        }

        .table thead th {
            background: rgba(52, 152, 219, 0.3);
            border: none;
            padding: 15px;
            font-weight: 600;
        }

        .table tbody tr {
            background: rgba(255, 255, 255, 0.05);
            transition: all 0.3s;
        }

        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: scale(1.01);
        }

        .table tbody td {
            border-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            vertical-align: middle;
        }

        .badge {
            font-size: 0.8rem;
            padding: 6px 12px;
            border-radius: 20px;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-action {
            padding: 6px 12px;
            font-size: 0.85rem;
            border-radius: 6px;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            border: none;
            cursor: pointer;
        }

        .btn-action:hover {
            transform: translateY(-2px);
            text-decoration: none;
        }

        /* Filter Section */
        .filter-section {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--secondary-color);
            color: white;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        /* Fix Dropdown Background */
        .dropdown-menu {
            background: rgba(26, 26, 46, 0.95) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .dropdown-item {
            color: rgba(255, 255, 255, 0.8) !important;
        }

        .dropdown-item:hover {
            background: rgba(52, 152, 219, 0.3) !important;
            color: white !important;
        }

        /* Fix form select dropdown */
        .form-select option {
            background: rgba(26, 26, 46, 0.95) !important;
            color: white !important;
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

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: rgba(255, 255, 255, 0.7);
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: rgba(255, 255, 255, 0.3);
        }

        /* Alert Styles */
        .alert {
            border: none;
            border-radius: 10px;
            backdrop-filter: blur(10px);
        }

        .alert-success {
            background: rgba(40, 167, 69, 0.2);
            color: #d4edda;
        }

        .alert-danger {
            background: rgba(220, 53, 69, 0.2);
            color: #f8d7da;
        }

        /* Debug Info */
        .debug-info {
            background: rgba(231, 76, 60, 0.2);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 4px solid var(--accent-color);
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

            .table-responsive {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 576px) {
            .stats-container {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-action {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <!-- Header -->
    <header class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">
                <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item mx-2">

                    </li>

                    <li class="nav-item dropdown">
                        <div class="d-flex align-items-center">
                            <!-- Profile Image -->
                            <div class="rounded-circle mx-2 bg-secondary d-flex align-items-center justify-content-center"
                                 style="width: 60px; height: 60px; cursor: pointer;"
                                 data-bs-toggle="modal" data-bs-target="#imageModal">
                                <i class="fas fa-user text-white"></i>
                            </div>
                            <a class="btn btn-sm btn-secondary dropdown-toggle mx-2" href="#" role="button"
                                id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                ${not empty details ? details.fname : 'Admin'}
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
                    <c:choose>
                        <c:when test="${not empty details && not empty details.fileName}">
                            <img src="getImage/${details.fileName}" class="img-fluid rounded" alt="Profile Image" />
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-user-circle" style="font-size: 8rem; color: #6c757d;"></i>
                            <p class="mt-2">No profile image available</p>
                        </c:otherwise>
                    </c:choose>
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

                <li><a href="viewSmartCardRequests?email=${details.email}" class="active"><i class="fas fa-id-card"></i> Smart Cards</a></li>
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
                        <h6>Smart Card Stats</h6>
                        <div class="mt-2">
                            <span class="badge bg-info">${empty requests ? 0 : requests.size()} Total</span>
                            <p class="small mt-2">Requests pending review</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Success/Error Messages -->
            <c:if test="${not empty message}">
                <div class="alert alert-${messageType == 'success' ? 'success' : 'danger'} alert-dismissible fade show" role="alert">
                    <i class="fas ${messageType == 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} me-2"></i>
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <!-- Debug Information -->
            <c:if test="${empty requests}">
                <div class="debug-info">
                    <h6><i class="fas fa-bug"></i> Debug Information</h6>
                    <p class="mb-1">Requests list: EMPTY</p>
                    <p class="mb-0">Number of requests: 0</p>
                </div>
            </c:if>

            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h2><i class="fas fa-id-card me-2"></i> Smart Card Requests</h2>
                        <p class="mb-0">Manage and review all smart card applications submitted by users.</p>
                    </div>
                    <div class="col-md-4 text-end">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5>Last Updated</h5>
                                <p id="current-date" class="mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="stats-container">
                <div class="stat-card">
                    <i class="fas fa-clock"></i>
                    <h3 id="pendingCount">0</h3>
                    <p>Pending Requests</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-check-circle"></i>
                    <h3 id="approvedCount">0</h3>
                    <p>Approved</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-times-circle"></i>
                    <h3 id="rejectedCount">0</h3>
                    <p>Rejected</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-users"></i>
                    <h3>${empty requests ? 0 : requests.size()}</h3>
                    <p>Total Requests</p>
                </div>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="searchInput" placeholder="Search by name or email...">
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" id="statusFilter">
                            <option value="">All Status</option>
                            <option value="PENDING">Pending</option>
                            <option value="APPROVED">Approved</option>
                            <option value="REJECTED">Rejected</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" id="cardTypeFilter">
                            <option value="">All Card Types</option>
                            <option value="Monthly Pass">Monthly Pass</option>
                            <option value="Quarterly Pass">Quarterly Pass</option>
                            <option value="Student Card">Student Card</option>
                            <option value="Senior Citizen Card">Senior Citizen Card</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-secondary w-100" id="resetFilters">Reset</button>
                    </div>
                </div>
            </div>

            <!-- Requests Table -->
            <div class="requests-table">
                <div class="table-responsive">
                    <table class="table table-hover" id="requestsTable">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-user"></i> Name</th>
                                <th><i class="fas fa-envelope"></i> Email</th>
                                <th><i class="fas fa-phone"></i> Phone</th>
                                <th><i class="fas fa-credit-card"></i> Card Type</th>
                                <th><i class="fas fa-id-badge"></i> ID Proof</th>
                                <th><i class="fas fa-info-circle"></i> Status</th>
                                <th><i class="fas fa-cogs"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty requests}">
                                    <c:forEach var="request" items="${requests}">
                                        <tr>
                                            <td>${request.cardId}</td>
                                            <td>${request.fullName}</td>
                                            <td>${request.email}</td>
                                            <td>${request.phone}</td>
                                            <td>${request.cardType}</td>
                                            <td>
                                                <span class="badge bg-secondary">${request.idProofType}</span>
                                                <small class="d-block">${request.idProofNumber}</small>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${request.status == 'APPROVED'}">
                                                        <span class="badge bg-success"><i class="fas fa-check"></i> Approved</span>
                                                    </c:when>
                                                    <c:when test="${request.status == 'REJECTED'}">
                                                        <span class="badge bg-danger"><i class="fas fa-times"></i> Rejected</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark"><i class="fas fa-clock"></i> Pending</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="action-buttons">
                                                    <c:choose>
                                                        <c:when test="${request.status == 'PENDING'}">
                                                            <a href="updateSmartCardStatus?cardId=${request.cardId}&status=APPROVED&email=${details.email}"
                                                               class="btn btn-success btn-action"
                                                               onclick="return confirm('Are you sure you want to approve this smart card request?')">
                                                                <i class="fas fa-check"></i> Approve
                                                            </a>
                                                            <a href="updateSmartCardStatus?cardId=${request.cardId}&status=REJECTED&email=${details.email}"
                                                               class="btn btn-danger btn-action"
                                                               onclick="return confirm('Are you sure you want to reject this smart card request?')">
                                                                <i class="fas fa-times"></i> Reject
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-success btn-action" disabled>
                                                                <i class="fas fa-check"></i> Approve
                                                            </button>
                                                            <button class="btn btn-danger btn-action" disabled>
                                                                <i class="fas fa-times"></i> Reject
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="8">
                                            <div class="empty-state">
                                                <i class="fas fa-inbox"></i>
                                                <h4>No Smart Card Requests</h4>
                                                <p>There are no pending smart card requests at the moment.</p>
                                                <p class="small text-warning mt-2">Check your database connection and ensure data exists.</p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
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
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });

        // Calculate status counts
        function calculateStatusCounts() {
            const pendingCount = document.querySelectorAll('.badge.bg-warning').length;
            const approvedCount = document.querySelectorAll('.badge.bg-success').length;
            const rejectedCount = document.querySelectorAll('.badge.bg-danger').length;

            document.getElementById('pendingCount').textContent = pendingCount;
            document.getElementById('approvedCount').textContent = approvedCount;
            document.getElementById('rejectedCount').textContent = rejectedCount;
        }

        // Filter functionality
        document.addEventListener('DOMContentLoaded', function() {
            calculateStatusCounts();

            const searchInput = document.getElementById('searchInput');
            const statusFilter = document.getElementById('statusFilter');
            const cardTypeFilter = document.getElementById('cardTypeFilter');
            const resetButton = document.getElementById('resetFilters');
            const tableRows = document.querySelectorAll('#requestsTable tbody tr');

            function filterTable() {
                const searchText = searchInput.value.toLowerCase();
                const statusValue = statusFilter.value;
                const cardTypeValue = cardTypeFilter.value;

                tableRows.forEach(row => {
                    if (row.cells.length < 8) return; // Skip empty state row

                    const name = row.cells[1].textContent.toLowerCase();
                    const email = row.cells[2].textContent.toLowerCase();
                    const status = row.cells[6].textContent.trim();
                    const cardType = row.cells[4].textContent.trim();

                    const matchesSearch = name.includes(searchText) || email.includes(searchText);
                    const matchesStatus = !statusValue || status.includes(statusValue);
                    const matchesCardType = !cardTypeValue || cardType === cardTypeValue;

                    if (matchesSearch && matchesStatus && matchesCardType) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            searchInput.addEventListener('input', filterTable);
            statusFilter.addEventListener('change', filterTable);
            cardTypeFilter.addEventListener('change', filterTable);

            resetButton.addEventListener('click', function() {
                searchInput.value = '';
                statusFilter.value = '';
                cardTypeFilter.value = '';
                filterTable();
            });

            // Auto-hide alerts after 5 seconds
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                setTimeout(() => {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                }, 5000);
            });
        });
    </script>

</body>
</html>