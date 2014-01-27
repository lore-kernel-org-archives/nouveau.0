From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Mon, 27 Jan 2014 13:24:49 +0000
Message-ID: <bug-73473-8800-UXYgo4JrbO@http.bugs.freedesktop.org/>
References: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1072741146=="
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


--===============1072741146==
Content-Type: multipart/alternative; boundary="1390829088.80c2Eb61.8825"; charset="us-ascii"


--1390829088.80c2Eb61.8825
Date: Mon, 27 Jan 2014 13:24:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yay the crash should happen no more

commit 4dd445f1cf80292f10eda53665cefc2a674d838d
Author: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri Jan 10 18:00:17 2014 +0000

    gallium/rtasm: handle mmap failures appropriately

    For a variety of reasons mmap (selinux and pax to name
    a few) and can fail and with current code. This will
    result in a crash in the driver, if not worse.

    This has been the case since the inception of the
    gallium copy of rtasm.

    Cc: 9.1 9.2 10.0 <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=73473

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390829088.80c2Eb61.8825
Date: Mon, 27 Jan 2014 13:24:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">bug 73473</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Yay the crash should happen no more

commit 4dd445f1cf80292f10eda53665cefc2a674d838d
Author: Emil Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">emil.l.velikov&#64;gmail.com</a>&gt;
Date:   Fri Jan 10 18:00:17 2014 +0000

    gallium/rtasm: handle mmap failures appropriately

    For a variety of reasons mmap (selinux and pax to name
    a few) and can fail and with current code. This will
    result in a crash in the driver, if not worse.

    This has been the case since the inception of the
    gallium copy of rtasm.

    Cc: 9.1 9.2 10.0 &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;
    Bugzilla: <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="show_bug.cgi?id=73473">https://bugs.freedesktop.org/show_bug.cgi?id=73473</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390829088.80c2Eb61.8825--

--===============1072741146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1072741146==--
