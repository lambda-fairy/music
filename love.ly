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
            | c4.\fermata f,8 e4 d
            | c1
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
        for ev’ -- ry -- one.
    }
>>

right_hand = \relative c' {
    \set Staff.midiInstrument = #"acoustic grand"
    r4
    | <b f' g>2-- r4
    | <b f' g>2-- << { a'8( b) } \\ <c, f>4 >>
    | r4\fermata r8 <a f'>( <g e'>4)-. <f d'>-.
    | <e c'>1--
}

left_hand = \relative c {
    \clef bass
    \set Staff.midiInstrument = #"acoustic grand"
    r4
    | r4 g2--
    | r4 g8( f e d)
    | r4\fermata f( g)-. g,-.
    | << c1 \\ { r4 c,2.-- } >>
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