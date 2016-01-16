From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93733] New: Kernel message spam when HDMI display is
	turned off
Date: Sat, 16 Jan 2016 12:42:09 +0000
Message-ID: <bug-93733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1730751229=="
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


--===============1730751229==
Content-Type: multipart/alternative; boundary="1452948129.ECEaB4C1.13629"; charset="UTF-8"


--1452948129.ECEaB4C1.13629
Date: Sat, 16 Jan 2016 12:42:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93733

            Bug ID: 93733
           Summary: Kernel message spam when HDMI display is turned off
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: i.am.inuyasha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 121073
  --> https://bugs.freedesktop.org/attachment.cgi?id=121073&action=edit
dmesg output

When using nouveau driver and turning off my HDMI screen, the kernel logs are
spammed with errors:

Jan 16 07:27:36 guilmon kernel: ------------[ cut here ]------------
Jan 16 07:27:36 guilmon kernel: WARNING: CPU: 6 PID: 172 at
include/drm/drm_crtc.h:1577 drm_helper_choose_crtc_dpms+0x93/0xa0
[drm_kms_helper]()
Jan 16 07:27:36 guilmon kernel: Modules linked in: fuse pci_stub vboxpci(O)
vboxnetflt(O) vboxnetadp(O) vboxdrv(O) f71882fg snd_hda_codec_hdmi joydev btusb 
Jan 16 07:27:36 guilmon kernel:  ansi_cprng algif_skcipher af_alg dm_crypt
dm_mod hid_generic usbhid hid sr_mod cdrom sd_mod uas usb_storage atkbd libps2
cr
Jan 16 07:27:36 guilmon kernel: CPU: 6 PID: 172 Comm: kworker/6:3 Tainted: G   
    W  O    4.3.3-2-ARCH #1
Jan 16 07:27:36 guilmon kernel: Hardware name: MSI MS-7693/970A-G46 (MS-7693),
BIOS V1.11 10/31/2012
Jan 16 07:27:36 guilmon kernel: Workqueue: events nvif_notify_work [nouveau]
Jan 16 07:27:36 guilmon kernel:  0000000000000000 00000000d3b82562
ffff8805ff7d3d10 ffffffff812c0dc9
Jan 16 07:27:36 guilmon kernel:  0000000000000000 ffff8805ff7d3d48
ffffffff81074f42 ffff880600bcf000
Jan 16 07:27:36 guilmon kernel:  ffff880600942000 ffff880600942000
0000000000000003 0000000000000000
Jan 16 07:27:36 guilmon kernel: Call Trace:
Jan 16 07:27:36 guilmon kernel:  [<ffffffff812c0dc9>] dump_stack+0x4b/0x72
Jan 16 07:27:36 guilmon kernel:  [<ffffffff81074f42>]
warn_slowpath_common+0x82/0xc0
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8107508a>]
warn_slowpath_null+0x1a/0x20
Jan 16 07:27:36 guilmon kernel:  [<ffffffffa05e11f3>]
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]
Jan 16 07:27:36 guilmon kernel:  [<ffffffffa05e15c7>]
drm_helper_connector_dpms+0x77/0x100 [drm_kms_helper]
Jan 16 07:27:36 guilmon kernel:  [<ffffffffa0a67700>] ?
nv50_display_crtc_get+0x20/0x20 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [<ffffffffa0a640fb>]
nouveau_connector_hotplug+0x3b/0xb0 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [<ffffffffa09bca77>]
nvif_notify_work+0x27/0xa0 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8108c9ad>] ?
pwq_dec_nr_in_flight+0x4d/0xa0
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8108cfeb>]
process_one_work+0x14b/0x440
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8108d328>] worker_thread+0x48/0x4a0
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8108d2e0>] ?
process_one_work+0x440/0x440
Jan 16 07:27:36 guilmon kernel:  [<ffffffff81092e68>] kthread+0xd8/0xf0
Jan 16 07:27:36 guilmon kernel:  [<ffffffff81092d90>] ?
kthread_worker_fn+0x170/0x170
Jan 16 07:27:36 guilmon kernel:  [<ffffffff8158409f>] ret_from_fork+0x3f/0x70
Jan 16 07:27:36 guilmon kernel:  [<ffffffff81092d90>] ?
kthread_worker_fn+0x170/0x170
Jan 16 07:27:36 guilmon kernel: ---[ end trace b434083d8b28aa12 ]---

When turning the display back on, the errors stop and things work normally
again.

System:
Nouveau v1.0.12-1
Xorg-server v1.18.0-4
Arch Linux AMD64 on AMD FX-8120, 24GB RAM
EVGA GTX 650 TI Boost, 1 GB, with three screens connected:
-HDMI
-DVI (upper port)
-DisplayPort (via VGA adaptor)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452948129.ECEaB4C1.13629
Date: Sat, 16 Jan 2016 12:42:09 +0000
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
   title="NEW - Kernel message spam when HDMI display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93733">93733</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel message spam when HDMI display is turned off
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>minor
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
          <td>i.am.inuyasha&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121073" name="attach_121073" title="dmesg output">attachment 121073</a> <a href="attachment.cgi?id=121073&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

When using nouveau driver and turning off my HDMI screen, the kernel logs are
spammed with errors:

Jan 16 07:27:36 guilmon kernel: ------------[ cut here ]------------
Jan 16 07:27:36 guilmon kernel: WARNING: CPU: 6 PID: 172 at
include/drm/drm_crtc.h:1577 drm_helper_choose_crtc_dpms+0x93/0xa0
[drm_kms_helper]()
Jan 16 07:27:36 guilmon kernel: Modules linked in: fuse pci_stub vboxpci(O)
vboxnetflt(O) vboxnetadp(O) vboxdrv(O) f71882fg snd_hda_codec_hdmi joydev btusb 
Jan 16 07:27:36 guilmon kernel:  ansi_cprng algif_skcipher af_alg dm_crypt
dm_mod hid_generic usbhid hid sr_mod cdrom sd_mod uas usb_storage atkbd libps2
cr
Jan 16 07:27:36 guilmon kernel: CPU: 6 PID: 172 Comm: kworker/6:3 Tainted: G   
    W  O    4.3.3-2-ARCH #1
Jan 16 07:27:36 guilmon kernel: Hardware name: MSI MS-7693/970A-G46 (MS-7693),
BIOS V1.11 10/31/2012
Jan 16 07:27:36 guilmon kernel: Workqueue: events nvif_notify_work [nouveau]
Jan 16 07:27:36 guilmon kernel:  0000000000000000 00000000d3b82562
ffff8805ff7d3d10 ffffffff812c0dc9
Jan 16 07:27:36 guilmon kernel:  0000000000000000 ffff8805ff7d3d48
ffffffff81074f42 ffff880600bcf000
Jan 16 07:27:36 guilmon kernel:  ffff880600942000 ffff880600942000
0000000000000003 0000000000000000
Jan 16 07:27:36 guilmon kernel: Call Trace:
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff812c0dc9&gt;] dump_stack+0x4b/0x72
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff81074f42&gt;]
warn_slowpath_common+0x82/0xc0
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8107508a&gt;]
warn_slowpath_null+0x1a/0x20
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffffa05e11f3&gt;]
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffffa05e15c7&gt;]
drm_helper_connector_dpms+0x77/0x100 [drm_kms_helper]
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffffa0a67700&gt;] ?
nv50_display_crtc_get+0x20/0x20 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffffa0a640fb&gt;]
nouveau_connector_hotplug+0x3b/0xb0 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffffa09bca77&gt;]
nvif_notify_work+0x27/0xa0 [nouveau]
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8108c9ad&gt;] ?
pwq_dec_nr_in_flight+0x4d/0xa0
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8108cfeb&gt;]
process_one_work+0x14b/0x440
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8108d328&gt;] worker_thread+0x48/0x4a0
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8108d2e0&gt;] ?
process_one_work+0x440/0x440
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff81092e68&gt;] kthread+0xd8/0xf0
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff81092d90&gt;] ?
kthread_worker_fn+0x170/0x170
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff8158409f&gt;] ret_from_fork+0x3f/0x70
Jan 16 07:27:36 guilmon kernel:  [&lt;ffffffff81092d90&gt;] ?
kthread_worker_fn+0x170/0x170
Jan 16 07:27:36 guilmon kernel: ---[ end trace b434083d8b28aa12 ]---

When turning the display back on, the errors stop and things work normally
again.

System:
Nouveau v1.0.12-1
Xorg-server v1.18.0-4
Arch Linux AMD64 on AMD FX-8120, 24GB RAM
EVGA GTX 650 TI Boost, 1 GB, with three screens connected:
-HDMI
-DVI (upper port)
-DisplayPort (via VGA adaptor)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452948129.ECEaB4C1.13629--

--===============1730751229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1730751229==--
