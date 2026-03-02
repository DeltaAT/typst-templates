# Typst Protocol Template

Dieses Repo enthält eine Typst-Vorlage, die das Layout von `Laborprotokoll.tex` nachbildet:
- Kopfzeile: Autor (links), Fach (zentriert), Logo (rechts) + dünne Trennlinie
- Fußzeile: Schuljahr (links), Seitenzahl (rechts)
- Orange Überschriften (Section/Subsection/Subsubsection-Äquivalent)
- Titelseite wie im LaTeX-Dokument
- Inhaltsverzeichnis + Abbildungs-/Tabellenverzeichnis

## Dateien
- `protocol-template.typ`: Die eigentliche Vorlage (exportiert `protocol(...)`).
- `main.typ`: Beispiel, wie man die Vorlage nutzt.

## Verwenden
1. Logo-Datei ins Projekt legen (z.B. `logo.png`) oder `logo_path` entsprechend setzen.
2. Metadaten im `#show: protocol(...)` in `main.typ` anpassen.
3. Inhalte schreiben oder über `#include "src/..."` einbinden.

## Build
```powershell
cd C:\Projects\typst-templates
typst compile main.typ main.pdf
```

## Hinweise
- `protocol(...)` nimmt `date` als freien Wert. Du kannst z.B. `datetime.today()` übergeben.
- Abbildungs-/Tabellenverzeichnis nutzen `outline(target: figure/table)`. Damit erscheinen nur Elemente mit Caption.

