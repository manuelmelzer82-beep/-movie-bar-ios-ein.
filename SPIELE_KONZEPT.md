# Movie Bar – Spielebereich (Vorbereitung)

Status: Konzept vorbereitet, noch nicht in die iOS-App eingebaut oder veröffentlicht.

## Navigation
Eigener Menüpunkt „Spiele“ im Movie-Bar-Design. Startbildschirm mit Spielkarten, Regeln und Start-Buttons. Spiele müssen ohne Echtgeld und ohne automatische Gewinnauszahlung nutzbar sein.

## Geplante Spiele
1. Movie Bingo: digitale 3-Reihen-Bingokarte, Zahlenanzeige, Spielregeln. Keine Verbindung zum echten Bingo-Jackpot ohne gesonderte Freigabe.
2. 10-Sekunden-Challenge: Start-/Stopp-Timer, Anzeige der Abweichung von 10,00 Sekunden, lokaler Übungsmodus. Kein automatischer Anspruch auf echte Gewinne.
3. Movie Quiz: Fragen mit vier Antworten, Punkte und Ergebnisanzeige.
4. Glücksrad: rein virtuelles Spiel mit Punkten; keine echten Preise.
5. Dart-Spiel: einfaches virtuelles Dart-Scoring/Trainingsspiel, unabhängig von offiziellen Ligaergebnissen.
6. Movie Memory: Kartenpaare finden, Zeit- und Zugzähler.

## Umsetzung
- Zunächst kostenlose, lokale Spielmodi ohne Nutzerkonto oder Echtgeld.
- Einheitliches Movie-Bar-Design und barrierearme Bedienung auf iPhone.
- Homepage kann später Spielinhalte/Fragen bereitstellen; sichere Datenquelle und Synchronisierung gesondert implementieren.
- Vor Veröffentlichung: Datenschutz, Altersfreigabe und Apple-Richtlinien prüfen, besonders bei Preisen oder Zufallsgewinnen.
- Für neue native App-Navigation/Funktionen ist ein neuer signierter iOS-Build erforderlich.

## Nächste technische Schritte
1. SwiftUI-Spieleübersicht und lokale Spielansichten implementieren.
2. App auf iPhone-Simulator testen.
3. Build-Nummer erhöhen und TestFlight-Build erstellen.
4. Erst nach Funktionstest zur öffentlichen App-Version hinzufügen.
