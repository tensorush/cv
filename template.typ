#import "metadata.typ": *
#import "@preview/fontawesome:0.1.0": *

/* Layout */

#let layout(doc) = {
  set text(
    font: ("Roboto", "Noto Emoji"),
    weight: "regular",
    size: 9pt,
  )
  set align(left)
  set page(
    paper: "a4",
    margin: (
      left: 1.4cm,
      right: 1.4cm,
      top: .8cm,
      bottom: .4cm,
    ),
  )
  doc
}

/* Utility Functions */

#let hSpc() = [
  #h(2pt)
]

#let hBar() = [
  #hSpc() | #hSpc()
]

#let hDot() = [
  #hSpc() · #hSpc()
]

#let autoImport(file, language) = {
  include {"sections_" + language + "/" + file + ".typ"}
}

/* Styles */

#let awesomeColors = (
  skyblue: rgb("#0395DE"),
  red: rgb("#DC3522"),
  nephritis: rgb("#27AE60"),
  concrete: rgb("#95A5A6"),
  darknight: rgb("#131A28"),
)

#let regularColors = (
  lightgray: rgb("#343a40"),
  darkgray: rgb("#212529"),
)

#let accentColor = awesomeColors.at(awesomeColor)

#let headerFont = "Roboto"

#let beforeEntrySkip = 1pt
#let beforeProjectSkip = 4pt
#let beforeSectionSkip = 1pt
#let beforeEntryDescriptionSkip = 1pt

#let headerFirstNameStyle(str) = {text(
  font: headerFont,
  size: 32pt,
  weight: "light",
  fill: regularColors.darkgray,
  str
)}

#let headerLastNameStyle(str) = {text(
  font: headerFont,
  size: 32pt,
  weight: "bold",
  str
)}

#let headerInfoStyle(str) = {text(
  size: 10pt,
  fill: accentColor,
  str
)}

#let headerSummaryStyle(str) = {text(
  size: 10pt,
  weight: "medium",
  style: "italic",
  fill: black,
  str
)}

#let sectionTitleStyle(str, color:black) = {text(
  size: 16pt,
  weight: "bold",
  fill: color,
  str
)}

#let entryA1Style(str) = {text(
  size: 10pt,
  weight: "bold",
  str
)}

#let entryA2Style(str) = {align(right, text(
  weight: "medium",
  fill: accentColor,
  style: "oblique",
  str
))}

#let entryB1Style(str) = {text(
  size: 8pt,
  fill: accentColor,
  weight: "medium",
  smallcaps(str)
)}

#let entryB2Style(str) = {align(right, text(
  size: 8pt,
  weight: "medium",
  fill: gray,
  style: "oblique",
  str
))}

#let projectStyle(str) = {text(
  size: 10pt,
  weight: "bold",
  str
)}

#let entryDescriptionStyle(str) = {text(
  fill: regularColors.lightgray,
  {
    v(beforeEntryDescriptionSkip)
    str
  }
)}

#let skillTypeStyle(str) = {align(right, text(
  size: 10pt,
  weight: "bold",
  str))
}

#let skillInfoStyle(str) = {text(
  str
)}

#let footerStyle(str) = {text(
  size: 8pt,
  fill: rgb("#999999"),
  smallcaps(str)
)}

/* Font Awesome Icons */

#let lua = fa-moon()
#let go = fa-golang()
#let zig = fa-bolt()
#let dbms = fa-database()
#let docker = fa-docker()
#let linux = fa-linux()
#let gh = fa-github()
#let gha = fa-github-alt()

/* Functions */

#let makeHeaderInfo() = {
  let personalInfoIcons = (
    phone: fa-phone(),
    email: fa-envelope(),
    telegram: fa-telegram(),
    linkedin: fa-linkedin(),
    homepage: fa-pager(),
    github: gh,
    extraInfo: "",
  )
  let n = 1
  for (k, v) in personalInfo {
    if v != "" {
      if n != 1 {
        hBar()
      }
      personalInfoIcons.at(k) + h(5pt)
      if k == "email" {
        link("mailto:" + v)[#v]
      } else if k == "telegram" {
        link("https://t.me/" + v)[#v]
      } else if k == "linkedin" {
        link("https://www.linkedin.com/in/" + v)[#v]
      } else if k == "github" {
        link("https://github.com/" + v)[#v]
      } else if k == "homepage" {
        link("https://" + v)[#v]
      } else {
        v
      }
    }
    n = n + 1
  }
}

#let makeHeaderNameSection(language) = table(
  columns: 1fr,
  inset: 0pt,
  stroke: none,
  row-gutter: 6mm,
  [#headerFirstNameStyle(firstName.at(language)) #h(5pt) #headerLastNameStyle(lastName.at(language))],
  [#headerInfoStyle(makeHeaderInfo())],
  if headerSummary.at(language) != "" [
    #headerSummaryStyle(headerSummary.at(language))
  ]
)

#let makeHeaderPhotoSection() = {
  if profilePhoto != "" {
    image(profilePhoto, height: 3.6cm)
  } else {
    v(3.6cm)
  }
}

#let cvHeader(align: left, hasPhoto: true, language) = {
  let makeHeader(leftComp, rightComp, columns, align) = table(
    columns: columns,
    inset: 0pt,
    stroke: none,
    column-gutter: 15pt,
    align: align + horizon,
    {leftComp},
    {rightComp}
  )
  if hasPhoto {
    makeHeader(makeHeaderNameSection(language), makeHeaderPhotoSection(), (auto, 20%), align)
  } else {
    makeHeader(makeHeaderNameSection(language), makeHeaderPhotoSection(), (auto, 0%), align)
  }
}

#let cvSection(title) = {
  let highlightText = title.slice(0)

  v(beforeSectionSkip)
  sectionTitleStyle(highlightText, color: accentColor)
  h(2pt)
  box(width: 1fr, line(stroke: 0.9pt, length: 100%))
}

#let cvEntry(
  title: "Title",
  society: "Society",
  date: "Date",
  location: "Location",
  description: "Description",
  logo: ""
) = {
  let ifLogo(path, ifTrue, ifFalse) = {
    return if varDisplayLogo {
      if path == "" { ifFalse } else { ifTrue }
    } else { ifFalse }
  }
  let setLogoLength(path) = {
    return if path == "" { 0% } else { 4% }
  }
  let setLogoContent(path) = {
    return if logo == "" [] else {image(path, width: 100%)}
  }
  v(beforeEntrySkip)
  table(
    columns: (ifLogo(logo, 4%, 0%), 1fr),
    inset: 0pt,
    stroke: none,
    align: horizon,
    column-gutter: ifLogo(logo, 4pt, 0pt),
    setLogoContent(logo),
    table(
      columns: (1fr, auto),
      inset: 0pt,
      stroke: none,
      row-gutter: 6pt,
      align: auto,
      {if varEntrySocietyFirst {entryA1Style(society)} else {entryA1Style(title)}},
      {entryA2Style(date)},
      {if varEntrySocietyFirst {entryB1Style(title)} else {entryB1Style(society)}},
      {entryB2Style(location)},
    )
  )
  entryDescriptionStyle(description)
}

#let cvProject(
  title: "Title",
  description: "Description",
) = {
  v(beforeProjectSkip)
  table(
      columns: (1fr, auto),
      inset: -3pt,
      stroke: none,
      align: horizon,
      row-gutter: 6pt,
      column-gutter: 0pt,
      {projectStyle(title)},
  )
  entryDescriptionStyle(description)
}

#let cvSkill(
  type: "Type",
  info: "Info",
) = {
  table(
    columns: (16%, 1fr),
    inset: 0pt,
    column-gutter: 10pt,
    stroke: none,
    skillTypeStyle(type),
    skillInfoStyle(info),
  )
}
