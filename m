From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Sun, 03 Feb 2013 20:44:37 +0000
Message-ID: <bug-56461-8800-293Sjx3Wo6@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895534731=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1895534731==
Content-Type: multipart/alternative; boundary="1359924277.7023CFAe2.20607"; charset="us-ascii"


--1359924277.7023CFAe2.20607
Date: Sun, 3 Feb 2013 20:44:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #42 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
I found the bug in commit cb75d97e that results in the incorrect GART aperture
and fixed it with this patch:

--- a/drivers/gpu/drm/nouveau/nouveau_compat.c
+++ b/drivers/gpu/drm/nouveau/nouveau_compat.c
@@ -17,7 +17,7 @@ nvdrm_gart_init(struct drm_device *dev, u64 *base, u64 *size)
     struct nouveau_drm *drm = nouveau_newpriv(dev);
     if (drm->agp.stat == ENABLED) {
         *base = drm->agp.base;
-        *size = drm->agp.base;
+        *size = drm->agp.size;
         return 0;
     }
     return -ENODEV;

However, the display still fades to black. I now get an error that I didn't get
with the parent commit:

PFIFO_DMA_PUSHER - Ch 0 Get 0x04000000 Put 0x00001088 State 0xc0000000 (err:
MEM_FAULT) Push 0x00000000

This message appears at the end of enabling the LDVS output, so it's probably
related (I'll attach the console log).

I'm not sure how to debug further. I'm wondering in particular how to trace the
effect of various changes in commit cb75d97e, such as those made to
run_digital_op_script()? Perhaps I need to trace all register read/writes
during the devinit phase and compare to the parent commit? How would I do this?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359924277.7023CFAe2.20607
Date: Sun, 3 Feb 2013 20:44:37 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c42">Comment # 42</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>I found the bug in commit cb75d97e that results in the incorrect GART aperture
and fixed it with this patch:

--- a/drivers/gpu/drm/nouveau/nouveau_compat.c
+++ b/drivers/gpu/drm/nouveau/nouveau_compat.c
&#64;&#64; -17,7 +17,7 &#64;&#64; nvdrm_gart_init(struct drm_device *dev, u64 *base, u64 *size)
     struct nouveau_drm *drm = nouveau_newpriv(dev);
     if (drm-&gt;agp.stat == ENABLED) {
         *base = drm-&gt;agp.base;
-        *size = drm-&gt;agp.base;
+        *size = drm-&gt;agp.size;
         return 0;
     }
     return -ENODEV;

However, the display still fades to black. I now get an error that I didn't get
with the parent commit:

PFIFO_DMA_PUSHER - Ch 0 Get 0x04000000 Put 0x00001088 State 0xc0000000 (err:
MEM_FAULT) Push 0x00000000

This message appears at the end of enabling the LDVS output, so it's probably
related (I'll attach the console log).

I'm not sure how to debug further. I'm wondering in particular how to trace the
effect of various changes in commit cb75d97e, such as those made to
run_digital_op_script()? Perhaps I need to trace all register read/writes
during the devinit phase and compare to the parent commit? How would I do this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359924277.7023CFAe2.20607--

--===============1895534731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1895534731==--
