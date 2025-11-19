<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Smart Card Status</title>
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .status-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .status-pending {
            color: #ffc107;
            background: rgba(255, 193, 7, 0.1);
            border: 1px solid rgba(255, 193, 7, 0.3);
        }

        .status-approved {
            color: #198754;
            background: rgba(25, 135, 84, 0.1);
            border: 1px solid rgba(25, 135, 84, 0.3);
        }

        .status-rejected {
            color: #dc3545;
            background: rgba(220, 53, 69, 0.1);
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        .status-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        .info-item {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .smart-card-link {
            position: relative;
            text-decoration: none;
            color: white;
            font-size: 16px;
        }

        .smart-card-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #ffcc00;
            transition: width 0.3s ease-in-out;
        }

        .smart-card-link:hover::after {
            width: 100%;
        }

        /* Smart Card Design */
        .smart-card-preview {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            color: white;
            padding: 25px;
            margin: 20px 0;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .smart-card-preview::before {
            content: "";
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            transform: rotate(30deg);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .card-type {
            background: rgba(255, 255, 255, 0.2);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
        }

        .card-holder-info {
            margin-bottom: 20px;
        }

        .card-holder-name {
            font-size: 1.4rem;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .card-holder-email {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .card-details {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .card-id-section .label {
            font-size: 0.8rem;
            opacity: 0.8;
        }

        .card-id {
            font-size: 1.1rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .id-proof-section {
            text-align: right;
        }

        .id-proof-type {
            font-size: 0.8rem;
            opacity: 0.8;
        }

        .id-proof-number {
            font-size: 1rem;
            font-weight: bold;
        }

        .card-status-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.7rem;
            font-weight: bold;
        }

        .status-badge-approved {
            background: #28a745;
            color: white;
        }

        .status-badge-pending {
            background: #ffc107;
            color: black;
        }

        .status-badge-rejected {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Header (Same as your dashboard) -->
    <header class="bg-dark text-white text-center py-3">
        <div class="d-flex justify-content-between align-items-center">
            <!-- Left side: Logo -->
            <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

            <!-- Right side: Links + Profile dropdown -->
            <div class="d-flex align-items-center">
                <!-- Smart Card Registration Link -->
                <a href="redirectTOSmartCard?email=${details.email}" class="nav-link smart-card-link text-white fw-bold mx-3">
                    Smart Card Registration
                </a>

                <!-- Profile Dropdown -->
                <div class="dropdown mb-1">
                    <img src="readImage/${details.imageName}" class="rounded-circle mx-2" alt="img" width="90"
                        data-bs-toggle="modal" data-bs-target="#imageModal" />
                    <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                        role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        ${details.firstName}
                    </a>

                    <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                        <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>
                        <a class="dropdown-item" href="info?email=${details.email}">Information</a>
                        <a class="dropdown-item" href="smartCards?email=${details.email}">Smart Cards</a>
                        <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="status-card p-4 p-md-5 my-5">
                    <!-- Header -->
                    <div class="text-center mb-4">
                        <h1 class="h2 fw-bold text-primary">
                            <i class="fas fa-id-card me-2"></i>Smart Card Status
                        </h1>
                        <p class="text-muted">Track your metro smart card application</p>
                    </div>

                    <!-- Error Messages -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:choose>
                        <c:when test="${not empty smartCard}">

                            <!-- Smart Card Preview -->
                            <div class="smart-card-preview">
                                <!-- Status Badge -->
                                <div class="card-status-badge
                                    <c:choose>
                                        <c:when test="${smartCard.status == 'APPROVED'}">status-badge-approved</c:when>
                                        <c:when test="${smartCard.status == 'REJECTED'}">status-badge-rejected</c:when>
                                        <c:otherwise>status-badge-pending</c:otherwise>
                                    </c:choose>">
                                    ${smartCard.status}
                                </div>

                                <div class="card-header">
                                    <div class="card-logo">
                                        <i class="fas fa-subway me-2"></i>Metro Smart Card
                                    </div>
                                    <div class="card-type">
                                        ${smartCard.cardType}
                                    </div>
                                </div>

                                <div class="card-holder-info">
                                    <div class="card-holder-name">${smartCard.fullName}</div>
                                    <div class="card-holder-email">${smartCard.email}</div>
                                </div>

                                <div class="card-details">
                                    <div class="card-id-section">
                                        <div class="label">CARD ID</div>
                                        <div class="card-id">${smartCard.cardId}</div>
                                    </div>
                                    <div class="id-proof-section">
                                        <div class="id-proof-type">${smartCard.idProofType}</div>
                                        <div class="id-proof-number">${smartCard.idProofNumber}</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Status Display -->
                            <div class="text-center mb-5">
                                <c:choose>
                                    <c:when test="${smartCard.status == 'APPROVED'}">
                                        <div class="status-approved rounded-3 p-4 mb-4">
                                            <i class="fas fa-check-circle status-icon"></i>
                                            <h3 class="fw-bold">Application Approved!</h3>
                                            <p class="mb-0">Your smart card has been approved and is ready for use.</p>
                                        </div>
                                    </c:when>
                                    <c:when test="${smartCard.status == 'REJECTED'}">
                                        <div class="status-rejected rounded-3 p-4 mb-4">
                                            <i class="fas fa-times-circle status-icon"></i>
                                            <h3 class="fw-bold">Application Rejected</h3>
                                            <p class="mb-0">Your smart card application has been rejected. Please contact support for more information.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="status-pending rounded-3 p-4 mb-4">
                                            <i class="fas fa-clock status-icon"></i>
                                            <h3 class="fw-bold">Application Pending</h3>
                                            <p class="mb-0">Your application is under review. Please check back later.</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Application ID -->
                                <div class="bg-light rounded p-3">
                                    <small class="text-muted">Application ID</small>
                                    <h5 class="fw-bold text-dark mb-0">${smartCard.cardId}</h5>
                                </div>
                            </div>

                            <!-- Application Details -->
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Application Details</h5>
                                </div>
                                <div class="card-body">
                                    <div class="info-item">
                                        <small class="text-muted">Full Name</small>
                                        <h6 class="fw-bold mb-0">${smartCard.fullName}</h6>
                                    </div>
                                    <div class="info-item">
                                        <small class="text-muted">Email Address</small>
                                        <h6 class="fw-bold mb-0">${smartCard.email}</h6>
                                    </div>
                                    <div class="info-item">
                                        <small class="text-muted">Phone Number</small>
                                        <h6 class="fw-bold mb-0">${smartCard.phone}</h6>
                                    </div>
                                    <div class="info-item">
                                        <small class="text-muted">Card Type</small>
                                        <h6 class="fw-bold mb-0">
                                            <span class="badge bg-info">${smartCard.cardType}</span>
                                        </h6>
                                    </div>
                                    <div class="info-item">
                                        <small class="text-muted">ID Proof</small>
                                        <h6 class="fw-bold mb-0">${smartCard.idProofType}: ${smartCard.idProofNumber}</h6>
                                    </div>
                                    <div class="info-item">
                                        <small class="text-muted">Current Status</small>
                                        <h6 class="fw-bold mb-0">
                                            <c:choose>
                                                <c:when test="${smartCard.status == 'APPROVED'}">
                                                    <span class="badge bg-success">APPROVED</span>
                                                </c:when>
                                                <c:when test="${smartCard.status == 'REJECTED'}">
                                                    <span class="badge bg-danger">REJECTED</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-warning text-dark">PENDING</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="text-center mt-4">
                                <c:if test="${smartCard.status == 'PENDING'}">
                                    <div class="alert alert-warning">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Expected processing time: 2-3 business days
                                    </div>
                                </c:if>

                                <c:if test="${smartCard.status == 'APPROVED'}">
                                    <button class="btn btn-success me-2">
                                        <i class="fas fa-download me-2"></i>Download Card
                                    </button>
                                    <button class="btn btn-outline-primary">
                                        <i class="fas fa-print me-2"></i>Print Details
                                    </button>
                                </c:if>

                                <c:if test="${smartCard.status == 'REJECTED'}">
                                    <a href="redirectTOSmartCard?email=${details.email}" class="btn btn-primary me-2">
                                        <i class="fas fa-redo me-2"></i>Re-apply
                                    </a>
                                    <button class="btn btn-outline-secondary">
                                        <i class="fas fa-headset me-2"></i>Contact Support
                                    </button>
                                </c:if>

                                <div class="mt-3">
                                    <a href="userSuccessPage.jsp" class="btn btn-outline-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                                    </a>
                                </div>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <!-- No Application Found -->
                            <div class="text-center py-5">
                                <i class="fas fa-file-alt status-icon text-muted"></i>
                                <h3 class="fw-bold text-muted">No Application Found</h3>
                                <p class="text-muted mb-4">You haven't applied for a smart card yet.</p>
                                <a href="redirectTOSmartCard?email=${details.email}" class="btn btn-primary btn-lg">
                                    <i class="fas fa-plus me-2"></i>Apply for Smart Card
                                </a>
                                <div class="mt-3">
                                    <a href="userSuccessPage.jsp" class="btn btn-outline-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                                    </a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- Last Updated -->
                    <div class="text-center mt-4 pt-3 border-top">
                        <small class="text-muted">
                            <i class="fas fa-sync-alt me-1"></i>
                            Last updated:
                            <span id="currentTime">
                                <script>
                                    document.getElementById('currentTime').textContent = new Date().toLocaleString();
                                </script>
                            </span>
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark py-3 mt-auto">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>