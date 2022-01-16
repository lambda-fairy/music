\version "2.22.1"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 40)

\header {
    title = "dishes"
    copyright = "© 2022"
    }

stuff = <<
    \relative g' {
        \clef treble
        \key g \major
        \set Staff.midiInstrument = #"flute"
        \tempo 2 = 72
        \time 2/2

        \partial 4
        fs4
        | fs4 g b c
        | d8 c ~ c2 b4
        | b2. b8 b
        | b4 a8 g fs4

        \bar "|."
        }

    \addlyrics {
        I've got to wash the dish -- es
        by hand
        cuz the dish -- wash -- er broke
        }
    >>

\score {
    \stuff
    \layout { }
    }

\score {
    \articulate \stuff
    \midi { }
    }
