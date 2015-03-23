From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 23 Mar 2015 13:19:51 +0000
Message-ID: <bug-89730-8800-085XiQQNsL@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0259964257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0259964257==
Content-Type: multipart/alternative; boundary="1427116791.7fb6B861.3087"; charset="UTF-8"


--1427116791.7fb6B861.3087
Date: Mon, 23 Mar 2015 13:19:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Here's a simple patch to try... *no* idea if it'll help. I assume not, but who
knows. [Patch to xf86-video-nouveau.]

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index 5efbd19..ecad602 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -207,6 +207,8 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
     PUSH_DATA (push, 0);
     BEGIN_NV04(push, NV50_3D(COLOR_MASK_COMMON), 1);
     PUSH_DATA (push, 1);
+    BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
+    PUSH_DATA (push, 0);

     BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
     PUSH_DATA (push, (pNv->scratch->offset + TIC_OFFSET) >> 32);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427116791.7fb6B861.3087
Date: Mon, 23 Mar 2015 13:19:51 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Here's a simple patch to try... *no* idea if it'll help. I assume not, but who
knows. [Patch to xf86-video-nouveau.]

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index 5efbd19..ecad602 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
&#64;&#64; -207,6 +207,8 &#64;&#64; NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
     PUSH_DATA (push, 0);
     BEGIN_NV04(push, NV50_3D(COLOR_MASK_COMMON), 1);
     PUSH_DATA (push, 1);
+    BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
+    PUSH_DATA (push, 0);

     BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
     PUSH_DATA (push, (pNv-&gt;scratch-&gt;offset + TIC_OFFSET) &gt;&gt; 32);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427116791.7fb6B861.3087--

--===============0259964257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0259964257==--
