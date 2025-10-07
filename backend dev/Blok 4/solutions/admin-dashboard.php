<?php

require 'database_connection.php';

// Check if the user is logged in
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

if ($_SESSION['role'] != 'admin') {
    header('Location: user-dashboard.php');
    exit;
}

// Query data
$sql = "SELECT COUNT(*) as total_users FROM users";
$result = mysqli_query($conn, $sql);
$total_users = mysqli_fetch_assoc($result)['total_users'];

$sql = "SELECT COUNT(*) as total_cards FROM cards";
$result = mysqli_query($conn, $sql);
$total_cards = mysqli_fetch_assoc($result)['total_cards'];

$sql = "SELECT COUNT(*) as total_normal_users FROM users WHERE role = 'user'";
$result = mysqli_query($conn, $sql);
$total_normal_users = mysqli_fetch_assoc($result)['total_normal_users'];
?>

<?php include 'header.php'; ?>
<?php include 'navbar.php'; ?>

    <div class="container mx-auto my-10 p-6 bg-white rounded-lg shadow-lg">
        <div class="text-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Welkom, <?php echo $_SESSION['firstname']; ?>!</h1>
            <p class="text-gray-600">Je bent ingelogd als <span class="font-medium"><?php echo $_SESSION['user_email']; ?></span>.</p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-blue-500 text-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-4xl font-bold"><?php echo $total_users; ?></h2>
                <p class="mt-2">Totaal aantal gebruikers</p>
            </div>
            <div class="bg-green-500 text-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-4xl font-bold"><?php echo $total_cards; ?></h2>
                <p class="mt-2">Totaal aantal kaarten</p>
            </div>
            <div class="bg-yellow-500 text-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-4xl font-bold"><?php echo $total_normal_users; ?></h2>
                <p class="mt-2">Totaal aantal normale gebruikers</p>
            </div>
        </div>
        <div class="text-center mt-6">
            <a href="logout.php" class="text-blue-500 hover:underline font-medium">Logout</a>
        </div>
    </div>
</body>
</html>

<?php include 'footer.php'; ?>