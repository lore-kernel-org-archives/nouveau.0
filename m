From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88514] X segfaults when using prime offloading to
	nouveau card
Date: Sat, 17 Jan 2015 10:05:41 +0000
Message-ID: <bug-88514-8800-VwTp6Wrena@http.bugs.freedesktop.org/>
References: <bug-88514-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716092294=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88514-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1716092294==
Content-Type: multipart/alternative; boundary="1421489141.201e1.12099"; charset="UTF-8"


--1421489141.201e1.12099
Date: Sat, 17 Jan 2015 10:05:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88514

--- Comment #12 from Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> ---
diff --git a/hw/xfree86/dri2/dri2.c b/hw/xfree86/dri2/dri2.c
index 8b94b8f..e048224 100644
--- a/hw/xfree86/dri2/dri2.c
+++ b/hw/xfree86/dri2/dri2.c
@@ -158,6 +158,9 @@ GetScreenPrime(ScreenPtr master, int prime_id)
         DRI2ScreenPtr ds;

         ds = DRI2GetScreen(slave);
+        if (ds == NULL)
+            continue;
+
         if (ds->prime_id == prime_id)
             return slave;
     }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421489141.201e1.12099
Date: Sat, 17 Jan 2015 10:05:41 +0000
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
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">bug 88514</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;chris-wilson.co.uk" title="Chris Wilson &lt;chris&#64;chris-wilson.co.uk&gt;"> <span class="fn">Chris Wilson</span></a>
</span></b>
        <pre>diff --git a/hw/xfree86/dri2/dri2.c b/hw/xfree86/dri2/dri2.c
index 8b94b8f..e048224 100644
--- a/hw/xfree86/dri2/dri2.c
+++ b/hw/xfree86/dri2/dri2.c
&#64;&#64; -158,6 +158,9 &#64;&#64; GetScreenPrime(ScreenPtr master, int prime_id)
         DRI2ScreenPtr ds;

         ds = DRI2GetScreen(slave);
+        if (ds == NULL)
+            continue;
+
         if (ds-&gt;prime_id == prime_id)
             return slave;
     }</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421489141.201e1.12099--

--===============1716092294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1716092294==--
