From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Tue, 24 Feb 2009 13:35:06 +0300
Message-ID: <49A3CD5A.1050905@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>	
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>	
	<49996AD8.2010602@gmail.com>
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
	<499AFA48.3070007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <499AFA48.3070007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Have made a next try.
The nouveau_drv.so compiles for PPC32 while I need PPC64. Is it able to 
be compiled for PPC64?
The autogen.sh output is below. When I've been trying to rebuild the 
kernel, sizeof(void*) was 8, but for nouveau_drv.so it is 4 bytes As my 
PCI BARs are behind 4GB, it is the problem.

Any clues?


[root@localhost xf86-video-nouveau]# ./autogen.sh --prefix=/opt/gfx-test
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal -I /opt/gfx-test/share/aclocal
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy
libtoolize: `config.guess' exists: use `--force' to overwrite
libtoolize: `config.sub' exists: use `--force' to overwrite
libtoolize: `ltmain.sh' exists: use `--force' to overwrite
autoreconf: running: /usr/bin/autoconf
autoreconf: running: /usr/bin/autoheader
autoreconf: running: automake --add-missing --copy --no-force
autoreconf: Leaving directory `.'
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking build system type... powerpc64-unknown-linux-gnu
checking host system type... powerpc64-unknown-linux-gnu
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
checking for gfortran... gfortran
checking whether we are using the GNU Fortran 77 compiler... yes
checking whether gfortran accepts -g... yes
checking the maximum length of command line arguments... 1966080
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
checking whether the gcc linker (/usr/bin/ld -m elf32ppclinux) supports 
shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by g++... /usr/bin/ld -m elf32ppclinux
checking if the linker (/usr/bin/ld -m elf32ppclinux) is GNU ld... yes
checking whether the g++ linker (/usr/bin/ld -m elf32ppclinux) supports 
shared libraries... yes
checking for g++ option to produce PIC... -fPIC
checking if g++ PIC flag -fPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking whether the g++ linker (/usr/bin/ld -m elf32ppclinux) supports 
shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
(cached) (cached) checking how to hardcode library paths into 
programs... immediate
appending configuration tag "F77" to libtool
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for gfortran option to produce PIC... -fPIC
checking if gfortran PIC flag -fPIC works... yes
checking if gfortran static flag -static works... yes
checking if gfortran supports -c -o file.o... yes
checking whether the gfortran linker (/usr/bin/ld -m elf32ppclinux) 
supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
(cached) (cached) checking how to hardcode library paths into 
programs... immediate
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking if RANDR is defined... yes
checking if RENDER is defined... yes
checking if XV is defined... yes
checking if DPMSExtension is defined... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for LIBDRM_NOUVEAU... yes
checking for XORG... yes
checking whether XSERVER_LIBPCIACCESS is declared... yes
checking for PCIACCESS... yes
checking for ANSI C header files... (cached) yes
checking for DRM modesetting... yes
checking for xf86drmMode.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating man/Makefile
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands

[root@localhost xf86-video-nouveau]# uname -a
Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue Feb 10 14:55:56 EST 
2009 ppc64 ppc64 ppc64 GNU/Linux



aik wrote:
> So, with the help of the community, I've got all the binaries compiled 
> and ready-to-run. But it crashes in the very beginning. So the 
> question is - what does nouveau expect from the system BIOS to get 
> started (if it does)? I'm asking because I know for sure that the BIOS 
> I have does support video very limited and I'm not sure that the 
> support implemented at the moment is enough to get X.org up.
>
> Also, I've heard an opinion that X.org cannot work with the cards 
> mapped behind 4GB range. My server maps all the PCI devices there (see 
> the lspci output). Can anybody comment on that?
>
>
