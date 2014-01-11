From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Sat, 11 Jan 2014 13:12:08 +0000
Message-ID: <bug-73473-8800-5WrzfdfjGC@http.bugs.freedesktop.org/>
References: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1578006587=="
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


--===============1578006587==
Content-Type: multipart/alternative; boundary="1389445927.311d1.22574"; charset="us-ascii"


--1389445927.311d1.22574
Date: Sat, 11 Jan 2014 13:12:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> (In reply to comment #3)
> > Created attachment 91834 [details] [review] [review]
> > gallium/rtasm: add support for SELinux
> > 
> > You're absolutely right here. Seems like there aren't many hardened/selinux
> > users of the gallium drivers.
> > 
> > The attached patch should do the job, can you give it a try ?
> 
> I tried the patch on Mesa 5.1.9 under Gentoo.
> 
I hope you mean 9.1.5 here :)

> patching file src/gallium/auxiliary/rtasm/rtasm_execmem.c
> Hunk #1 succeeded at 60 (offset -1 lines).
> Hunk #2 succeeded at 72 (offset -1 lines).
> Hunk #3 succeeded at 90 (offset -1 lines).
> Hunk #4 succeeded at 103 (offset -1 lines).
> Hunk #5 succeeded at 115 (offset -1 lines).
> 
> Running headless over SSH I could not verify today that the glxgears were
> actually shown in X, but here are the results I got:
> 
> $ DISPLAY=:0.0 glxgears
> Running synchronized to the vertical refresh.  The framerate should be
> approximately the same as the monitor refresh rate.
> 29168 frames in 5.0 seconds = 5833.411 FPS
> 29463 frames in 5.0 seconds = 5892.528 FPS
> ...
> 
> This still gives the kernel message of RWX mmap being denied which is normal.
> 
Great, thanks.

> $ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears
> LLVM ERROR: Allocation failed when allocating new memory in the JIT
> Can't allocate RWX Memory: Operation not permitted
> 
> This also gives the kernel message, but exits immediately after with exit
> status 1.
I'm guessing that some work may be needed for LLVM.

(In reply to comment #5)
> PS: I'm not using selinux. So I guess I'm unable to test that part of the
> patch.
I thought that was the case. Either way big thanks for the report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389445927.311d1.22574
Date: Sat, 11 Jan 2014 13:12:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">bug 73473</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73473#c4">comment #4</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73473#c3">comment #3</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=91834" name="attach_91834" title="gallium/rtasm: add support for SELinux">attachment 91834</a> <a href="attachment.cgi?id=91834&amp;action=edit" title="gallium/rtasm: add support for SELinux">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73473&amp;attachment=91834'>[review]</a> [review] [review]
&gt; &gt; gallium/rtasm: add support for SELinux
&gt; &gt; 
&gt; &gt; You're absolutely right here. Seems like there aren't many hardened/selinux
&gt; &gt; users of the gallium drivers.
&gt; &gt; 
&gt; &gt; The attached patch should do the job, can you give it a try ?
&gt; 
&gt; I tried the patch on Mesa 5.1.9 under Gentoo.
&gt; </span >
I hope you mean 9.1.5 here :)

<span class="quote">&gt; patching file src/gallium/auxiliary/rtasm/rtasm_execmem.c
&gt; Hunk #1 succeeded at 60 (offset -1 lines).
&gt; Hunk #2 succeeded at 72 (offset -1 lines).
&gt; Hunk #3 succeeded at 90 (offset -1 lines).
&gt; Hunk #4 succeeded at 103 (offset -1 lines).
&gt; Hunk #5 succeeded at 115 (offset -1 lines).
&gt; 
&gt; Running headless over SSH I could not verify today that the glxgears were
&gt; actually shown in X, but here are the results I got:
&gt; 
&gt; $ DISPLAY=:0.0 glxgears
&gt; Running synchronized to the vertical refresh.  The framerate should be
&gt; approximately the same as the monitor refresh rate.
&gt; 29168 frames in 5.0 seconds = 5833.411 FPS
&gt; 29463 frames in 5.0 seconds = 5892.528 FPS
&gt; ...
&gt; 
&gt; This still gives the kernel message of RWX mmap being denied which is normal.
&gt; </span >
Great, thanks.

<span class="quote">&gt; $ DISPLAY=:0.0 LIBGL_ALWAYS_SOFTWARE=1 glxgears
&gt; LLVM ERROR: Allocation failed when allocating new memory in the JIT
&gt; Can't allocate RWX Memory: Operation not permitted
&gt; 
&gt; This also gives the kernel message, but exits immediately after with exit
&gt; status 1.</span >
I'm guessing that some work may be needed for LLVM.

(In reply to <a href="show_bug.cgi?id=73473#c5">comment #5</a>)
<span class="quote">&gt; PS: I'm not using selinux. So I guess I'm unable to test that part of the
&gt; patch.</span >
I thought that was the case. Either way big thanks for the report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389445927.311d1.22574--

--===============1578006587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1578006587==--
