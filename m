From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] New: NV50: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Tue, 06 Oct 2015 00:32:30 +0000
Message-ID: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0377124476=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0377124476==
Content-Type: multipart/alternative; boundary="1444091550.761f1.21282"; charset="UTF-8"


--1444091550.761f1.21282
Date: Tue, 6 Oct 2015 00:32:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

            Bug ID: 92307
           Summary: NV50: WARNING: ... at include/drm/drm_crtc.h:1577
                    drm_helper_choose_encoder_dpms+0x8a/0x90
                    [drm_kms_helper]()
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

S3 RESUME:

WARNING: ... at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
Call Trace:
 [<ffffffff81417339>] dump_stack+0x4b/0x72
 [<ffffffff810a8c12>] warn_slowpath_common+0x82/0xc0
 [<ffffffff810a8d5a>] warn_slowpath_null+0x1a/0x20
 [<ffffffffa01542ca>] drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]
 [<ffffffffa01543bb>] drm_helper_connector_dpms+0x4b/0x100 [drm_kms_helper]
 [<ffffffffa0288beb>] nouveau_connector_hotplug+0x5b/0xb0 [nouveau]
 [<ffffffffa01e7a77>] nvif_notify_work+0x27/0xa0 [nouveau]
 [<ffffffff810c7470>] process_one_work+0x230/0x6a0
 [<ffffffff810c73d9>] ? process_one_work+0x199/0x6a0
 [<ffffffff810c792e>] worker_thread+0x4e/0x450
 [<ffffffff810c78e0>] ? process_one_work+0x6a0/0x6a0
 [<ffffffff810c78e0>] ? process_one_work+0x6a0/0x6a0
 [<ffffffff810ce981>] kthread+0x101/0x120
 [<ffffffff81103d79>] ? trace_hardirqs_on_caller+0x129/0x1b0
 [<ffffffff810ce880>] ? kthread_create_on_node+0x250/0x250
 [<ffffffff8185fbef>] ret_from_fork+0x3f/0x70
 [<ffffffff810ce880>] ? kthread_create_on_node+0x250/0x250
---[ end trace cf287771813cb2d1 ]---

WARNING: ... at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
Call Trace:
 [<ffffffff81417339>] dump_stack+0x4b/0x72
 [<ffffffff810a8c12>] warn_slowpath_common+0x82/0xc0
 [<ffffffff810a8d5a>] warn_slowpath_null+0x1a/0x20
 [<ffffffffa0154363>] drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]
 [<ffffffffa028c240>] ? nv50_display_crtc_get+0x20/0x20 [nouveau]
 [<ffffffffa0154429>] drm_helper_connector_dpms+0xb9/0x100 [drm_kms_helper]
 [<ffffffffa0288beb>] nouveau_connector_hotplug+0x5b/0xb0 [nouveau]
 [<ffffffffa01e7a77>] nvif_notify_work+0x27/0xa0 [nouveau]
 [<ffffffff810c7470>] process_one_work+0x230/0x6a0
 [<ffffffff810c73d9>] ? process_one_work+0x199/0x6a0
 [<ffffffff810c792e>] worker_thread+0x4e/0x450
 [<ffffffff810c78e0>] ? process_one_work+0x6a0/0x6a0
 [<ffffffff810c78e0>] ? process_one_work+0x6a0/0x6a0
 [<ffffffff810ce981>] kthread+0x101/0x120
 [<ffffffff81103d79>] ? trace_hardirqs_on_caller+0x129/0x1b0
 [<ffffffff810ce880>] ? kthread_create_on_node+0x250/0x250
 [<ffffffff8185fbef>] ret_from_fork+0x3f/0x70
 [<ffffffff810ce880>] ? kthread_create_on_node+0x250/0x250
---[ end trace cf287771813cb2d2 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444091550.761f1.21282
Date: Tue, 6 Oct 2015 00:32:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">92307</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV50: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>S3 RESUME:

WARNING: ... at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
Call Trace:
 [&lt;ffffffff81417339&gt;] dump_stack+0x4b/0x72
 [&lt;ffffffff810a8c12&gt;] warn_slowpath_common+0x82/0xc0
 [&lt;ffffffff810a8d5a&gt;] warn_slowpath_null+0x1a/0x20
 [&lt;ffffffffa01542ca&gt;] drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]
 [&lt;ffffffffa01543bb&gt;] drm_helper_connector_dpms+0x4b/0x100 [drm_kms_helper]
 [&lt;ffffffffa0288beb&gt;] nouveau_connector_hotplug+0x5b/0xb0 [nouveau]
 [&lt;ffffffffa01e7a77&gt;] nvif_notify_work+0x27/0xa0 [nouveau]
 [&lt;ffffffff810c7470&gt;] process_one_work+0x230/0x6a0
 [&lt;ffffffff810c73d9&gt;] ? process_one_work+0x199/0x6a0
 [&lt;ffffffff810c792e&gt;] worker_thread+0x4e/0x450
 [&lt;ffffffff810c78e0&gt;] ? process_one_work+0x6a0/0x6a0
 [&lt;ffffffff810c78e0&gt;] ? process_one_work+0x6a0/0x6a0
 [&lt;ffffffff810ce981&gt;] kthread+0x101/0x120
 [&lt;ffffffff81103d79&gt;] ? trace_hardirqs_on_caller+0x129/0x1b0
 [&lt;ffffffff810ce880&gt;] ? kthread_create_on_node+0x250/0x250
 [&lt;ffffffff8185fbef&gt;] ret_from_fork+0x3f/0x70
 [&lt;ffffffff810ce880&gt;] ? kthread_create_on_node+0x250/0x250
---[ end trace cf287771813cb2d1 ]---

WARNING: ... at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
Call Trace:
 [&lt;ffffffff81417339&gt;] dump_stack+0x4b/0x72
 [&lt;ffffffff810a8c12&gt;] warn_slowpath_common+0x82/0xc0
 [&lt;ffffffff810a8d5a&gt;] warn_slowpath_null+0x1a/0x20
 [&lt;ffffffffa0154363&gt;] drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]
 [&lt;ffffffffa028c240&gt;] ? nv50_display_crtc_get+0x20/0x20 [nouveau]
 [&lt;ffffffffa0154429&gt;] drm_helper_connector_dpms+0xb9/0x100 [drm_kms_helper]
 [&lt;ffffffffa0288beb&gt;] nouveau_connector_hotplug+0x5b/0xb0 [nouveau]
 [&lt;ffffffffa01e7a77&gt;] nvif_notify_work+0x27/0xa0 [nouveau]
 [&lt;ffffffff810c7470&gt;] process_one_work+0x230/0x6a0
 [&lt;ffffffff810c73d9&gt;] ? process_one_work+0x199/0x6a0
 [&lt;ffffffff810c792e&gt;] worker_thread+0x4e/0x450
 [&lt;ffffffff810c78e0&gt;] ? process_one_work+0x6a0/0x6a0
 [&lt;ffffffff810c78e0&gt;] ? process_one_work+0x6a0/0x6a0
 [&lt;ffffffff810ce981&gt;] kthread+0x101/0x120
 [&lt;ffffffff81103d79&gt;] ? trace_hardirqs_on_caller+0x129/0x1b0
 [&lt;ffffffff810ce880&gt;] ? kthread_create_on_node+0x250/0x250
 [&lt;ffffffff8185fbef&gt;] ret_from_fork+0x3f/0x70
 [&lt;ffffffff810ce880&gt;] ? kthread_create_on_node+0x250/0x250
---[ end trace cf287771813cb2d2 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444091550.761f1.21282--

--===============0377124476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0377124476==--
