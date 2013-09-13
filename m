From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Fri, 13 Sep 2013 14:35:20 +0000
Message-ID: <bug-58556-8800-VTQ1soNufO@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2022701850=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2022701850==
Content-Type: multipart/alternative; boundary="1379082920.ceaCA03.25929"; charset="us-ascii"


--1379082920.ceaCA03.25929
Date: Fri, 13 Sep 2013 14:35:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #18 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
It took me some times, but here is a patch correcting commit
20abd1634a6e2eedb84ca977adea56b8aa06cc3e:
---------------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/nouveau/nouveau_software.h
b/drivers/gpu/drm/nouveau/nouveau_software.h
index fe30a8f..7adfcb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_software.h
+++ b/drivers/gpu/drm/nouveau/nouveau_software.h
@@ -20,10 +20,10 @@ struct nouveau_software_chan {
 static inline void
 nouveau_software_vblank(struct drm_device *dev, int crtc)
 {
-       struct nouveau_software_priv *psw = nv_engine(dev, NVOBJ_ENGINE_SW);
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
        struct nouveau_software_chan *pch, *tmp;

-       list_for_each_entry_safe(pch, tmp, &psw->vblank, vblank.list) {
+       list_for_each_entry_safe(pch, tmp, &dev_priv->vbl_waiting, vblank.list)
{
                if (pch->vblank.head != crtc)
                        continue;

---------------------------------------------------------------------------------
(The above empty line is needed)

However, the code was later modified, and the patch can't be applied on recent
kernel; I'll try to get a new patch for it this week-end.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379082920.ceaCA03.25929
Date: Fri, 13 Sep 2013 14:35:20 +0000
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
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>It took me some times, but here is a patch correcting commit
20abd1634a6e2eedb84ca977adea56b8aa06cc3e:
---------------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/nouveau/nouveau_software.h
b/drivers/gpu/drm/nouveau/nouveau_software.h
index fe30a8f..7adfcb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_software.h
+++ b/drivers/gpu/drm/nouveau/nouveau_software.h
&#64;&#64; -20,10 +20,10 &#64;&#64; struct nouveau_software_chan {
 static inline void
 nouveau_software_vblank(struct drm_device *dev, int crtc)
 {
-       struct nouveau_software_priv *psw = nv_engine(dev, NVOBJ_ENGINE_SW);
+       struct drm_nouveau_private *dev_priv = dev-&gt;dev_private;
        struct nouveau_software_chan *pch, *tmp;

-       list_for_each_entry_safe(pch, tmp, &amp;psw-&gt;vblank, vblank.list) {
+       list_for_each_entry_safe(pch, tmp, &amp;dev_priv-&gt;vbl_waiting, vblank.list)
{
                if (pch-&gt;vblank.head != crtc)
                        continue;

---------------------------------------------------------------------------------
(The above empty line is needed)

However, the code was later modified, and the patch can't be applied on recent
kernel; I'll try to get a new patch for it this week-end.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379082920.ceaCA03.25929--

--===============2022701850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2022701850==--
