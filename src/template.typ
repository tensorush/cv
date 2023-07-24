#import "@preview/fontawesome:0.1.0": *

/*
Personal Information
*/

#let firstName = (
    "en": "Georgii (Jora)",
    "ru": "Георгий (Жора)",
)

#let lastName = (
    "en": "Troosh",
    "ru": "Труш",
)

#let personalInfo = (
  github: "tensorush",
  telegram: "tensorush",
  linkedin: "tensorush",
  email: "tensorush@gmail.com",
)

#let headerSummary = (
  "en": "Open to Go/Rust/Zig Software Engineering positions, especially working on developer tools.",
  "ru": "Готов к разработке на Go/Rust/Zig, особенно над инструментами для разработчиков.",
)

/*
Colors
*/

#let colors = (
  teal: rgb("#008080"),
  iris: rgb("#5D3FD3"),
  amber: rgb("#FFBF00"),
  coral: rgb("#FF7F50"),
  linen: rgb("#E9DCC9"),
  mauve: rgb("#E0B0FF"),
  salmon: rgb("#FA8072"),
  crimson: rgb("#DC143C"),
  amaranth: rgb("#9F2B68"),
  charcoal: rgb("#36454F"),
  cornsilk: rgb("#FFF8DC"),
  platinum: rgb("#E5E4E2"),
  dark_gray: rgb("#A9A9A9"),
  jet_black: rgb("#343434"),
  light_gray: rgb("#D3D3D3"),
  royal_blue: rgb("#4169E1"),
  matte_black: rgb("#28282B"),
  cadmium_orange: rgb("#F28C28"),
  shamrock_green: rgb("#009E60"),
)

/*
Font Awesome Icons
*/

#let lk = fa-link()
#let gh = fa-github()
#let tg = fa-telegram()
#let li = fa-linkedin()
#let em = fa-envelope()

#let go = fa-golang()
#let rust = fa-gear()
#let zig = fa-bolt()
#let dbms = fa-database()
#let docker = fa-docker()
#let linux = fa-linux()
#let github = fa-github-alt()

/*
Layout Settings
*/

#let headerFont = "Roboto"

#let varDisplayLogo = true

#let titleColor = colors.linen

#let dateColor = colors.dark_gray

#let descColor = colors.light_gray

#let pageColor = colors.matte_black

#let accentColor = colors.shamrock_green

#let profilePhoto = "./assets/photo.png"

/*
Layout
*/

#let afterHeaderSkip = -9pt
#let beforeEntrySkip = 1pt
#let beforeSectionSkip = 1pt
#let beforeEntryDescSkip = 1pt

#let layout(doc) = {
  set text(
    font: ("Roboto", "Noto Emoji"),
    weight: "regular",
    size: 9pt,
  )
  set align(left)
  set page(
    paper: "a4",
    fill: pageColor,
    margin: (
      left: .5in,
      right: .5in,
      top: .15in,
      bottom: .15in,
    ),
  )
  doc
}

/*
Utility Functions
*/

#let hSpc() = [
  #h(2pt)
]

#let hBar() = [
  #hSpc() | #hSpc()
]

#let hDot() = [
  #hSpc() · #hSpc()
]

#let autoImport(file, lang) = {
  include {"sections/" + lang + "/" + file + ".typ"}
}

/*
Styles
*/

#let headerFirstNameStyle(str) = {text(
  font: headerFont,
  size: 32pt,
  fill: titleColor,
  weight: "light",
  str
)}

#let headerLastNameStyle(str) = {text(
  font: headerFont,
  size: 32pt,
  fill: titleColor,
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
  fill: descColor,
  str
)}

#let sectionTitleStyle(str, color:titleColor) = {text(
  size: 16pt,
  weight: "bold",
  fill: color,
  str
)}

#let entryTitleStyle(str) = {text(
  size: 10pt,
  fill: titleColor,
  weight: "bold",
  str
)}


#let entryHostStyle(str) = {text(
  size: 8pt,
  fill: accentColor,
  weight: "medium",
  smallcaps(str)
)}

#let entryDateStyle(str) = {align(right, text(
  weight: "medium",
  fill: accentColor,
  style: "oblique",
  str
))}

#let entryModeStyle(str) = {align(right, text(
  size: 8pt,
  weight: "medium",
  fill: dateColor,
  style: "oblique",
  str
))}

#let entryDescStyle(str) = {text(
  fill: descColor,
  {
    v(beforeEntryDescSkip)
    str
  }
)}

#let skillTypeStyle(str) = {align(right, text(
  size: 10pt,
  fill: titleColor,
  weight: "bold",
  str))
}

#let skillInfoStyle(str) = {text(
  fill: descColor,
  str
)}

#let footerStyle(str) = {text(
  size: 8pt,
  fill: rgb("#999999"),
  smallcaps(str)
)}

/*
Functions
*/

#let makeHeaderInfo() = {
  let personalInfoIcons = (
    email: em,
    github: gh,
    telegram: tg,
    linkedin: li,
    homepage: lk,
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
      } else {
        v
      }
    }
    n = n + 1
  }
}

#let makeHeaderNameSection(lang) = table(
  columns: 1fr,
  inset: 0pt,
  stroke: none,
  row-gutter: 6mm,
  [#headerFirstNameStyle(firstName.at(lang)) #h(5pt) #headerLastNameStyle(lastName.at(lang))],
  [#headerInfoStyle(makeHeaderInfo())],
  if headerSummary.at(lang) != "" [
    #headerSummaryStyle(headerSummary.at(lang))
  ]
)

#let makeHeaderPhotoSection() = {
  if profilePhoto != "" {
    image(profilePhoto, height: 1.4in)
  } else {
    v(1.4in)
  }
}

#let cvHeader(align: left, hasPhoto: true, lang) = {
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
    makeHeader(makeHeaderNameSection(lang), makeHeaderPhotoSection(), (auto, 20%), align)
  } else {
    makeHeader(makeHeaderNameSection(lang), makeHeaderPhotoSection(), (auto, 0%), align)
  }
  v(afterHeaderSkip)
}

#let cvSection(title) = {
  let highlightText = title.slice(0)
  v(beforeSectionSkip)
  sectionTitleStyle(highlightText, color: accentColor)
  h(2pt)
  box(width: 1fr, line(stroke: 0.9pt + descColor, length: 100%))
}

#let cvEntry(
  title: "Title",
  host: "Host",
  date: "Date",
  mode: "Mode",
  logo: "",
  desc: "Desc",
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
      {entryTitleStyle(title)},
      {entryDateStyle(date)},
      {entryHostStyle(host)},
      {entryModeStyle(mode)},
    )
  )
  entryDescStyle(desc)
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
