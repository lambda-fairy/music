\version "2.22.2"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 28)

\header {
    title = "jeanie"
    copyright = "© 2022"
}

right_hand = {
    \set Staff.midiInstrument = #"acoustic grand"
    \tempo 4 = 72
    \time 4/4
    \key e \major

    <<
        \relative e' {
            \partial 4 cs'4(
            | b4. gs8 a gs fs e
            | gs4 b,8 cs e2)

            | e4( fs8 gs e'4\arpeggio cs
            | b8 cs e,8. gs16 fs4.)

            cs'8(
            | b4. gs8 a gs fs e
            | gs4 b,8 cs e2)

            | fs8( as b cs ds e gs,8. cs16
            | b4 as b2)
        }
    \\
        \relative e' {
            \partial 4 s4
            | s2 cs4-- ds--
            | s4 gs, ~ gs r

            | s2 <e' b'>
            | e4 e e ds

            | s2 <b cs>4-- <b ds>--
            | s4 gs ~ gs r

            | <b e>4 q q <b ds>
            | <b e>2 <b ds>
        }
    >>

    \relative e' {
        | fs8( gs fs e fs4 gs8. fs16
        | e8 ds e gs b2)

        | cs8( b cs e b4)
        <<
            {
                \slurDown gs8( fs
                | <g, b e>4 <g b cs> \stemDown <e fs b>4.) \slurUp cs''8(
                | b4. \stemNeutral gs8 a gs fs e
                | gs4 b,8 cs <b e>2)
            }
        \\
            {
                s4
                | s2 \stemUp \slurUp <fs' fs'>8( <gs gs'> <a a'> <cs cs'>
                | <b b'>4.)
                s8
                \stemDown \slurDown <b, cs e>4-- <b ds>--
                | <gs b e>1
            }
        >>
    }

    <<
        \relative e' {
            | fs8 gs e'8.\arpeggio cs16 b8. cs16 e,8 fs
            | gs2 gs4 fs
        }
    \\
        \relative e' {
            | <b e>4 <b e b'>\arpeggio <b e> <b e>8 <c fs>
            | <b e>2 <b ds>
        }
    >>

    \relative e' {
        | <b e gs>1\fermata\arpeggio
    }

    \bar "|."
}

left_hand = \relative e {
    \clef bass
    \set Staff.midiInstrument = #"acoustic grand"
    \key e \major

    \partial 4 r4
    | \slurDown e8( b' \change Staff = "R" e gs)
    \slurNeutral \change Staff = "L" a,,4-- b--
    | e,8( b' e4 ~ e ds)
    | \slurDown cs8( gs' \change Staff = "R" \voiceTwo b4)
    \slurNeutral \change Staff = "L" \oneVoice <a, b'>2\arpeggio
    | << { b'4 b b2 } \\ { gs,4 cs a b } >>

    | \stemDown \slurDown gs8( b' \change Staff = "R" e gs)
    \stemNeutral \slurNeutral \change Staff = "L" a,,4-- b--
    | e,8( b' e4 ~ e b)
    | as4 fs b e,
    | fs4. fs'8 b,2

    | r8 <b' e>8-. q-. q-. r8 <b ds>-. q-. q-.
    | r8 b-. <b ds>-. <b ds e>-.
    <<
        {
            r8 <b e>-- r q--
            | r8 <b cs e>-. q-. q-. r8 <g b ds>( <b e>4)
        }
    \\
        {
            fs,4-- gs--
            | a2 gs!4 cs
        }
    >>
    | c4 <a, a'> <fs fs'> <b b'>

    | \slurDown gs16( gs' e' gs b8 \change Staff = "R" e)
    \change Staff = "L" \slurNeutral <a,,, a'>4-- <b b'>--
    | <cs cs'>1

    | a'4 fs\arpeggio gs <cs gs'>
    | b2 b,
    | <e, e' b' e gs>1\arpeggio\fermata
}

stuff = 
    \new PianoStaff <<
        #(set-accidental-style 'piano)
        \set PianoStaff.connectArpeggios = ##t
        \new Staff = "R" \right_hand
        \new Staff = "L" \left_hand
    >>

\score {
    \stuff
    \layout {}
}

\score {
    \articulate \stuff
    \midi {}
}
