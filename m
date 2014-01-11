From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Sat, 11 Jan 2014 10:29:20 +0000
Message-ID: <bug-73473-8800-8FYEPfp3Ed@http.bugs.freedesktop.org/>
References: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937871349=="
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


--===============1937871349==
Content-Type: multipart/alternative; boundary="1389436159.Ee2e5bE0.464"; charset="us-ascii"


--1389436159.Ee2e5bE0.464
Date: Sat, 11 Jan 2014 10:29:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

--- Comment #4 from Jaak Ristioja <jaak-89mTbI93R4uuvFJfX82//w@public.gmane.org> ---
(In reply to comment #3)
> Created attachment 91834 [details] [review]
> gallium/rtasm: add support for SELinux
> 
> You're absolutely right here. Seems like there aren't many hardened/selinux
> users of the gallium drivers.
> 
> The attached patch should do the job, can you give it a try ?

I tried the patch on Mesa 5.1.9 under Gentoo.

patching file src/gallium/auxiliary/rtasm/rtasm_execmem.c
Hunk #1 succeeded at 60 (offset -1 lines).
Hunk #2 succeeded at 72 (offset -1 lines).
Hunk #3 succeeded at 90 (offset -1 lines).
Hunk #4 succeeded at 103 (offset -1 lines).
Hunk #5 succeeded at 115 (offset -1 lines).

Running headless over SSH I could not verify today that the glxgears were
actually shown in X, but here are the results I got:

$ DISPLAY=:0.0 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
29168 frames in 5.0 seconds = 5833.411 FPS
29463 frames in 5.0 seconds = 5892.528 FPS
...

This still gives the kernel message of RWX mmap being denied which is normal.

$ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears
LLVM ERROR: Allocation failed when allocating new memory in the JIT
Can't allocate RWX Memory: Operation not permitted

This also gives the kernel message, but exits immediately after with exit
status 1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389436159.Ee2e5bE0.464
Date: Sat, 11 Jan 2014 10:29:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">bug 73473</a>
              from <span class="vcard"><a class="email" href="mailto:jaak&#64;ristioja.ee" title="Jaak Ristioja &lt;jaak&#64;ristioja.ee&gt;"> <span class="fn">Jaak Ristioja</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73473#c3">comment #3</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=91834" name="attach_91834" title="gallium/rtasm: add support for SELinux">attachment 91834</a> <a href="attachment.cgi?id=91834&amp;action=edit" title="gallium/rtasm: add support for SELinux">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73473&amp;attachment=91834'>[review]</a> [review]
&gt; gallium/rtasm: add support for SELinux
&gt; 
&gt; You're absolutely right here. Seems like there aren't many hardened/selinux
&gt; users of the gallium drivers.
&gt; 
&gt; The attached patch should do the job, can you give it a try ?</span >

I tried the patch on Mesa 5.1.9 under Gentoo.

patching file src/gallium/auxiliary/rtasm/rtasm_execmem.c
Hunk #1 succeeded at 60 (offset -1 lines).
Hunk #2 succeeded at 72 (offset -1 lines).
Hunk #3 succeeded at 90 (offset -1 lines).
Hunk #4 succeeded at 103 (offset -1 lines).
Hunk #5 succeeded at 115 (offset -1 lines).

Running headless over SSH I could not verify today that the glxgears were
actually shown in X, but here are the results I got:

$ DISPLAY=:0.0 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
29168 frames in 5.0 seconds = 5833.411 FPS
29463 frames in 5.0 seconds = 5892.528 FPS
...

This still gives the kernel message of RWX mmap being denied which is normal.

$ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears
LLVM ERROR: Allocation failed when allocating new memory in the JIT
Can't allocate RWX Memory: Operation not permitted

This also gives the kernel message, but exits immediately after with exit
status 1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389436159.Ee2e5bE0.464--

--===============1937871349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1937871349==--
