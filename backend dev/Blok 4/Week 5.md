# Blok 4

## Week 5 - zoeken in Formula1-256

In deze les gaan we zoeken in de database en nog een keer filters aanbrengen. Omdat jullie dat wilde gaan we met het project Formula1-256 verder.

Dus open het project in VS Code en open de terminal. Run `docker compose up -d` om de database op te starten.

Dan open je de browser en ga naar `http://localhost:8000`.

### Opdracht 1 - Zoeken in de database

1. Maak een nieuw bestand aan genaamad search.php.
2. Voeg de volgende code toe:
    ```php
    <form action="search_process.php" method="GET">
        <label for="zoekterm">Zoek op naam</label>
        <input type="text" name="zoekterm" id="zoekterm" placeholder="Zoek op naam">
        <button type="submit">Zoek!</button>
    </form>
    ```
3. Maak een nieuw bestand aan genaamad search_process.php.
4. Voeg de volgende code toe:
    ```php
    <?php
    //validatie
    if(isset($_GET['zoekterm']) && !empty($_GET['zoekterm'])){
        
        $zoekterm = $_GET['zoekterm'];

        require 'database.php';
        $sql = "SELECT * FROM drivers WHERE name = '$zoekterm%'";
        $result = mysqli_query($conn, $sql);
        $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);

        foreach($drivers as $driver){
            echo $driver['forename'] . " " . $driver['surname'] . "<br>";
           
        }
       
    }
    else{
        echo "Voer een zoekterm in";
        exit;
    }
    ```