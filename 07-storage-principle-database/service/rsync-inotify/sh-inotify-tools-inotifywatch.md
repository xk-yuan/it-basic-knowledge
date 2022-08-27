# 

```sh
[root@inotify src]# inotifywatch --help
inotifywatch 3.20.0
Gather filesystem usage statistics using inotify.
Usage: inotifywatch [ options ] file1 [ file2 ] [ ... ]
Options:
	-h|--help    	Show this help text.
	-v|--verbose 	Be verbose.
	@<file>       	Exclude the specified file from being watched.
	--fromfile <file>
		Read files to watch from <file> or `-' for stdin.
	--exclude <pattern>
		Exclude all events on files matching the extended regular
		expression <pattern>.
	--excludei <pattern>
		Like --exclude but case insensitive.
	--include <pattern>
		Exclude all events on files except the ones
		matching the extended regular expression
		<pattern>.
	--includei <pattern>
		Like --include but case insensitive.
	-z|--zero
		In the final table of results, output rows and columns even
		if they consist only of zeros (the default is to not output
		these rows and columns).
	-r|--recursive	Watch directories recursively.
	-t|--timeout <seconds>
		Listen only for specified amount of time in seconds; if
		omitted or negative, inotifywatch will execute until receiving an
		interrupt signal.
	-e|--event <event1> [ -e|--event <event2> ... ]
		Listen for specific event(s).  If omitted, all events are 
		listened for.
	-a|--ascending <event>
		Sort ascending by a particular event, or `total'.
	-d|--descending <event>
		Sort descending by a particular event, or `total'.

Exit status:
	0  -  Exited normally.
	1  -  Some error occurred.

Events:
	access		file or directory contents were read
	modify		file or directory contents were written
	attrib		file or directory attributes changed
	close_write	file or directory closed, after being opened in
	           	writeable mode
	close_nowrite	file or directory closed, after being opened in
	           	read-only mode
	close		file or directory closed, regardless of read/write mode
	open		file or directory opened
	moved_to	file or directory moved to watched directory
	moved_from	file or directory moved from watched directory
	move		file or directory moved to or from watched directory
	move_self		A watched file or directory was moved.
	create		file or directory created within watched directory
	delete		file or directory deleted within watched directory
	delete_self	file or directory was deleted
	unmount		file system containing file or directory unmounted
```