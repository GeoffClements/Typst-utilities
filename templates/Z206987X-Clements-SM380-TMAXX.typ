#let student = "Geoff Clements"
#let email = "geoffrey.clements@ou.ac.uk"
#let identifier = "Z206987X"
#let course = "SM380"
#let coursetitle = "Quantum physics: fundamentals and applications"
#let tma = 1
#let tmapart = ""

#import "@local/ou-tma:0.1.0": ou-tma, question, subquestion, subsubquestion

#show: ou-tma.with(
  student: student,
  email: email,
  identifier: identifier,
  course: course,
  coursetitle: coursetitle,
  tma: tma,
  tmapart: tmapart,
)

#set text(font: "Liberation Sans", lang: "en", region: "GB")
#set par(justify: true)
#set table(stroke: none)
#show table.cell.where(y: 0): set text(weight: "bold")

#question()
Answer 1

#subquestion()

#subsubquestion()

#question()

Answer 2
