<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bangalore Metro - Live Updates</title>
    <style>
        body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f5f5f5;
                    background-image: url('https://themetrorailguy.com/wp-content/uploads/2022/03/ChallaghattaDepotDesign_Small.jpg');
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
        .container { max-width: 700px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        .update-box { border: 1px solid #ccc; padding: 15px; margin: 10px 0; border-radius: 5px; background-color: #e3f2fd; }
        h2 { color: #2c3e50; }
        .time { font-weight: bold; color: #1565c0; }
    </style>
    <script>
        // Dummy live updates simulation for Bangalore Metro
        function updateNextTrain() {
            const updates = [
                "Next train at MG Road in 3 mins",
                "Next train at Majestic in 5 mins",
                "Next train at Yeshwanthpur in 2 mins",
                "Next train at Silk Board in 4 mins"
            ];
            document.getElementById("liveTrain").innerText = updates[Math.floor(Math.random() * updates.length)];
        }
        setInterval(updateNextTrain, 5000); // Update every 5 seconds
    </script>
</head>
<body>
<div class="container" style="opacity: 0.9;">
    <h2>Bangalore Metro - Live Updates</h2>

    <div class="update-box" id="liveTrain">
        Next train at MG Road in 3 mins
    </div>

    <div class="update-box">
        <h3>Notifications:</h3>
        <p class="time">Delay at Majestic: 5 mins</p>
        <p class="time">Disruption at Yeshwanthpur: Maintenance work</p>
    </div>
</div>
</body>
</html>
