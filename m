From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 11 Apr 2017 18:10:29 +0000
Message-ID: <bug-99900-8800-1X3f32667g@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0449766390=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0449766390==
Content-Type: multipart/alternative; boundary="14919342293.beDdbB.3772";
 charset="UTF-8"


--14919342293.beDdbB.3772
Date: Tue, 11 Apr 2017 18:10:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #14 from Viktor Kuzmin <kvaster-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This porblem is not related only to NVC0.

This bugs is the same (I think):
https://bugs.freedesktop.org/show_bug.cgi?id=3D98690

MacBook Pro 11.3 (GK107, GeForce GT 750M), Gentoo Linux, kernel 4.10.8.

[   49.196313] Workqueue: pm pm_runtime_work
[   49.196314] Call Trace:
[   49.196321]  ? dump_stack+0x46/0x59
[   49.196323]  ? __warn+0xb9/0xe0
[   49.196327]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196329]  ? warn_slowpath_fmt+0x4a/0x50
[   49.196349]  ? gen6_read32+0x92/0x1e0 [i915]
[   49.196369]  ? hsw_enable_pc8+0x6b7/0x720 [i915]
[   49.196371]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196384]  ? intel_runtime_suspend+0x142/0x250 [i915]
[   49.196386]  ? pci_pm_runtime_suspend+0x50/0x140
[   49.196387]  ? __rpm_callback+0xb1/0x1f0
[   49.196389]  ? rpm_callback+0x1a/0x70
[   49.196390]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196392]  ? rpm_suspend+0x11d/0x670
[   49.196396]  ? _raw_write_unlock_irq+0xe/0x20
[   49.196400]  ? finish_task_switch+0xa7/0x260
[   49.196403]  ? __update_idle_core+0x1b/0xb0
[   49.196405]  ? pm_runtime_work+0x62/0xa0
[   49.196407]  ? process_one_work+0x133/0x480
[   49.196408]  ? worker_thread+0x42/0x4c0
[   49.196411]  ? kthread+0xef/0x130
[   49.196412]  ? process_one_work+0x480/0x480
[   49.196415]  ? kthread_create_on_node+0x40/0x40
[   49.196416]  ? ret_from_fork+0x23/0x30

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14919342293.beDdbB.3772
Date: Tue, 11 Apr 2017 18:10:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kvaster&#64;gmail.com" title=3D"Viktor Kuzmin &lt;kvaster&#64;gmail.com&gt;=
"> <span class=3D"fn">Viktor Kuzmin</span></a>
</span></b>
        <pre>This porblem is not related only to NVC0.

This bugs is the same (I think):
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [SKL bisected] System freeze when starting X using kernel=
 4.9-rc1 or later"
   href=3D"show_bug.cgi?id=3D98690">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98690</a>

MacBook Pro 11.3 (GK107, GeForce GT 750M), Gentoo Linux, kernel 4.10.8.

[   49.196313] Workqueue: pm pm_runtime_work
[   49.196314] Call Trace:
[   49.196321]  ? dump_stack+0x46/0x59
[   49.196323]  ? __warn+0xb9/0xe0
[   49.196327]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196329]  ? warn_slowpath_fmt+0x4a/0x50
[   49.196349]  ? gen6_read32+0x92/0x1e0 [i915]
[   49.196369]  ? hsw_enable_pc8+0x6b7/0x720 [i915]
[   49.196371]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196384]  ? intel_runtime_suspend+0x142/0x250 [i915]
[   49.196386]  ? pci_pm_runtime_suspend+0x50/0x140
[   49.196387]  ? __rpm_callback+0xb1/0x1f0
[   49.196389]  ? rpm_callback+0x1a/0x70
[   49.196390]  ? pci_pm_runtime_resume+0xa0/0xa0
[   49.196392]  ? rpm_suspend+0x11d/0x670
[   49.196396]  ? _raw_write_unlock_irq+0xe/0x20
[   49.196400]  ? finish_task_switch+0xa7/0x260
[   49.196403]  ? __update_idle_core+0x1b/0xb0
[   49.196405]  ? pm_runtime_work+0x62/0xa0
[   49.196407]  ? process_one_work+0x133/0x480
[   49.196408]  ? worker_thread+0x42/0x4c0
[   49.196411]  ? kthread+0xef/0x130
[   49.196412]  ? process_one_work+0x480/0x480
[   49.196415]  ? kthread_create_on_node+0x40/0x40
[   49.196416]  ? ret_from_fork+0x23/0x30</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14919342293.beDdbB.3772--

--===============0449766390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0449766390==--
