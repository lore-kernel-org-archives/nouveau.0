From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 23:16:08 +0000
Message-ID: <bug-58378-8800-1xDrBJeqZx@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1852825050=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1852825050==
Content-Type: multipart/alternative; boundary="1387149368.2A3f5.5348"; charset="us-ascii"


--1387149368.2A3f5.5348
Date: Sun, 15 Dec 2013 23:16:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #34 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Bad news once again...

I applied the following single-line patch to a stock 3.12.4 kernel in order to
switch to the NV50 fence:

diff -Nrpu linux-3.12.4.orig/drivers/gpu/drm/nouveau/nouveau_drm.c
linux-3.12.4/drivers/gpu/drm/nouveau/nouveau_drm.c
--- linux-3.12.4.orig/drivers/gpu/drm/nouveau/nouveau_drm.c    2013-12-08
17:18:58.000000000 +0100
+++ linux-3.12.4/drivers/gpu/drm/nouveau/nouveau_drm.c    2013-12-15
16:37:25.000000000 +0100
@@ -180,7 +180,7 @@ nouveau_accel_init(struct nouveau_drm *d
     else if (device->chipset   <  0x17) ret = nv10_fence_create(drm);
     else if (device->card_type < NV_50) ret = nv17_fence_create(drm);
     else if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
-    else if (device->card_type < NV_C0) ret = nv84_fence_create(drm);
+    else if (device->card_type < NV_C0) ret = nv50_fence_create(drm);
     else                                ret = nvc0_fence_create(drm);
     if (ret) {
         NV_ERROR(drm, "failed to initialise sync subsystem, %d\n", ret);

but the result is that after the GUI login screen (gdm) which works fine, I get
a complete hang when GNOME starts up using compiz (cannot even switch to a text
vt any more) and lots of the following output:

Dec 15 23:23:05 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 0 mthd 0x0018 data 0x00000002
Dec 15 23:23:05 aloew-lap kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0000000114 on channel 0x0000f949 [unknown]
PFIFO/PFIFO_READ/SEMAPHORE reason: PT_NOT_PRESENT
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x6f000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0000000114 on channel 0x0000f949 [unknown]
PFIFO/PFIFO_READ/SEMAPHORE reason: PT_NOT_PRESENT
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x72000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x76000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x74000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x6f000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x60000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x41000000
(...)

(see the attached bz2 for the full log).

So does this mean that your proposal of switching to the nv50_fence won't work
for me?

In the meantime, I will continue and try kernel builds based on commits
"5e120f6e4b3f35b741c5445dfc755f50128c3c44^" and
"5e120f6e4b3f35b741c5445dfc755f50128c3c44" tomorrow...

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387149368.2A3f5.5348
Date: Sun, 15 Dec 2013 23:16:08 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Bad news once again...

I applied the following single-line patch to a stock 3.12.4 kernel in order to
switch to the NV50 fence:

diff -Nrpu linux-3.12.4.orig/drivers/gpu/drm/nouveau/nouveau_drm.c
linux-3.12.4/drivers/gpu/drm/nouveau/nouveau_drm.c
--- linux-3.12.4.orig/drivers/gpu/drm/nouveau/nouveau_drm.c    2013-12-08
17:18:58.000000000 +0100
+++ linux-3.12.4/drivers/gpu/drm/nouveau/nouveau_drm.c    2013-12-15
16:37:25.000000000 +0100
&#64;&#64; -180,7 +180,7 &#64;&#64; nouveau_accel_init(struct nouveau_drm *d
     else if (device-&gt;chipset   &lt;  0x17) ret = nv10_fence_create(drm);
     else if (device-&gt;card_type &lt; NV_50) ret = nv17_fence_create(drm);
     else if (device-&gt;chipset   &lt;  0x84) ret = nv50_fence_create(drm);
-    else if (device-&gt;card_type &lt; NV_C0) ret = nv84_fence_create(drm);
+    else if (device-&gt;card_type &lt; NV_C0) ret = nv50_fence_create(drm);
     else                                ret = nvc0_fence_create(drm);
     if (ret) {
         NV_ERROR(drm, &quot;failed to initialise sync subsystem, %d\n&quot;, ret);

but the result is that after the GUI login screen (gdm) which works fine, I get
a complete hang when GNOME starts up using compiz (cannot even switch to a text
vt any more) and lots of the following output:

Dec 15 23:23:05 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 0 mthd 0x0018 data 0x00000002
Dec 15 23:23:05 aloew-lap kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0000000114 on channel 0x0000f949 [unknown]
PFIFO/PFIFO_READ/SEMAPHORE reason: PT_NOT_PRESENT
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x6f000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0000000114 on channel 0x0000f949 [unknown]
PFIFO/PFIFO_READ/SEMAPHORE reason: PT_NOT_PRESENT
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x72000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x76000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x74000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x6f000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x60000000
Dec 15 23:23:06 aloew-lap kernel: nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR
- ch 4 [compiz[4637]] subc 2 mthd 0x0860 data 0x41000000
(...)

(see the attached bz2 for the full log).

So does this mean that your proposal of switching to the nv50_fence won't work
for me?

In the meantime, I will continue and try kernel builds based on commits
&quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44^&quot; and
&quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44&quot; tomorrow...

Thanks &amp; BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387149368.2A3f5.5348--

--===============1852825050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1852825050==--
