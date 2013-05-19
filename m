From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Sun, 19 May 2013 20:02:17 +0000
Message-ID: <bug-62914-8800-6nspW5sIfg@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0452706297=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0452706297==
Content-Type: multipart/alternative; boundary="1368993736.6c1731.29772"; charset="us-ascii"


--1368993736.6c1731.29772
Date: Sun, 19 May 2013 20:02:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
An alternative to bisecting: you know where the crash is, it's at

[   360.877] (EE) 3: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f24ae751000+0x255c0) [0x7f24ae7765c0]
[   360.877] (EE) 4: /usr/bin/X (xf86CrtcSetModeTransform+0x12a) [0x4aad4a]

So load up nouveau_drv.so in gdb (gdb
/usr/local/lib/xorg/modules/drivers/nouveau_drv.so)

And inside gdb, run

disassemble 0x255c0

That should tell you what function it's dying in, and the exact instructions
it's dying on. This is what I did for bug 63263 (see my initial comment there),
and that was able to pinpoint the crash exactly. (Of course figuring out the
circumstances that lead to that condition can be trickier to work out.)

You can also compile the whole thing with -g, e.g. ./configure CFLAGS=-g or
something like that. And make sure that the final thing isn't stripped. That
might make gdb more cooperative if you're having trouble.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368993736.6c1731.29772
Date: Sun, 19 May 2013 20:02:16 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>An alternative to bisecting: you know where the crash is, it's at

[   360.877] (EE) 3: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f24ae751000+0x255c0) [0x7f24ae7765c0]
[   360.877] (EE) 4: /usr/bin/X (xf86CrtcSetModeTransform+0x12a) [0x4aad4a]

So load up nouveau_drv.so in gdb (gdb
/usr/local/lib/xorg/modules/drivers/nouveau_drv.so)

And inside gdb, run

disassemble 0x255c0

That should tell you what function it's dying in, and the exact instructions
it's dying on. This is what I did for <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="show_bug.cgi?id=63263">bug 63263</a> (see my initial comment there),
and that was able to pinpoint the crash exactly. (Of course figuring out the
circumstances that lead to that condition can be trickier to work out.)

You can also compile the whole thing with -g, e.g. ./configure CFLAGS=-g or
something like that. And make sure that the final thing isn't stripped. That
might make gdb more cooperative if you're having trouble.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368993736.6c1731.29772--

--===============0452706297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0452706297==--
