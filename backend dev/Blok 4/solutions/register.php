<?php 

session_start();

if(!empty($_SESSION['email'])){
    include 'header.php'; 
}


?>
    <h1>Gebruiker maken</h1>
    <form action="register_process.php" method="post">
        <div class="form-group">
            <label for="email_form">Email</label>
            <input type="email" name="email_form" id="email_form">
        </div>
        <div class="form-group">
            <label for="password_form">Wachtwoord</label>
            <input type="password" name="password_form" id="password_form">
        </div>

        <div class="form-group">
            <label for="firstname_form">Voornaam</label>
            <input type="text" name="firstname_form" id="firstname_form">
        </div>
        <div class="form-group">
            <label for="lastname_form">Achternaam</label>
            <input type="text" name="lastname_form" id="lastname_form">
        </div>
        <div class="form-group">
                <label for="role_form">Selecteer een rol</label>
                <select name="role_form" id="role_form">
                    <option value="">Maak een keuze....</option>
                    <option value="administrator">Admin</option>
                    <option value="teacher">Docent</option>
                    <option value="student">Leerling</option>
                </select>
        </div>

        <button type="submit">Maak gebruiker!</button>
    </form>
</body>
</html>