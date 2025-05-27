# Twittr – Mini Twitter Clone Rails App

## Funkciók

- **Regisztráció & Bejelentkezés:**  
  Felhasználók popup ablakban regisztrálhatnak és jelentkezhetnek be.  
  Csak bejelentkezett felhasználók tweetelhetnek és like-olhatnak.

- **Tweetelés:**  
  Bejelentkezés után új tweetet lehet írni, amelyek azonnal megjelennek a főoldalon.

- **Like rendszer:**  
  Minden tweet like-olható és unlike-olható. Egy felhasználó egy tweetet csak egyszer like-olhat.

- **Modern, letisztult UI:**  
  Tailwind CSS alapú, világos, Twitter-szerű design.  
  A fejléc minden oldalon látható, benne a bejelentkezés/regisztráció vagy a felhasználónév és kijelentkezés.

## Technológia

- Ruby on Rails 7
- Tailwind CSS (CDN)
- SQLite (fejlesztéshez)
- Modellek: User, Tweet, Like

## Telepítés & Indítás

1. **Függőségek telepítése:**

   ```
   bundle install
   ```

2. **Adatbázis migrációk futtatása:**

   ```
   bin/rails db:migrate
   ```

3. **Szerver indítása:**

   ```
   bin/rails server
   ```

4. **Első felhasználó létrehozása (ha szükséges):**
   ```
   bin/rails console
   User.create(username: "admin", password: "jelszo")
   ```

## Fő fájlok

- `app/models/user.rb`, `tweet.rb`, `like.rb` – modellek
- `app/controllers/` – vezérlők (auth, tweet, like)
- `app/views/home/index.html.erb` – főoldal, tweet lista
- `app/views/home/_header.html.erb` – fejléc
- `app/views/sessions/_login_form.html.erb`, `_register_form.html.erb` – popup űrlapok
- `app/views/layouts/application.html.erb` – layout, modális popupokkal

## Stílus

- Színek: világos háttér (`bg-gray-100`), fehér dobozok, Twitter-kék gombok, letisztult szövegek.
- Minden komponens Tailwind utility class-okat használ.

## Funkciók bővítése

- Új funkciók (pl. kommentek, profiloldal) könnyen hozzáadhatók a meglévő struktúrához.
