Review Hoofdstuk 1b t/m 1e — ZWSD25F Blok 6
                                                                                                                                                                         
  ---             
  Overkoepelend beeld
                                                                                                                                                                         
  Er is een groot verschil in didactische kwaliteit tussen de vier hoofdstukken. Hoofdstuk 1b is puur een kookboek zonder scaffolding. Vanaf 1c is er een duidelijke
  sprong: denkvragen, verwachte resultaten, zelf-doen opdrachten. Dat patroon moet je ook terugbrengen in 1b, en iets meer vasthouden in 1d.                             
                  
  ---                                                                                                                                                                    
  Hoofdstuk 1b — Producten
                                                                                                                                                                         
  Didactiek
                                                                                                                                                                         
  Zwakste van de vier. Het mist de standaardelementen die 1c wel heeft:                                                                                                  
  
  - Geen "Wat ga je leren?" tabel                                                                                                                                        
  - Geen denkvragen (🤔)
  - Geen verwachte resultaten (✅)                                                                                                                                       
  - Geen terugblik
  - Uitleg ontbreekt volledig — studenten typen code zonder te begrijpen wat of waarom
                                                                                                                                                                         
  Tips:
  - Voeg een "Wat ga je leren?" tabel toe (MVC-patroon herhalen, Eloquent relatie, seeder)                                                                               
  - Voeg minimaal 2–3 denkvragen in: "Waarom gebruik je $fillable?", "Wat doet cascadeOnDelete?"                                                                         
  - Eindig met een terugblik-tabel zoals in 1c en 1e                                            
                                                                                                                                                                         
  Technisch                                                                                                                                                              
                                                                                                                                                                         
  - Code is correct, maar er is een inconsistentie: Product::with('category')->get() staat al in opdracht 15, terwijl eager loading pas in 1e als nieuw concept wordt    
  geïntroduceerd. Ofwel: bespreek het hier kort, ofwel gebruik Product::all()->get() en herzie dit in 1e.
  - php artisan make:view werkt pas vanaf Laravel 11 — vermeld dit, zodat studenten op een oudere versie niet vastlopen.                                                 
  - mediumText voor description is prima. cascadeOnDelete is een goede keuze maar wil je erbij uitleggen wat er met producten gebeurt als de categorie wordt verwijderd —
   dat is een moment van begripsvorming.                                                                                                                                 
                                                                                                                                                                         
  ---                                                                                                                                                                    
  Hoofdstuk 1c — Detailpagina
                                                                                                                                                                         
  Didactiek
                                                                                                                                                                         
  Sterkste van de vier. Dit is het format dat je als standaard zou moeten hanteren:                                                                                      
  
  - Denkvragen op de juiste momenten                                                                                                                                     
  - Verwachte foutmeldingen worden aangekondigd ("je krijgt een fout — dat klopt!")
  - Route → Controller → View patroon wordt expliciet herhaald                                                                                                           
  - Opdracht 20 is een goede zelf-doen opdracht met stappenplan maar zonder kant-en-klare code                                                                           
                                                                                                                                                                         
  Tips:                                                                                                                                                                  
  - Voeg bij opdracht 20 een checktabel toe (zoals je al doet bij stap E) — dat werkt motiverend en helpt studenten zelf beoordelen of ze klaar zijn                     
  - De kluisjes-analogie (stap 19.2) is sterk. Overweeg vaker zulke vergelijkingen in de andere hoofdstukken                                                             
  
  Technisch                                                                                                                                                              
                  
  - Hardcoded URLs (href="/categories/{{ $category->id }}") werken, maar je introduceert later route model binding. Overweeg een voetnoot: "In een later hoofdstuk leer  
  je de route() helper — die is netter en flexibeler." Dat zet verwachtingen goed neer.
  - https://spelshop.test — is dit een Herd/Valet-domeinnaam? Zorg dat dit ergens eerder is uitgelegd zodat studenten niet vastlopen op de URL zelf.                     
                                                                                                                                                                         
  ---
  Hoofdstuk 1d — Layout files                                                                                                                                            
                  
  Didactiek

  Solide maar te compact voor het abstractieniveau.                                                                                                                      
   
  Blade components zijn voor MBO-studenten best abstract (@props, $attributes, merge()). Opdracht 23 introduceert drie nieuwe concepten tegelijk en geeft weinig ruimte  
  voor de student om te verwerken.
                                                                                                                                                                         
  Tips:           
  - Splits opdracht 23 in twee fasen: eerst @props begrijpen en toepassen, dan pas $attributes->merge(). Laat studenten de resulterende HTML inspecteren in devtools
  vóórdat je verder gaat.                                                                                                                                                
  - Voeg een denkvraag toe bij stap 23.3: "Wat zou er in de HTML staan als je merge() niet gebruikt?" — dit maakt het verschil tastbaar.
  - Opdracht 22.3 ("Products views omzetten") geeft alleen de instructie maar geen voorbeeldcode. Dat is goed voor zelfstandig werken, maar voeg minimaal een checklist  
  toe zodat studenten weten wanneer ze klaar zijn.                                                                                                                       
                                                                                                                                                                         
  Technisch                                                                                                                                                              
                                                                                                                                                                         
  - php artisan make:component Layout genereert ook een PHP-klasse in app/View/Components/Layout.php. Die klasse is leeg bij een anonymous component, maar studenten     
  zullen ernaar kijken en verward raken. Vermeld dit expliciet, of gebruik make:component Layout --view om alleen het Blade-bestand te maken.
  - De App\View\Components\Layout-klasse en het layout.blade.php-bestand — dit onderscheid is niet uitgelegd. Een anoniem component (alleen het blade-bestand) is hier   
  eenvoudiger en sluit beter aan bij het niveau.                                                                                                                         
   
  ---                                                                                                                                                                    
  Hoofdstuk 1e — Eloquent relaties in views
                                                                                                                                                                         
  Didactiek
                                                                                                                                                                         
  Goed opgebouwd, maar één grote struikelblok.                                                                                                                           
   
  Tinker gebruiken om relaties te testen vóórdat je de view aanpast is pedagogisch sterk — studenten zien de data leven voordat ze code schrijven. De reflectievragen in 
  stap 27.4 zijn goed.
                                                                                                                                                                         
  Tips:           
  - De twee varianten naast elkaar aanbieden (route model binding vs. findOrFail($id)) is verwarrend voor studenten die net leren. Kies één aanpak als de standaard en
  zet de andere in een uitklapbaar blok of voetnoot voor gevorderden. De inconsistentie met hoofdstuk 1c (waar {id} werd gebruikt) zal vragen oproepen.                  
  - Opdracht 31 is gemarkeerd als "extra oefening" — goed, want het abstractieniveau (nested eager loading, @php in view) is hoog. Zorg dat de markering duidelijk
  zichtbaar is zodat zwakkere studenten niet denken dat het verplicht is.                                                                                                
                                                                                                                                                                         
  Technisch
                                                                                                                                                                         
  - @php in de view (opdracht 31) is een anti-pattern. Logica in views willen we vermijden. Verplaats de filtering naar de controller:                                   
  $relatedProducts = $product->category?->products->where('id', '!=', $product->id);                                                                                     
  return view('products.show', compact('product', 'relatedProducts'));                                                                                                   
  - Dit is ook een goed leermoment: "Logica hoort in de controller, niet in de view."
  - In opdracht 28 gebruik je $product->load('category') (lazy eager loading na ophalen), maar in de alternatieve variant Product::with('category')->findOrFail($id)     
  (eager loading bij ophalen). Beide werken, maar benoem het verschil expliciet — anders denken studenten dat het dezelfde techniek is.                                  
  - De routeparameternaam wijzigt van {id} (1c) naar {product} / {category} (1e) zonder duidelijke overgangsuitleg. Zet dit als expliciete stap: "We passen de route aan 
  van {id} naar {product} — dit is nodig voor route model binding."                                                                                                      
                  
  ---                                                                                                                                                                    
  Overkoepelende tips

  ┌───────────────────────┬────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
  │         Punt          │                                                              Aanbeveling                                                               │
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Consistentie          │ Gebruik in alle hoofdstukken hetzelfde format: Intro → Wat ga je leren? → Opdrachten met denkvragen → Terugblik. Nu heeft 1b dit niet. │
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ Eager loading         │ Introduceer het concept pas echt in 1e, en gebruik Product::all() in 1b. Nu staat with('category') al in 1b zonder uitleg.             │     
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤     
  │ Route model binding   │ Kies één moment om dit te introduceren, en kondig de overgang van {id} naar {product} expliciet aan.                                   │     
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤     
  │ @php in views         │ Vermijden — altijd in de controller oplossen. Dit is een goede gelegenheid om de MVC-scheiding te benadrukken.                         │
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤     
  │ make:component gedrag │ Leg uit dat dit twee bestanden maakt, of gebruik --view voor alleen een Blade-bestand.                                                 │
  ├───────────────────────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤     
  │ Differentiatieniveaus │ 1b en 1d missen een uitdagingsniveau voor snellere studenten. Voeg per hoofdstuk één "voor als je klaar bent"-opdracht toe.            │
  └───────────────────────┴────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘     
                  
  ---                                                                                                                                                                    
  De hoofdlijn is sterk: het Spelshop-thema is herkenbaar, het patroon Route → Controller → View wordt goed opgebouwd, en 1c is een uitstekend voorbeeld van hoe
  MBO-lesmateriaal eruit kan zien. Door 1b op te tillen naar het niveau van 1c en de technische inconsistenties (eager loading, route parameters) te stroomlijnen, wordt 
  de reeks als geheel veel sterker.