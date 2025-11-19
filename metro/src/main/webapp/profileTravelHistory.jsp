<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <title>Travel History</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body>
    <header class="bg-dark text-white text-center py-3">
        <div class="container">
            <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
            <h2 class="my-0">Travel History</h2>
        </div>
    </header>

    <div class="container my-5">
        <div class="card">
            <div class="card-header bg-success text-white">
                <h5 class="card-title mb-0">Your Recent Trips</h5>
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Date</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Fare (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Travel History -->
                        <tr>
                            <td>2025-09-20</td>
                            <td>MG Road</td>
                            <td>Majestic</td>
                            <td>25</td>
                        </tr>
                        <tr>
                            <td>2025-09-21</td>
                            <td>Indiranagar</td>
                            <td>Silk Board</td>
                            <td>40</td>
                        </tr>
                        <tr>
                            <td>2025-09-22</td>
                            <td>Rajajinagar</td>
                            <td>Yeshwantpur</td>
                            <td>30</td>
                        </tr>
                        <tr>
                            <td>2025-09-23</td>
                            <td>Kengeri</td>
                            <td>Mahalakshmi Layout</td>
                            <td>35</td>
                        </tr>
                        <tr>
                            <td>2025-09-24</td>
                            <td>Silk Board</td>
                            <td>MG Road</td>
                            <td>40</td>
                        </tr>
                        <!-- If travelHistory from backend exists -->
                        <c:forEach var="ticket" items="${travelHistory}">
                            <tr>
                                <td>${ticket.date}</td>
                                <td>${ticket.source}</td>
                                <td>${ticket.destination}</td>
                                <td>${ticket.fare}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Monthly Expense -->
                <p class="text-end mt-3"><strong>Monthly Expense:</strong> ₹
                    <c:out value="${monthlyExpense != null ? monthlyExpense : 170}" />
                </p>
            </div>
        </div>
    </div>

    <footer class="bg-dark py-3 mt-auto">
        <div class="container text-center">
            <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
        </div>
    </footer>
</body>

</html>
