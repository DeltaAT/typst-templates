/*
* @author: Elias Pöschl
* @description: Template für Protokolle
*/

#import "@preview/icu-datetime:0.2.1": fmt

#let titlepage(
    title: "Protokoll",
    subtitle: "zu Versuch XY",
    task-title: "Aufgabenstellung",
    task-content: "Das ist die Aufgabenstellung, die hier beschrieben wird.",
    author: "Elias Pöschl",
    class: "3AHITS",
    school-year: "2025/26",
    date: datetime,
    logo-url: "logo.png",
    subject: "ITSI",
    school: "HTBLuVA Salzburg",
    department: "Informationstechnologie: Data Science und Artificial Intelligence",
    teachers: ("Frau Mag. Mustermann", "Herr Mag. Muster")
) = {
    v(2cm)

    align(center)[
        #text(weight: "bold", size: 50pt)[#title]
        #v(-1cm)
        #text(size: 25pt)[#subtitle]
        #line(length: 100%, stroke: 1.5pt)
    ]

    text(weight: "semibold", size: 20pt)[#task-title]
    v(-0.2cm)
    text(size: 16pt)[#task-content]
    v(0.7cm)

    align(center)[
        #text(weight: "bold", size: 14pt)[Verfasser:#linebreak()]
        #text(size: 25pt)[#author]
    ]

    grid(
        columns: 2*(auto,),
        rows: 3*(auto,),
        gutter: 10pt,
        [
            *Klasse:*
        ],
        [
            #class
        ],
        [
            *Schuljahr:*
        ],
        [
            #school-year
        ],
        [
            *Datum:*
        ],
        [
            #fmt(date, locale: "de")
        ]
    )

    align(center)[
        #image(logo-url, width: 8cm)
    ]

    grid(
        columns: 2*(auto,),
        rows: 4*(auto,),
        gutter: 10pt,
        [
            *Fach:*
        ],
        [
            #subject
        ],
        [
            *Schule:*
        ],
        [
            #school
        ],
        [
            *Abteilung:*
        ],
        [
            #department
        ],
        [
            *Lehrer:*
        ],
        [
            #teachers.join(", ")
        ]
    )

    pagebreak()
}


#let template(body,
    author: "Elias Pöschl",
    class-long: "ITSI Protokoll",
    logo-url: "logo.png",
    school-year: "2025/26",

    title: "Protokoll",
    subtitle: "zu Versuch XY",
    task-title: "Aufgabenstellung",
    task-content: "Das ist die Aufgabenstellung, die hier beschrieben wird.",
    class: "3AHITS",
    date: datetime.today().display("[Day padding:None].[month].[year]"),
    subject: "ITSI",
    school: "HTBLuVA Salzburg",
    department: "Informationstechnologie: Data Science und Artificial Intelligence",
    teachers: ("Frau Mag. Mustermann", "Herr Mag. Muster")
) = {
    let htlorange = rgb(255, 108, 76)

    set heading(
        numbering: "1.",
    )
    show heading: set text(fill: htlorange)

    set page(
        paper: "a4",
        margin: (top: 2.95cm, bottom: 2.54cm, left: 1.57cm, right: 1.57cm),
        numbering: "1",
        header: {
            grid(
                columns: 3*(1fr,),
                rows: (7fr, 1fr),
                [
                    #author
                ],
                align(center)[
                    #class-long
                ],
                align(right)[
                    #image(logo-url, width: 3cm)
                ],
                [
                    #line(length: 300%, stroke: 0.5pt)
                ]
            )
        },
        footer: context {
            grid(
                columns: 2*(1fr,),
                [
                    #school-year
                ],
                align(right)[
                    #counter(page).display("1")
                ]
            )
        }
    )

    set document(
        title: title,
        author: author
    )

    set text(
        font: "Arial",
        size: 12pt,
        lang: "de"
    )

    titlepage(
        title: title,
        subtitle: subtitle,
        task-title: task-title,
        task-content: task-content,
        author: author,
        class: class,
        school-year: school-year,
        date: date,
        logo-url: logo-url,
        subject: subject,
        school: school,
        department: department,
        teachers: teachers
    )

    body
}



