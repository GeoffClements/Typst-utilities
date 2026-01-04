#let ou-tma(
  student: "Your Name",
  email: "you@example.com",
  identifier: "B1234567",
  course: "S282",
  coursetitle: "Astronomy",
  tma: 1,
  tmapart: "",
  body,
) = {
  let mailto = "mailto:" + email
  let studentinfo = link(mailto)[#student (#identifier)]

  set page(
    margin: 1in,
    footer: align(center)[#context [#counter(page).display()]],
    header: context {
      if counter(page).get().first() > 1 {
        grid(
          columns: (1fr, 1fr),
          align(left + bottom)[#studentinfo], align(right + bottom)[#context document.title],
        )
        line(length: 100%, stroke: 0.5pt)
      }
    },
  )
  set text(font: "Liberation Sans")

  let leading_zero(val) = {
    if val < 10 {
      "0" + str(val)
    } else {
      val
    }
  }

  let day_suffix(thedate) = {
    let day = thedate.day()
    if day in (11, 12, 13) {
      "th"
    } else if calc.rem(day, 10) == 1 {
      "st"
    } else if calc.rem(day, 10) == 2 {
      "nd"
    } else if calc.rem(day, 10) == 3 {
      "rd"
    } else {
      "th"
    }
  }

  set document(
    title: [#course -- #coursetitle -- #box[TMA #leading_zero(tma)]
      #if tmapart != "" [ #box[-- Part #tmapart]]],
    author: student,
    description: "TMA submission for " + course + " - " + coursetitle,
  )

  align(center)[
    #title()
    #set text(size: 14pt)
    #student (#identifier)\
    #link(mailto)[#email]\
    #let today = datetime.today()
    #today.display("[day padding:none]" + day_suffix(today) + " [month repr:long] [year]")
  ]

  body
}

// Base count for questions, used to determine if first header should
// go on page 1
#let _q_cnt = counter("_q_cnt")

// Header counters to display question and subquestion numbers
#let q_cnt = counter("q_cnt")
#let sub_q_cnt = counter("sub_q_cnt")
#let sub_sub_q_cnt = counter("sub_sub_q_cnt")

#let question(from: none) = {
  if from == none {
    q_cnt.step()
  } else {
    q_cnt.update(from)
  }

  _q_cnt.step()
  sub_q_cnt.update(0)
  sub_sub_q_cnt.update(0)

  context {
    if _q_cnt.get().first() > 1 {
      pagebreak(weak: true)
    }
    [= Question #q_cnt.display()]
  }
}

#let subquestion() = {
  sub_q_cnt.step()
  sub_sub_q_cnt.update(0)

  context {
    [== #sub_q_cnt.display("a")]
  }
}

#let subsubquestion() = {
  sub_sub_q_cnt.step()

  context {
    [=== #sub_sub_q_cnt.display("i")]
  }
}
