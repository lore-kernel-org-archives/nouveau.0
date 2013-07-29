From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Mon, 29 Jul 2013 00:43:24 +0000
Message-ID: <bug-54700-8800-6KVXFxCF56@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0105725976=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0105725976==
Content-Type: multipart/alternative; boundary="1375058604.A67D2.30425"; charset="us-ascii"


--1375058604.A67D2.30425
Date: Mon, 29 Jul 2013 00:43:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #48 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks this is enough on the image side.

So link2 (directfb) exhibits the same issue, although in X not everything is
affected. Same dimension image can be rendered with and without corruption,
next to each other :P Seems like on some instances nouveau_bo_new() is not
given the correct params (and/or the kernel does not like them :)

A couple of tests

1. Startup X with SWCursor, by adding "Option "HWCursor" "O"" in your
xorg.conf(see $man nouveau for more information)
Does the cursor render properly ?

2. Make sure nouveau_vieux_dri.so is available and confirm that you have 3d
acceleration $ glxinfo | grep render
The above command should give you
* direct rendering: Yes
* OpenGL renderer string: Mesa DRI nv28 *****
Startup glxgears and adjust the window size and note when corruption does and
does not occur

Example: @ 200x500 graphics are corrupted, at other sizes everything is fine
(or vice-versa)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375058604.A67D2.30425
Date: Mon, 29 Jul 2013 00:43:24 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Thanks this is enough on the image side.

So link2 (directfb) exhibits the same issue, although in X not everything is
affected. Same dimension image can be rendered with and without corruption,
next to each other :P Seems like on some instances nouveau_bo_new() is not
given the correct params (and/or the kernel does not like them :)

A couple of tests

1. Startup X with SWCursor, by adding &quot;Option &quot;HWCursor&quot; &quot;O&quot;&quot; in your
xorg.conf(see $man nouveau for more information)
Does the cursor render properly ?

2. Make sure nouveau_vieux_dri.so is available and confirm that you have 3d
acceleration $ glxinfo | grep render
The above command should give you
* direct rendering: Yes
* OpenGL renderer string: Mesa DRI nv28 *****
Startup glxgears and adjust the window size and note when corruption does and
does not occur

Example: &#64; 200x500 graphics are corrupted, at other sizes everything is fine
(or vice-versa)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375058604.A67D2.30425--

--===============0105725976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0105725976==--
