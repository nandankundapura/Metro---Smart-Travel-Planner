<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Smart Card Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .registration-container {
            width: 100%;
            max-width: 600px;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 25px;
            color: #5e17eb;
            font-weight: 600;
        }

        .btn-submit {
            background-color: #5e17eb;
            color: white;
            transition: 0.3s ease-in-out;
            font-weight: 500;
        }

        .btn-submit:hover {
            background-color: #4510b0;
            transform: scale(1.03);
        }

        label {
            font-weight: 500;
            color: #333;
        }

        .form-control,
        .form-select {
            border-radius: 10px;
        }
    </style>
</head>

<body>

    <div class="registration-container">
        <h3 class="form-title">Smart Card Registration</h3>

        <form action="submitSmartCardRequest" method="post" enctype="multipart/form-data">
            <input type="hidden" name="email" value="${dto.email}">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullName" class="form-control" value="${details.firstName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" required>
            </div>



            <div class="mb-3">
                <label class="form-label">ID Proof Type</label>
                <select name="idProofType" class="form-select" required>
                    <option value="">Select ID Type</option>
                    <option>Aadhaar</option>
                    <option>Voter ID</option>
                    <option>Driving License</option>
                    <option>Passport</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">ID Proof Number</label>
                <input type="text" name="idProofNumber" class="form-control" required>
            </div>



            <div class="text-center">
                <button type="submit" class="btn btn-submit w-100">Request Smart Card</button>
            </div>
        </form>
    </div>

</body>
</html>
