From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74648] [NV86] Ultima IX (wine) movie playback
	crashes game
Date: Sat, 15 Feb 2014 22:29:15 +0000
Message-ID: <bug-74648-8800-6TtI3MzFDB@http.bugs.freedesktop.org/>
References: <bug-74648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1528280485=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74648-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1528280485==
Content-Type: multipart/alternative; boundary="1392503355.15463e02.23258"; charset="us-ascii"


--1392503355.15463e02.23258
Date: Sat, 15 Feb 2014 22:29:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74648

--- Comment #3 from Christopher Thielen <christopher-XP3JB3hj9piIwRZHo2/mJg@public.gmane.org> ---
I'm having trouble building Mesa-9.2.5. I can try from the source RPM if I
can't get this working but:

Untarred the package and built with --enable-32-bit and --enable-debug. Got a
complaint about not having aclocal-1.14 (Fedora 20 has aclocal-1.13, but it's
strange aclocal is required as I didn't touch configure.ac). Had to run
'autoreconf -fi', then ./configure with the two flags again and that got it
building.

Ran into a linking error though (note that I _have_ the i686 version of glibc
installed as well as the x86_64):

  CPPAS    sse_xform2.lo
  CPPAS    sse_xform3.lo
  CPPAS    sse_xform4.lo
  CPPAS    sse_normal.lo
  CPPAS    read_rgba_span_x86.lo
  CXXLD    libdricore9.2.5.la
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/libstdc++.so when searching for -lstdc++
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libm.so when searching
for -lm
/bin/ld: skipping incompatible /lib/../lib64/libm.so when searching for -lm
/bin/ld: skipping incompatible /usr/lib/../lib64/libm.so when searching for -lm
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libc.so when searching
for -lc
/bin/ld: skipping incompatible /lib/../lib64/libc.so when searching for -lc
/bin/ld: skipping incompatible /usr/lib/../lib64/libc.so when searching for -lc
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/libgcc_s.so when searching for -lgcc_s
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crti.o' is
incompatible with i386 output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtbeginS.o' is incompatible with i386
output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtendS.o' is incompatible with i386
output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crtn.o' is
incompatible with i386 output
collect2: error: ld returned 1 exit status
gmake[4]: *** [libdricore9.2.5.la] Error 1
gmake[4]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa/libdricore'
gmake[3]: *** [all-recursive] Error 1
gmake[3]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa'
gmake[2]: *** [all] Error 2
gmake[2]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa'
gmake[1]: *** [all-recursive] Error 1
gmake[1]: Leaving directory `/usr/local/src/Mesa-9.2.5/src'
gmake: *** [all-recursive] Error 1

Any idea what's going on?

Out of curiosity, is the reason you need this Mesa to be 32-bit because Wine
runs in 32-bit mode? Wouldn't a 32-bit Xorg application still make calls to a
64-bit Xorg and 64-bit Xorg Nouveau driver just fine? I'm not too knowledgable
on these matters however.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392503355.15463e02.23258
Date: Sat, 15 Feb 2014 22:29:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648">bug 74648</a>
              from <span class="vcard"><a class="email" href="mailto:christopher&#64;thielen.co" title="Christopher Thielen &lt;christopher&#64;thielen.co&gt;"> <span class="fn">Christopher Thielen</span></a>
</span></b>
        <pre>I'm having trouble building Mesa-9.2.5. I can try from the source RPM if I
can't get this working but:

Untarred the package and built with --enable-32-bit and --enable-debug. Got a
complaint about not having aclocal-1.14 (Fedora 20 has aclocal-1.13, but it's
strange aclocal is required as I didn't touch configure.ac). Had to run
'autoreconf -fi', then ./configure with the two flags again and that got it
building.

Ran into a linking error though (note that I _have_ the i686 version of glibc
installed as well as the x86_64):

  CPPAS    sse_xform2.lo
  CPPAS    sse_xform3.lo
  CPPAS    sse_xform4.lo
  CPPAS    sse_normal.lo
  CPPAS    read_rgba_span_x86.lo
  CXXLD    libdricore9.2.5.la
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/libstdc++.so when searching for -lstdc++
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libm.so when searching
for -lm
/bin/ld: skipping incompatible /lib/../lib64/libm.so when searching for -lm
/bin/ld: skipping incompatible /usr/lib/../lib64/libm.so when searching for -lm
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libc.so when searching
for -lc
/bin/ld: skipping incompatible /lib/../lib64/libc.so when searching for -lc
/bin/ld: skipping incompatible /usr/lib/../lib64/libc.so when searching for -lc
/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-redhat-linux/4.8.2/libgcc_s.so when searching for -lgcc_s
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crti.o' is
incompatible with i386 output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtbeginS.o' is incompatible with i386
output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtendS.o' is incompatible with i386
output
/bin/ld: i386:x86-64 architecture of input file
`/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crtn.o' is
incompatible with i386 output
collect2: error: ld returned 1 exit status
gmake[4]: *** [libdricore9.2.5.la] Error 1
gmake[4]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa/libdricore'
gmake[3]: *** [all-recursive] Error 1
gmake[3]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa'
gmake[2]: *** [all] Error 2
gmake[2]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/mesa'
gmake[1]: *** [all-recursive] Error 1
gmake[1]: Leaving directory `/usr/local/src/Mesa-9.2.5/src'
gmake: *** [all-recursive] Error 1

Any idea what's going on?

Out of curiosity, is the reason you need this Mesa to be 32-bit because Wine
runs in 32-bit mode? Wouldn't a 32-bit Xorg application still make calls to a
64-bit Xorg and 64-bit Xorg Nouveau driver just fine? I'm not too knowledgable
on these matters however.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392503355.15463e02.23258--

--===============1528280485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1528280485==--
