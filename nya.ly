\version "2.22.2"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 25)

\header {
    title = "nya"
    copyright = "© 2022"
}

vocals = <<
    \relative c'' {
        \clef treble
        \key f \major
        \set Staff.instrumentName = #"Voice"
        \set Staff.midiInstrument = #"oboe"
        \tempo 2 = 50

        \time 2/2

        \repeat unfold 2 {
            | c4 e c a
            | f4 a c2
            | c4 e c a
            | f2 f
        }

        \bar "|."
    }

    \addlyrics {
        nya nya nya nya
        nya nya nya
        nya nya nya nya
        nya nya

        nya nya nya nya
        nya nya nya
        nya nya nya nya
        nya nya
    }
>>

right_hand = \relative c'' {
    \key f \major
    \set Staff.midiInstrument = #"acoustic grand"

    | r2 a4( c
    | a4 f d f)
    | r4 <c e f a> r <a cs e f>
    | r2 <a c d f>

    | r2 a'4( c
    | a4 fs d fs)
    | r4 <bf, d f c'> r <bf c e a>
    | r2 <a c d f>
}

left_hand = \relative c, {
    \clef bass
    \key f \major
    \set Staff.midiInstrument = #"acoustic grand"

    | R1
    | d4( d' a' c)
    | f,,2 a
    <<
        {
            | r4 d2.
        }
    \\
        {
            | d,1
        }
    >>

    | R1
    | d4( d' a' c)
    | g,2 c
    <<
        {
            | r4 f2.
        }
    \\
        {
            | f,1
        }
    >>
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