From: "Michael Coco" <drcosquared-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Nouveau and Debian Unstable
Date: Mon, 30 Jul 2007 16:47:48 -0400
Message-ID: <6bf479de0707301347t34881981j809ef36ebbc141db@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582632333=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1582632333==
Content-Type: multipart/alternative;
	boundary="----=_Part_36456_10278647.1185828468654"

------=_Part_36456_10278647.1185828468654
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I recently compiled the drm and nouveau modules on Debian unstable. All went
well until I had to insert the drm module, I recieved to following error:

insmod: error inserting 'drm.ko': -1 Unknown symbol in module

I have compiled the modules before and I have always gotten this same error.

Here is the log of my build:

debian:/home/michael/drm# ./autogen.sh --prefix=/usr && make && make install
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy
autoreconf: running: /usr/bin/autoconf
autoreconf: running: /usr/bin/autoheader
autoreconf: running: automake --add-missing --copy --no-force
configure.ac:24: installing `./missing'
configure.ac:24: installing `./install-sh'
libdrm/Makefile.am: installing `./depcomp'
autoreconf: Leaving directory `.'
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking build system type... i586-pc-linux-gnu
checking host system type... i586-pc-linux-gnu
checking for style of include used by make... GNU
checking for gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for /usr/bin/ld option to reload object files... -r
checking for BSD-compatible nm... /usr/bin/nm -B
checking whether ln -s works... yes
checking how to recognize dependent libraries... pass_all
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
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking how to run the C++ preprocessor... g++ -E
checking for g77... no
checking for xlf... no
checking for f77... no
checking for frt... no
checking for pgf77... no
checking for cf77... no
checking for fort77... no
checking for fl32... no
checking for af77... no
checking for xlf90... no
checking for f90... no
checking for pgf90... no
checking for pghpf... no
checking for epcf90... no
checking for gfortran... no
checking for g95... no
checking for xlf95... no
checking for f95... no
checking for fort... no
checking for ifort... no
checking for ifc... no
checking for efc... no
checking for pgf95... no
checking for lf95... no
checking for ftn... no
checking whether we are using the GNU Fortran 77 compiler... no
checking whether  accepts -g... no
checking the maximum length of command line arguments... 98304
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking for objdir... .libs
checking for ar... ar
checking for ranlib... ranlib
checking for strip... strip
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC
checking if gcc PIC flag -fPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking whether the gcc linker (/usr/bin/ld) supports shared libraries...
yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by g++... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking whether the g++ linker (/usr/bin/ld) supports shared libraries...
yes
checking for g++ option to produce PIC... -fPIC
checking if g++ PIC flag -fPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking whether the g++ linker (/usr/bin/ld) supports shared libraries...
yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
appending configuration tag "F77" to libtool
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking for ANSI C header files... (cached) yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... 64
configure: creating ./config.status
config.status: creating Makefile
config.status: creating libdrm/Makefile
config.status: creating shared-core/Makefile
config.status: creating tests/Makefile
config.status: creating libdrm.pc
config.status: creating libdrm/config.h
config.status: executing depfiles commands
Making all in libdrm
make[1]: Entering directory `/home/michael/drm/libdrm'
make  all-am
make[2]: Entering directory `/home/michael/drm/libdrm'
/bin/sh ../libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I../shared-core -g -O2 -MT xf86drm.lo -MD -MP -MF .deps/xf86drm.Tpo -c -o
xf86drm.lo xf86drm.c
mkdir .libs
 gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drm.lo -MD -MP -MF
.deps/xf86drm.Tpo -c xf86drm.c  -fPIC -DPIC -o .libs/xf86drm.o
mv -f .deps/xf86drm.Tpo .deps/xf86drm.Plo
/bin/sh ../libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I../shared-core -g -O2 -MT xf86drmHash.lo -MD -MP -MF .deps/xf86drmHash.Tpo
-c -o xf86drmHash.lo xf86drmHash.c
 gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drmHash.lo -MD -MP
-MF .deps/xf86drmHash.Tpo -c xf86drmHash.c  -fPIC -DPIC -o
.libs/xf86drmHash.o
mv -f .deps/xf86drmHash.Tpo .deps/xf86drmHash.Plo
/bin/sh ../libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I../shared-core -g -O2 -MT xf86drmRandom.lo -MD -MP -MF
.deps/xf86drmRandom.Tpo -c -o xf86drmRandom.lo xf86drmRandom.c
 gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drmRandom.lo -MD
-MP -MF .deps/xf86drmRandom.Tpo -c xf86drmRandom.c  -fPIC -DPIC -o
.libs/xf86drmRandom.o
mv -f .deps/xf86drmRandom.Tpo .deps/xf86drmRandom.Plo
/bin/sh ../libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I../shared-core -g -O2 -MT xf86drmSL.lo -MD -MP -MF .deps/xf86drmSL.Tpo -c
-o xf86drmSL.lo xf86drmSL.c
 gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drmSL.lo -MD -MP
-MF .deps/xf86drmSL.Tpo -c xf86drmSL.c  -fPIC -DPIC -o .libs/xf86drmSL.o
mv -f .deps/xf86drmSL.Tpo .deps/xf86drmSL.Plo
/bin/sh ../libtool --tag=CC   --mode=link gcc -I../shared-core -g -O2
-version-number 2:3:0 -no-undefined  -o libdrm.la -rpath /usr/lib xf86drm.lo
xf86drmHash.lo xf86drmRandom.lo xf86drmSL.lo
gcc -shared  .libs/xf86drm.o .libs/xf86drmHash.o .libs/xf86drmRandom.o
.libs/xf86drmSL.o   -Wl,-soname -Wl,libdrm.so.2 -o .libs/libdrm.so.2.3.0
(cd .libs && rm -f libdrm.so.2 && ln -s libdrm.so.2.3.0 libdrm.so.2)
(cd .libs && rm -f libdrm.so && ln -s libdrm.so.2.3.0 libdrm.so)
creating libdrm.la
(cd .libs && rm -f libdrm.la && ln -s ../libdrm.la libdrm.la)
make[2]: Leaving directory `/home/michael/drm/libdrm'
make[1]: Leaving directory `/home/michael/drm/libdrm'
Making all in shared-core
make[1]: Entering directory `/home/michael/drm/shared-core'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/michael/drm/shared-core'
Making all in tests
make[1]: Entering directory `/home/michael/drm/tests'
gcc -DHAVE_CONFIG_H -I. -I../libdrm    -I ../shared-core -g -O2 -MT
dristat.o -MD -MP -MF .deps/dristat.Tpo -c -o dristat.o dristat.c
mv -f .deps/dristat.Tpo .deps/dristat.Po
/bin/sh ../libtool --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I../libdrm    -I ../shared-core -g -O2 -MT drmtest.lo -MD -MP -MF
.deps/drmtest.Tpo -c -o drmtest.lo drmtest.c
mkdir .libs
 gcc -DHAVE_CONFIG_H -I. -I../libdrm -I ../shared-core -g -O2 -MT
drmtest.lo-MD -MP -MF .deps/drmtest.Tpo -c
drmtest.c  -fPIC -DPIC -o .libs/drmtest.o
mv -f .deps/drmtest.Tpo .deps/drmtest.Plo
/bin/sh ../libtool --tag=CC   --mode=link gcc -I ../shared-core -g -O2   -o
libdrmtest.la  drmtest.lo ../libdrm/libdrm.la
ar cru .libs/libdrmtest.a .libs/drmtest.o
ranlib .libs/libdrmtest.a
creating libdrmtest.la
(cd .libs && rm -f libdrmtest.la && ln -s ../libdrmtest.la libdrmtest.la)
/bin/sh ../libtool --tag=CC   --mode=link gcc -I ../shared-core -g -O2   -o
dristat dristat.o libdrmtest.la
gcc -I ../shared-core -g -O2 -o .libs/dristat dristat.o
./.libs/libdrmtest.a /home/michael/drm/libdrm/.libs/libdrm.so
creating dristat
gcc -DHAVE_CONFIG_H -I. -I../libdrm    -I ../shared-core -g -O2 -MT
drmstat.o -MD -MP -MF .deps/drmstat.Tpo -c -o drmstat.o drmstat.c
mv -f .deps/drmstat.Tpo .deps/drmstat.Po
/bin/sh ../libtool --tag=CC   --mode=link gcc -I ../shared-core -g -O2   -o
drmstat drmstat.o libdrmtest.la
gcc -I ../shared-core -g -O2 -o .libs/drmstat drmstat.o
./.libs/libdrmtest.a /home/michael/drm/libdrm/.libs/libdrm.so
creating drmstat
make[1]: Leaving directory `/home/michael/drm/tests'
make[1]: Entering directory `/home/michael/drm'
make[1]: Nothing to be done for `all-am'.
make[1]: Leaving directory `/home/michael/drm'
Making install in libdrm
make[1]: Entering directory `/home/michael/drm/libdrm'
make[2]: Entering directory `/home/michael/drm/libdrm'
make[2]: Nothing to be done for `install-exec-am'.
test -z "/usr/lib" || /bin/mkdir -p "/usr/lib"
 /bin/sh ../libtool --mode=install /usr/bin/install -c  'libdrm.la'
'/usr/lib/libdrm.la'
/usr/bin/install -c .libs/libdrm.so.2.3.0 /usr/lib/libdrm.so.2.3.0
(cd /usr/lib && { ln -s -f libdrm.so.2.3.0 libdrm.so.2 || { rm -f
libdrm.so.2 && ln -s libdrm.so.2.3.0 libdrm.so.2; }; })
(cd /usr/lib && { ln -s -f libdrm.so.2.3.0 libdrm.so || { rm -f libdrm.so &&
ln -s libdrm.so.2.3.0 libdrm.so; }; })
/usr/bin/install -c .libs/libdrm.lai /usr/lib/libdrm.la
PATH="$PATH:/sbin" ldconfig -n /usr/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
test -z "/usr/include" || /bin/mkdir -p "/usr/include"
 /usr/bin/install -c -m 644 'xf86drm.h' '/usr/include/xf86drm.h'
 /usr/bin/install -c -m 644 'xf86mm.h' '/usr/include/xf86mm.h'
make[2]: Leaving directory `/home/michael/drm/libdrm'
make[1]: Leaving directory `/home/michael/drm/libdrm'
Making install in shared-core
make[1]: Entering directory `/home/michael/drm/shared-core'
make[2]: Entering directory `/home/michael/drm/shared-core'
make[2]: Nothing to be done for `install-exec-am'.
test -z "/usr/include/drm" || /bin/mkdir -p "/usr/include/drm"
 /usr/bin/install -c -m 644 'drm.h' '/usr/include/drm/drm.h'
 /usr/bin/install -c -m 644 'drm_sarea.h' '/usr/include/drm/drm_sarea.h'
 /usr/bin/install -c -m 644 'i915_drm.h' '/usr/include/drm/i915_drm.h'
 /usr/bin/install -c -m 644 'mach64_drm.h' '/usr/include/drm/mach64_drm.h'
 /usr/bin/install -c -m 644 'mga_drm.h' '/usr/include/drm/mga_drm.h'
 /usr/bin/install -c -m 644 'nouveau_drm.h' '/usr/include/drm/nouveau_drm.h'
 /usr/bin/install -c -m 644 'r128_drm.h' '/usr/include/drm/r128_drm.h'
 /usr/bin/install -c -m 644 'radeon_drm.h' '/usr/include/drm/radeon_drm.h'
 /usr/bin/install -c -m 644 'savage_drm.h' '/usr/include/drm/savage_drm.h'
 /usr/bin/install -c -m 644 'sis_drm.h' '/usr/include/drm/sis_drm.h'
 /usr/bin/install -c -m 644 'via_drm.h' '/usr/include/drm/via_drm.h'
 /usr/bin/install -c -m 644 'r300_reg.h' '/usr/include/drm/r300_reg.h'
 /usr/bin/install -c -m 644 'via_3d_reg.h' '/usr/include/drm/via_3d_reg.h'
make[2]: Leaving directory `/home/michael/drm/shared-core'
make[1]: Leaving directory `/home/michael/drm/shared-core'
Making install in tests
make[1]: Entering directory `/home/michael/drm/tests'
make[2]: Entering directory `/home/michael/drm/tests'
make[2]: Nothing to be done for `install-exec-am'.
make[2]: Nothing to be done for `install-data-am'.
make[2]: Leaving directory `/home/michael/drm/tests'
make[1]: Leaving directory `/home/michael/drm/tests'
make[1]: Entering directory `/home/michael/drm'
make[2]: Entering directory `/home/michael/drm'
make[2]: Nothing to be done for `install-exec-am'.
test -z "/usr/lib/pkgconfig" || /bin/mkdir -p "/usr/lib/pkgconfig"
 /usr/bin/install -c -m 644 'libdrm.pc' '/usr/lib/pkgconfig/libdrm.pc'
make[2]: Leaving directory `/home/michael/drm'
make[1]: Leaving directory `/home/michael/drm'

debian:/home/michael/drm# cd linux-core && make nouveau.o
make DRM_MODULES=nouveau.o modules
make[1]: Entering directory `/home/michael/drm/linux-core'
sh ../scripts/create_linux_pci_lists.sh < ../shared-core/drm_pciids.txt
make -C /lib/modules/2.6.22-1-486/build  SUBDIRS=`pwd` DRMSRCDIR=`pwd`
modules
make[2]: Entering directory `/usr/src/linux-headers-2.6.22-1-486'
  CC [M]  /home/michael/drm/linux-core/drm_auth.o
  CC [M]  /home/michael/drm/linux-core/drm_bufs.o
  CC [M]  /home/michael/drm/linux-core/drm_context.o
  CC [M]  /home/michael/drm/linux-core/drm_dma.o
  CC [M]  /home/michael/drm/linux-core/drm_drawable.o
  CC [M]  /home/michael/drm/linux-core/drm_drv.o
  CC [M]  /home/michael/drm/linux-core/drm_fops.o
  CC [M]  /home/michael/drm/linux-core/drm_ioctl.o
  CC [M]  /home/michael/drm/linux-core/drm_irq.o
  CC [M]  /home/michael/drm/linux-core/drm_lock.o
  CC [M]  /home/michael/drm/linux-core/drm_memory.o
  CC [M]  /home/michael/drm/linux-core/drm_proc.o
  CC [M]  /home/michael/drm/linux-core/drm_stub.o
  CC [M]  /home/michael/drm/linux-core/drm_vm.o
  CC [M]  /home/michael/drm/linux-core/drm_sysfs.o
  CC [M]  /home/michael/drm/linux-core/drm_pci.o
  CC [M]  /home/michael/drm/linux-core/drm_agpsupport.o
  CC [M]  /home/michael/drm/linux-core/drm_scatter.o
  CC [M]  /home/michael/drm/linux-core/drm_memory_debug.o
  CC [M]  /home/michael/drm/linux-core/ati_pcigart.o
  CC [M]  /home/michael/drm/linux-core/drm_sman.o
  CC [M]  /home/michael/drm/linux-core/drm_hashtab.o
  CC [M]  /home/michael/drm/linux-core/drm_mm.o
  CC [M]  /home/michael/drm/linux-core/drm_object.o
  CC [M]  /home/michael/drm/linux-core/drm_compat.o
  CC [M]  /home/michael/drm/linux-core/drm_fence.o
  CC [M]  /home/michael/drm/linux-core/drm_ttm.o
  CC [M]  /home/michael/drm/linux-core/drm_bo.o
  CC [M]  /home/michael/drm/linux-core/drm_bo_move.o
  CC [M]  /home/michael/drm/linux-core/nouveau_drv.o
  CC [M]  /home/michael/drm/linux-core/nouveau_state.o
/home/michael/drm/linux-core/nouveau_state.c: In function
'nouveau_ioctl_getparam':
/home/michael/drm/linux-core/nouveau_state.c:458: warning: cast from pointer
to integer of different size
/home/michael/drm/linux-core/nouveau_state.c: In function
'nouveau_wait_for_idle':
/home/michael/drm/linux-core/nouveau_state.c:528: warning: unused variable
'pmc_e'
  CC [M]  /home/michael/drm/linux-core/nouveau_fifo.o
  CC [M]  /home/michael/drm/linux-core/nouveau_mem.o
  CC [M]  /home/michael/drm/linux-core/nouveau_object.o
  CC [M]  /home/michael/drm/linux-core/nouveau_irq.o
  CC [M]  /home/michael/drm/linux-core/nouveau_notifier.o
  CC [M]  /home/michael/drm/linux-core/nouveau_sgdma.o
  CC [M]  /home/michael/drm/linux-core/nv04_timer.o
  CC [M]  /home/michael/drm/linux-core/nv04_mc.o
  CC [M]  /home/michael/drm/linux-core/nv40_mc.o
  CC [M]  /home/michael/drm/linux-core/nv50_mc.o
  CC [M]  /home/michael/drm/linux-core/nv04_fb.o
  CC [M]  /home/michael/drm/linux-core/nv10_fb.o
  CC [M]  /home/michael/drm/linux-core/nv40_fb.o
  CC [M]  /home/michael/drm/linux-core/nv04_fifo.o
  CC [M]  /home/michael/drm/linux-core/nv10_fifo.o
  CC [M]  /home/michael/drm/linux-core/nv40_fifo.o
  CC [M]  /home/michael/drm/linux-core/nv50_fifo.o
  CC [M]  /home/michael/drm/linux-core/nv04_graph.o
  CC [M]  /home/michael/drm/linux-core/nv10_graph.o
  CC [M]  /home/michael/drm/linux-core/nv20_graph.o
  CC [M]  /home/michael/drm/linux-core/nv30_graph.o
  CC [M]  /home/michael/drm/linux-core/nv40_graph.o
  CC [M]  /home/michael/drm/linux-core/nv50_graph.o
  CC [M]  /home/michael/drm/linux-core/nv04_instmem.o
  CC [M]  /home/michael/drm/linux-core/nv50_instmem.o
  LD [M]  /home/michael/drm/linux-core/drm.o
  LD [M]  /home/michael/drm/linux-core/nouveau.o
  Building modules, stage 2.
  MODPOST 2 modules
  CC      /home/michael/drm/linux-core/drm.mod.o
  LD [M]  /home/michael/drm/linux-core/drm.ko
  CC      /home/michael/drm/linux-core/nouveau.mod.o
  LD [M]  /home/michael/drm/linux-core/nouveau.ko
make[2]: Leaving directory `/usr/src/linux-headers-2.6.22-1-486'
make[1]: Leaving directory `/home/michael/drm/linux-core'
debian:/home/michael/drm/linux-core# insmod drm.ko
insmod: error inserting 'drm.ko': -1 Unknown symbol in module

I use the latest available packages from Debian and I have a Nvidia TNT2 64
video card.

------=_Part_36456_10278647.1185828468654
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I recently compiled the drm and nouveau modules on Debian unstable. All went well until I had to insert the drm module, I recieved to following error:<br><br>insmod: error inserting &#39;drm.ko&#39;: -1 Unknown symbol in module
<br><br>I have compiled the modules before and I have always gotten this same error.<br><br>Here is the log of my build:<br><br>debian:/home/michael/drm# ./autogen.sh --prefix=/usr &amp;&amp; make &amp;&amp; make install<br>
autoreconf: Entering directory `.&#39;<br>autoreconf: <a href="http://configure.ac">configure.ac</a>: not using Gettext<br>autoreconf: running: aclocal <br>autoreconf: <a href="http://configure.ac">configure.ac</a>: tracing
<br>autoreconf: running: libtoolize --copy<br>autoreconf: running: /usr/bin/autoconf<br>autoreconf: running: /usr/bin/autoheader<br>autoreconf: running: automake --add-missing --copy --no-force<br><a href="http://configure.ac:24">
configure.ac:24</a>: installing `./missing&#39;<br><a href="http://configure.ac:24">configure.ac:24</a>: installing `./install-sh&#39;<br>libdrm/Makefile.am: installing `./depcomp&#39;<br>autoreconf: Leaving directory `.&#39;
<br>checking for a BSD-compatible install... /usr/bin/install -c<br>checking whether build environment is sane... yes<br>checking for a thread-safe mkdir -p... /bin/mkdir -p<br>checking for gawk... no<br>checking for mawk... mawk
<br>checking whether make sets $(MAKE)... yes<br>checking build system type... i586-pc-linux-gnu<br>checking host system type... i586-pc-linux-gnu<br>checking for style of include used by make... GNU<br>checking for gcc... gcc
<br>checking for C compiler default output file name... a.out<br>checking whether the C compiler works... yes<br>checking whether we are cross compiling... no<br>checking for suffix of executables... <br>checking for suffix of object files... o
<br>checking whether we are using the GNU C compiler... yes<br>checking whether gcc accepts -g... yes<br>checking for gcc option to accept ISO C89... none needed<br>checking dependency style of gcc... gcc3<br>checking for a sed that does not truncate output... /bin/sed
<br>checking for grep that handles long lines and -e... /bin/grep<br>checking for egrep... /bin/grep -E<br>checking for ld used by gcc... /usr/bin/ld<br>checking if the linker (/usr/bin/ld) is GNU ld... yes<br>checking for /usr/bin/ld option to reload object files... -r
<br>checking for BSD-compatible nm... /usr/bin/nm -B<br>checking whether ln -s works... yes<br>checking how to recognize dependent libraries... pass_all<br>checking how to run the C preprocessor... gcc -E<br>checking for ANSI C header files... yes
<br>checking for sys/types.h... yes<br>checking for sys/stat.h... yes<br>checking for stdlib.h... yes<br>checking for string.h... yes<br>checking for memory.h... yes<br>checking for strings.h... yes<br>checking for inttypes.h..
. yes<br>checking for stdint.h... yes<br>checking for unistd.h... yes<br>checking dlfcn.h usability... yes<br>checking dlfcn.h presence... yes<br>checking for dlfcn.h... yes<br>checking for g++... g++<br>checking whether we are using the GNU C++ compiler... yes
<br>checking whether g++ accepts -g... yes<br>checking dependency style of g++... gcc3<br>checking how to run the C++ preprocessor... g++ -E<br>checking for g77... no<br>checking for xlf... no<br>checking for f77... no<br>
checking for frt... no<br>checking for pgf77... no<br>checking for cf77... no<br>checking for fort77... no<br>checking for fl32... no<br>checking for af77... no<br>checking for xlf90... no<br>checking for f90... no<br>checking for pgf90... no
<br>checking for pghpf... no<br>checking for epcf90... no<br>checking for gfortran... no<br>checking for g95... no<br>checking for xlf95... no<br>checking for f95... no<br>checking for fort... no<br>checking for ifort... no
<br>checking for ifc... no<br>checking for efc... no<br>checking for pgf95... no<br>checking for lf95... no<br>checking for ftn... no<br>checking whether we are using the GNU Fortran 77 compiler... no<br>checking whether&nbsp; accepts -g... no
<br>checking the maximum length of command line arguments... 98304<br>checking command to parse /usr/bin/nm -B output from gcc object... ok<br>checking for objdir... .libs<br>checking for ar... ar<br>checking for ranlib... ranlib
<br>checking for strip... strip<br>checking if gcc supports -fno-rtti -fno-exceptions... no<br>checking for gcc option to produce PIC... -fPIC<br>checking if gcc PIC flag -fPIC works... yes<br>checking if gcc static flag -static works... yes
<br>checking if gcc supports -c -o file.o... yes<br>checking whether the gcc linker (/usr/bin/ld) supports shared libraries... yes<br>checking whether -lc should be explicitly linked in... no<br>checking dynamic linker characteristics... GNU/Linux 
ld.so<br>checking how to hardcode library paths into programs... immediate<br>checking whether stripping libraries is possible... yes<br>checking if libtool supports shared libraries... yes<br>checking whether to build shared libraries... yes
<br>checking whether to build static libraries... no<br>configure: creating libtool<br>appending configuration tag &quot;CXX&quot; to libtool<br>checking for ld used by g++... /usr/bin/ld<br>checking if the linker (/usr/bin/ld) is GNU ld... yes
<br>checking whether the g++ linker (/usr/bin/ld) supports shared libraries... yes<br>checking for g++ option to produce PIC... -fPIC<br>checking if g++ PIC flag -fPIC works... yes<br>checking if g++ static flag -static works... yes
<br>checking if g++ supports -c -o file.o... yes<br>checking whether the g++ linker (/usr/bin/ld) supports shared libraries... yes<br>checking dynamic linker characteristics... GNU/Linux ld.so<br>checking how to hardcode library paths into programs... immediate
<br>appending configuration tag &quot;F77&quot; to libtool<br>checking for gcc... (cached) gcc<br>checking whether we are using the GNU C compiler... (cached) yes<br>checking whether gcc accepts -g... (cached) yes<br>checking for gcc option to accept ISO C89... (cached) none needed
<br>checking dependency style of gcc... (cached) gcc3<br>checking for ANSI C header files... (cached) yes<br>checking for special C compiler options needed for large files... no<br>checking for _FILE_OFFSET_BITS value needed for large files... 64
<br>configure: creating ./config.status<br>config.status: creating Makefile<br>config.status: creating libdrm/Makefile<br>config.status: creating shared-core/Makefile<br>config.status: creating tests/Makefile<br>config.status
: creating libdrm.pc<br>config.status: creating libdrm/config.h<br>config.status: executing depfiles commands<br>Making all in libdrm<br>make[1]: Entering directory `/home/michael/drm/libdrm&#39;<br>make&nbsp; all-am<br>make[2]: Entering directory `/home/michael/drm/libdrm&#39;
<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=compile gcc -DHAVE_CONFIG_H -I.&nbsp;&nbsp;&nbsp; -I../shared-core -g -O2 -MT xf86drm.lo -MD -MP -MF .deps/xf86drm.Tpo -c -o xf86drm.lo xf86drm.c<br>mkdir .libs<br>&nbsp;gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT 
xf86drm.lo -MD -MP -MF .deps/xf86drm.Tpo -c xf86drm.c&nbsp; -fPIC -DPIC -o .libs/xf86drm.o<br>mv -f .deps/xf86drm.Tpo .deps/xf86drm.Plo<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=compile gcc -DHAVE_CONFIG_H -I.&nbsp;&nbsp;&nbsp; -I../shared-core -g -O2 -MT 
xf86drmHash.lo -MD -MP -MF .deps/xf86drmHash.Tpo -c -o xf86drmHash.lo xf86drmHash.c<br>&nbsp;gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drmHash.lo -MD -MP -MF .deps/xf86drmHash.Tpo -c xf86drmHash.c&nbsp; -fPIC -DPIC -o .libs/xf86drmHash.o
<br>mv -f .deps/xf86drmHash.Tpo .deps/xf86drmHash.Plo<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=compile gcc -DHAVE_CONFIG_H -I.&nbsp;&nbsp;&nbsp; -I../shared-core -g -O2 -MT xf86drmRandom.lo -MD -MP -MF .deps/xf86drmRandom.Tpo -c -o xf86drmRandom.lo
 xf86drmRandom.c<br>&nbsp;gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT xf86drmRandom.lo -MD -MP -MF .deps/xf86drmRandom.Tpo -c xf86drmRandom.c&nbsp; -fPIC -DPIC -o .libs/xf86drmRandom.o<br>mv -f .deps/xf86drmRandom.Tpo .deps/xf86drmRandom.Plo
<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=compile gcc -DHAVE_CONFIG_H -I.&nbsp;&nbsp;&nbsp; -I../shared-core -g -O2 -MT xf86drmSL.lo -MD -MP -MF .deps/xf86drmSL.Tpo -c -o xf86drmSL.lo xf86drmSL.c<br>&nbsp;gcc -DHAVE_CONFIG_H -I. -I../shared-core -g -O2 -MT 
xf86drmSL.lo -MD -MP -MF .deps/xf86drmSL.Tpo -c xf86drmSL.c&nbsp; -fPIC -DPIC -o .libs/xf86drmSL.o<br>mv -f .deps/xf86drmSL.Tpo .deps/xf86drmSL.Plo<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=link gcc -I../shared-core -g -O2 -version-number 2:3:0 -no-undefined&nbsp; -o 
<a href="http://libdrm.la">libdrm.la</a> -rpath /usr/lib xf86drm.lo xf86drmHash.lo xf86drmRandom.lo xf86drmSL.lo&nbsp; <br>gcc -shared&nbsp; .libs/xf86drm.o .libs/xf86drmHash.o .libs/xf86drmRandom.o .libs/xf86drmSL.o&nbsp;&nbsp; -Wl,-soname -Wl,
libdrm.so.2 -o .libs/libdrm.so.2.3.0<br>(cd .libs &amp;&amp; rm -f libdrm.so.2 &amp;&amp; ln -s libdrm.so.2.3.0 libdrm.so.2)<br>(cd .libs &amp;&amp; rm -f libdrm.so &amp;&amp; ln -s libdrm.so.2.3.0 libdrm.so)<br>creating 
<a href="http://libdrm.la">libdrm.la</a><br>(cd .libs &amp;&amp; rm -f <a href="http://libdrm.la">libdrm.la</a> &amp;&amp; ln -s ../libdrm.la <a href="http://libdrm.la">libdrm.la</a>)<br>make[2]: Leaving directory `/home/michael/drm/libdrm&#39;
<br>make[1]: Leaving directory `/home/michael/drm/libdrm&#39;<br>Making all in shared-core<br>make[1]: Entering directory `/home/michael/drm/shared-core&#39;<br>make[1]: Nothing to be done for `all&#39;.<br>make[1]: Leaving directory `/home/michael/drm/shared-core&#39;
<br>Making all in tests<br>make[1]: Entering directory `/home/michael/drm/tests&#39;<br>gcc -DHAVE_CONFIG_H -I. -I../libdrm&nbsp;&nbsp;&nbsp; -I ../shared-core -g -O2 -MT dristat.o -MD -MP -MF .deps/dristat.Tpo -c -o dristat.o dristat.c
<br>mv -f .deps/dristat.Tpo .deps/dristat.Po<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=compile gcc -DHAVE_CONFIG_H -I. -I../libdrm&nbsp;&nbsp;&nbsp; -I ../shared-core -g -O2 -MT drmtest.lo -MD -MP -MF .deps/drmtest.Tpo -c -o drmtest.lo drmtest.c
<br>mkdir .libs<br>&nbsp;gcc -DHAVE_CONFIG_H -I. -I../libdrm -I ../shared-core -g -O2 -MT drmtest.lo -MD -MP -MF .deps/drmtest.Tpo -c drmtest.c&nbsp; -fPIC -DPIC -o .libs/drmtest.o<br>mv -f .deps/drmtest.Tpo .deps/drmtest.Plo<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=link gcc -I ../shared-core -g -O2&nbsp;&nbsp; -o 
<a href="http://libdrmtest.la">libdrmtest.la</a>&nbsp; drmtest.lo ../libdrm/libdrm.la <br>ar cru .libs/libdrmtest.a .libs/drmtest.o<br>ranlib .libs/libdrmtest.a<br>creating <a href="http://libdrmtest.la">libdrmtest.la</a><br>(cd .libs &amp;&amp; rm -f 
<a href="http://libdrmtest.la">libdrmtest.la</a> &amp;&amp; ln -s ../libdrmtest.la <a href="http://libdrmtest.la">libdrmtest.la</a>)<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=link gcc -I ../shared-core -g -O2&nbsp;&nbsp; -o dristat dristat.o
 <a href="http://libdrmtest.la">libdrmtest.la</a> <br>gcc -I ../shared-core -g -O2 -o .libs/dristat dristat.o&nbsp; ./.libs/libdrmtest.a /home/michael/drm/libdrm/.libs/libdrm.so <br>creating dristat<br>gcc -DHAVE_CONFIG_H -I. -I../libdrm&nbsp;&nbsp;&nbsp; -I ../shared-core -g -O2 -MT 
drmstat.o -MD -MP -MF .deps/drmstat.Tpo -c -o drmstat.o drmstat.c<br>mv -f .deps/drmstat.Tpo .deps/drmstat.Po<br>/bin/sh ../libtool --tag=CC&nbsp;&nbsp; --mode=link gcc -I ../shared-core -g -O2&nbsp;&nbsp; -o drmstat drmstat.o <a href="http://libdrmtest.la">
libdrmtest.la</a> <br>gcc -I ../shared-core -g -O2 -o .libs/drmstat drmstat.o&nbsp; ./.libs/libdrmtest.a /home/michael/drm/libdrm/.libs/libdrm.so <br>creating drmstat<br>make[1]: Leaving directory `/home/michael/drm/tests&#39;
<br>make[1]: Entering directory `/home/michael/drm&#39;<br>make[1]: Nothing to be done for `all-am&#39;.<br>make[1]: Leaving directory `/home/michael/drm&#39;<br>Making install in libdrm<br>make[1]: Entering directory `/home/michael/drm/libdrm&#39;
<br>make[2]: Entering directory `/home/michael/drm/libdrm&#39;<br>make[2]: Nothing to be done for `install-exec-am&#39;.<br>test -z &quot;/usr/lib&quot; || /bin/mkdir -p &quot;/usr/lib&quot;<br>&nbsp;/bin/sh ../libtool --mode=install /usr/bin/install -c&nbsp; &#39;
<a href="http://libdrm.la">libdrm.la</a>&#39; &#39;/usr/lib/libdrm.la&#39;<br>/usr/bin/install -c .libs/libdrm.so.2.3.0 /usr/lib/libdrm.so.2.3.0<br>(cd /usr/lib &amp;&amp; { ln -s -f libdrm.so.2.3.0 libdrm.so.2 || { rm -f 
libdrm.so.2 &amp;&amp; ln -s libdrm.so.2.3.0 libdrm.so.2; }; })<br>(cd /usr/lib &amp;&amp; { ln -s -f libdrm.so.2.3.0 libdrm.so || { rm -f libdrm.so &amp;&amp; ln -s libdrm.so.2.3.0 libdrm.so; }; })<br>/usr/bin/install -c .libs/libdrm.lai /usr/lib/libdrm.la
<br>PATH=&quot;$PATH:/sbin&quot; ldconfig -n /usr/lib<br>----------------------------------------------------------------------<br>Libraries have been installed in:<br>&nbsp;&nbsp; /usr/lib<br><br>If you ever happen to want to link against installed libraries
<br>in a given directory, LIBDIR, you must either use libtool, and<br>specify the full pathname of the library, or use the `-LLIBDIR&#39;<br>flag during linking and do at least one of the following:<br>&nbsp;&nbsp; - add LIBDIR to the `LD_LIBRARY_PATH&#39; environment variable
<br>&nbsp;&nbsp;&nbsp;&nbsp; during execution<br>&nbsp;&nbsp; - add LIBDIR to the `LD_RUN_PATH&#39; environment variable<br>&nbsp;&nbsp;&nbsp;&nbsp; during linking<br>&nbsp;&nbsp; - use the `-Wl,--rpath -Wl,LIBDIR&#39; linker flag<br>&nbsp;&nbsp; - have your system administrator add LIBDIR to `/etc/ld.so.conf&#39;
<br><br>See any operating system documentation about shared libraries for<br>more information, such as the ld(1) and ld.so(8) manual pages.<br>----------------------------------------------------------------------<br>test -z &quot;/usr/include&quot; || /bin/mkdir -p &quot;/usr/include&quot;
<br>&nbsp;/usr/bin/install -c -m 644 &#39;xf86drm.h&#39; &#39;/usr/include/xf86drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;xf86mm.h&#39; &#39;/usr/include/xf86mm.h&#39;<br>make[2]: Leaving directory `/home/michael/drm/libdrm&#39;
<br>make[1]: Leaving directory `/home/michael/drm/libdrm&#39;<br>Making install in shared-core<br>make[1]: Entering directory `/home/michael/drm/shared-core&#39;<br>make[2]: Entering directory `/home/michael/drm/shared-core&#39;
<br>make[2]: Nothing to be done for `install-exec-am&#39;.<br>test -z &quot;/usr/include/drm&quot; || /bin/mkdir -p &quot;/usr/include/drm&quot;<br>&nbsp;/usr/bin/install -c -m 644 &#39;drm.h&#39; &#39;/usr/include/drm/drm.h&#39;
<br>&nbsp;/usr/bin/install -c -m 644 &#39;drm_sarea.h&#39; &#39;/usr/include/drm/drm_sarea.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;i915_drm.h&#39; &#39;/usr/include/drm/i915_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;mach64_drm.h&#39; &#39;/usr/include/drm/mach64_drm.h&#39;
<br>&nbsp;/usr/bin/install -c -m 644 &#39;mga_drm.h&#39; &#39;/usr/include/drm/mga_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;nouveau_drm.h&#39; &#39;/usr/include/drm/nouveau_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;r128_drm.h&#39; &#39;/usr/include/drm/r128_drm.h&#39;
<br>&nbsp;/usr/bin/install -c -m 644 &#39;radeon_drm.h&#39; &#39;/usr/include/drm/radeon_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;savage_drm.h&#39; &#39;/usr/include/drm/savage_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;sis_drm.h&#39; &#39;/usr/include/drm/sis_drm.h&#39;
<br>&nbsp;/usr/bin/install -c -m 644 &#39;via_drm.h&#39; &#39;/usr/include/drm/via_drm.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;r300_reg.h&#39; &#39;/usr/include/drm/r300_reg.h&#39;<br>&nbsp;/usr/bin/install -c -m 644 &#39;via_3d_reg.h&#39; &#39;/usr/include/drm/via_3d_reg.h&#39;
<br>make[2]: Leaving directory `/home/michael/drm/shared-core&#39;<br>make[1]: Leaving directory `/home/michael/drm/shared-core&#39;<br>Making install in tests<br>make[1]: Entering directory `/home/michael/drm/tests&#39;<br>
make[2]: Entering directory `/home/michael/drm/tests&#39;<br>make[2]: Nothing to be done for `install-exec-am&#39;.<br>make[2]: Nothing to be done for `install-data-am&#39;.<br>make[2]: Leaving directory `/home/michael/drm/tests&#39;
<br>make[1]: Leaving directory `/home/michael/drm/tests&#39;<br>make[1]: Entering directory `/home/michael/drm&#39;<br>make[2]: Entering directory `/home/michael/drm&#39;<br>make[2]: Nothing to be done for `install-exec-am&#39;.
<br>test -z &quot;/usr/lib/pkgconfig&quot; || /bin/mkdir -p &quot;/usr/lib/pkgconfig&quot;<br>&nbsp;/usr/bin/install -c -m 644 &#39;libdrm.pc&#39; &#39;/usr/lib/pkgconfig/libdrm.pc&#39;<br>make[2]: Leaving directory `/home/michael/drm&#39;
<br>make[1]: Leaving directory `/home/michael/drm&#39;<br><br>debian:/home/michael/drm# cd linux-core &amp;&amp; make nouveau.o<br>make DRM_MODULES=nouveau.o modules<br>make[1]: Entering directory `/home/michael/drm/linux-core&#39;
<br>sh ../scripts/create_linux_pci_lists.sh &lt; ../shared-core/drm_pciids.txt<br>make -C /lib/modules/2.6.22-1-486/build&nbsp; SUBDIRS=`pwd` DRMSRCDIR=`pwd` modules<br>make[2]: Entering directory `/usr/src/linux-headers-2.6.22-1-486
&#39;<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_auth.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_bufs.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_context.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_dma.o<br>
&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_drawable.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_drv.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_fops.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_ioctl.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_irq.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_lock.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_memory.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_proc.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_stub.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_vm.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_sysfs.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_pci.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_agpsupport.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_scatter.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_memory_debug.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/ati_pcigart.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_sman.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_hashtab.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_mm.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_object.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_compat.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_fence.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_ttm.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_bo.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/drm_bo_move.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_drv.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_state.o
<br>/home/michael/drm/linux-core/nouveau_state.c: In function 'nouveau_ioctl_getparam':<br>/home/michael/drm/linux-core/nouveau_state.c:458: warning: cast from pointer to integer of different size<br>/home/michael/drm/linux-core/nouveau_state.c: In function 'nouveau_wait_for_idle':
<br>/home/michael/drm/linux-core/nouveau_state.c:528: warning: unused variable 'pmc_e'<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_fifo.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_mem.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_object.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_irq.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_notifier.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nouveau_sgdma.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_timer.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_mc.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv40_mc.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv50_mc.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_fb.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv10_fb.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv40_fb.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_fifo.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv10_fifo.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv40_fifo.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv50_fifo.o
<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_graph.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv10_graph.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv20_graph.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv30_graph.o<br>
&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv40_graph.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv50_graph.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv04_instmem.o<br>&nbsp; CC [M]&nbsp; /home/michael/drm/linux-core/nv50_instmem.o<br>
&nbsp; LD [M]&nbsp; /home/michael/drm/linux-core/drm.o<br>&nbsp; LD [M]&nbsp; /home/michael/drm/linux-core/nouveau.o<br>&nbsp; Building modules, stage 2.<br>&nbsp; MODPOST 2 modules<br>&nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /home/michael/drm/linux-core/drm.mod.o<br>&nbsp; LD [M]&nbsp; /home/michael/drm/linux-core/drm.ko
<br>&nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /home/michael/drm/linux-core/nouveau.mod.o<br>&nbsp; LD [M]&nbsp; /home/michael/drm/linux-core/nouveau.ko<br>make[2]: Leaving directory `/usr/src/linux-headers-2.6.22-1-486&#39;<br>make[1]: Leaving directory `/home/michael/drm/linux-core&#39;
<br>debian:/home/michael/drm/linux-core# insmod drm.ko<br>insmod: error inserting &#39;drm.ko&#39;: -1 Unknown symbol in module<br><br>I use the latest available packages from Debian and I have a Nvidia TNT2 64&nbsp; video card. 
<br>

------=_Part_36456_10278647.1185828468654--

--===============1582632333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1582632333==--
