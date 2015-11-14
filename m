From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Sat, 14 Nov 2015 19:21:26 +0000
Message-ID: <bug-92307-8800-BapEzVG6oG@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417213126=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92307-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1417213126==
Content-Type: multipart/alternative; boundary="1447528886.8c6fdEf41.17942"; charset="UTF-8"


--1447528886.8c6fdEf41.17942
Date: Sat, 14 Nov 2015 19:21:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #13 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 119664
  --> https://bugs.freedesktop.org/attachment.cgi?id=119664&action=edit
dmesg 4.4.0-0.rc0.git9.1.fc24.x86_64 connector_hotplug nvif_notify


- nouveau.ko built of:
http://cgit.freedesktop.org/~darktama/nouveau
git://people.freedesktop.org/~darktama/nouveau

- ending with:
$ git log -1
commit ad38b5e72b3acb40b820954f04293a0161e33845
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Nov 11 13:06:10 2015 +1000

    WIPce/gk104: attempt at better handling of LAUNCHERR

    Very rough, no idea how correct it is at this point, but it prevents
    getteximage-depth from piglit from hanging the GPU.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

- patched with:
$ git diff
diff --git a/drm/nouveau/nouveau_connector.c b/drm/nouveau/nouveau_connector.c
index 36ec8f3..d6afbb0 100644
--- a/drm/nouveau/nouveau_connector.c
+++ b/drm/nouveau/nouveau_connector.c
@@ -1274,6 +1274,7 @@ nouveau_connector_create(struct drm_device *dev, int
index)
                break;
        }

+       drm_modeset_lock_all(dev);
        ret = nvif_notify_init(&disp->disp, nouveau_connector_hotplug, true,
                               NV04_DISP_NTFY_CONN,
                               &(struct nvif_notify_conn_req_v0) {
@@ -1283,6 +1284,7 @@ nouveau_connector_create(struct drm_device *dev, int
index)
                               sizeof(struct nvif_notify_conn_req_v0),
                               sizeof(struct nvif_notify_conn_rep_v0),
                               &nv_connector->hpd);
+       drm_modeset_unlock_all(dev);
        if (ret)
                connector->polled = DRM_CONNECTOR_POLL_CONNECT;
        else

Ref.
"drm/radeon: Sprinkle drm_modeset_lock_all to appease locking checks"
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/radeon/radeon_device.c?id=6adaed5

Conclusion:
In this regard, it does not change anything - with or without ~darktama/nouveau
update, with or without patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447528886.8c6fdEf41.17942
Date: Sat, 14 Nov 2015 19:21:26 +0000
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
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=119664" name="attach_119664" title="dmesg 4.4.0-0.rc0.git9.1.fc24.x86_64 connector_hotplug nvif_notify">attachment 119664</a> <a href="attachment.cgi?id=119664&amp;action=edit" title="dmesg 4.4.0-0.rc0.git9.1.fc24.x86_64 connector_hotplug nvif_notify">[details]</a></span>
dmesg 4.4.0-0.rc0.git9.1.fc24.x86_64 connector_hotplug nvif_notify


- nouveau.ko built of:
<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a>
git://people.freedesktop.org/~darktama/nouveau

- ending with:
$ git log -1
commit ad38b5e72b3acb40b820954f04293a0161e33845
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Wed Nov 11 13:06:10 2015 +1000

    WIPce/gk104: attempt at better handling of LAUNCHERR

    Very rough, no idea how correct it is at this point, but it prevents
    getteximage-depth from piglit from hanging the GPU.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

- patched with:
$ git diff
diff --git a/drm/nouveau/nouveau_connector.c b/drm/nouveau/nouveau_connector.c
index 36ec8f3..d6afbb0 100644
--- a/drm/nouveau/nouveau_connector.c
+++ b/drm/nouveau/nouveau_connector.c
&#64;&#64; -1274,6 +1274,7 &#64;&#64; nouveau_connector_create(struct drm_device *dev, int
index)
                break;
        }

+       drm_modeset_lock_all(dev);
        ret = nvif_notify_init(&amp;disp-&gt;disp, nouveau_connector_hotplug, true,
                               NV04_DISP_NTFY_CONN,
                               &amp;(struct nvif_notify_conn_req_v0) {
&#64;&#64; -1283,6 +1284,7 &#64;&#64; nouveau_connector_create(struct drm_device *dev, int
index)
                               sizeof(struct nvif_notify_conn_req_v0),
                               sizeof(struct nvif_notify_conn_rep_v0),
                               &amp;nv_connector-&gt;hpd);
+       drm_modeset_unlock_all(dev);
        if (ret)
                connector-&gt;polled = DRM_CONNECTOR_POLL_CONNECT;
        else

Ref.
&quot;drm/radeon: Sprinkle drm_modeset_lock_all to appease locking checks&quot;
<a href="https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/radeon/radeon_device.c?id=6adaed5">https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/radeon/radeon_device.c?id=6adaed5</a>

Conclusion:
In this regard, it does not change anything - with or without ~darktama/nouveau
update, with or without patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447528886.8c6fdEf41.17942--

--===============1417213126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1417213126==--
