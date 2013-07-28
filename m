From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 28 Jul 2013 21:22:24 +0000
Message-ID: <bug-67051-8800-lH4QZyCW2C@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741454813=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1741454813==
Content-Type: multipart/alternative; boundary="1375046544.6ce80.20207"; charset="us-ascii"


--1375046544.6ce80.20207
Date: Sun, 28 Jul 2013 21:22:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #104 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Note for Alex
> The attached patch will also resolve your issue (not guaranteed to apply
> cleanly)

Confirmed:)
[/linux-3.10.1]$ patch -p1 < /home/alex/EmilVelikov.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Hunk #2 FAILED at 56.
1 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c.rej
1

> due to the fact that it purges some code unnecessary code, which you were (unintentionally) hitting :)

As to the compile (make) step:

Whether:
1. hdmi-1 + hdminva3 + debug-3 + EmilVelikov
or
2. hdmi-1 + hdminva3 + debug-3 + mthd-1 + EmilVelikov

the compile fails (unintentionally:) with

  CC [M]  drivers/gpu/drm/nouveau/core/engine/disp/sornv50.o
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c: In function
'nv50_sor_mthd':drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1:
error: 'type' undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1: note: each undeclared
identifier is reported only once for each function it appears in
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1: error: 'link'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:30: error: 'bios'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:42: error: 'mask'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:49: error: 'ver'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:55: error: 'hdr'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:61: error: 'outp'
undeclared (first use in this function)
make[4]: *** [drivers/gpu/drm/nouveau/core/engine/disp/sornv50.o] Error 1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375046544.6ce80.20207
Date: Sun, 28 Jul 2013 21:22:24 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c104">Comment # 104</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre><span class="quote">&gt; Note for Alex
&gt; The attached patch will also resolve your issue (not guaranteed to apply
&gt; cleanly)</span >

Confirmed:)
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/EmilVelikov.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Hunk #2 FAILED at 56.
1 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c.rej
1

<span class="quote">&gt; due to the fact that it purges some code unnecessary code, which you were (unintentionally) hitting :)</span >

As to the compile (make) step:

Whether:
1. hdmi-1 + hdminva3 + debug-3 + EmilVelikov
or
2. hdmi-1 + hdminva3 + debug-3 + mthd-1 + EmilVelikov

the compile fails (unintentionally:) with

  CC [M]  drivers/gpu/drm/nouveau/core/engine/disp/sornv50.o
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c: In function
'nv50_sor_mthd':drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1:
error: 'type' undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1: note: each undeclared
identifier is reported only once for each function it appears in
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:60:1: error: 'link'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:30: error: 'bios'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:42: error: 'mask'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:49: error: 'ver'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:55: error: 'hdr'
undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:61:61: error: 'outp'
undeclared (first use in this function)
make[4]: *** [drivers/gpu/drm/nouveau/core/engine/disp/sornv50.o] Error 1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375046544.6ce80.20207--

--===============1741454813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1741454813==--
