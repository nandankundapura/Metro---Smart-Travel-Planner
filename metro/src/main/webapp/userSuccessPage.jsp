
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

    <style>
        /* 🌇 Light Metro Gradient Background */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f8e1f4, #ffd6c2, #fff3e2);
            background-attachment: fixed;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            animation: fadeInBody 1.5s ease-in-out;
        }

        @keyframes fadeInBody {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* 🌈 Navbar Styling */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 0.7rem 2rem;
            width: 100%;
            animation: fadeInNavbar 1.5s ease-in-out;
        }

        @keyframes fadeInNavbar {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .navbar-brand img {
            height: 45px;
        }

        .navbar-nav .nav-link {
            color: #222 !important;
            font-weight: 600;
            position: relative;
            text-transform: uppercase;
            margin-right: 1.2rem;
            transition: color 0.3s ease-in-out;
        }

        .navbar-nav .nav-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            left: 0;
            bottom: -5px;
            background: linear-gradient(90deg, #ff80ab, #ffb74d);
            transition: width 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover::after {
            width: 100%;
        }

        .navbar-nav .nav-link:hover {
            color: #ff80ab !important;
        }

        .profile-img {
            border-radius: 50%;
            height: 45px;
            width: 45px;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid rgba(255, 255, 255, 0.5);
        }

        /* 🚈 Decorative Metro Line */
        .metro-line {
            width: 200px;
            height: 4px;
            background: linear-gradient(90deg, #ff80ab, #ffb74d, #fff3e2);
            margin: 20px auto 10px;
            border-radius: 2px;
        }

        /* 💎 Card Styling */
        .card {
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            border: none;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            animation: fadeInCard 1.5s ease-in-out;
        }

        @keyframes fadeInCard {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0px 10px 25px rgba(255, 128, 171, 0.4);
        }

        .card-title {
            color: #444;
            font-weight: 700;
        }

        /* 🌸 Buttons */
        .btn-metro {
            background: linear-gradient(90deg, #ff80ab, #ffb74d);
            color: white;
            border: none;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            font-weight: 600;
        }

        .btn-metro:hover {
            background: linear-gradient(90deg, #ffb74d, #ff80ab);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 128, 171, 0.5);
        }

        /* 📜 Footer */
        footer {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(8px);
            border-top: 1px solid rgba(255, 255, 255, 0.3);
            color: #444;
            font-weight: 500;
        }

        /* 🎯 QR Code Styling */
        .qr-container {
            text-align: center;
            padding: 20px;
            margin: 20px 0;
        }

        .qr-image {
            max-width: 250px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin: 15px 0;
            border: 3px solid #fff;
        }

        .payment-instructions {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 15px;
            margin-top: 15px;
        }

        .metro-qr-section {
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            border: 2px dashed #2196f3;
            border-radius: 15px;
            padding: 25px;
            margin: 20px 0;
            display: none;
        }

        .ticket-details {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
        }

        .success-animation {
            animation: bounceIn 0.8s ease-out;
        }

        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { transform: scale(1.05); opacity: 0.9; }
            100% { transform: scale(1); opacity: 1; }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
    </style>
</head>

<body>

    <!-- ✅ Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://www.x-workz.in/Logo.png" alt="Logo">
            </a>

            <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a href="smartCardStatus?email=${details.email}" class="nav-link">Smart Card Status</a></li>
                    <li class="nav-item"><a href="redirectTOSmartCard?email=${details.email}" class="nav-link">Smart Card Registration</a></li>

                    <li class="nav-item dropdown">
                        <img src="readImage/${details.imageName}" alt="Profile" class="profile-img mx-2" data-bs-toggle="dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-bs-toggle="dropdown">${details.firstName}</a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a></li>
                            <li><a class="dropdown-item" href="info?email=${details.email}">Information</a></li>
                            <li><a class="dropdown-item" href="smartCards?email=${details.email}">Smart Cards</a></li>
                            <li><a class="dropdown-item" href="userCanLoginHere">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 🚈 Decorative Metro Line -->
    <div class="metro-line"></div>

    <!-- ✅ Journey Fare Calculator -->
    <div class="card mx-auto mt-4" style="max-width: 900px; width: 90%; padding: 20px;">
        <div class="card-body">
            <h4 class="card-title text-center">JOURNEY FARE CALCULATOR</h4>
            <form action="ticketForm" id="ticketForm">
                <div class="card mt-4">
                    <div class="card-body bg-transparent">
                        <div class="row mb-3">
                            <input type="email" id="email" name="email" value="${details.email}" hidden>
                            <input type="number" id="id" name="id" value="${details.id}" hidden>

                            <div class="col-md-4">
                                <label class="form-label">From:</label>
                                <select class="form-select select2" id="sourceBox" onchange="checkPrice()" name="source">
                                    <option selected>Select Source:</option>
                                    <c:forEach var="source" items="${uniqueSources}">
                                        <option value="${source}">${source}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label">To:</label>
                                <select class="form-select select2" onchange="checkPrice()" id="selectBox" name="destination">
                                    <option selected>Select Destination:</option>
                                    <c:forEach var="destination" items="${uniqueDestinations}">
                                        <option value="${destination}">${destination}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-4" id="priceResult">
                                <label class="form-label">Price:</label>
                                <input type="number" name="price" id="priceId" value="${price.price}" class="form-control" readonly>
                                <p id="priceText" class="text-primary fw-bold mt-1"></p>
                            </div>
                        </div>

                        <!-- 🎯 Payment QR Code Section -->
                        <div id="paymentSection" style="display: none;">
                            <div class="qr-container">
                                <h5 class="text-center mb-3">Complete Your Payment</h5>
                                <img src="https://raw.githubusercontent.com/nandankundapura/qr-code/main/imag.jpeg"
                                     alt="Payment QR Code" class="qr-image">
                                <div class="payment-instructions">
                                    <p class="mb-2"><strong>Payment Instructions:</strong></p>
                                    <p class="mb-1">1. Scan the QR code with any UPI app</p>
                                    <p class="mb-1">2. Enter the amount shown above</p>
                                    <p class="mb-1">3. Complete the payment</p>
                                    <p class="mb-0">4. Click "Confirm Payment" after successful payment</p>
                                </div>
                                <button type="button" class="btn btn-success mt-3" onclick="confirmPayment()">
                                    ✅ Confirm Payment
                                </button>
                            </div>
                        </div>

                        <!-- 🚇 Metro Entry QR Code Section -->
                        <div id="metroQRSection" class="metro-qr-section" style="display: none;">
                            <div class="qr-container">
                                <h4 class="text-center text-success mb-3">🎉 Payment Successful!</h4>
                                <div class="ticket-details">
                                    <h5 class="text-center">Your Metro Ticket</h5>
                                    <p><strong>From:</strong> <span id="ticketSource"></span></p>
                                    <p><strong>To:</strong> <span id="ticketDestination"></span></p>
                                    <p><strong>Fare:</strong> ₹<span id="ticketPrice"></span></p>
                                    <p><strong>Ticket No:</strong> <span id="ticketNumber"></span></p>
                                    <p class="text-muted"><small>Generated on: <span id="ticketTime"></span></small></p>
                                </div>

                                <h5 class="text-center mt-4">Scan This QR Code at Metro Station</h5>
                                <img src="https://raw.githubusercontent.com/nandankundapura/qr-code/main/qrcode.jpeg"
                                     alt="Metro Entry QR Code" class="qr-image pulse">
                                <div class="payment-instructions mt-3">
                                    <p class="mb-2"><strong>Instructions:</strong></p>
                                    <p class="mb-1">• Scan this QR code at metro station entry gates</p>
                                    <p class="mb-1">• Valid for single journey only</p>
                                    <p class="mb-1">• Keep this QR code ready while traveling</p>
                                    <p class="mb-0 text-danger">• Expires 3 hours after generation</p>
                                </div>

                                <div class="mt-4">
                                    <button type="button" class="btn btn-primary me-2" onclick="printTicket()">
                                        🖨️ Print Ticket
                                    </button>
                                    <button type="button" class="btn btn-outline-success" onclick="downloadQR()">
                                        📱 Save QR Code
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8 mx-auto" id="bookButtonSection">
                            <button type="button" id="proceedToPayBtn" class="btn btn-metro w-100" onclick="showPaymentSection()">
                                💳 Proceed to Pay
                            </button>
                        </div>
                    </div>
                    <pre class="text-center text-success mt-3">${booked}</pre>
                </div>
            </form>
        </div>
    </div>

    <h5 class="text-center text-success mt-2">${price}</h5>

    <!-- ✅ Dashboard Cards -->
    <div class="container mt-5">
        <div class="d-flex justify-content-between flex-wrap text-center">
            <div class="card mx-2 mb-4" style="flex: 1 1 18%; cursor:pointer;" onclick="window.location.href='stationInfo.jsp'">
                <img src="https://bangaloretoday.in/wp-content/uploads/2019/03/bangalore-metro-stations-980x735.png" class="card-img-top" alt="Station Info">
                <div class="card-body"><h6 class="card-title">Station Info</h6></div>
            </div>

            <div class="card mx-2 mb-4" style="flex: 1 1 18%;" onclick="window.location.href='liveUpdates.jsp'">
                <img src="https://www.metrorailnews.in/wp-content/uploads/2019/06/NAMMA_METRO_MAP-768x501.png" class="card-img-top" alt="Live Updates">
                <div class="card-body"><h6 class="card-title">Live Updates</h6></div>
            </div>

            <div class="card mx-2 mb-4" style="flex: 1 1 18%;" onclick="window.location.href='complaintFeedback.jsp'">
                <img src="https://static.vecteezy.com/system/resources/previews/010/925/376/original/user-feedback-and-website-rating-customer-feedback-review-website-non-commercial-product-evaluation-rating-service-sharing-experience-flat-design-modern-illustration-vector.jpg" class="card-img-top" alt="Complaints & Feedback">
                <div class="card-body"><h6 class="card-title">Complaints & Feedback</h6></div>
            </div>

            <div class="card mx-2 mb-4" style="flex: 1 1 18%;" onclick="window.location.href='notifications.jsp'">
                <img src="https://tse1.mm.bing.net/th/id/OIP.57SojKyHpb_JvdVt-PcPzQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3" class="card-img-top" alt="Notifications">
                <div class="card-body"><h6 class="card-title">Notifications</h6></div>
            </div>

            <div class="card mx-2 mb-4" style="flex: 1 1 18%;" onclick="window.location.href='profileTravelHistory.jsp'">
                <img src="https://i.pinimg.com/736x/b4/7b/fb/b47bfbcd716ecdc348335e9928108a9c.jpg" class="card-img-top" alt="Profile & History">
                <div class="card-body"><h6 class="card-title">History</h6></div>
            </div>
        </div>
    </div>

    <!-- 🌈 Footer -->
    <footer class="py-3 mt-auto mt-5 text-center">
        <p class="mb-0">&copy; 2024 All Rights Reserved</p>
    </footer>

    <script>
        $('.select2').select2();

        const checkPrice = async () => {
            const source = document.getElementById("sourceBox").value;
            const destination = document.getElementById("selectBox").value;

            if (!source || source === "Select Source:" || !destination || destination === "Select Destination:") {
                document.getElementById("priceId").value = "";
                document.getElementById("priceText").innerText = "Please select both source and destination.";
                document.getElementById("proceedToPayBtn").disabled = true;
                return;
            }

            try {
                const response = await axios.get('http://localhost:8080/metro/sourceAndDestination', {
                    params: { source, destination },
                    headers: { 'Accept': 'text/plain' }
                });

                const price = response.data;
                if (price && price !== "Not Found") {
                    document.getElementById("priceId").value = price;
                    document.getElementById("priceText").innerText = `₹ ${price}`;
                    document.getElementById("proceedToPayBtn").disabled = false;
                } else {
                    document.getElementById("priceId").value = "";
                    document.getElementById("priceText").innerText = "Price not found.";
                    document.getElementById("proceedToPayBtn").disabled = true;
                }
            } catch (error) {
                console.error("Error fetching price:", error);
                document.getElementById("priceId").value = "";
                document.getElementById("priceText").innerText = "Please select valid source and destination";
                document.getElementById("proceedToPayBtn").disabled = true;
            }
        };

        function showPaymentSection() {
            const source = document.getElementById("sourceBox").value;
            const destination = document.getElementById("selectBox").value;
            const price = document.getElementById("priceId").value;

            if (!source || source === "Select Source:" || !destination || destination === "Select Destination:" || !price) {
                alert("Please select both source and destination first.");
                return;
            }

            // Hide the proceed button and show payment section
            document.getElementById("bookButtonSection").style.display = 'none';
            document.getElementById("paymentSection").style.display = 'block';
        }

        function confirmPayment() {
            const source = document.getElementById("sourceBox").value;
            const destination = document.getElementById("selectBox").value;
            const price = document.getElementById("priceId").value;

            if (confirm(`Confirm payment of ₹${price} for journey from ${source} to ${destination}?`)) {
                // Show metro QR code section
                showMetroQRCode(source, destination, price);
            }
        }

        function showMetroQRCode(source, destination, price) {
            // Hide payment section
            document.getElementById("paymentSection").style.display = 'none';

            // Set ticket details
            document.getElementById("ticketSource").textContent = source;
            document.getElementById("ticketDestination").textContent = destination;
            document.getElementById("ticketPrice").textContent = price;
            document.getElementById("ticketNumber").textContent = 'TKT' + Date.now().toString().slice(-8);
            document.getElementById("ticketTime").textContent = new Date().toLocaleString();

            // Show metro QR section with animation
            const metroSection = document.getElementById("metroQRSection");
            metroSection.style.display = 'block';
            metroSection.classList.add('success-animation');

            // Auto-submit form after 2 seconds to save to backend
            setTimeout(() => {
                document.getElementById("ticketForm").submit();
            }, 2000);
        }

        function printTicket() {
            const printContent = document.getElementById("metroQRSection").innerHTML;
            const originalContent = document.body.innerHTML;

            document.body.innerHTML = `
                <div style="padding: 20px; text-align: center;">
                    <h2>Metro Ticket</h2>
                    ${printContent}
                </div>
            `;
            window.print();
            document.body.innerHTML = originalContent;
            window.location.reload();
        }

        function downloadQR() {
            // Create a temporary link to download the QR code
            const link = document.createElement('a');
            link.href = 'https://raw.githubusercontent.com/nandankundapura/qr-code/main/qrcode.jpeg';
            link.download = 'metro-ticket-qr.jpeg';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        // Initialize - disable proceed button until price is calculated
        document.getElementById("proceedToPayBtn").disabled = true;
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>