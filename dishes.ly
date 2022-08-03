\version "2.22.2"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 30)

\header {
    title = "dishes"
    copyright = "© 2022"
}

vocals = <<
    \relative g' {
        \clef treble
        \key g \major
        \set Staff.instrumentName = #"Voice"
        \set Staff.midiInstrument = #"flute"
        \tempo 2 = 72
        \time 2/2

        | R1
        | r2 r4 fs
        | fs4 g b c
        | d8 c ~ c2 b4
        | b2. b8 b
        | b4^> a8^> g fs4^>

        \bar "|."
    }

    \addlyrics {
        I've got to wash the dish -- es
        by hand
        cuz the dish -- wash -- er broke
    }
>>

right_hand = \relative c' {
    \key g \major
    \set Staff.midiInstrument = #"acoustic grand"

    \repeat unfold 4 { | r <b e fs>-. r q-. }
    | r2 r4 b'8(-- b--
    | b4--) << { a8-> g fs4-> } \\ { <b, e>4-> q-> }>>
}

left_hand = \relative c {
    \clef bass
    \key g \major
    \set Staff.midiInstrument = #"acoustic grand"

    \repeat unfold 3 { | fs,4-. r fs-. r }
    | b-. r b-. r
    | c,8( c' b' c e2)
    | r4 <cs, g'>_> <fs, fs'>_>
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
