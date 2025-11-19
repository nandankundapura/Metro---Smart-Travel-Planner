<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bangalore Metro Routes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #e0f7ff, #f0faff); /* smooth light blue gradient */
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        .maps-row {
            display: flex;
            justify-content: center;
            gap: 25px; /* more space between cards */
            flex-wrap: wrap;
            margin: 40px 20px;
        }

        .map-container {
            text-align: center;
            flex: 0 0 auto;
            background: #ffffffdd; /* semi-transparent white card */
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .map-container:hover {
            transform: scale(1.05); /* slightly enlarge on hover */
        }

        .map-container img {
            width: 250px; /* bigger thumbnails */
            height: auto;
            cursor: pointer;
            border: 2px solid #ccc;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

        /* Lightbox overlay */
        .lightbox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .lightbox img {
            max-width: 90%;
            max-height: 90%;
            border-radius: 10px;
            box-shadow: 0 0 20px #fff;
            transform: scale(0.8);
            opacity: 0;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .lightbox.show img {
            transform: scale(1);
            opacity: 1;
        }

        /* Card titles */
        .map-container h3 {
            margin-bottom: 10px;
            color: #444;
        }
    </style>
    <script>
        function openLightbox(src) {
            const lightbox = document.getElementById('lightbox');
            const lightboxImg = document.getElementById('lightbox-img');
            lightboxImg.src = src;
            lightbox.style.display = 'flex';
            setTimeout(() => {
                lightbox.classList.add('show');
            }, 10);
        }

        function closeLightbox() {
            const lightbox = document.getElementById('lightbox');
            lightbox.classList.remove('show');
            setTimeout(() => {
                lightbox.style.display = 'none';
            }, 300);
        }
    </script>
</head>
<body>
    <h2>Bangalore Metro Routes</h2>

    <div class="maps-row">
        <!-- Purple Line Map -->
        <div class="map-container">
            <h3>Purple Line</h3>
            <img src="https://yometro.com/images/maps/bangalore-metro-purple-line-route-map.jpg" alt="Purple Line Map" onclick="openLightbox(this.src)">
        </div>

        <!-- Green Line Map -->
        <div class="map-container">
            <h3>Green Line</h3>
            <img src="https://yometro.com/images/maps/bangalore-metro-green-line-route-map.jpg" alt="Green Line Map" onclick="openLightbox(this.src)">
        </div>

        <!-- Yellow Line Map -->
        <div class="map-container">
            <h3>Yellow Line</h3>
            <img src="https://yometro.com/images/maps/bangalore-metro-yellow-line-route-map.jpg" alt="Yellow Line Map" onclick="openLightbox(this.src)">
        </div>

        <!-- Pink Line Map -->
        <div class="map-container">
            <h3>Pink Line</h3>
            <img src="https://yometro.com/images/maps/bangalore-metro-pink-line-route-map.jpg" alt="Pink Line Map" onclick="openLightbox(this.src)">
        </div>
    </div>

    <!-- Lightbox overlay -->
    <div id="lightbox" class="lightbox" onclick="closeLightbox()">
        <img id="lightbox-img" src="" alt="Zoomed Map">
    </div>
</body>
</html>
