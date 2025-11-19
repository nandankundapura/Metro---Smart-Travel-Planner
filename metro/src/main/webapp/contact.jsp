<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us - Bangalore Metro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #e0f7ff, #f0faff);
            margin: 0;
            padding: 0;
        }

        .contact-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 80vh;
            text-align: center;
            padding: 40px 20px;
        }

        .contact-section h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .contact-card {
            background: #ffffffdd;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }

        .contact-card p {
            font-size: 18px;
            color: #444;
            margin: 15px 0;
        }

        .contact-card a {
            color: #1E90FF;
            text-decoration: none;
            font-weight: bold;
        }

        .contact-card a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .contact-card {
                padding: 20px;
            }

            .contact-card p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="contact-section">
        <h2>Contact Us</h2>
        <div class="contact-card">
            <p>For any queries regarding Bangalore Metro Routes, you can reach us at:</p>
            <p>📞 Helpline Number: <a href="tel:+918123456789">+91 81234 56789</a></p>
            <p>📧 Email: <a href="mailto:info@bangaloremetro.com">info@bangaloremetro.com</a></p>
        </div>
    </div>
</body>
</html>
