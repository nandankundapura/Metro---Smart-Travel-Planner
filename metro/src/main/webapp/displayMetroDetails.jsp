<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Metro Train Details | Metro Portal</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Icons (used in AddLocation) -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        /* === Page theme (matches AddLocation) === */
        :root {
            --neon: #38bdf8;
            --glass-bg: rgba(255,255,255,0.06);
            --glass-border: rgba(255,255,255,0.08);
            --card-shadow: 0 6px 30px rgba(2,6,23,0.6);
        }

        html,body { height: 100%; margin: 0; }

        body {
            background: radial-gradient(circle at top left, #0a0f1e, #0f1a33);
            color: #e2e8f0;
            font-family: 'Poppins', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            min-height: 100vh;
            -webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
        }

        /* header / navbar */
        header {
            background: rgba(15,23,42,0.8);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255,255,255,0.06);
            padding: 0.75rem 1rem;
        }
        header img { max-height: 52px; }

        nav a {
            color: #e2e8f0 !important;
            font-weight: 500;
            margin: 0 8px;
            position: relative;
            transition: all .25s ease;
        }
        nav a::after{
            content:''; position:absolute; left:0; bottom:-6px; height:2px; width:0;
            background: var(--neon); box-shadow:0 0 8px var(--neon); transition: width .28s ease;
        }
        nav a:hover{ color: var(--neon) !important; transform: translateY(-3px); }
        nav a:hover::after{ width:100%; }

        /* profile dropdown */
        .dropdown-menu { background:#1e293b; border:1px solid rgba(255,255,255,0.06); }
        .dropdown-menu a { color: #e2e8f0 !important; }

        /* central container */
        .container-main {
            padding: 2.5rem 1rem 4.5rem;
            display:flex;
            justify-content:center;
            align-items:flex-start;
            gap:1.5rem;
        }

        /* Metro card (glass) */
        .metro-card {
            width:100%;
            max-width:1100px;
            background: var(--glass-bg);
            border-radius: 14px;
            border: 1px solid var(--glass-border);
            box-shadow: var(--card-shadow);
            padding: 1.4rem;
            backdrop-filter: blur(10px);
            overflow: hidden;
            animation: fadeSlideIn .7s ease forwards;
        }
        @keyframes fadeSlideIn { from { opacity: 0; transform: translateY(22px);} to { opacity: 1; transform: translateY(0);} }

        /* train-line (neon) above title */
        .train-line {
            position: relative;
            height: 4px;
            width: 100%;
            background: linear-gradient(90deg, transparent, var(--neon), transparent);
            border-radius: 3px;
            box-shadow: 0 0 12px rgba(56,189,248,0.16);
            margin-bottom: 12px;
            overflow: hidden;
        }
        .train {
            position: absolute;
            top: -9px;
            width: 28px;
            height: 16px;
            background: var(--neon);
            border-radius: 3px;
            box-shadow: 0 0 15px var(--neon), inset 0 0 20px rgba(59,130,246,0.25);
            animation: moveTrain 3.2s linear infinite;
        }
        @keyframes moveTrain {
            0% { left: -32px; opacity:0 }
            5% { opacity:1 }
            95%{ opacity:1 }
            100% { left: 102%; opacity:0 }
        }

        /* Title */
        .page-title {
            color: #93c5fd;
            letter-spacing: 1px;
            margin: 6px 0 18px;
            font-weight:700;
            text-transform:uppercase;
            display:flex;
            align-items:center;
            gap:.6rem;
        }
        .page-title .material-icons { color: var(--neon); font-size:28px; }

        /* Search bar + actions row */
        .toolbar {
            display:flex; gap: .75rem; align-items:center; margin-bottom:1rem; flex-wrap:wrap;
        }
        .search {
            flex:1; min-width:220px;
        }
        .btn-metro {
            background: linear-gradient(90deg,#3b82f6,#06b6d4);
            border:none; color:white; font-weight:600; border-radius:8px;
            padding: .45rem .9rem; transition: all .22s ease;
            box-shadow: 0 6px 18px rgba(3,105,161,0.08);
        }
        .btn-metro:hover { transform: translateY(-3px); box-shadow: 0 10px 30px rgba(6,182,212,0.12); }

        /* Data table styling */
        .table-wrap { width:100%; overflow:auto; border-radius:8px; padding: 6px; background: linear-gradient(180deg, rgba(255,255,255,0.02), transparent); }
        table.metro-table {
            width:100%;
            border-collapse: collapse;
            color: #e2e8f0;
            min-width: 980px; /* allow horizontal scroll on small screens */
        }
        table.metro-table thead th {
            background: rgba(56,189,248,0.08);
            color: #e6f8ff;
            font-weight:700;
            position: sticky;
            top: 0;
            backdrop-filter: blur(6px);
            padding: 10px 12px;
            text-align:left;
            border-bottom: 1px solid rgba(255,255,255,0.04);
        }
        table.metro-table tbody td {
            padding: 10px 12px;
            border-bottom: 1px dashed rgba(255,255,255,0.03);
            vertical-align: middle;
            font-size: 0.95rem;
        }
        table.metro-table tbody tr:hover {
            background: linear-gradient(90deg, rgba(56,189,248,0.04), rgba(59,130,246,0.02));
            transform: translateY(-1px);
        }
        .badge-line { display:inline-block; padding:3px 8px; border-radius:999px; font-size:.78rem; color:#022; background:#93c5fd; font-weight:600; }

        /* responsive adjustments */
        @media (max-width: 850px) {
            .metro-card { padding: 1rem; }
            table.metro-table { min-width: 820px; }
        }
        @media (max-width: 560px) {
            header .container { padding: 0 .5rem; }
            table.metro-table { min-width: 760px; font-size:0.9rem; }
        }

        /* footer */
        footer.app-footer {
            background: rgba(15,23,42,0.9);
            color: #94a3b8;
            border-top: 1px solid rgba(255,255,255,0.04);
            padding: .9rem 1rem;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="d-flex align-items-center">
    <div class="container d-flex justify-content-between align-items-center">
        <img src="https://www.x-workz.in/Logo.png" alt="Logo">
        <nav class="d-flex align-items-center">
            <a href="viewSmartCardRequests?email=${details.email}"><i class="fas fa-id-card"></i> Smart Cards </a></li>
            <a href="addLocations?email=${dto.email}">Locations</a>
            <a href="addTimings?email=${dto.email}">Timings</a>
            <a href="addTrainType?email=${dto.email}">Add Train</a>
            <a href="addPriceList?email=${dto.email}">Price</a>
            <a href="readTrain?email=${dto.email}">View Data</a>
        </nav>

        <div class="d-flex align-items-center">
            <img src="getImage/${dto.fileName}" class="rounded-circle me-2" style="width:48px;height:48px;object-fit:cover;border:2px solid rgba(56,189,248,0.18);" alt="profile" data-bs-toggle="modal" data-bs-target="#imageModal">
            <div class="dropdown">
                <a class="btn btn-sm btn-outline-info dropdown-toggle" href="#" role="button" id="dd" data-bs-toggle="dropdown" aria-expanded="false">${dto.fname}</a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dd">
                    <li><a class="dropdown-item" href="profileUpdate?email=${dto.email}">Profile</a></li>
                    <li><a class="dropdown-item" href="loginOut">Log out</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background:#0b1220;color:#fff;">
            <div class="modal-header border-0">
                <h5 class="modal-title">Profile Picture</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img src="getImage/${dto.fileName}" class="img-fluid rounded" alt="Profile">
            </div>
        </div>
    </div>
</div>

<!-- Main card -->
<div class="container-main">
    <div class="metro-card">

        <!-- neon train-line above title (same as AddLocation) -->
        <div class="train-line"><div class="train" aria-hidden="true"></div></div>

        <div class="d-flex justify-content-between align-items-center mb-2">
            <h3 class="page-title mb-0">
                <span class="material-icons">train</span>
                Metro Train Details
            </h3>

            <!-- toolbar: search & actions -->
            <div class="toolbar">
                <form action="readTrain" method="get" class="d-flex search" style="gap:.5rem;">
                    <input type="hidden" name="email" value="${dto.email}">
                    <input type="text" name="q" class="form-control form-control-sm" placeholder="Search train number / station..." />
                    <button class="btn btn-metro btn-sm" type="submit">Search</button>
                </form>
                <a href="addTrainType?email=${dto.email}" class="btn btn-metro btn-sm">Add Train</a>
            </div>
        </div>

        <!-- messages (if any) -->
        <div class="mb-2">
            <c:if test="${not empty find}">
                <div style="color:#34d399;">${find}</div>
            </c:if>
        </div>

        <!-- table -->
        <div class="table-wrap">
            <table class="metro-table">
                <thead>
                    <tr>
                        <th>AddTrain Id</th>
                        <th>Train Number</th>
                        <th>Train Type</th>
                        <th>Locations</th>
                        <th>From Time</th>
                        <th>To Time</th>
                        <th>Source</th>
                        <th>Destination</th>
                        <th>Day Of Week</th>
                        <th>Price (₹)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="addTrainEntity" items="${addTrainEntities}">
                        <tr>
                            <td>${addTrainEntity.addTrainId}</td>
                            <td>${addTrainEntity.trainNumber}</td>
                            <td><span class="badge-line">${addTrainEntity.trainType}</span></td>

                            <td>
                                <c:forEach items="${addTrainEntity.locations}" var="location">
                                    ${location.locationsName}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                                    ${timing.fromTime}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                                    ${timing.toTime}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                                    ${timing.source}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                                    ${timing.destination}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                                    ${timing.dayOfTheWeek}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${addTrainEntity.priceEntity}" var="price">
                                    ${price.price}<br/>
                                </c:forEach>
                            </td>

                            <td>
                                <a class="btn btn-sm btn-outline-light" href="UpdateTrain?addTrainId=${addTrainEntity.addTrainId}&email=${dto.email}">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="app-footer text-center">
    <div class="container">
        <p class="mb-0">© 2024 Metro Management System — All Rights Reserved</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
