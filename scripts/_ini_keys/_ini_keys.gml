/// @func _ini_keys(fname, sec)
/// @desc Finds all key names in a given section of a given INI file.
/// @param {string} fname - Name of INI file to search.
/// @param {string} sec - Name of INI file section to search.
/// @return {string[]} Array of key names.

function _ini_keys(fname, sec)
{
	// Open INI file as a text file
	var f = file_text_open_read(fname);
	
	// Quit early if the file could not be opened
	if (f < 0)
		return [];
	
	// Initialize key queue
	var q = ds_queue_create();
	
	// Search file line-by-line until reaching the specified section
	var active = false; // whether the search is currently in the correct section
	while (file_text_eof(f) == false)
	{
		var line = file_text_read_string(f); // line of INI file
		var len = string_length(line); // length of string line
		
		// Determine whether the specified section has begun
		if (line == "[" + sec + "]")
		{
			active = true;
			file_text_readln(f);
			continue;
		}
		
		// If within the specified section, record key names
		if (active == true)
		{
			// Skip comments and empty lines
			if ((len < 1) || (string_char_at(line, 1) == ";") || (string_char_at(line, 1) == "#"))
			{
				file_text_readln(f);
				continue;
			}
			
			// Stop after reaching the next section
			if ((string_char_at(line, 1) == "[") && (string_char_at(line, len) == "]"))
			{
				active = false;
				break;
			}
			
			// Copy portion of key name before "=" sign (if present)
			if (string_count(" =", line) > 0)
				ds_queue_enqueue(q, string_copy(line, 1, string_pos("=", line) - 2));
			else if (string_count("=", line) > 0)
				ds_queue_enqueue(q, string_copy(line, 1, string_pos("=", line) - 1));
			else
				ds_queue_enqueue(q, line);
		}
		
		file_text_readln(f);
	}
	file_text_close(f);
	
	// Transfer queue contents into an array
	var keys = array_create(ds_queue_size(q));
	for (var i = 0; i < array_length(keys); i++)
		keys[i] = ds_queue_dequeue(q);
	ds_queue_destroy(q);
	
	// Return key array
	return keys;
}
