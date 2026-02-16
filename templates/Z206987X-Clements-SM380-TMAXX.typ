#import "@local/ou-tma:0.1.0": ou-tma, question, subquestion, subsubquestion

#show: ou-tma.with(
  student: "Geoff Clements",
  email: "geoffrey.clements@ou.ac.uk",
  identifier: "Z206987X",
  course: "SM380",
  coursetitle: "Quantum physics: fundamentals and applications",
  tma: 1,
  tmapart: "",
)

#set text(font: "Liberation Sans", lang: "en", region: "GB")
#set par(justify: true)
#show table.cell.where(y: 0): set text(weight: "bold")
#set table(stroke: (_, y) => if y == 0 { (top: 1pt, bottom: 1pt) } else { none })

#question()

