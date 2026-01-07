<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login_process.php" method="post">
        <div class="form-group">
            <label for="email_form">Email</label>
            <input type="text" name="email_form" id="email_form">
        </div>
        <div class="form-group">
            <label for="password_form">Wachtwoord</label>
            <input type="text" name="password_form" id="password_form">
        </div>
        <button type="submit">Login!</button>

       
    </form>
</body>
</html>