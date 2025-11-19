<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bangalore Metro - Complaint & Feedback</title>
    <style>
        body {
                            font-family: Arial, sans-serif;
                            margin: 0;
                            padding: 0;
                            background-color: #f5f5f5;
                            background-image: url('https://www.newbreedrevenue.com/hs-fs/hubfs/shutterstock_695711272.jpg?width=2501&name=shutterstock_695711272.jpg');
                            background-size: cover;
                            background-repeat: no-repeat;
                            background-position: center;
                            height: 100vh;
                            width: 100vw;
                            display: flex;
                            flex-direction: column;
                            justify-content: center;
                            align-items: center;
                        }
        .container { max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        input, textarea, select, button { width: 100%; padding: 8px; margin: 5px 0; }
        .status-box { border: 1px solid #ccc; padding: 10px; margin-top: 15px; border-radius: 5px; background-color: #fff3e0; }
        h2 { color: #2c3e50; }
    </style>
</head>
<body>
<div class="container" style="opacity: 0.8;">
    <h2>Bangalore Metro - Complaint & Feedback</h2>

    <form>
        <label for="type">Complaint Type:</label>
        <select id="type" name="type">
            <option>Lost Item</option>
            <option>Cleanliness</option>
            <option>Delays</option>
            <option>Safety</option>
            <option>Other</option>
        </select>

        <label for="details">Complaint Details:</label>
        <textarea id="details" name="details" rows="4" placeholder="Describe your complaint"></textarea>

        <label for="rating">Rate Our Service:</label>
        <select id="rating" name="rating">
            <option>1 - Poor</option>
            <option>2 - Fair</option>
            <option>3 - Good</option>
            <option>4 - Very Good</option>
            <option>5 - Excellent</option>
        </select>

        <button type="submit">Submit Complaint</button>
    </form>

    <div class="status-box">
        <h3>Track Complaint Status</h3>
        <p>Complaint ID: #BM12345</p>
        <p>Status: In Progress</p>
    </div>
</div>
</body>
</html>
