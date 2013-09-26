From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69830] [NVC1] Kernel 3.11 and newer hang at X11
 start (bisected)
Date: Thu, 26 Sep 2013 22:42:43 +0000
Message-ID: <bug-69830-8800-zw2SkgcXkt@http.bugs.freedesktop.org/>
References: <bug-69830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1832238613=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1832238613==
Content-Type: multipart/alternative; boundary="1380235363.e8dafCB00.9802"; charset="us-ascii"


--1380235363.e8dafCB00.9802
Date: Thu, 26 Sep 2013 22:42:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69830

--- Comment #6 from Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> ---
(In reply to comment #5)
> If you check the last comment of that bug, that's what the OP found as well.
> (Unless I'm misunderstanding.)

On that other bug, the lists of commits don't match my git history. I don't
have 791dc14 in the same place (it's inside a merge so I'll have to look
closer). Also 30f4e08 causes an X11 hang for me, not a boot failure. If the
user in the other bug has stuff out of order for some reason (using a tree
other than mainline?) then it's probably the same issue.

These being the same issue is likely, but the record should show that on my
system, with the mainline kernel, 30f4e08 is the first bad one and doesn't hang
the system at boot; it just fails to start x11.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380235363.e8dafCB00.9802
Date: Thu, 26 Sep 2013 22:42:43 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830">bug 69830</a>
              from <span class="vcard"><a class="email" href="mailto:alan&#64;signal11.us" title="Alan Ott &lt;alan&#64;signal11.us&gt;"> <span class="fn">Alan Ott</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69830#c5">comment #5</a>)
<span class="quote">&gt; If you check the last comment of that bug, that's what the OP found as well.
&gt; (Unless I'm misunderstanding.)</span >

On that other bug, the lists of commits don't match my git history. I don't
have 791dc14 in the same place (it's inside a merge so I'll have to look
closer). Also 30f4e08 causes an X11 hang for me, not a boot failure. If the
user in the other bug has stuff out of order for some reason (using a tree
other than mainline?) then it's probably the same issue.

These being the same issue is likely, but the record should show that on my
system, with the mainline kernel, 30f4e08 is the first bad one and doesn't hang
the system at boot; it just fails to start x11.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380235363.e8dafCB00.9802--

--===============1832238613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1832238613==--
