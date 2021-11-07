function onValueChanged(key)
	  scroll_index = 1
	
	  major = root.children.types.children.maj.values.x
	  minor = root.children.types.children.min.values.x
	  seventh = root.children.types.children.seven.values.x
	  
	  E  = root.children.E.children.note_e.values.x
	  A  = root.children.A.children.note_a.values.x
	  D  = root.children.D.children.note_d.values.x
	  G  = root.children.G.children.note_g.values.x
	  C  = root.children.C.children.note_c.values.x
	  F  = root.children.F.children.note_f.values.x
	  Bb = root.children.Bb.children.note_bb.values.x
	  Eb = root.children.Eb.children.note_eb.values.x
	  Ab = root.children.Ab.children.note_ab.values.x
	  Db = root.children.Db.children.note_db.values.x
	  Gb = root.children.Gb.children.note_gb.values.x
	  B  = root.children.B.children.note_b.values.x
	  
	  notes = {E, A, D, G, C, F, Bb, Eb, Ab, Db, Gb, B}
	  chords_offsets = {
	  {0, 4, 7, 12, 16, 19, 24, 28, 31, 36, 40, 43}, 
	  {0, 3, 7, 12, 15, 19, 24, 27, 31, 36, 39, 43}, 
	  {0, 4, 7, 11, 12, 16, 19, 23, 24, 28, 31, 35}, 
	  {0, 3, 7, 10, 12, 15, 19, 22, 24, 27, 31, 34}}
		
	  if seventh == 1 then
		if major == 1 then
		  offset = chords_offsets[3][scroll_index] 
		else
		  offset = chords_offsets[4][scroll_index] 
		end
	  else
		if major == 1 then
		  offset = chords_offsets[1][scroll_index] 
		else
		  offset = chords_offsets[2][scroll_index] 
		end
	  end
		
	  note_codes = {
	  52 + offset, 
	  57 + offset,
	  50+ offset,
	  55 + offset,
	  48 + offset,
	  53 + offset,
	  46 + offset,
	  51 + offset,
	  44 + offset,
	  49 + offset,
	  42 + offset,
	  47 + offset
	  }
	  note_code = nil
	  
	  for i, note in ipairs(notes) do
		if note == 1 then
		  note_code = note_codes[i]
		end
	  end
	  
	  if self.values.x == 1 then
		sendMIDI({MIDIMessageType.NOTE_ON, note_code, 127})
		sendMIDI({MIDIMessageType.NOTE_OFF, note_code, 0})
	  end
	end