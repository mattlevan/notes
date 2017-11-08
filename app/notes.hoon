::  Take notes in Urbit
::
::::  /===/app/notes/hoon
  ::
/-  notes-note, notes-send
[. notes-note notes-send]
::
!:
|%
++  move  {bone card}
++  card  $%  {$poke path dock poke-contents}
              {$diff diff-contents}
          ==
++  poke-contents  $%  {$notes-note notes-note}
                   ==
++  diff-contents  $%  {$json json}
                   ==
--
::
|_  $:  bow/bowl:gall
        sen/(list notes-note)                         ::<  sent messages
        rec/(list notes-note)                         ::<  received messages
    ==
::
++  prep  _`.
::
++  peer
  |=  pax/path
  ^-  {(list move) _+>.$}
  =/  ordered-notes/(list notes-note)
    %+  sort
      rec
    |=  {a/notes-note b/notes-note}
    (gth tim.a tim.b)
  :_  +>.$
  :_  ~
  :^  ost.bow  %diff  %json
  (inbox-to-json ordered-notes)
::
++  inbox-to-json
  |=  box/(list notes-note)
  ^-  json
  :-  %a
  %+  turn  box
  |=  a/notes-note
  %-  pairs:enjs:format
  :~  tim+(time:enjs:format tim.a)
      aut+s+(scot %p aut.a)
      tit+s+tit.a
      bod+s+(of-wain:format bod.a)
  ==
::++  poke-notes-send
::  |=  sen/notes-send                                     ::<  to, subject, body
::  ^-  {(list move) _+>.$}
::  =/  out/notes-note
::    [now.bow our.bow to.sen sub.sen bod.sen]
::  =.  ^sen
::    [out ^sen]
::  ~&  mail+sending+'Sending message!'
::  :_  +>.$
::  :~  :*  ost.bow
::          %poke
::          /
::          [[to.out %mail] %notes-note out]
::      ==
::  ==
::++  poke-notes-note
::  |=  mes/notes-note
::  ?>  =(to.mes our.bow)
::  ~&  mail+received+'New message!'
::  ~&  mail+time+tim.mes
::  ~&  mail+from+fom.mes
::  ~&  mail+to+to.mes
::  ~&  mail+sub+sub.mes
::  ~&  mail+bod+bod.mes
::  =.  rec
::    [mes rec]
::  =/  ord/(list notes-note)                           ::<  ordered messages
::    %+  sort
::      rec
::    |=  {a/notes-note b/notes-note}
::    (gth tim.a tim.b)
::  :_  +>.$
::  %+  turn  (~(tap by sup.bow))
::  |=  {o/bone *}
::  [o %diff %json `json`(inbox-to-json ord)]
:: ::
::++  coup
::  |=  {wir/wire err/(unit tang)}
::  ^-  {(list move) _+>.$}
::  ?~  err
::    ~&  mail+success+'Message sent!'
::    [~ +>.$]
::  ~&  mail+error+'Message failed to send. Error:'
::  ~&  mail+error+err
::  [~ +>.$]
::
--
