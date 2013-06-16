From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61765] Regression: null pointer dereference on
 reboot after switcheroo use
Date: Sun, 16 Jun 2013 05:15:33 +0000
Message-ID: <bug-61765-8800-7S4bXxEcvh@http.bugs.freedesktop.org/>
References: <bug-61765-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1730900430=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61765-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1730900430==
Content-Type: multipart/alternative; boundary="1371359733.7a32E61.22115"; charset="us-ascii"


--1371359733.7a32E61.22115
Date: Sun, 16 Jun 2013 05:15:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D61765

--- Comment #1 from Cristian Rodr=C3=ADguez <crrodriguez-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org> ---
Now the issue has mutated into a BUG: unable to handle kernel paging reques=
t at
ffff8803323e9ffc

Here is the kernel trace

Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: VGA switcheroo:
switched nouveau off
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending fbcon...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending display...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
unpinning framebuffer(s)...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
evicting buffers...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
waiting for kernel channels to go idle...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending client object trees...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending kernel object tree...
Jun 16 01:05:13 xps15z.thno.cristianrodriguez.org kernel: nouveau 0000:01:0=
0.0:
power state changed by ACPI to D3hot
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: BUG: unable to ha=
ndle
kernel paging request at ffff8803323e9ffc
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: IP:
[<ffffffff81486609>] evo_wait+0x69/0xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: PGD 1ed7067 PUD 0=
=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Oops: 0002 [#1]
PREEMPT SMP=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Modules linked in:
intel_powerclamp coretemp kvm_intel iTCO_wdt iTCO_vendor_support kvm
crc32_pclmul dell_wmi sparse_keymap ghash_clmulni_intel aesni_intel
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CPU: 0 PID: 703 C=
omm:
Xorg Not tainted 3.10.0-rc6-666-desktop-00017-g6a1c4e4 #43
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Hardware name: De=
ll
Inc.          Dell System XPS 15Z/00WW5M, BIOS A12 09/07/2012
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: task:
ffff880232940000 ti: ffff880232e5e000 task.ti: ffff880232e5e000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RIP:
0010:[<ffffffff81486609>]  [<ffffffff81486609>] evo_wait+0x69/0xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RSP:
0018:ffff880232e5f960  EFLAGS: 00010246
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RAX: ffff8802323e=
a000
RBX: 000000003fffffff RCX: ffff88023269a200
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RDX: 000000000000=
0000
RSI: 0000000000000000 RDI: ffff880233cbca40
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RBP: ffff880232e5=
f980
R08: 000000000000000d R09: ffff880210696500
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: R10: 000000000000=
0000
R11: 0000000000000000 R12: ffff880233cbca20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: R13: ffff880233cb=
ca40
R14: 0000000040000007 R15: ffffffff8187e460
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: FS:=20
00007f58984ba880(0000) GS:ffff88023fa00000(0000) knlGS:0000000000000000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CS:  0010 DS: 0000
ES: 0000 CR0: 0000000080050033
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CR2: ffff8803323e=
9ffc
CR3: 000000022cf98000 CR4: 00000000000407e0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: DR0: 000000000000=
0000
DR1: 0000000000000000 DR2: 0000000000000000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: DR3: 000000000000=
0000
DR6: 00000000ffff0ff0 DR7: 0000000000000400
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Stack:
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880233cb7000
ffff880210696b00 ffff880232676e40 ffff880233cbc000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880232e5f9a8
ffffffff814888a3 ffff880232676e40 ffff880233cbca20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880233cbc000
ffff880232e5f9d0 ffffffff81488975 ffff88023234c478
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Call Trace:
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff814888=
a3>]
nv50_display_flip_stop+0x53/0xc0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff814889=
75>]
nv50_crtc_prepare+0x25/0x190
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff813651=
0f>]
drm_crtc_helper_set_mode+0x25f/0x450
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff813667=
d2>]
drm_crtc_helper_set_config+0xa22/0xb40
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff813779=
8e>]
drm_mode_set_config_internal+0x1e/0x50
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff8137a1=
87>]
drm_mode_setcrtc+0xf7/0x650
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff81470f=
86>]
? nouveau_user_framebuffer_create+0x66/0xb0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff8136b3=
02>]
drm_ioctl+0x532/0x660
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff811657=
c5>]
do_vfs_ioctl+0x2e5/0x4d0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff8106dc=
31>]
? vtime_account_user+0x61/0x70
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff811659=
f0>]
SyS_ioctl+0x40/0x80
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [<ffffffff816aca=
8b>]
tracesys+0xdd/0xe2
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Code: 81 fe f7 03=
 00
00 77 1a 48 89 d0 49 03 44 24 18 5b 41 5c 41 5d 41 5e 5d c3 66 0f 1f 84 00 =
00
00 00 00 49 8b 44 24 18 31 d2 31 f6 <c7> 04 98 00 00 00=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RIP=20
[<ffffffff81486609>] evo_wait+0x69/0xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  RSP
<ffff880232e5f960>
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CR2: ffff8803323e=
9ffc
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: ---[ end trace
403519e1213664b5 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1371359733.7a32E61.22115
Date: Sun, 16 Jun 2013 05:15:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Regression: null pointer dereference on reboot after =
switcheroo use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D61765#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Regression: null pointer dereference on reboot after =
switcheroo use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D61765">bug 61765<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
crrodriguez&#64;opensuse.org" title=3D"Cristian Rodr=C3=ADguez &lt;crrodrig=
uez&#64;opensuse.org&gt;"> <span class=3D"fn">Cristian Rodr=C3=ADguez</span=
></a>
</span></b>
        <pre>Now the issue has mutated into a BUG: unable to handle kernel =
paging request at
ffff8803323e9ffc

Here is the kernel trace

Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: VGA switcheroo:
switched nouveau off
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending fbcon...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending display...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
unpinning framebuffer(s)...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
evicting buffers...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
waiting for kernel channels to go idle...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending client object trees...
Jun 16 01:05:12 xps15z.thno.cristianrodriguez.org kernel: nouveau  [     DR=
M]
suspending kernel object tree...
Jun 16 01:05:13 xps15z.thno.cristianrodriguez.org kernel: nouveau 0000:01:0=
0.0:
power state changed by ACPI to D3hot
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: BUG: unable to ha=
ndle
kernel paging request at ffff8803323e9ffc
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: IP:
[&lt;ffffffff81486609&gt;] evo_wait+0x69/0xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: PGD 1ed7067 PUD 0=
=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Oops: 0002 [#1]
PREEMPT SMP=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Modules linked in:
intel_powerclamp coretemp kvm_intel iTCO_wdt iTCO_vendor_support kvm
crc32_pclmul dell_wmi sparse_keymap ghash_clmulni_intel aesni_intel
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CPU: 0 PID: 703 C=
omm:
Xorg Not tainted 3.10.0-rc6-666-desktop-00017-g6a1c4e4 #43
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Hardware name: De=
ll
Inc.          Dell System XPS 15Z/00WW5M, BIOS A12 09/07/2012
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: task:
ffff880232940000 ti: ffff880232e5e000 task.ti: ffff880232e5e000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RIP:
0010:[&lt;ffffffff81486609&gt;]  [&lt;ffffffff81486609&gt;] evo_wait+0x69/0=
xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RSP:
0018:ffff880232e5f960  EFLAGS: 00010246
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RAX: ffff8802323e=
a000
RBX: 000000003fffffff RCX: ffff88023269a200
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RDX: 000000000000=
0000
RSI: 0000000000000000 RDI: ffff880233cbca40
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RBP: ffff880232e5=
f980
R08: 000000000000000d R09: ffff880210696500
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: R10: 000000000000=
0000
R11: 0000000000000000 R12: ffff880233cbca20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: R13: ffff880233cb=
ca40
R14: 0000000040000007 R15: ffffffff8187e460
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: FS:=20
00007f58984ba880(0000) GS:ffff88023fa00000(0000) knlGS:0000000000000000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CS:  0010 DS: 0000
ES: 0000 CR0: 0000000080050033
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CR2: ffff8803323e=
9ffc
CR3: 000000022cf98000 CR4: 00000000000407e0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: DR0: 000000000000=
0000
DR1: 0000000000000000 DR2: 0000000000000000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: DR3: 000000000000=
0000
DR6: 00000000ffff0ff0 DR7: 0000000000000400
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Stack:
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880233cb7000
ffff880210696b00 ffff880232676e40 ffff880233cbc000
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880232e5f9a8
ffffffff814888a3 ffff880232676e40 ffff880233cbca20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  ffff880233cbc000
ffff880232e5f9d0 ffffffff81488975 ffff88023234c478
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Call Trace:
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff814=
888a3&gt;]
nv50_display_flip_stop+0x53/0xc0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff814=
88975&gt;]
nv50_crtc_prepare+0x25/0x190
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff813=
6510f&gt;]
drm_crtc_helper_set_mode+0x25f/0x450
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff813=
667d2&gt;]
drm_crtc_helper_set_config+0xa22/0xb40
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff813=
7798e&gt;]
drm_mode_set_config_internal+0x1e/0x50
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff813=
7a187&gt;]
drm_mode_setcrtc+0xf7/0x650
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff814=
70f86&gt;]
? nouveau_user_framebuffer_create+0x66/0xb0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff813=
6b302&gt;]
drm_ioctl+0x532/0x660
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff811=
657c5&gt;]
do_vfs_ioctl+0x2e5/0x4d0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff810=
6dc31&gt;]
? vtime_account_user+0x61/0x70
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff811=
659f0&gt;]
SyS_ioctl+0x40/0x80
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  [&lt;ffffffff816=
aca8b&gt;]
tracesys+0xdd/0xe2
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: Code: 81 fe f7 03=
 00
00 77 1a 48 89 d0 49 03 44 24 18 5b 41 5c 41 5d 41 5e 5d c3 66 0f 1f 84 00 =
00
00 00 00 49 8b 44 24 18 31 d2 31 f6 &lt;c7&gt; 04 98 00 00 00=20
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: RIP=20
[&lt;ffffffff81486609&gt;] evo_wait+0x69/0xd0
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel:  RSP
&lt;ffff880232e5f960&gt;
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: CR2: ffff8803323e=
9ffc
Jun 16 01:05:50 xps15z.thno.cristianrodriguez.org kernel: ---[ end trace
403519e1213664b5 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371359733.7a32E61.22115--

--===============1730900430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1730900430==--
