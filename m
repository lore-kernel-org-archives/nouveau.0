From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74648] [NV86] Ultima IX (wine) movie playback
	crashes game
Date: Sat, 15 Feb 2014 22:36:41 +0000
Message-ID: <bug-74648-8800-vtbkosNpnW@http.bugs.freedesktop.org/>
References: <bug-74648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0613070380=="
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


--===============0613070380==
Content-Type: multipart/alternative; boundary="1392503801.1F8f3cD2.24986"; charset="us-ascii"


--1392503801.1F8f3cD2.24986
Date: Sat, 15 Feb 2014 22:36:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74648

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> I'm having trouble building Mesa-9.2.5. I can try from the source RPM if I
> can't get this working but:
> 
> Untarred the package and built with --enable-32-bit and --enable-debug. Got
> a complaint about not having aclocal-1.14 (Fedora 20 has aclocal-1.13, but
> it's strange aclocal is required as I didn't touch configure.ac). Had to run
> 'autoreconf -fi', then ./configure with the two flags again and that got it
> building.
> 
> Ran into a linking error though (note that I _have_ the i686 version of
> glibc installed as well as the x86_64):
> 
>   CPPAS    sse_xform2.lo
>   CPPAS    sse_xform3.lo
>   CPPAS    sse_xform4.lo
>   CPPAS    sse_normal.lo
>   CPPAS    read_rgba_span_x86.lo
>   CXXLD    libdricore9.2.5.la
> /bin/ld: skipping incompatible
> /usr/lib/gcc/x86_64-redhat-linux/4.8.2/libstdc++.so when searching for
> -lstdc++
> /bin/ld: skipping incompatible
> /usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libm.so when
> searching for -lm
> /bin/ld: skipping incompatible /lib/../lib64/libm.so when searching for -lm
> /bin/ld: skipping incompatible /usr/lib/../lib64/libm.so when searching for
> -lm
> /bin/ld: skipping incompatible
> /usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libc.so when
> searching for -lc
> /bin/ld: skipping incompatible /lib/../lib64/libc.so when searching for -lc
> /bin/ld: skipping incompatible /usr/lib/../lib64/libc.so when searching for
> -lc
> /bin/ld: skipping incompatible
> /usr/lib/gcc/x86_64-redhat-linux/4.8.2/libgcc_s.so when searching for -lgcc_s
> /bin/ld: i386:x86-64 architecture of input file
> `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crti.o' is
> incompatible with i386 output
> /bin/ld: i386:x86-64 architecture of input file
> `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtbeginS.o' is incompatible with
> i386 output
> /bin/ld: i386:x86-64 architecture of input file
> `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtendS.o' is incompatible with i386
> output
> /bin/ld: i386:x86-64 architecture of input file
> `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crtn.o' is
> incompatible with i386 output
> collect2: error: ld returned 1 exit status
> 
> Any idea what's going on?

Not familiar with this linker error, sorry. However SOMEONE is sticking their
x86_64 nose into an i386 build where it doesn't belong. Did you do
CFLAGS="-m32" CXXFLAGS="-m32"? Oh, perhaps you also need to do LDFLAGS="-m32"
as well?

e.g.

./configure --enable-32-bit --enable-debug CFLAGS="-m32" CXXFLAGS="-m32"
LDFLAGS="-m32"


> 
> Out of curiosity, is the reason you need this Mesa to be 32-bit because Wine
> runs in 32-bit mode? Wouldn't a 32-bit Xorg application still make calls to
> a 64-bit Xorg and 64-bit Xorg Nouveau driver just fine? I'm not too
> knowledgable on these matters however.

What you're saying is all true. The problem is that wine links against libGL,
which must be 32-bit, which in turn includes all the nouveau mesa stuff, which
in turn must also be 32-bit. No Xorg interactions involved :) (Well, a few, to
get surfaces to draw to/etc.) I guess the problem with you reasoning is that
"nouveau driver" is not a well-defined term. Could be the kernel, ddx, or mesa
(or libdrm).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392503801.1F8f3cD2.24986
Date: Sat, 15 Feb 2014 22:36:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648">bug 74648</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74648#c3">comment #3</a>)
<span class="quote">&gt; I'm having trouble building Mesa-9.2.5. I can try from the source RPM if I
&gt; can't get this working but:
&gt; 
&gt; Untarred the package and built with --enable-32-bit and --enable-debug. Got
&gt; a complaint about not having aclocal-1.14 (Fedora 20 has aclocal-1.13, but
&gt; it's strange aclocal is required as I didn't touch configure.ac). Had to run
&gt; 'autoreconf -fi', then ./configure with the two flags again and that got it
&gt; building.
&gt; 
&gt; Ran into a linking error though (note that I _have_ the i686 version of
&gt; glibc installed as well as the x86_64):
&gt; 
&gt;   CPPAS    sse_xform2.lo
&gt;   CPPAS    sse_xform3.lo
&gt;   CPPAS    sse_xform4.lo
&gt;   CPPAS    sse_normal.lo
&gt;   CPPAS    read_rgba_span_x86.lo
&gt;   CXXLD    libdricore9.2.5.la
&gt; /bin/ld: skipping incompatible
&gt; /usr/lib/gcc/x86_64-redhat-linux/4.8.2/libstdc++.so when searching for
&gt; -lstdc++
&gt; /bin/ld: skipping incompatible
&gt; /usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libm.so when
&gt; searching for -lm
&gt; /bin/ld: skipping incompatible /lib/../lib64/libm.so when searching for -lm
&gt; /bin/ld: skipping incompatible /usr/lib/../lib64/libm.so when searching for
&gt; -lm
&gt; /bin/ld: skipping incompatible
&gt; /usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/libc.so when
&gt; searching for -lc
&gt; /bin/ld: skipping incompatible /lib/../lib64/libc.so when searching for -lc
&gt; /bin/ld: skipping incompatible /usr/lib/../lib64/libc.so when searching for
&gt; -lc
&gt; /bin/ld: skipping incompatible
&gt; /usr/lib/gcc/x86_64-redhat-linux/4.8.2/libgcc_s.so when searching for -lgcc_s
&gt; /bin/ld: i386:x86-64 architecture of input file
&gt; `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crti.o' is
&gt; incompatible with i386 output
&gt; /bin/ld: i386:x86-64 architecture of input file
&gt; `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtbeginS.o' is incompatible with
&gt; i386 output
&gt; /bin/ld: i386:x86-64 architecture of input file
&gt; `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/crtendS.o' is incompatible with i386
&gt; output
&gt; /bin/ld: i386:x86-64 architecture of input file
&gt; `/usr/lib/gcc/x86_64-redhat-linux/4.8.2/../../../../lib64/crtn.o' is
&gt; incompatible with i386 output
&gt; collect2: error: ld returned 1 exit status
&gt; 
&gt; Any idea what's going on?</span >

Not familiar with this linker error, sorry. However SOMEONE is sticking their
x86_64 nose into an i386 build where it doesn't belong. Did you do
CFLAGS=&quot;-m32&quot; CXXFLAGS=&quot;-m32&quot;? Oh, perhaps you also need to do LDFLAGS=&quot;-m32&quot;
as well?

e.g.

./configure --enable-32-bit --enable-debug CFLAGS=&quot;-m32&quot; CXXFLAGS=&quot;-m32&quot;
LDFLAGS=&quot;-m32&quot;


<span class="quote">&gt; 
&gt; Out of curiosity, is the reason you need this Mesa to be 32-bit because Wine
&gt; runs in 32-bit mode? Wouldn't a 32-bit Xorg application still make calls to
&gt; a 64-bit Xorg and 64-bit Xorg Nouveau driver just fine? I'm not too
&gt; knowledgable on these matters however.</span >

What you're saying is all true. The problem is that wine links against libGL,
which must be 32-bit, which in turn includes all the nouveau mesa stuff, which
in turn must also be 32-bit. No Xorg interactions involved :) (Well, a few, to
get surfaces to draw to/etc.) I guess the problem with you reasoning is that
&quot;nouveau driver&quot; is not a well-defined term. Could be the kernel, ddx, or mesa
(or libdrm).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392503801.1F8f3cD2.24986--

--===============0613070380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0613070380==--
