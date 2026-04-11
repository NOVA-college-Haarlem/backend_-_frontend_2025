# Receptie & Bezoekersregistratie

## Projectomschrijving

### Opdrachtgever
Een bedrijf wil het bezoekersproces moderniseren. Op dit moment tekenen bezoekers hun naam in een papieren schrift bij de receptie. Dat is onprofessioneel, slecht leesbaar, en in een noodsituatie weet niemand wie er in het pand is. De opdrachtgever wil een digitaal systeem waarbij bezoekers netjes worden aangemeld, de ontvanger automatisch een bericht krijgt, en een realtime overzicht beschikbaar is van wie er in het pand aanwezig is.

### Functionele eisen

Receptionist (ingelogd) kan:
- Een bezoeker inchecken: naam, bedrijf, contactpersoon (wie bezoekt hij?), reden van bezoek, verwachte vertrekdatum/-tijd
- Een bezoeker uitchecken (registreert de exacte vertrektijd)
- Een realtime overzicht zien van alle bezoekers die momenteel in het pand zijn
- De bezoekershistorie inzien (gisteren, afgelopen week)
- Een bezoeker zoeken op naam of bedrijf

Medewerkers (ontvanger, ingelogd) kunnen:
- Een e-mailnotificatie ontvangen zodra hun bezoeker is ingecheckt
- Een overzicht zien van hun eigen verwachte en afgeronde bezoeken
- Een bezoek vooraf aanmelden (zodat de receptie weet wie er komt)

Beheerders kunnen:
- Medewerkersaccounts aanmaken en beheren
- Alle bezoekersgegevens inzien en exporteren (inclusief historische data)
- Noodlijst opvragen: wie is er momenteel in het pand? (inclusief naam, bedrijf, contactpersoon)
- Bezoekersstatistieken inzien (drukste dag, gemiddelde bezoekduur, meest bezochte medewerkers)

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `visits`, `visitors`
- Authenticatie (Laravel Breeze of de starter kit van de docent)
- Autorisatie via rollen: receptionist / medewerker / admin
- E-mailnotificatie aan de ontvanger bij inchecken van hun bezoeker
- Realtime "aanwezig in pand"-overzicht (filter op `checked_out_at IS NULL`)
- **Nice to have**: Laravel Authorization met Policies (receptionist mag alle bezoekers beheren, medewerker alleen zijn eigen)

### Aan de slag

- **Bespreek samen**: Sla je bezoekers op als aparte entiteit (`visitors`-tabel) of registreer je bezoekgegevens direct in de `visits`-tabel? Wat zijn de voor- en nadelen?
- **Maak een ERD**: Een bezoek (`visit`) heeft een bezoeker, een ontvanger (medewerker/user) en tijdstempels. Welke extra velden heb je nodig?
- **Verdeel het werk**: Wie bouwt het inchecken/uitchecken, wie de medewerkers-notificaties, wie het beheerdashboard?

### GitHub

Maak een nieuwe repository aan. Zorg dat alle teamleden toegang hebben. Werk met feature branches — één branch per user story of feature.

### Bonusfunctionaliteit

- Bezoeker kan vooraf een digitale bezoekersbadge (PDF) ontvangen per e-mail
- Automatisch uitchecken na middernacht (voor bezoekers die vergeten zijn uit te checken)
- Exporteer noodlijst als PDF of CSV
- Bezoekersstatistieken-dashboard met grafieken
