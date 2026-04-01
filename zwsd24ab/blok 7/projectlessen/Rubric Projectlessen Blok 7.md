# Rubric Projectlessen – Blok 7 (zwsd24ab)

Van toepassing op alle projecten in blok 7.

**Team:** _________________________________ **Project:** _________________________________

**GitHub:** ________________________________________________________________

---

## Beoordelingscriteria

Omcirkel per criterium één score. Stel bij criterium 5 minimaal één vraag aan elke student afzonderlijk.

---

### 1. Database & ERD

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Geen ERD gemaakt. Database structuur ontbreekt of werkt niet. Relaties zijn niet aanwezig of incorrect gedefinieerd in de migrations. |
| **2 – Voldoende** | ERD aanwezig. De verplichte tabellen zijn aangemaakt, maar relaties (foreign keys) kloppen niet volledig of ontbreken op plekken. Migrations zijn uitvoerbaar. |
| **3 – Goed** | ERD klopt en is zichtbaar gemaakt vóór de bouw. Alle verplichte tabellen aanwezig met de juiste kolommen en relaties. Migrations zijn correct en herhaalbaar uitvoerbaar. |

**Score: \_\_\_ / 3**

---

### 2. Laravel Backend (routes, controllers, Eloquent)

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Routes zijn nauwelijks aangemaakt. Controllers bevatten weinig of geen werkende logica. Eloquent-relaties zijn niet gedefinieerd of worden niet gebruikt. |
| **2 – Voldoende** | CRUD-functionaliteit is deels aanwezig. Routes werken voor de meeste acties. Eloquent wordt gebruikt maar relaties worden niet altijd correct bevraagd. Validatie ontbreekt grotendeels. |
| **3 – Goed** | Volledige CRUD voor de kern van het project werkt. Routes zijn logisch benoemd en gegroepeerd. Eloquent-relaties worden correct gebruikt (bijv. `$user->reservations`). Formuliervalidatie is aanwezig. |

**Score: \_\_\_ / 3**

---

### 3. Authenticatie & Autorisatie (rollen)

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Login werkt niet of is niet geïmplementeerd. Er is geen rolscheiding; iedereen heeft toegang tot alles. |
| **2 – Voldoende** | Inloggen werkt via Breeze of starter kit. Rollen zijn aangemaakt, maar afscherming is inconsistent: beheerdersfuncties zijn deels toegankelijk voor gewone gebruikers. |
| **3 – Goed** | Authenticatie werkt volledig. Rolscheiding is correct doorgevoerd via middleware of policies: gebruikers zien alleen hun eigen data, beheerders hebben extra rechten. |

**Score: \_\_\_ / 3**

---

### 4. Functionele Eisen (demo)

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Minder dan de helft van de functionele eisen werkt tijdens de demo. Basisacties zoals toevoegen of bekijken mislukken. |
| **2 – Voldoende** | De gebruikersfuncties werken grotendeels. De beheerderfuncties zijn beperkt aanwezig of deels broken. Succesmeldingen of foutafhandeling ontbreken op plekken. |
| **3 – Goed** | Alle verplichte functionele eisen voor gebruiker én beheerder zijn werkend gedemonstreerd. Fout- en succesmeldingen zijn zichtbaar. Het systeem gedraagt zich stabiel. |

**Score: \_\_\_ / 3**

---

### 5. Code Begrip & MVC

> Stel aan elke student (individueel) 1–2 vragen. Beoordeeld op basis van het antwoord.

**Voorbeeldvragen:**
- *"Leg uit wat er gebeurt als een gebruiker dit formulier instuurt — waar gaat de data naartoe?"*
- *"Waarom staat deze logica in de controller en niet in de view?"*
- *"Wat doet deze Eloquent-relatie precies?"*
- *"Hoe weet Laravel welke gebruiker welke rol heeft?"*
- *"Waar in de code wordt gecontroleerd of iemand admin is?"*

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Student kan de werking van eigen code niet uitleggen. Antwoorden zijn vaag of onjuist. Begrip van MVC ontbreekt ("de controller is gewoon een bestand"). |
| **2 – Voldoende** | Student begrijpt globaal wat de code doet maar kan de MVC-verdeling niet volledig toelichten. Kan de flow beschrijven maar struikelt bij doorvragen op specifieke keuzes. |
| **3 – Goed** | Student legt de flow van een request duidelijk uit (route → controller → model → view). Begrijpt waarom logica in de controller zit en data in het model. Kan eigen keuzes onderbouwen. |

**Score student 1:** \_\_\_ / 3 &nbsp;&nbsp;&nbsp; **Score student 2:** \_\_\_ / 3

*Gebruik het gemiddelde of de laagste score — kies zelf een vaste aanpak en pas die consistent toe.*

**Score (gemiddeld): \_\_\_ / 3**

---

### 6. GitHub & Samenwerking

| Score | Beschrijving |
|-------|-------------|
| **1 – Onvoldoende** | Slechts één teamlid heeft commits gedaan. Repository is nauwelijks gevuld of commits zijn onbeschrijvend ("update", "fix"). |
| **2 – Voldoende** | Beiden hebben gecommit maar de bijdrage is ongelijk verdeeld. Commits zijn redelijk beschrijvend. Branches zijn nauwelijks of niet gebruikt. |
| **3 – Goed** | Beide teamleden hebben regelmatig en beschrijvend gecommit. Feature-branches zijn aangemaakt en gemerged. Taakverdeling is zichtbaar in de commit-history. |

**Score: \_\_\_ / 3**

---

## Scoreoverzicht

| Criterium | Score |
|-----------|-------|
| 1. Database & ERD | \_\_\_ / 3 |
| 2. Laravel Backend | \_\_\_ / 3 |
| 3. Authenticatie & Autorisatie | \_\_\_ / 3 |
| 4. Functionele Eisen | \_\_\_ / 3 |
| 5. Code Begrip & MVC | \_\_\_ / 3 |
| 6. GitHub & Samenwerking | \_\_\_ / 3 |
| **Totaal** | **\_\_\_ / 18** |

---

## Totaal → Cijfer

| Totaal | Cijfer |
|--------|--------|
| 17–18 | 10 |
| 15–16 | 9 |
| 13–14 | 8 |
| 11–12 | 7 |
| 9–10 | 6 |
| 7–8 | 5,5 |
| < 7 | onvoldoende |

**Cijfer: \_\_\_\_\_\_**

---

**Opmerkingen:**

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

**Handtekening docent:** _________________________ &nbsp;&nbsp; **Datum:** _________________

---

*Rubric blok 7 – zwsd24ab*
