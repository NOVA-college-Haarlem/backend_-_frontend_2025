<?php

$breadcrumb = "Home";
require "database_connection.php";

$sql = "SELECT * FROM cards";
$result = mysqli_query($conn, $sql);
$pokemon_info = mysqli_fetch_all($result, MYSQLI_ASSOC);    

if(isset($_GET['type'])){
    $type = $_GET['type'];
    $sql = "SELECT * FROM cards WHERE type = '$type'";
    $result = mysqli_query($conn, $sql);
    $pokemon_info = mysqli_fetch_all($result, MYSQLI_ASSOC);
}

?>
    <?php include 'header.php'; ?>
    <?php include 'navbar.php'; ?>

    <a href="index.php?type=vuur">Filter op Fire</a>

    <!-- Main Content -->
    <div class="w-full">
        <!-- Hero Section -->
        <div class="px-8 py-20 text-white bg-blue-600">
            <div class="max-w-4xl mx-auto">
                <!-- <h1 class="mb-4 text-5xl font-bold"><?php echo $bericht; ?></h1> -->
                <p class="text-xl">Ontdek de wonderlijke wereld van Pokémon en bekijk mijn uitgebreide collectie!</p>
            </div>
        </div>

        <!-- Pokemon Grid -->
        <div class="px-8 py-12 mx-auto max-w-7xl">
            <h2 class="mb-8 text-3xl font-bold">Mijn Favoriete Pokémon</h2>
            <div class="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">

                <?php foreach ($pokemon_info as $pokemon) { ?>
                    <!-- Pokemon Card 1 -->
                    <div class="overflow-hidden bg-white rounded-lg shadow-lg">
                        <div class="flex justify-center">
                            <img src="images/<?php echo $pokemon['image'] ?>" alt="Pikachu"
                                class="object-contain w-full h-64">
                        </div>
                        <div class="p-6">
                            <h3 class="mb-2 text-xl font-bold"><?php echo $pokemon["name"]; ?></h3>
                            <p class="mb-4 text-gray-600"><?php echo $pokemon["type"]; ?></p>
                            <a href="pokemon_detail.php?id=<?php echo $pokemon["id"]; ?>" class="text-blue-600 hover:text-blue-800">Meer informatie →</a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>

<?php include 'footer.php'; ?>