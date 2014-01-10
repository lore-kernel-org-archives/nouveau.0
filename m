From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Fri, 10 Jan 2014 15:38:53 +0000
Message-ID: <bug-73473-8800-rjLLy2FpEg@http.bugs.freedesktop.org/>
References: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0448181854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73473-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0448181854==
Content-Type: multipart/alternative; boundary="1389368332.E3ad650.13400"; charset="us-ascii"


--1389368332.E3ad650.13400
Date: Fri, 10 Jan 2014 15:38:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

--- Comment #2 from Jaak Ristioja <jaak-89mTbI93R4uuvFJfX82//w@public.gmane.org> ---
(In reply to comment #1)
> If you're getting consistent crashes in glxgears I would recommend using gdb
> to get a backtrace of the problem.

I wish I could but gdb only shows ?? in backtrace:

(gdb) thread apply all bt full

Thread 1 (process 2782):
#0  0x00006a0a172d4901 in ?? ()
No symbol table info available.
#1  0x0000000000000000 in ?? ()
No symbol table info available.

> With that said, I suspect that the problems is elsewhere for a few reasons
> * There are more than a handful cases when mmap fails and I have yet to
> notice after 3+ years constant use of nouveau any glxgears segfaults.
> * I would suspect other mesa users will be affected and this problem would
> be well know/resolved by now.
> 
> Apart from the backtrace would you mind attaching your dmesg output after
> the problem/segfault ?

[17407.732321] grsec: From 5.4.2.83: denied RWX mmap of <anonymous mapping> by
/usr/bin/glxgears[glxgears:2866] uid/euid:1000/1000 gid/egid:100/100, parent
/bin/bash[bash:2860] uid/euid:1000/1000 gid/egid:100/100
[17407.732328] glxgears[2866]: segfault at ffffffffffffffff ip 0000685b13c99901
sp 000077a968f66e50 error 7 in nouveau_dri.so[685b1381f000+136c000]
[17407.732342] grsec: From 5.4.2.83: Segmentation fault occurred at
ffffffffffffffff in /usr/bin/glxgears[glxgears:2866] uid/euid:1000/1000
gid/egid:100/100, parent /bin/bash[bash:2860] uid/euid:1000/1000
gid/egid:100/100
[17407.732356] grsec: From 5.4.2.83: denied resource overstep by requesting
4096 for RLIMIT_CORE against limit 0 for /usr/bin/glxgears[glxgears:2866]
uid/euid:1000/1000 gid/egid:100/100, parent /bin/bash[bash:2860]
uid/euid:1000/1000 gid/egid:100/100

So it appears to try to read memory at ffffffffffffffff (i.e. -1 alias
MAP_FAILED). It doesn't matter why mmap fails (EPERM). What matters is that it
is documented that it may fail, but errors do not appear to be handled in code.

I don't think Gentoo should be expected to mark every single application using
OpenGL to be allowed mmap RWX memory. I use Intel + OpenGL on my Gentoo
Hardened laptop with no problems.

> Can you reproduce with the swrast driver ?
> $ LIBGL_ALWAYS_SOFTWARE=1 glxgears

$ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears; echo $?
LLVM ERROR: Allocation failed when allocating new memory in the JIT
Can't allocate RWX Memory: Operation not permitted
1

I'm using Hardened Gentoo (kernel is vanilla-3.12.6 + genpatches-3.12-7 +
grsecurity-3.0-3.12.6-201401021726; gcc --version is "gcc (Gentoo Hardened
4.7.3-r1 p1.4, pie-0.5.5) 4.7.3").

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389368332.E3ad650.13400
Date: Fri, 10 Jan 2014 15:38:52 +0000
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
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">bug 73473</a>
              from <span class="vcard"><a class="email" href="mailto:jaak&#64;ristioja.ee" title="Jaak Ristioja &lt;jaak&#64;ristioja.ee&gt;"> <span class="fn">Jaak Ristioja</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73473#c1">comment #1</a>)
<span class="quote">&gt; If you're getting consistent crashes in glxgears I would recommend using gdb
&gt; to get a backtrace of the problem.</span >

I wish I could but gdb only shows ?? in backtrace:

(gdb) thread apply all bt full

Thread 1 (process 2782):
#0  0x00006a0a172d4901 in ?? ()
No symbol table info available.
#1  0x0000000000000000 in ?? ()
No symbol table info available.

<span class="quote">&gt; With that said, I suspect that the problems is elsewhere for a few reasons
&gt; * There are more than a handful cases when mmap fails and I have yet to
&gt; notice after 3+ years constant use of nouveau any glxgears segfaults.
&gt; * I would suspect other mesa users will be affected and this problem would
&gt; be well know/resolved by now.
&gt; 
&gt; Apart from the backtrace would you mind attaching your dmesg output after
&gt; the problem/segfault ?</span >

[17407.732321] grsec: From 5.4.2.83: denied RWX mmap of &lt;anonymous mapping&gt; by
/usr/bin/glxgears[glxgears:2866] uid/euid:1000/1000 gid/egid:100/100, parent
/bin/bash[bash:2860] uid/euid:1000/1000 gid/egid:100/100
[17407.732328] glxgears[2866]: segfault at ffffffffffffffff ip 0000685b13c99901
sp 000077a968f66e50 error 7 in nouveau_dri.so[685b1381f000+136c000]
[17407.732342] grsec: From 5.4.2.83: Segmentation fault occurred at
ffffffffffffffff in /usr/bin/glxgears[glxgears:2866] uid/euid:1000/1000
gid/egid:100/100, parent /bin/bash[bash:2860] uid/euid:1000/1000
gid/egid:100/100
[17407.732356] grsec: From 5.4.2.83: denied resource overstep by requesting
4096 for RLIMIT_CORE against limit 0 for /usr/bin/glxgears[glxgears:2866]
uid/euid:1000/1000 gid/egid:100/100, parent /bin/bash[bash:2860]
uid/euid:1000/1000 gid/egid:100/100

So it appears to try to read memory at ffffffffffffffff (i.e. -1 alias
MAP_FAILED). It doesn't matter why mmap fails (EPERM). What matters is that it
is documented that it may fail, but errors do not appear to be handled in code.

I don't think Gentoo should be expected to mark every single application using
OpenGL to be allowed mmap RWX memory. I use Intel + OpenGL on my Gentoo
Hardened laptop with no problems.

<span class="quote">&gt; Can you reproduce with the swrast driver ?
&gt; $ LIBGL_ALWAYS_SOFTWARE=1 glxgears</span >

$ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears; echo $?
LLVM ERROR: Allocation failed when allocating new memory in the JIT
Can't allocate RWX Memory: Operation not permitted
1

I'm using Hardened Gentoo (kernel is vanilla-3.12.6 + genpatches-3.12-7 +
grsecurity-3.0-3.12.6-201401021726; gcc --version is &quot;gcc (Gentoo Hardened
4.7.3-r1 p1.4, pie-0.5.5) 4.7.3&quot;).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389368332.E3ad650.13400--

--===============0448181854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0448181854==--
