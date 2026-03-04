#import "protocol-template.typ": template

#show: body => template(body,
    author: "Elias Pöschl",
    class-long: "ITSI Protokoll",
    logo-url: "logo.png",
    date: datetime.today(offset: 2)
    )
= Test

#datetime.today(offset: 1).display("[Day padding:None].[month].[year]")

#lorem(700)