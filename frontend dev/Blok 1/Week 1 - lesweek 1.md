# Frontend Ontwikkeling - Blok 1 (9 weken)

## Algemene Informatie
- **Doelgroep:** MBO studenten (15-22 jaar), beginners
- **Lesduur:** 90 minuten per week
- **Tools:** VS Code, DevTools (vanaf week 2), Copilot (vanaf week 3)

---

## Week 1: Introductie & Basis HTML

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat HTML is en waarvoor het gebruikt wordt
- Een correcte mappenstructuur aanmaken voor een webproject
- Een basis HTML-document opzetten met de juiste structuur
- Headings en paragrafen toevoegen aan een webpagina

### Lesopbouw (90 minuten)

**1. Introductie (15 min)**
- Verwelkoming en kennismaking
- Wat gaan we leren dit blok?
- Demo: laat een eenvoudige website zien en vertel dat zij dit gaan maken

**2. Mappenstructuur (20 min)**
- **Uitleg:** Waarom is een goede mappenstructuur belangrijk?
  - Overzicht houden van je bestanden
  - Samenwerken met anderen
  - Professioneel werken
  
- **Demonstratie:**
  ```
  mijn-website/
  ├── index.html
  ├── images/
  └── css/
  ```
  
- **Samen doen:** Laat studenten deze structuur aanmaken op hun computer
  - Nieuwe map maken op het Bureaublad: "mijn-website"
  - Submappen aanmaken: "images" en "css"

**3. VS Code Introductie (10 min)**
- VS Code openen
- Map "mijn-website" openen in VS Code
- Nieuw bestand aanmaken: index.html
- Uitleggen interface: bestandenboom links, editor rechts

**4. Basis HTML Structuur (25 min)**
- **Uitleg:** Wat is HTML?
  - HyperText Markup Language
  - De bouwstenen van een website
  - Tags werken als instructies voor de browser

- **Code samen schrijven:**
  ```html
  <!DOCTYPE html>
  <html lang="nl">
  <head>
      <meta charset="UTF-8">
      <title>Mijn Eerste Pagina</title>
  </head>
  <body>
      <h1>Welkom op mijn website</h1>
      <p>Dit is mijn eerste webpagina!</p>
  </body>
  </html>
  ```

- **Uitleg per onderdeel:**
  - `<!DOCTYPE html>` - Vertelt browser dat dit HTML5 is
  - `<html>` - Het begin van alle HTML
  - `<head>` - Informatie over de pagina (niet zichtbaar)
  - `<title>` - Naam in het tabblad van de browser
  - `<body>` - Wat je daadwerkelijk ziet op de pagina

**5. Headings en Paragrafen (15 min)**
- **Uitleg:**
  - `<h1>` t/m `<h6>` - Koppen (h1 is grootste, h6 kleinste)
  - `<p>` - Paragraaf met tekst
  - Gebruik slechts één `<h1>` per pagina (belangrijkste titel)

- **Oefening:** Studenten voegen toe:
  ```html
  <h1>Mijn Naam</h1>
  <h2>Over mij</h2>
  <p>Ik ben een student bij [schoolnaam]. Ik volg de opleiding Software Development.</p>
  <h2>Mijn Hobbies</h2>
  <p>In mijn vrije tijd houd ik van...</p>
  ```

**6. Bestand openen in browser (5 min)**
- Demonstreer: rechtsklik op index.html → Open met → Browser
- Laat studenten hun pagina openen
- Wow-moment: "Dit heb ik zelf gemaakt!"

### Huiswerk
Maak een pagina over jezelf met:
- Minstens 3 verschillende headings (h1, h2, h3)
- Minstens 4 paragrafen
- Onderwerpen: Je naam, waarom je deze opleiding doet, je hobby's, je favoriete eten

---
