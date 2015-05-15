From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP,
	PFIFO and PGRAPH errors
Date: Fri, 15 May 2015 15:16:52 +0000
Message-ID: <bug-90453-8800-FJyJoe42ZD@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1806729073=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1806729073==
Content-Type: multipart/alternative; boundary="1431703012.3Deab1.28403"; charset="UTF-8"


--1431703012.3Deab1.28403
Date: Fri, 15 May 2015 15:16:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
BTW, as per my suggestion in
https://bugs.freedesktop.org/show_bug.cgi?id=90276#c11 you can likely "fix" the
PDISP errors by changing drivers/gpu/drm/nouveau/nv50_display.c:

-       if (show && nv_crtc->cursor.nvbo)
+       if (show && nv_crtc->base.enabled && nv_crtc->cursor.nvbo)

However that didn't fix the underlying issues for the other user, and it is
likely not to help your hang either, I'm afraid. But perhaps worth a shot?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431703012.3Deab1.28403
Date: Fri, 15 May 2015 15:16:52 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO and PGRAPH errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO and PGRAPH errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>BTW, as per my suggestion in
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] screen freeze with PDISP errors, bisected"
   href="show_bug.cgi?id=90276#c11">https://bugs.freedesktop.org/show_bug.cgi?id=90276#c11</a> you can likely &quot;fix&quot; the
PDISP errors by changing drivers/gpu/drm/nouveau/nv50_display.c:

-       if (show &amp;&amp; nv_crtc-&gt;cursor.nvbo)
+       if (show &amp;&amp; nv_crtc-&gt;base.enabled &amp;&amp; nv_crtc-&gt;cursor.nvbo)

However that didn't fix the underlying issues for the other user, and it is
likely not to help your hang either, I'm afraid. But perhaps worth a shot?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431703012.3Deab1.28403--

--===============1806729073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1806729073==--
