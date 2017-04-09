From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100433] Kernel Oops on attempting to return from
 locked screen on gnome-session
Date: Sun, 09 Apr 2017 19:48:22 +0000
Message-ID: <bug-100433-8800-ofMR8KmJEL@http.bugs.freedesktop.org/>
References: <bug-100433-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1515262238=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100433-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1515262238==
Content-Type: multipart/alternative; boundary="14917673020.DD3cca2E.28719";
 charset="UTF-8"


--14917673020.DD3cca2E.28719
Date: Sun, 9 Apr 2017 19:48:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100433

--- Comment #1 from Atri <badshah400-CZK690njTpI@public.gmane.org> ---
Still happening with 4/10/8, with crashes like these:

Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: BUG: unable to handle kernel
NULL pointer dereference at 0000000000000020
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: IP:
dma_fence_wait_timeout+0x30/0x110
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PGD 3c068a067=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PUD 3c3ca4067=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PMD 0=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Oops: 0000 [#1] PREEMPT SMP
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Modules linked in: fuse
af_packet msr snd_hda_codec_hdmi joydev iTCO_wdt snd_hda_codec_realtek
iTCO_vendor_support snd_hda_codec_generic intel_rapl hid_generic eda
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  xhci_pci firewire_core
drm_kms_helper ehci_pci crc_itu_t syscopyarea xhci_hcd sysfillrect ehci_hcd
sysimgblt fb_sys_fops ttm usbcore drm wmi button sg efivarfs
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CPU: 3 PID: 8309 Comm:
gnome-shell Not tainted 4.10.8-1-default #1
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Hardware name: PRIMINFO UNL=
OCK
INSTALL/P9X79, BIOS 4701 05/06/2014
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: task: ffff8fce446b8000
task.stack: ffffa997c6414000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RIP:
0010:dma_fence_wait_timeout+0x30/0x110
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RSP: 0018:ffffa997c6417be8
EFLAGS: 00010206
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RAX: 0000000000000000 RBX:
0000000000000001 RCX: 0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RDX: 7fffffffffffffff RSI:
0000000000000001 RDI: ffff8fcd03ef4300
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RBP: ffff8fcd03ef4300 R08:
0000000000009330 R09: 0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: R10: 0000000000000000 R11:
0000000000000002 R12: 0000000000000001
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: R13: 7fffffffffffffff R14:
ffff8fcea9c02800 R15: 0000000000000001
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: FS:  00007fdf1ac43ac0(0000)
GS:ffff8fceaf2c0000(0000) knlGS:0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CR2: 0000000000000020 CR3:
00000003b681a000 CR4: 00000000001406e0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Call Trace:
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  nouveau_fence_sync+0x118/0=
x250
[nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
nouveau_gem_ioctl_pushbuf+0x8f5/0x1660 [nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  drm_ioctl+0x1ec/0x410 [drm]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ?
nouveau_gem_ioctl_new+0x120/0x120 [nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  nouveau_drm_ioctl+0x66/0xc0
[nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  do_vfs_ioctl+0x8f/0x5d0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ? __sys_recvmsg+0x5d/0x70
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ? __fget+0x70/0xc0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  SyS_ioctl+0x74/0x80
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
entry_SYSCALL_64_fastpath+0x1e/0xad
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Code: 48 85 d2 41 55 41 54 =
55
53 0f 88 d4 00 00 00 48 89 fd 41 89 f4 49 89 d5 0f 1f 44 00 00 48 8b 45 08 =
41
0f b6 f4 4c 89 ea 48 89 ef <ff> 50 20 49 89 c4 0f 1f 44
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RIP:
dma_fence_wait_timeout+0x30/0x110 RSP: ffffa997c6417be8
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CR2: 0000000000000020
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: ---[ end trace ca8c6158d9e3=
41a9
]---

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14917673020.DD3cca2E.28719
Date: Sun, 9 Apr 2017 19:48:22 +0000
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
   title=3D"NEW - Kernel Oops on attempting to return from locked screen on=
 gnome-session"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100433#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Oops on attempting to return from locked screen on=
 gnome-session"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100433">bug 10043=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
badshah400&#64;aim.com" title=3D"Atri &lt;badshah400&#64;aim.com&gt;"> <spa=
n class=3D"fn">Atri</span></a>
</span></b>
        <pre>Still happening with 4/10/8, with crashes like these:

Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: BUG: unable to handle kernel
NULL pointer dereference at 0000000000000020
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: IP:
dma_fence_wait_timeout+0x30/0x110
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PGD 3c068a067=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PUD 3c3ca4067=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: PMD 0=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Oops: 0000 [#1] PREEMPT SMP
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Modules linked in: fuse
af_packet msr snd_hda_codec_hdmi joydev iTCO_wdt snd_hda_codec_realtek
iTCO_vendor_support snd_hda_codec_generic intel_rapl hid_generic eda
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  xhci_pci firewire_core
drm_kms_helper ehci_pci crc_itu_t syscopyarea xhci_hcd sysfillrect ehci_hcd
sysimgblt fb_sys_fops ttm usbcore drm wmi button sg efivarfs
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CPU: 3 PID: 8309 Comm:
gnome-shell Not tainted 4.10.8-1-default #1
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Hardware name: PRIMINFO UNL=
OCK
INSTALL/P9X79, BIOS 4701 05/06/2014
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: task: ffff8fce446b8000
task.stack: ffffa997c6414000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RIP:
0010:dma_fence_wait_timeout+0x30/0x110
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RSP: 0018:ffffa997c6417be8
EFLAGS: 00010206
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RAX: 0000000000000000 RBX:
0000000000000001 RCX: 0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RDX: 7fffffffffffffff RSI:
0000000000000001 RDI: ffff8fcd03ef4300
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RBP: ffff8fcd03ef4300 R08:
0000000000009330 R09: 0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: R10: 0000000000000000 R11:
0000000000000002 R12: 0000000000000001
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: R13: 7fffffffffffffff R14:
ffff8fcea9c02800 R15: 0000000000000001
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: FS:  00007fdf1ac43ac0(0000)
GS:ffff8fceaf2c0000(0000) knlGS:0000000000000000
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CR2: 0000000000000020 CR3:
00000003b681a000 CR4: 00000000001406e0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Call Trace:
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  nouveau_fence_sync+0x118/0=
x250
[nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
nouveau_gem_ioctl_pushbuf+0x8f5/0x1660 [nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  drm_ioctl+0x1ec/0x410 [drm]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ?
nouveau_gem_ioctl_new+0x120/0x120 [nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  nouveau_drm_ioctl+0x66/0xc0
[nouveau]
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  do_vfs_ioctl+0x8f/0x5d0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ? __sys_recvmsg+0x5d/0x70
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  ? __fget+0x70/0xc0
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:  SyS_ioctl+0x74/0x80
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel:=20
entry_SYSCALL_64_fastpath+0x1e/0xad
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: Code: 48 85 d2 41 55 41 54 =
55
53 0f 88 d4 00 00 00 48 89 fd 41 89 f4 49 89 d5 0f 1f 44 00 00 48 8b 45 08 =
41
0f b6 f4 4c 89 ea 48 89 ef &lt;ff&gt; 50 20 49 89 c4 0f 1f 44
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: RIP:
dma_fence_wait_timeout+0x30/0x110 RSP: ffffa997c6417be8
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: CR2: 0000000000000020
Apr 09 06:15:28 mal.theo.phys.ulg.ac.be kernel: ---[ end trace ca8c6158d9e3=
41a9
]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14917673020.DD3cca2E.28719--

--===============1515262238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1515262238==--
