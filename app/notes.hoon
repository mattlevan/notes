::  Take notes in Urbit
::
::::  /===/app/notes/hoon
  ::
/-  notes-note
=,  notes-note
::
!:
|%
+=  move  [bone card]
+=  card  $%  [%poke path dock poke-contents]
              [%diff diff-contents]
          ==
+=  poke-contents  $%  [%notes-note notes-note]
                   ==
+=  diff-contents  $%  [%json json]
                   ==
--
::
|_  $:  bow=bowl:gall
        notes=(list notes-note)
    ==
::
++  prep  _`.
::
++  peer
  |=  pax=path
  ^-  [(list move) _+>.$]
  =/  nord=(list notes-note)
    %+  sort
      notes
    |=  [a=notes-note b=notes-note]
    (gth tim.a tim.b)
  :_  +>.$
  :_  ~
  :^  ost.bow  %diff  %json
  (notes-to-json nord)
::
++  notes-to-json
  |=  tome=(list notes-note)
  ^-  json
  :-  %a
  %+  turn  tome
  |=  a=notes-note
  %-  pairs:enjs:format
  :~  tim+(time:enjs:format tim.a)
      aut+s+(scot %p aut.a)
      tit+s+tit.a
      bod+s+(of-wain:format bod.a)
  ==
++  poke-notes-note                                     ::  XX add clay ops
  |=  n=notes-note
  ?>  =(aut.n our.bow)                                  ::  assert we are aut
  ~&  notes+received+'new (or updated) note!'           ::  printfs
  ~&  notes+time+tim.n
  ~&  notes+author+aut.n
  ~&  notes+title+tit.n
  ~&  notes+body+bod.n
  =.  notes                                             ::  update subject
    [n notes]
  =/  nord=(list notes-note)                            
    %+  sort
      notes
    |=  [a=notes-note b=notes-note]
    (gth tim.a tim.b)
  :_  +>.$
  %+  turn  ~(tap by sup.bow)
  |=  [o=bone *]
  [o %diff %json `json`(notes-to-json nord)]
::
++  coup
  |=  [wir=wire err=(unit tang)]
  ^-  [(list move) _+>.$]
  ?~  err
    ~&  notes+success+'note sent!'
    [~ +>.$]
  ~&  notes+error+'note failed to send. error:'
  ~&  notes+error+err
  [~ +>.$]
--
