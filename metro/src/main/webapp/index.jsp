<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>X-Workz Metro - Official Website</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --metro-primary: #0055A5;
            --metro-secondary: #FF671F;
            --metro-accent: #00A651;
            --metro-light: #F5F5F5;
            --metro-dark: #333333;
            --metro-gray: #6c757d;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--metro-light);
            color: var(--metro-dark);
            overflow-x: hidden;
        }

        /* Header Styles */
        .metro-header {
            background: linear-gradient(135deg, var(--metro-primary), var(--metro-secondary));
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .metro-logo {
            height: 50px;
            transition: transform 0.3s ease;
        }

        .metro-logo:hover {
            transform: scale(1.05);
        }

        .metro-title {
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
            font-size: 1.8rem;
            color: white;
        }

        .metro-nav-btn {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
        }

        .metro-nav-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Notification Bar */
        .metro-notification {
            background: linear-gradient(90deg, var(--metro-primary), var(--metro-accent));
            color: white;
            padding: 12px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(0, 85, 165, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(0, 85, 165, 0); }
            100% { box-shadow: 0 0 0 0 rgba(0, 85, 165, 0); }
        }

        /* Hero Section */
        .metro-hero {
            background: linear-gradient(rgba(0, 85, 165, 0.85), rgba(0, 166, 81, 0.85)), url('https://english.bmrc.co.in/images/metro/footer-img.png');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
        }

        .metro-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .metro-hero h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 20px;
            animation: fadeInUp 1s ease;
        }

        .metro-hero p {
            font-size: 1.3rem;
            margin-bottom: 30px;
            animation: fadeInUp 1s ease 0.2s both;
        }

        .metro-btn {
            background: var(--metro-secondary);
            border: none;
            border-radius: 30px;
            padding: 12px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease 0.4s both;
        }

        .metro-btn:hover {
            background: #e55a1a;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Section Styles */
        .metro-section {
            padding: 60px 0;
        }

        .metro-section-title {
            color: var(--metro-primary);
            font-weight: 700;
            margin-bottom: 40px;
            position: relative;
            padding-bottom: 15px;
            text-align: center;
        }

        .metro-section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--metro-secondary);
            border-radius: 2px;
        }

        /* Card Styles */
        .metro-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: none;
            margin-bottom: 20px;
            height: 100%;
        }

        .metro-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .metro-card-header {
            background: var(--metro-primary);
            color: white;
            padding: 15px;
            font-weight: 600;
            text-align: center;
        }

        .metro-card-body {
            padding: 25px;
        }

        .metro-feature-icon {
            font-size: 2.5rem;
            color: var(--metro-primary);
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }

        .metro-card:hover .metro-feature-icon {
            transform: scale(1.2);
        }

        /* Service List */
        .metro-service-list {
            list-style: none;
            padding: 0;
        }

        .metro-service-list li {
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 35px;
            transition: all 0.3s ease;
        }

        .metro-service-list li:hover {
            background-color: rgba(0, 85, 165, 0.05);
            padding-left: 40px;
        }

        .metro-service-list li:before {
            content: "\2714";
            position: absolute;
            left: 0;
            color: var(--metro-accent);
            font-weight: bold;
            font-size: 1.2rem;
        }

        /* Footer Styles */
        .metro-footer {
            background: var(--metro-dark);
            color: white;
            padding: 50px 0 20px;
        }

        .metro-footer h5 {
            color: var(--metro-secondary);
            margin-bottom: 20px;
            font-weight: 600;
        }

        .metro-footer-links {
            list-style: none;
            padding: 0;
        }

        .metro-footer-links li {
            margin-bottom: 10px;
        }

        .metro-footer-links a {
            color: #ccc;
            text-decoration: none;
            transition: all 0.3s;
        }

        .metro-footer-links a:hover {
            color: white;
            padding-left: 5px;
        }

        .metro-social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            color: white;
            transition: all 0.3s;
        }

        .metro-social-icons a:hover {
            background: var(--metro-primary);
            transform: translateY(-5px);
        }

        .metro-train-img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.5s ease;
        }

        .metro-train-img:hover {
            transform: scale(1.03);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in {
            animation: fadeInUp 1s ease;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .metro-hero h1 {
                font-size: 2rem;
            }

            .metro-title {
                font-size: 1.5rem;
            }

            .metro-section {
                padding: 40px 0;
            }
        }

        /* Navigation Menu */
        .metro-nav {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
        }

        .metro-nav .nav-link {
            color: var(--metro-dark);
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 20px;
            transition: all 0.3s ease;
            margin: 0 5px;
        }

        .metro-nav .nav-link:hover {
            background: var(--metro-primary);
            color: white;
        }

        .metro-nav .nav-link.active {
            background: var(--metro-secondary);
            color: white;
        }

        /* Counter Animation */
        .metro-counter {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--metro-primary);
        }

        .metro-counter-container {
            text-align: center;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .metro-counter-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="metro-header text-white py-2">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-auto">
                    <img src="https://www.x-workz.in/Logo.png" alt="Logo" class="metro-logo">
                </div>
                <div class="col text-center">
                    <h1 class="metro-title my-0">Metro Connect</h1>
                </div>
                <div class="col-auto text-center">
                    <button type="button" class="btn btn-light metro-nav-btn me-2">
                        <a href="loginPage" class="text-decoration-none text-dark"><i class="fas fa-user-shield me-1"></i> Admin</a>
                    </button>
                    <button type="button" class="btn metro-btn">
                        <a href="userRegister" class="text-decoration-none text-white"><i class="fas fa-user-plus me-1"></i> User Register</a>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <!-- Navigation Menu -->
    <nav class="metro-nav">
        <div class="container">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="routes.jsp"><i class="fas fa-route me-1"></i> Routes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#our-services"><i class="fas fa-train me-1"></i> Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp"><i class="fas fa-phone-alt me-1"></i> Contact Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Notification Bar -->
    <div class="container my-4">
        <div class="metro-notification text-center">
            <i class="fas fa-bullhorn me-2"></i>
            <span>Experience the fastest way to travel in the city. Save time and reduce traffic with metro service.</span>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="container">
        <div class="metro-hero text-center">
            <h1>Fast, Safe & Reliable Metro Service</h1>
            <p>Connecting the city with modern, eco-friendly transportation</p>
            <p class="lead">Want to book ticket?</p>
            <a href="userCanLoginHere" class="btn metro-btn"><i class="fas fa-ticket-alt me-2"></i> Book Now</a>
        </div>
    </div>

    <!-- About Section -->
    <div class="container metro-section">
        <h2 class="metro-section-title">About Our Metro</h2>
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="mb-4 fade-in">
                    The metro system is a rapid transit network that provides fast and convenient transportation across the
                    city. It aims to reduce traffic congestion and make urban commuting easier for everyone.
                </p>
                <div class="row">
                    <div class="col-sm-6 mb-4">
                        <div class="text-center fade-in">
                            <i class="metro-feature-icon fas fa-tachometer-alt"></i>
                            <h5>Fast Travel</h5>
                            <p>Reduce your commute time significantly</p>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="text-center fade-in">
                            <i class="metro-feature-icon fas fa-leaf"></i>
                            <h5>Eco-Friendly</h5>
                            <p>Help reduce carbon emissions</p>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="text-center fade-in">
                            <i class="metro-feature-icon fas fa-shield-alt"></i>
                            <h5>Safe & Secure</h5>
                            <p>24/7 security and surveillance</p>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="text-center fade-in">
                            <i class="metro-feature-icon fas fa-wifi"></i>
                            <h5>Wi-Fi Enabled</h5>
                            <p>Stay connected during your journey</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <img src="https://english.bmrc.co.in/images/metro/footer-img.png" alt="Metro Train" class="metro-train-img">
            </div>
        </div>
    </div>

    <!-- Stats Section -->
    <div class="container metro-section bg-white rounded">
        <h2 class="metro-section-title">Metro In Numbers</h2>
        <div class="row text-center">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="metro-counter-container">
                    <div class="metro-counter" id="stationCounter">0</div>
                    <p>Stations</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="metro-counter-container">
                    <div class="metro-counter" id="routeCounter">0</div>
                    <p>Kilometers</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="metro-counter-container">
                    <div class="metro-counter" id="passengerCounter">0</div>
                    <p>Daily Passengers</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="metro-counter-container">
                    <div class="metro-counter" id="trainCounter">0</div>
                    <p>Trains</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <div class="container metro-section"  id="our-services">
        <h2 class="metro-section-title">Our Services</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="metro-card">
                    <div class="metro-card-header">
                        <i class="fas fa-concierge-bell me-2"></i> Passenger Services
                    </div>
                    <div class="metro-card-body">
                        <ul class="metro-service-list">
                            <li>24/7 Service Availability</li>
                            <li>Wi-Fi Enabled Stations</li>
                            <li>Accessibility Features for Disabled Passengers</li>
                            <li>Eco-friendly and Sustainable</li>
                            <li>Digital Ticketing & Smart Cards</li>
                            <li>Real-time Train Tracking</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="metro-card">
                    <div class="metro-card-header">
                        <i class="fas fa-map-marked-alt me-2"></i> Route Information
                    </div>
                    <div class="metro-card-body">
                        <ul class="metro-service-list">
                            <li>50+ Stations Across the City</li>
                            <li>Interchange Facilities</li>
                            <li>Last Train After Midnight</li>
                            <li>Frequency: 3-5 Minutes During Peak Hours</li>
                            <li>Park & Ride Facilities</li>
                            <li>Integration with Bus Services</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="metro-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h5>X-Workz Metro</h5>
                    <p>Providing fast, reliable, and eco-friendly transportation solutions for the city.</p>
                    <div class="metro-social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <h5>Quick Links</h5>
                    <ul class="metro-footer-links">
                        <li><a href="#"><i class="fas fa-chevron-right me-1"></i> Home</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right me-1"></i> Routes & Fares</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right me-1"></i> Service Updates</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right me-1"></i> Smart Card</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right me-1"></i> Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-md-4 mb-4">
                    <h5>Contact Information</h5>
                    <ul class="metro-footer-links">
                        <li><i class="fas fa-map-marker-alt me-2"></i> Metro Headquarters, City Center</li>
                        <li><i class="fas fa-phone me-2"></i> 1800-123-4567</li>
                        <li><i class="fas fa-envelope me-2"></i> info@xworkzmetro.com</li>
                        <li><i class="fas fa-clock me-2"></i> Customer Care: 24/7</li>
                    </ul>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 text-center">
                    <p class="mb-0">Copyright &copy; 2024 X-Workz Metro, All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Counter Animation
        function animateCounter(id, start, end, duration) {
            let obj = document.getElementById(id);
            let range = end - start;
            let increment = end > start ? 1 : -1;
            let step = Math.abs(Math.floor(duration / range));
            let timer = setInterval(() => {
                start += increment;
                obj.textContent = start;
                if (start == end) {
                    clearInterval(timer);
                }
            }, step);
        }

        // Initialize counters when page loads
        window.addEventListener('load', function() {
            animateCounter('stationCounter', 0, 50, 2000);
            animateCounter('routeCounter', 0, 120, 2000);
            animateCounter('passengerCounter', 0, 500, 2000);
            animateCounter('trainCounter', 0, 40, 2000);
        });

        // Add scroll animation to elements
        document.addEventListener('DOMContentLoaded', function() {
            const fadeElements = document.querySelectorAll('.fade-in');

            const fadeInOnScroll = function() {
                fadeElements.forEach(element => {
                    const elementTop = element.getBoundingClientRect().top;
                    const elementVisible = 150;

                    if (elementTop < window.innerHeight - elementVisible) {
                        element.classList.add('fade-in');
                    }
                });
            };

            // Initial check
            fadeInOnScroll();

            // Check on scroll
            window.addEventListener('scroll', fadeInOnScroll);
        });
    </script>
</body>

</html>