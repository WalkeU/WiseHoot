# WiseHoot - Oszd meg bölcsességed

A WiseHoot egy Twitter által inspirált közösségi platform, ahol a felhasználók rövid bölcsességeket oszthatnak meg a közösséggel. Ruby on Rails-szel készült és Tailwind CSS-sel formázott, modern, reszponzív felületet biztosít gondolatok megosztására és másokkal való kapcsolódásra.

## Funkciók

### Felhasználói hitelesítés

- **Modal-alapú Bejelentkezés/Regisztráció**: Letisztult felugró űrlapok a felhasználói hitelesítéshez
- **Ellenőrzés**: A regisztrációhoz jelszó megerősítés szükséges és helyes email
- **Fiókkezelés**: A felhasználók kezelhetik és törölhetik fiókjaikat

### Tartalom megosztás

- **Bölcsesség bejegyzések**: Ossz meg gondolatokat maximum 280 karakterben
- **Karakterszámláló**: Valós idejű karakterszámlálás színjelzésekkel
- **Formázás**: Hosszú szavak és szövegformázás automatikus kezelése

### Közösségi interakció

- **Kedvelés rendszer**: A felhasználók kedvelhetik/visszavonhatják a bejegyzések kedvelését
- **AJAX interakciók**: Kedvelés/visszavonás oldal újratöltése nélkül
- **Időbélyeg megjelenítés**: Látható, hogy mennyi ideje lett megosztva a bölcsesség

### Felhasználói élmény

- **Reszponzív dizájn**: Működik asztali és mobil eszközökön
- **Intuitív navigáció**: Letisztult fejléc felhasználói vezérlőkkel
- **Hibakezelés**: Egyértelmű hibaüzenetek ellenőrzési problémák esetén

### Admin képességek

- **Tartalom moderálás**: Az admin felhasználók törölhetnek bármilyen bejegyzést
- **Különleges jogosultságok**: Csak adminoknak elérhető funkciók és vezérlők

## Technológiai stack

- **Backend**: Ruby on Rails 8.0.2
- **Frontend**:
  - Tailwind CSS (CDN-en keresztül)
  - JavaScript az interaktív elemekhez
  - Turbo az AJAX-szerű funkcionalitáshoz
- **Adatbázis**: SQLite fejlesztéshez (könnyen átállítható PostgreSQL-re éles környezetben)
- **Modellek**: User (felhasználó), Tweet (bölcsesség bejegyzések), Like (kedvelés)
- **Ruby verzió**: 3.4.4

## Telepítés

1. **Klónozd a repository-t**

   ```
   git clone https://github.com/WalkeU/WiseHoot
   cd wisehoot
   ```

2. **Telepítsd a függőségeket**

   ```
   bundle install
   ```

3. **Állítsd be az adatbázist**

   ```
   bin/rails db:create
   bin/rails db:migrate
   ```

4. **Indítsd el a szervert**

   ```
   bin/rails server
   ```

5. **Hozzáférés az alkalmazáshoz**
   Látogasd meg a `http://localhost:3000` címet a böngésződben

## Admin felhasználó létrehozása

Admin felhasználó létrehozása moderálási jogosultságokkal:

```ruby
# A Rails konzolban (bin/rails console)
User.create(username: "admin", email: "admin@example.com", password: "your_password", password_confirmation: "your_password")
```

Az alkalmazás felismeri az "admin" felhasználónevű felhasználókat, és különleges jogosultságokat biztosít számukra.

## Projekt struktúra

### Kulcsfájlok

- **Modellek**

  - `app/models/user.rb` - Felhasználói hitelesítés és asszociációk
  - `app/models/tweet.rb` - Bölcsesség bejegyzések logikája
  - `app/models/like.rb` - Kedvelési funkcionalitás

- **Kontrollerek**

  - `app/controllers/home_controller.rb` - Főoldal renderelés
  - `app/controllers/sessions_controller.rb` - Hitelesítés
  - `app/controllers/tweets_controller.rb` - Bejegyzés létrehozás/törlés
  - `app/controllers/likes_controller.rb` - Kedvelési funkcionalitás
  - `app/controllers/settings_controller.rb` - Felhasználói beállítások

- **Nézetek**
  - `app/views/layouts/application.html.erb` - Fő elrendezés modálokkal
  - `app/views/home/index.html.erb` - Kezdőlap bejegyzés űrlappal és hírfolyammal
  - `app/views/home/_header.html.erb` - Navigációs fejléc
  - `app/views/sessions/_login_form.html.erb` - Bejelentkezési űrlap
  - `app/views/sessions/_register_form.html.erb` - Regisztrációs űrlap
  - `app/views/settings/index.html.erb` - Felhasználói beállítások oldal

### Adatbázis séma

**users (felhasználók)**

- username: szöveg, egyedi
- email: szöveg, egyedi
- password_digest: szöveg
- timestamps: létrehozás/módosítás ideje

**tweets (bölcsesség bejegyzések)**

- content: szöveg
- user_id: külső kulcs
- timestamps: létrehozás/módosítás ideje

**likes (kedvelések)**

- user_id: külső kulcs
- tweet_id: külső kulcs
- timestamps: létrehozás/módosítás ideje
- egyedi index: (user_id, tweet_id) páron

## Testreszabás

### Stílus

Az alkalmazás Tailwind CSS-t használ a stílusokhoz. A fő színséma tartalmaz:

- Kék árnyalatokat az elsődleges műveletekhez és a márkajelzéshez
- Fehér/szürke színt a háttérhez és kártyákhoz
- Piros színt a romboló műveletekhez

### Funkciók hozzáadása

A moduláris struktúra megkönnyíti új funkciók hozzáadását:

- **Hozzászólások**: Adj hozzá egy Comment modellt Tweet és User asszociációkkal
- **Felhasználói profilok**: Bővítsd a User modellt és adj hozzá profil nézeteket
- **Értesítések**: Hozz létre egy Notification modellt a felhasználói interakciókhoz

## Közreműködés

1. Fork-old a repository-t
2. Hozz létre egy feature ágat (`git checkout -b feature/amazing-feature`)
3. Commit-old a változtatásokat (`git commit -m 'Add some amazing feature'`)
4. Push-old az ágra (`git push origin feature/amazing-feature`)
5. Nyiss egy Pull Request-et

## Licenc

Ez a projekt az MIT Licenc alatt áll - lásd a LICENSE fájlt a részletekért.

## Köszönetnyilvánítás

- A Twitter letisztult felhasználói felülete és funkcionalitása által inspirálva
- Ruby on Rails-szel készült
- Tailwind CSS-sel formázva
