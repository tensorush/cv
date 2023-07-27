#import "template.typ": *
#show: layout

#let lang = "en"

#cvHeader(hasPhoto: true, align: left, lang)
#autoImport("experience", lang)
#autoImport("education", lang)
#autoImport("projects", lang)
#autoImport("skills", lang)
