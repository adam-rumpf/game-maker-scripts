/// @func _ini_sections(fname)
/// @desc Finds all section names in a given INI file.
/// @param {string} fname - Name of INI file to search.
/// @return {string[]} Array of section names.

function _ini_sections(fname)
{
	// Open INI file as a text file
	var f = file_text_open_read(fname);
	
	// Quit early if the file could not be opened
	if (f < 0)
		return [];
	
	// Initialize section queue
	var q = ds_queue_create();
	
	// Search file line-by-line for anything formatted like a section name
	while (file_text_eof(f) == false)
	{
		var line = file_text_read_string(f); // line of INI file
		var len = string_length(line); // length of string line
		
		// Skip comments and lines too short to be sections
		if ((len < 3) || (string_char_at(line, 1) == ";") || (string_char_at(line, 1) == "#"))
		{
			file_text_readln(f);
			continue;
		}
		
		// Look for lines that begin and end with square brackets
		if ((string_char_at(line, 1) == "[") && (string_char_at(line, len) == "]"))
		{
			// Copy string without brackets
			var str = string_replace_all(line, "[", "");
			str = string_replace_all(str, "]", "");
			ds_queue_enqueue(q, str);
		}
		
		file_text_readln(f);
	}
	file_text_close(f);
	
	// Transfer queue contents into an array
	var sections = array_create(ds_queue_size(q));
	for (var i = 0; i < array_length(sections); i++)
		sections[i] = ds_queue_dequeue(q);
	ds_queue_destroy(q);
	
	// Return section array
	return sections;
}
