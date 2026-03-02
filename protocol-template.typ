// Protocol-Template (Typst)
// Ziel: Layout ähnlich `Laborprotokoll.tex` (Titelseite, fancy header/footer, orange headings, Verzeichnisse)

// --- Theme / Defaults ---
#let htlorange = rgb(255, 108, 76)

#let _as_image(path, height: 12mm) = {
  // Robust: Wenn kein Pfad gesetzt ist, nichts rendern.
  if path == none { none } else { image(path, height: height) }
}

#let _rule(thickness: 0.2pt) = line(length: 100%, stroke: (paint: black, thickness: thickness))

#let title_page(
  author: str,
  title: str,
  subtitle: str,
  topic: str,
  topic_desc: str,
  year: str,
  grade: str,
  class: str,
  school_year: str,
  date: "",
  course: str,
  school: str,
  department: str,
  teacher: str,
  logo_path: none,
) = {
  // In LaTeX wird oben eine große Lücke gemacht und dann zentriert gesetzt.
  v(20mm)

  align(center)[
    text(size: 28pt, weight: "bold")[#title]
    v(10mm)
    text(size: 18pt, weight: "regular")[#subtitle]
    v(5mm)
  ]

  _rule(thickness: 1pt)
  v(5mm)

  text(size: 14pt, weight: "bold")[#topic]
  v(5mm)
  topic_desc

  // vfill
  v(1fr)

  align(center)[
    text(weight: "bold")[Verfasser:]
    v(2mm)
    text(size: 18pt)[#author]
  ]

  v(10mm)

  // Entspricht dem tabbing-Block (2 Spalten)
  grid(
    columns: (35mm, 1fr),
    row-gutter: 2mm,
    column-gutter: 6mm,
    [*Jahrgang:*], [#grade],
    [*Klasse:*], [#class],
    [*Schuljahr:*], [#school_year],
    [*Datum:*], [#date],
  )

  v(20mm)
  align(center)[
    #_as_image(logo_path, height: 30mm)
  ]

  v(10mm)

  grid(
    columns: (35mm, 1fr),
    row-gutter: 2mm,
    column-gutter: 6mm,
    [*Unterrichtsfach:*], [#course],
    [*Schule:*], [#school],
    [*Abteilungen:*], [#department],
    [*Lehrer:*], [#teacher],
  )

  // Die Titelseite soll wie im LaTeX eine normale Seite sein.
  pagebreak()
}

#let _header(author: str, subject: str, year: str, logo_path: none) = {
  // 3 Spalten: links/mitte/rechts (Logo)
  // Extra Höhe durch padding, damit das Logo nicht geclippt wird.
  block(inset: (top: 2mm, bottom: 2mm))[
    grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 6mm,
      align(left)[#author],
      align(center)[#subject],
      align(right)[#_as_image(logo_path, height: 12mm)],
    )
    v(1.5mm)
    #_rule(thickness: 0.2pt)
  ]
}

#let _footer(year: str) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 6mm,
    align(left)[#year],
    align(right)[#context(counter(page).display("1"))],
  )
}

#let _lists_of_figures_and_tables() = {
  // Typst 0.14 unterstützt `outline(target: ...)` für Abbildungen/Tabellen.
  // Das ist die nächste Entsprechung zu \listoffigures/\listoftables.

  heading(level: 1)[Abbildungsverzeichnis]
  outline(
    target: figure,
    title: none,
  )

  pagebreak()

  heading(level: 1)[Tabellenverzeichnis]
  outline(
    target: table,
    title: none,
  )

  pagebreak()
}

#let protocol(
  author: str,
  subject: str,
  title: str,
  subtitle: str,
  topic: str,
  topic_desc: str,

  year: str,
  grade: str,
  class: str,
  school_year: str,
  date: "",

  course: str,
  school: str,
  department: str,
  teacher: str,

  logo_path: none,
  body: content,
) = {
  // --- Page / Typography ---
  set page(
    paper: "a4",
    // LaTeX geometry: left=2cm,right=2cm,top=3cm,bottom=2.5cm
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 25mm),
    header: _header(author: author, subject: subject, year: year, logo_path: logo_path),
    footer: _footer(year: year),
  )

  // Sans default; nutze eine weit verbreitete Schrift. Falls nicht vorhanden, fällt Typst zurück.
  set text(font: "Helvetica", size: 12pt)

  // Links wie "hidelinks" (nicht bunt/unterstrichen)
  // set link(underline: false)

  // Headings (ähnlich titlesec mit htlorange)
  show heading.where(level: 1): it => {
    set text(fill: htlorange)
    set text(size: 16pt, weight: "bold")
    it
  }
  show heading.where(level: 2): it => {
    set text(fill: htlorange)
    set text(size: 13.5pt, weight: "bold")
    it
  }
  show heading.where(level: 3): it => {
    set text(fill: htlorange)
    set text(size: 12pt, weight: "bold")
    it
  }

  // --- Title page ---
  title_page(
    author: author,
    title: title,
    subtitle: subtitle,
    topic: topic,
    topic_desc: topic_desc,
    year: year,
    grade: grade,
    class: class,
    school_year: school_year,
    date: date,
    course: course,
    school: school,
    department: department,
    teacher: teacher,
    logo_path: logo_path,
  )

  // --- TOC / Lists ---
  outline(title: "Inhaltsverzeichnis")
  pagebreak()

  _lists_of_figures_and_tables()

  // --- Content ---
  body
}
