<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Notifications & Alerts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .alert-card {
            transition: 0.3s;
        }
        .alert-card:hover {
            transform: scale(1.02);
            box-shadow: 0px 6px 18px rgba(0,0,0,0.15);
        }
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; background-image:url(https://media.istockphoto.com/id/1413761087/vector/alert-risk-sign-line-icon-set-caution-warning-exclamation-mark-thin-editable-line-stroke.jpg?s=612x612&w=0&k=20&c=E0NFMb20Uk-PArWAYtaCLmnBVQabiSwLA-eRm9uu2K4=);display:"flex;"}
    </style>
</head>
<body class="bg-light" >

<div class="container mt-5">
    <h3 class="text-center mb-4">🚇 Notifications & Alerts</h3>
    <div class="row g-4">

        <!-- Delay Alerts -->
        <div class="col-md-4">
            <div class="card alert-card border-warning">
                <div class="card-body">
                    <h5 class="card-title text-warning">Delay Alerts</h5>
                    <p class="card-text">Green Line: 10 mins delay at Majestic.</p><br>
                    <p class="text-muted small">Updated: 2 mins ago</p>
                </div>
            </div>
        </div>

        <!-- Maintenance -->
        <div class="col-md-4">
            <div class="card alert-card border-danger">
                <div class="card-body">
                    <h5 class="card-title text-danger">Maintenance</h5>
                    <p class="card-text">Purple Line closed between MG Road & Indiranagar on Sunday 10PM–5AM.</p>
                    <p class="text-muted small">Updated: Today</p>
                </div>
            </div>
        </div>

        <!-- Safety Instructions -->
        <div class="col-md-4">
            <div class="card alert-card border-info">
                <div class="card-body">
                    <h5 class="card-title text-info">Safety Instructions</h5>
                    <p class="card-text">Always stand behind the yellow line. Follow security announcements.</p>
                    <p class="text-muted small">Issued: Metro Authority</p>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
