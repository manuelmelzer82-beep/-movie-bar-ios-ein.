# Movie Bar – Supabase Online-Bestenliste

## Stand
SQL vorbereitet und in GitHub gespeichert. **Noch keine Supabase-Datenbank angelegt oder aktiviert.**
Keine Zugangsdaten oder Schlüssel in GitHub eintragen.

## Einrichtung
1. Auf https://supabase.com/dashboard ein neues Projekt für Movie Bar anlegen.
2. Unter **SQL Editor** den Inhalt von `supabase/10_sekunden_challenge.sql` ausführen.
3. Unter **Project Settings → API** die **Project URL** und den öffentlichen **Publishable/anon Key** notieren.
4. Diese Werte später in der App-/Homepage-Konfiguration hinterlegen; niemals den `service_role`-/Secret-Key in Browser oder iOS-App verwenden.
5. Im Spiel die Supabase REST-Schnittstelle nutzen:
   - Ergebnis speichern: `POST /rest/v1/rpc/movie_challenge_submit`, JSON `{"p_player_name":"Gast","p_elapsed_seconds":10.1234}`.
   - Bestenliste: `GET /rest/v1/movie_challenge_scores?select=player_name,elapsed_seconds,difference_seconds,created_at&order=difference_seconds.asc,created_at.asc&limit=20`.
   - Header: `apikey: <publishable-key>`; für alte anon JWT-Keys zusätzlich `Authorization: Bearer <anon-key>`.
6. Auf zwei verschiedenen Geräten testen, ob neue Ergebnisse auf beiden sichtbar sind.

## Datenschutz / Missbrauchsschutz
- Anzeigenamen sind öffentlich. Keine Klarnamen verlangen.
- Datensparsame Datenschutzhinweise, Aufbewahrungs- und Löschkonzept vor öffentlicher Nutzung ergänzen.
- **Die Zeitmessung erfolgt aktuell im Browser und ist manipulierbar.** Die SQL-Funktion validiert nur Wertebereiche, nicht die Echtheit einer Zeit.
- Für offene öffentliche Teilnahme vor Produktivbetrieb Rate-Limits, CAPTCHA/Turnstile oder Edge Function, Moderation/Löschmöglichkeit und Schutz gegen Massenanfragen ergänzen.
- Die vier Nachkommastellen sind ein Anzeigeformat, keine garantierte Messgenauigkeit.
- Keine echten Preise, bezahlten Versuche oder Jackpot-Entscheidungen auf dieser Bestenliste aufbauen.

## Integration
Die aktuelle HTML-Übungsversion ist noch **nicht** mit Supabase verbunden. Erst nach Einrichtung des Supabase-Projekts kann die gemeinsame Bestenliste live geschaltet werden.
