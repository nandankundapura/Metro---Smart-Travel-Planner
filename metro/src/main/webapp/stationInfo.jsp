<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bangalore Metro - Station Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            background-image: url('https://cdn.pixabay.com/photo/2023/11/22/19/32/metro-8406263_1280.jpg');
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
        .container { max-width: 800px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        input, button { padding: 8px; margin: 5px 0; width: 100%; }
        .info-box { border: 1px solid #ccc; padding: 15px; margin-top: 15px; border-radius: 5px; background-color: #e8f5e9; }
        h2 { color: #2c3e50; }

    </style>
</head>
<body>
<div class="container"; style="opacity: 0.9;">
    <h2>Bangalore Metro - Station Information</h2>

    <form>
        <label for="station">Search Station:</label>
        <input type="text" id="station" name="station" placeholder="Enter station name (e.g., MG Road)">
        <button type="submit">Search</button>
    </form>

    <div class="info-box">
        <h3>Facilities:</h3>
        <ul>
            <li>Parking: Available</li>
            <li>Washrooms: Available</li>
            <li>Lifts: Available</li>
            <li>Escalators: Available</li>
        </ul>

        <h3>First/Last Train Timings:</h3>
        <p>First Train: 5:00 AM | Last Train: 11:00 PM</p>

        <h3>Nearby Bus Stops / Landmarks:</h3>
        <ul>
            <li>BMTC Bus Stop: Near station exit</li>
            <li>Landmark: Brigade Road</li>
            <li>Nearby Mall: Orion Mall (if applicable)</li>
        </ul>
    </div>
</div>
</body>
</html>
