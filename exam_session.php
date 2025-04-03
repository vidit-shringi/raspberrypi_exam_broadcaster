<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Session</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            overflow: hidden;
        }
        #examContainer {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <div id="examContainer">
        <div class="text-center">
            <h2>Secure Exam Session</h2>
            <p>Please complete your exam without leaving this page.</p>
            <button id="submitExam" class="btn btn-danger">Submit Exam</button>
        </div>
    </div>

    <script>
        // Lock the screen in full-screen mode
        document.documentElement.requestFullscreen();

        document.getElementById('submitExam').onclick = function() {
            // Redirect to the dashboard after submission
            window.location.href = 'dashboard.html';
        };
    </script>
</body>
</html>