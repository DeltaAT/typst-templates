// Beispiel-Dokument, das das Template in `protocol-template.typ` nutzt.
#import "protocol-template.typ": protocol

#show: protocol(
  author: "Elias Pöschl",
  subject: "Systemtechnik – Windows Server",
  title: "Laborprotokoll",
  subtitle: "Betriebssystemtechnik",
  topic: "Windows Server",
  topic_desc: "Aufsetzen und Konfigurieren eines Windows Servers 2025",

  year: "2025/26",
  grade: "3. Jahrgang",
  class: "3AHITS",
  school_year: "2025/26",
  date: "02.03.2026",

  course: "Systemtechnik",
  school: "HTBLuVA Salzburg",
  department: "Informationstechnologie",
  teacher: "Maxim Benjamin, Prof. Ing. Dipl.-Ing. BSc.",

  // Passe das an deine echte Datei an, z.B. "logo.png" / "logo.jpg".
  logo_path: "logo.png",
  body: {
    // Inhalt (entspricht den \input{src/...} in LaTeX)
    heading(level: 1)[Schutzmaßnahmen]
    // #include "src/schutzmaßnahmen.typ"

    heading(level: 1)[Serverinstallation]
    // #include "src/serverinstallation.typ"

    heading(level: 1)[Arbeitsauftrag: Rollen und Features]
    // #include "src/arbeitsauftrag-rollen-features.typ"

    heading(level: 1)[Arbeitsauftrag: IT-Infrastruktur in einem fiktiven Unternehmen]
    // #include "src/arbeitsauftrag-it-infrastruktur.typ"

    heading(level: 1)[Arbeitsauftrag: Benutzerverwaltung, Serverdienste und Dateizugriff]
    // #include "src/arbeitsauftrag-benutzerverwaltung.typ"

    heading(level: 1)[Arbeitsauftrag: Sicherheit, Dokumentation und Troubleshooting]
    // #include "src/arbeitsauftrag-sicherheit.typ"

    heading(level: 1)[Reflektion]
    // #include "src/reflektion.typ"
  }
)
