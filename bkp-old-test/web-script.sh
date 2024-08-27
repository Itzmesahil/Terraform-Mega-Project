#!/bin/bash

# Update package index and install httpd (Apache)
sudo apt-get update
sudo apt-get install -y apache2

# Create the HTML file
cat <<EOL | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            width: 100%;
        }
        h1 {
            color: #2c3e50;
            font-size: 2.5rem;
            margin: 0;
        }
        p {
            font-size: 1.2rem;
            color: #7f8c8d;
            margin-top: 10px;
        }
        .signature {
            font-size: 1rem;
            color: #95a5a6;
            margin-top: 20px;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello Sahil!</h1>
        <p>This is Sahil Shaikh, and this is Terraform Project 2.</p>
        <div class="signature">
            Thank you for visiting!
        </div>
    </div>
</body>
</html>
EOL



