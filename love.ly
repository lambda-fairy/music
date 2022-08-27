\version "2.22.2"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 36)

\header {
    title = "morning prayer"
    copyright = "© 2022"
}

vocals = <<
    \relative c' {
        \clef treble
        \set Staff.instrumentName = #"Voice"
        \set Staff.midiInstrument = #"oboe"
        \tempo 4 = 72

        \repeat volta 2 {
            \partial 4
            \time 3/4
            a'4
            | g r a
            | g r a8( b)
            \break
            \time 4/4
            | c2.\fermata e,4
            | f8 e d4 c2
        }

        \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
        \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
        \mark \markup {
            \small \italic \right-column {
                "repeat the"
                "next day"
            }
        }
    }

    \addlyrics {
        To -- day
        I’m filled
        with love
        for ev -- e -- ry -- one.
    }
>>

right_hand = \relative c' {
    \set Staff.midiInstrument = #"acoustic grand"
    r4
    | <b f' g>2-- r4
    | <b f' g>2-- << { a'8( b) } \\ <c, f>4 >>
    | r2\fermata r4 <g e'>(
    | <a f'>8)-. <g e'>-. <f d'>4-- <e c'>2--
}

left_hand = \relative c {
    \clef bass
    \set Staff.midiInstrument = #"acoustic grand"
    r4
    | r4 g2--
    | r4 g8( f e d)
    | r2\fermata a'(
    | f4-.) g-. << c,2-- \\ { r4 c,-- } >>
}

stuff = <<
    \vocals
    \new PianoStaff <<
        #(set-accidental-style 'piano)
        \set PianoStaff.instrumentName = #"Piano"
        \set PianoStaff.connectArpeggios = ##t
        \new Staff = "R" \right_hand
        \new Staff = "L" \left_hand
    >>
>>

\score {
    \stuff
    \layout {}
}

\score {
    \articulate \stuff
    \midi {}
}

\paper {
    system-system-spacing = #'((padding . 8))
}