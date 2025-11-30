<?php include 'session_check.php'; ?>
<?php include 'header.php'; ?>


    <h1>Maak klas</h1>
    <form action="create_klas_process.php" method="post">

        <div class="form-group">
            <label for="naam_klas">Naam klas</label>
            <input type="text" name="naam" id="naam_klas" placeholder="vb: zwsd25f ">
        </div>
        <div class="form-group">
            <label for="lokaal">Naam lokaal</label>
            <input type="text" name="lokaal" id="lokaal" placeholder="B222">
        </div>
             <div class="form-group">
            <label for="juf_meester">Naam juf of meester</label>
            <input type="text" name="juf_meester" id="juf_meester" placeholder="Konings">
        </div>
        <div class="form-group">
            <label for="aantal_l">Aantal leerlingen</label>
            <input type="number" name="aantal_l" id="aantal_l" placeholder="20">
        </div>
        <div class="form-group">
            <label for="verdiep">Verdieping</label>
            <input type="number" name="verdiep" id="verdiep" placeholder="2">
        </div>

        <button type="submit">Maak klas</button>
    
 
    </form>
</body>
</html>