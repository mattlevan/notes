::  A note, defined in /sur/notes
::
::::  /===/mar/notes/note/hoon
  ::
/-  notes-note
!:
|_  note=notes-note
++  grab
  |%
  +=  noun  notes-note
  ++  json
    |=  jon=^json
    ^-  notes-note
    %-  need
    %.  jon
    =>  dejs-soft:format
    (ot tim+di aut+(su fed:ag) tit+so bod+(cu to-wain:format so) ~)
  --
::
++  grow
  |%
  ++  json
    %-  pairs:enjs:format
      :~  [%tim (time:enjs:format tim.note)]
          [%aut (ship:enjs:format aut.note)]
          [%tit (tape:enjs:format tit.note)]
          [%bod (wall:enjs:format bod.note)]
      ==
  --
--
