\version "2.22.1"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 23)

\header {
    title = "Little ditty"
    copyright = "© 2021"
    }

A = {
    \clef treble
    \set Staff.midiInstrument = #"acoustic grand"
    \tempo 2 = 80
    \key e \major

    \time 2/2

    \relative e'' {
        | b'4 b b gs8 e
        | fs8 e fs gs fs4 cs
        | b'4 b b gs8 e
        | fs8 gs fs4 e2
        }

    \relative e'' {
        | b'4 b b gs8 e
        | fs8 e fs gs fs4 cs
        | b'4 b b gs8 e
        | fs8 gs fs4 e2
        }

    \relative e'' {
        | fs4 fs fs fs8 e
        | fs8 e fs gs fs4 cs
        | fs4 cs b2
        | fs'4 cs b2\fermata
        }

    \relative e'' {
        | b'4 b b gs8 e
        | fs8 e fs gs fs4 cs
        | b'4 b b gs8 e
        | fs8 gs fs4 e2\fermata
        }

    \bar "|."
    }

B = {
    \clef treble
    \set Staff.midiInstrument = #"acoustic grand"
    \key e \major

    \relative e' {
        | e2 gs
        | a b
        | e,2 gs
        | a4 b e,2
        }

    \relative e' {
        | e2 gs
        | a b
        | gs2 cs
        | a4 b e,2
        }

    \relative e' {
        | a2 b
        | a b
        | a4 as \parenthesize b b,
        | a'2 b,\fermata
        }

    \relative e' {
        | e2 gs
        | a4 as b b,
        | gs4 bs cs8 ds e gs
        | a4 b e,2\fermata
        }
    }

stuff = <<
    \new PianoStaff <<
        #(set-accidental-style 'piano)
        \new Staff = "A" { \A }
        \new Staff = "B" { \B }
        >>
    >>

\score {
    \stuff
    \layout { }
    }

\score {
    \articulate \stuff
    \midi { }
    }
