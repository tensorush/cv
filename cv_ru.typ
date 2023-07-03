#import "template.typ": *
#show: layout

// Value must match sections folder suffix, i.e "en" -> "./sections_en"
#let language = "ru"

#cvHeader(hasPhoto: true, align: left, language)
  #autoImport("experience", language)
  #autoImport("education", language)
  #autoImport("projects", language)
  #autoImport("skills", language)
