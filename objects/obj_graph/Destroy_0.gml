/// @desc Destroy associated vertex and edge objects.

for (var i = 0; i < array_length(v); i++)
	instance_destroy(v[i]);

for (var i = 0; i < array_length(e); i++)
	instance_destroy(e[i]);
