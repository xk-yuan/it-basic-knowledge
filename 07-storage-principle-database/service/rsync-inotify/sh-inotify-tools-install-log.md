# inotify-tools-3.20.0 编译安装

```bash
[root@inotify inotify-tools-3.20.0]# ./autogen.sh 
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `config'.
libtoolize: copying file `config/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'

libtoolize: copying file `m4/lt~obsolete.m4'
configure.ac:17: installing 'config/config.guess'
configure.ac:17: installing 'config/config.sub'
configure.ac:16: installing 'config/install-sh'
configure.ac:16: installing 'config/missing'
libinotifytools/src/Makefile.am: installing 'config/depcomp'
parallel-tests: installing 'config/test-driver'

[root@inotify inotify-tools-3.20.0]# ll
总用量 552
-rw-r--r--. 1 root root  37942 4月   1 11:03 aclocal.m4
-rw-rw-r--. 1 root root     39 1月   4 2018 AUTHORS
-rwxrwxr-x. 1 root root     47 1月   4 2018 autogen.sh
drwxr-xr-x. 2 root root    118 4月   1 11:03 autom4te.cache
-rw-rw-r--. 1 root root    115 1月   4 2018 ChangeLog
drwxr-xr-x. 2 root root    128 4月   1 11:03 config
-rw-r--r--. 1 root root   2268 4月   1 11:03 config.h.in
-rwxr-xr-x. 1 root root 418024 4月   1 11:03 configure
-rw-rw-r--. 1 root root   2314 1月   4 2018 configure.ac
-rw-rw-r--. 1 root root  17999 1月   4 2018 COPYING
-rw-rw-r--. 1 root root  15752 1月   4 2018 INSTALL
drwxrwxr-x. 3 root root     55 4月   1 11:03 libinotifytools
drwxrwxr-x. 2 root root    122 4月   1 11:03 m4
-rw-rw-r--. 1 root root    252 1月   4 2018 Makefile.am
-rw-r--r--. 1 root root  25338 4月   1 11:03 Makefile.in
drwxrwxr-x. 2 root root     93 4月   1 11:03 man
-rw-rw-r--. 1 root root     48 1月   4 2018 NEWS
-rw-rw-r--. 1 root root    246 1月   4 2018 README
drwxrwxr-x. 2 root root    119 4月   1 11:03 src
drwxrwxr-x. 2 root root    107 1月   4 2018 t
-rwxrwxr-x. 1 root root    466 1月   4 2018 upload_api_docs

[root@inotify inotify-tools-3.20.0]# ./configure
checking whether make sets $(MAKE)... yes
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking for style of include used by make... GNU
checking whether make supports nested variables... yes
checking dependency style of gcc... gcc3
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for fgrep... /usr/bin/grep -F
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to x86_64-unknown-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for ar... ar
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for sysroot... no
checking for mt... no
checking if : is a manifest tool... no
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... no
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for doxygen... /usr/bin/doxygen
checking sys/inotify.h usability... yes
checking sys/inotify.h presence... yes
checking for sys/inotify.h... yes
checking mcheck.h usability... yes
checking mcheck.h presence... yes
checking for mcheck.h... yes
checking whether sys/inotify.h actually works... yup
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for daemon... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating man/Makefile
config.status: creating man/inotifywait.1
config.status: creating man/inotifywatch.1
config.status: creating libinotifytools/Makefile
config.status: creating libinotifytools/src/Makefile
config.status: creating libinotifytools/src/inotifytools/Makefile
config.status: creating config.h
config.status: creating libinotifytools/src/inotifytools/inotify.h
config.status: executing depfiles commands
config.status: executing libtool commands
```

```sh
[root@inotify inotify-tools-3.20.0]# make
make  all-recursive
make[1]: 进入目录“/home/ykdl/inotify-tools-3.20.0”
Making all in libinotifytools
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
Making all in src
make[3]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
Making all in inotifytools
make[4]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make  all-am
make[5]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[5]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[4]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[4]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
/bin/sh ../../libtool  --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools    -std=c99 -g -O2 -MT inotifytools.lo -MD -MP -MF .deps/inotifytools.Tpo -c -o inotifytools.lo inotifytools.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools -std=c99 -g -O2 -MT inotifytools.lo -MD -MP -MF .deps/inotifytools.Tpo -c inotifytools.c  -fPIC -DPIC -o .libs/inotifytools.o
inotifytools.c: In function 'event_compare':
inotifytools.c:2067:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  int sort_event = (int)config;
                   ^
inotifytools.c: In function 'inotifytools_wd_sorted_by_event':
inotifytools.c:2088:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  struct rbtree *ret = rbinit(event_compare, (void*)sort_event);
                                             ^
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools -std=c99 -g -O2 -MT inotifytools.lo -MD -MP -MF .deps/inotifytools.Tpo -c inotifytools.c -o inotifytools.o >/dev/null 2>&1
mv -f .deps/inotifytools.Tpo .deps/inotifytools.Plo
/bin/sh ../../libtool  --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools    -std=c99 -g -O2 -MT redblack.lo -MD -MP -MF .deps/redblack.Tpo -c -o redblack.lo redblack.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools -std=c99 -g -O2 -MT redblack.lo -MD -MP -MF .deps/redblack.Tpo -c redblack.c  -fPIC -DPIC -o .libs/redblack.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../.. -I../../libinotifytools/src/inotifytools -std=c99 -g -O2 -MT redblack.lo -MD -MP -MF .deps/redblack.Tpo -c redblack.c -o redblack.o >/dev/null 2>&1
mv -f .deps/redblack.Tpo .deps/redblack.Plo
/bin/sh ../../libtool  --tag=CC   --mode=link gcc -std=c99 -g -O2 -version-info 4:1:4  -o libinotifytools.la -rpath /usr/local/lib inotifytools.lo redblack.lo  
libtool: link: gcc -shared  -fPIC -DPIC  .libs/inotifytools.o .libs/redblack.o    -O2   -Wl,-soname -Wl,libinotifytools.so.0 -o .libs/libinotifytools.so.0.4.1
libtool: link: (cd ".libs" && rm -f "libinotifytools.so.0" && ln -s "libinotifytools.so.0.4.1" "libinotifytools.so.0")
libtool: link: (cd ".libs" && rm -f "libinotifytools.so" && ln -s "libinotifytools.so.0.4.1" "libinotifytools.so")
libtool: link: ar cru .libs/libinotifytools.a  inotifytools.o redblack.o
libtool: link: ranlib .libs/libinotifytools.a
libtool: link: ( cd ".libs" && rm -f "libinotifytools.la" && ln -s "../libinotifytools.la" "libinotifytools.la" )
/usr/bin/doxygen
Warning: Tag `USE_WINDOWS_ENCODING' at line 64 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Warning: Tag `DETAILS_AT_TOP' at line 156 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Warning: Tag `SHOW_DIRECTORIES' at line 390 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Warning: Tag `HTML_ALIGN_MEMBERS' at line 674 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Warning: Tag `MAX_DOT_GRAPH_WIDTH' at line 1196 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Warning: Tag `MAX_DOT_GRAPH_HEIGHT' at line 1204 of file Doxyfile has become obsolete.
To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
Notice: Output directory `doc' does not exist. I have created it for you.
Searching for include files...
Searching for example files...
Searching for files in directory /home/ykdl/inotify-tools-3.20.0/libinotifytools/src
Searching for images...
Searching for dot files...
Searching for msc files...
Searching for files to exclude
Searching for files to process...
Reading and parsing tag files
Parsing files
Preprocessing /home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools/inotifytools.h...
Parsing file /home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools/inotifytools.h...
Preprocessing /home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools.c...
Parsing file /home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools.c...
Building group list...
Building directory list...
Building namespace list...
Building file list...
Building class list...
Associating documentation with classes...
Computing nesting relations for classes...
Building example list...
Searching for enumerations...
Searching for documented typedefs...
Searching for members imported via using declarations...
Searching for included using directives...
Searching for documented variables...
Building interface member list...
Building member list...
Searching for friends...
Searching for documented defines...
Computing class inheritance relations...
Computing class usage relations...
Flushing cached template relations that have become invalid...
Creating members for template instances...
Computing class relations...
Add enum values to enums...
Searching for member function documentation...
Building page list...
Search for main page...
Computing page relations...
Determining the scope of groups...
Sorting lists...
Freeing entry tree
Determining which enums are documented
Computing member relations...
Building full member lists recursively...
Adding members to member groups.
Computing member references...
Inheriting documentation...
Generating disk names...
Adding source references...
Adding xrefitems...
Sorting member lists...
Computing dependencies between directories...
Generating citations page...
Counting data structures...
Resolving user defined references...
Finding anchors and sections in the documentation...
Transferring function references...
Combining using relations...
Adding members to index pages...
Generating style sheet...
Generating example documentation...
Generating file sources...
Generating code for file inotifytools.c...
Generating code for file inotifytools/inotifytools.h...
Generating file documentation...
Generating docs for file inotifytools/inotifytools.h...
Generating page documentation...
Generating docs for page todo...
Generating group documentation...
Generating class documentation...
Generating namespace index...
Generating graph info page...
Generating directory documentation...
Generating index page...
Generating page index...
Generating module index...
Generating namespace index...
Generating namespace member index...
Generating annotated compound index...
Generating alphabetical compound index...
Generating hierarchical class index...
Generating member index...
Generating file index...
Generating file member index...
Generating example index...
finalizing index lists...
lookup cache used 87/65536 hits=306 misses=87
finished...
make[4]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[3]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[3]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[3]: 对“all-am”无需做任何事。
make[3]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
Making all in src
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/src”
gcc -DHAVE_CONFIG_H -I. -I.. -I../libinotifytools/src/inotifytools  -I../libinotifytools/src  -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -L../libinotifytools/src -g -O2 -MT inotifywait.o -MD -MP -MF .deps/inotifywait.Tpo -c -o inotifywait.o inotifywait.c
mv -f .deps/inotifywait.Tpo .deps/inotifywait.Po
gcc -DHAVE_CONFIG_H -I. -I.. -I../libinotifytools/src/inotifytools  -I../libinotifytools/src  -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -L../libinotifytools/src -g -O2 -MT common.o -MD -MP -MF .deps/common.Tpo -c -o common.o common.c
mv -f .deps/common.Tpo .deps/common.Po
/bin/sh ../libtool  --tag=CC   --mode=link gcc -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -L../libinotifytools/src -g -O2   -o inotifywait inotifywait.o common.o ../libinotifytools/src/libinotifytools.la 
libtool: link: gcc -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -g -O2 -o .libs/inotifywait inotifywait.o common.o  -L../libinotifytools/src ../libinotifytools/src/.libs/libinotifytools.so -Wl,-rpath -Wl,/usr/local/lib
gcc -DHAVE_CONFIG_H -I. -I.. -I../libinotifytools/src/inotifytools  -I../libinotifytools/src  -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -L../libinotifytools/src -g -O2 -MT inotifywatch.o -MD -MP -MF .deps/inotifywatch.Tpo -c -o inotifywatch.o inotifywatch.c
mv -f .deps/inotifywatch.Tpo .deps/inotifywatch.Po
/bin/sh ../libtool  --tag=CC   --mode=link gcc -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -L../libinotifytools/src -g -O2   -o inotifywatch inotifywatch.o common.o ../libinotifytools/src/libinotifytools.la 
libtool: link: gcc -Wall -Werror -Wpointer-arith -std=c99 -I../libinotifytools/src -g -O2 -o .libs/inotifywatch inotifywatch.o common.o  -L../libinotifytools/src ../libinotifytools/src/.libs/libinotifytools.so -Wl,-rpath -Wl,/usr/local/lib
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/src”
Making all in man
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/man”
make[2]: 对“all”无需做任何事。
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/man”
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0”
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0”
make[1]: 离开目录“/home/ykdl/inotify-tools-3.20.0”
```

```sh
[root@inotify inotify-tools-3.20.0]# make install
Making install in libinotifytools
make[1]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
Making install in src
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
Making install in inotifytools
make[3]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[4]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[4]: 对“install-exec-am”无需做任何事。
make[4]: 对“install-data-am”无需做任何事。
make[4]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[3]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src/inotifytools”
make[3]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[4]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
 /usr/bin/mkdir -p '/usr/local/lib'
 /bin/sh ../../libtool   --mode=install /usr/bin/install -c   libinotifytools.la '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/libinotifytools.so.0.4.1 /usr/local/lib/libinotifytools.so.0.4.1
libtool: install: (cd /usr/local/lib && { ln -s -f libinotifytools.so.0.4.1 libinotifytools.so.0 || { rm -f libinotifytools.so.0 && ln -s libinotifytools.so.0.4.1 libinotifytools.so.0; }; })
libtool: install: (cd /usr/local/lib && { ln -s -f libinotifytools.so.0.4.1 libinotifytools.so || { rm -f libinotifytools.so && ln -s libinotifytools.so.0.4.1 libinotifytools.so; }; })
libtool: install: /usr/bin/install -c .libs/libinotifytools.lai /usr/local/lib/libinotifytools.la
libtool: install: /usr/bin/install -c .libs/libinotifytools.a /usr/local/lib/libinotifytools.a
libtool: install: chmod 644 /usr/local/lib/libinotifytools.a
libtool: install: ranlib /usr/local/lib/libinotifytools.a
libtool: finish: PATH="/usr/lib64/qt-3.3/bin:/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/sbin" ldconfig -n /usr/local/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/local/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
 /usr/bin/mkdir -p '/usr/local/share/doc/inotify-tools'
 /usr/bin/install -c -m 644 doc/html/bc_s.png doc/html/bdwn.png doc/html/closed.png doc/html/dir_6f9162800bb6dbbe5c86171e8602f383.html doc/html/doxygen.css doc/html/doxygen.png doc/html/dynsections.js doc/html/files.html doc/html/ftv2blank.png doc/html/ftv2cl.png doc/html/ftv2doc.png doc/html/ftv2folderclosed.png doc/html/ftv2folderopen.png doc/html/ftv2lastnode.png doc/html/ftv2link.png doc/html/ftv2mlastnode.png doc/html/ftv2mnode.png doc/html/ftv2mo.png doc/html/ftv2node.png doc/html/ftv2ns.png doc/html/ftv2plastnode.png doc/html/ftv2pnode.png doc/html/ftv2splitbar.png doc/html/ftv2vertline.png doc/html/globals_func.html doc/html/globals.html doc/html/index.html doc/html/inotifytools_8c_source.html doc/html/inotifytools_8h.html doc/html/inotifytools_8h_source.html doc/html/jquery.js doc/html/nav_f.png doc/html/nav_g.png doc/html/nav_h.png doc/html/open.png doc/html/pages.html doc/html/sync_off.png doc/html/sync_on.png doc/html/tab_a.png doc/html/tab_b.png '/usr/local/share/doc/inotify-tools'
 /usr/bin/install -c -m 644 doc/html/tab_h.png doc/html/tabs.css doc/html/tab_s.png doc/html/todo.html '/usr/local/share/doc/inotify-tools'
 /usr/bin/mkdir -p '/usr/local/include'
 /usr/bin/mkdir -p '/usr/local/include/inotifytools'
 /usr/bin/install -c -m 644  inotifytools/inotifytools.h inotifytools/inotify-nosys.h inotifytools/inotify.h '/usr/local/include/inotifytools'
make[4]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[3]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools/src”
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[3]: 进入目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[3]: 对“install-exec-am”无需做任何事。
make[3]: 对“install-data-am”无需做任何事。
make[3]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
make[1]: 离开目录“/home/ykdl/inotify-tools-3.20.0/libinotifytools”
Making install in src
make[1]: 进入目录“/home/ykdl/inotify-tools-3.20.0/src”
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/src”
 /usr/bin/mkdir -p '/usr/local/bin'
  /bin/sh ../libtool   --mode=install /usr/bin/install -c inotifywait inotifywatch '/usr/local/bin'
libtool: install: /usr/bin/install -c .libs/inotifywait /usr/local/bin/inotifywait
libtool: install: /usr/bin/install -c .libs/inotifywatch /usr/local/bin/inotifywatch
make[2]: 对“install-data-am”无需做任何事。
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/src”
make[1]: 离开目录“/home/ykdl/inotify-tools-3.20.0/src”
Making install in man
make[1]: 进入目录“/home/ykdl/inotify-tools-3.20.0/man”
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0/man”
make[2]: 对“install-exec-am”无需做任何事。
 /usr/bin/mkdir -p '/usr/local/share/man/man1'
 /usr/bin/install -c -m 644 inotifywait.1 inotifywatch.1 '/usr/local/share/man/man1'
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0/man”
make[1]: 离开目录“/home/ykdl/inotify-tools-3.20.0/man”
make[1]: 进入目录“/home/ykdl/inotify-tools-3.20.0”
make[2]: 进入目录“/home/ykdl/inotify-tools-3.20.0”
make[2]: 对“install-exec-am”无需做任何事。
make[2]: 对“install-data-am”无需做任何事。
make[2]: 离开目录“/home/ykdl/inotify-tools-3.20.0”
make[1]: 离开目录“/home/ykdl/inotify-tools-3.20.0”
```