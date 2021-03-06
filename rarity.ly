\version "2.18.2"

\include "articulate.ly"
\include "shared.ily"

#(set-global-staff-size 21)

\header {
    title = "The worst possible thing"
    copyright = "© 2019"
    }

A = {
    \set Staff.midiInstrument = #"acoustic grand"
    \tempo 4 = 120
    \key c \major

    \time 3/4

    \relative c'' {
        \partial 4
        \times 2/3 { gs8( f b }
        | c8.) <cs g e>16-> q4-> q-> ~
        | q r

        \times 2/3 { gs8 f b }
        | c8. cs16 cs4 cs
        | cs8. d16 d4 d
        | d8. ds16 ds4 ds ~
        | ds gs fs
        | fs8. e16 e4 e ~

        \time 4/4
        | e ds( d)
        }

    \relative c'' {
        \times 2/3 { gs8 f b }
        \time 3/4
        | c8. cs16 cs4 cs
        | cs8. d16 d4 d
        | d8. ds16 ds4 ds ~
        | ds b' as

        | as8. gs16 gs4 gs ~
        | gs gs fss
        | fss8. es16 es4 es ~
        | es es ds
        }

    \relative c'' {
        | R2.
        | ef
        | f4 bf, c
        | d ef f
        | gf2.
        | af

        | g2.
        | a
        | b4 e, fs
        | gs a b
        | c2.
        | d

        | cs2. ~
        | cs ~
        | cs

        | R2.*3
        }

    \relative c'' {
        | r2 cs4 ~
        | cs cs ds
        | es fs gs
        | as b cs
        | d2. ~
        \time 2/4
        | d4 d ~
        \time 3/4
        | d cs b
        | a gs fs
        | \times 2/3 { fs8 c cs } \times 2/3 { d ds d } \times 2/3 { ds e ds }
        | \times 2/3 { e es e } \times 2/3 { es fs es } \times 2/3 { as g8. fs16 }
        | fs2. ~
        \time 2/4
        | fs4 fs ~
        \time 3/4
        | fs fs gs
        | as b cs
        | ds e fs
        | g gs as
        | b2. ~
        \time 2/4
        | b4 b ~
        \time 3/4
        | b as gs
        | g fs e
        | R4*3-"TODO"
        | R4*3
        | r2 \times 2/3 { <ds, ds'>8 <cs cs'> <b b'> }
        \time 5/4
        | <b b'>2.
        }

    \relative c'' {
        b2 ~
        | b4 a af g gf
        | f2. d'2 ~
        | d4 c b bf a
        | af2. f'2 ~
        \time 4/4
        | f4 e ef d
        }

    \relative c' {
        | \times 2/3 { <e g cs>8 <f af d> q } \times 2/3 { q <fs a ef'> q }
        q8[ <g bf e>] q r
        | \times 2/3 { <g bf e>8 <gs b f'> q } \times 2/3 { q <a c gf'> q }
        q8[ <as cs g'>] q r
        \time 2/4
        | \times 2/3 { q8 <b d gs> q } \times 2/3 { q <b d a'> q }
        \time 5/4
        | r4 <f' f'> q <e e'> q
        }

    \relative c'' {
        \time 3/4
        | e8. d16 d4 d ~
        | d d cs
        | cs8. b16 b4 b ~
        | b b as
        }

    \bar "|."
    }

B = {
    \clef bass
    \set Staff.midiInstrument = #"acoustic grand"
    \key c \major

    \relative c {
        r4
        | r8. <bf e g>16 q4 q ~
        | q r2

        | gs4 <e'' g> q
        | cs,, <ds'' fs> q
        | fs,, <gs' b f'> q
        | b,, <a'' b ds> <a b a'>

        | e, <b'' e> <b e gs>
        | f, <c'' f a> r
        }

    \relative c {
        r
        | fs, <as' cs e?> q
        | cs,, <as'' d? e> q
        | gs, <gs' as ds> q
        | ds, <fss' cs' ds> <cs' ds b'>

        | <gs,, gs'> <b'' ds gs> q
        | <b,, b'> <b'' ds gs> <b ds gss>
        | <cs,, cs'> <cs'' es gs> q
        | fss, <cs' ds fss> r
        }

    \relative c' {
        % write out repeat by hand to avoid duplicating the accidental
        | <af b? d>8. q16 q4 q
        | <af b d>8. q16 q4 q
        \repeat unfold 2 { | <af bf d>8. q16 q4 q }
        \repeat unfold 2 { | <a c ef>8. q16 q4 q }
        \repeat unfold 2 { | <bf df ff>8. q16 q4 q }
        \repeat unfold 2 { | <b d e>8. q16 q4 q }
        \repeat unfold 2 { | <bs ds fs>8. q16 q4 q }
        \repeat unfold 3 { | <as cs fs>8. q16 q4 q }

        | cs,,8. <b'' cs fs>16 q4 q
        | r <b cs> q
        | r q r
        | q r q
        }

    \relative c' {
        | cs,, <b'' cs> r
        | q r q
        | r q r
        | r b,, <b'' d>
        | r <a b d>
        | e, <gs' b d> r
        | q r q
        | r ef, q d q cs
        | r fs <as' cs>
        | r q
        | e, <gs' as cs> r
        | q r q
        | r <g as cs> r
        | e, q ds
        | r gs, <gs'' b>
        | r <gs b fs'>
        | cs,, <b'' cs es> r
        | <as cs e> r q
        | r <cs,, cs'> <as'' cs e g>
        | <cs,, cs'> <as'' cs e g> <cs,, cs'>
        | <gs'' cs e gs> <fs,, fs'> <as'' cs e as>
        | r <b,, b'> <b'' ds fs>
        }

    \relative c {
        r4 b,
        | c <c'' ef> r q cs,,
        | d <b'' d> <c ef> <cs e> <d f>
        | ef,, <ef'' gf> r q e,,
        | f <d'' f> <ds fs> <e g> <f af>
        | fs,, <cs'' g' bf> r2
        |
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
