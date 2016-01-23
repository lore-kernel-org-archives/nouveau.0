From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93834] New: BUG: unable to handle kernel paging
 request at ffff88110fa7cffc
Date: Sat, 23 Jan 2016 19:38:22 +0000
Message-ID: <bug-93834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0710599974=="
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


--===============0710599974==
Content-Type: multipart/alternative; boundary="14535779010.b753ACe.20573";
 charset="UTF-8"


--14535779010.b753ACe.20573
Date: Sat, 23 Jan 2016 19:38:21 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93834

            Bug ID: 93834
           Summary: BUG: unable to handle kernel paging request at
                    ffff88110fa7cffc
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-xEfZ0fjVPPX2SC1gVPJUZ6xOck334EZe@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 121235
  --> https://bugs.freedesktop.org/attachment.cgi?id=121235&action=edit
Complete dmesg

Running Arch Linux (4.3.3-3-ARCH) on a GA-X79S-UP5-WIFI with a GTX Titan and a
8600 GTS, nouveau seems to oops on load:

 BUG: unable to handle kernel paging request at ffff88110fa7cffc
 IP: [<ffffffffa0c868aa>] evo_wait+0x5a/0x130 [nouveau]
 PGD 2b3f067 PUD 0 
 Oops: 0002 [#1] PREEMPT SMP 

 CPU: 7 PID: 340 Comm: systemd-udevd Not tainted 4.3.3-3-ARCH #1
 Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./X79S-UP5,
BIOS F5f 03/19/2014
 task: ffff881013c40000 ti: ffff881013c4c000 task.ti: ffff881013c4c000
 RIP: 0010:[<ffffffffa0c868aa>]  [<ffffffffa0c868aa>] evo_wait+0x5a/0x130
[nouveau]
 RSP: 0018:ffff881013c4f878  EFLAGS: 00010202
 RAX: ffff88100fa7d000 RBX: 000000003fffffff RCX: 0000000000000000
 RDX: ffffc90006b24000 RSI: 0000000000000008 RDI: ffff88101569a498
 RBP: ffff881013c4f8a0 R08: ffffffffa0c36ad0 R09: ffff88101388a9c0
 R10: 0000000000019ca4 R11: 00000000000004d6 R12: ffff88101569a408
 R13: ffff88100d00a0d8 R14: 0000000040000007 R15: ffff88101569a498
 FS:  00007f6d7c64e7c0(0000) GS:ffff88105fce0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: ffff88110fa7cffc CR3: 000000101671f000 CR4: 00000000001406e0
 Stack:
  ffff88100d00c000 ffff88101569a400 ffff88100d00a0d8 ffff88101569a408
  ffff88100d00a878 ffff881013c4f8d0 ffffffffa0c871a7 ffff88100d00c000
  ffff881016b6fb80 ffffffffa0cec660 ffff88100d00a000 ffff881013c4f8f8
 Call Trace:
  [<ffffffffa0c871a7>] evo_sync+0x37/0xf0 [nouveau]
  [<ffffffffa0c874a8>] nv50_crtc_disable+0x28/0x90 [nouveau]
  [<ffffffffa04ec466>] __drm_helper_disable_unused_functions+0xa6/0xe0
[drm_kms_helper]
  [<ffffffffa04ec4ba>] drm_helper_disable_unused_functions+0x1a/0x30
[drm_kms_helper]
  [<ffffffffa0c8c114>] nouveau_fbcon_init+0xd4/0x110 [nouveau]
  [<ffffffffa0c792a3>] nouveau_drm_load+0x2f3/0x940 [nouveau]
  [<ffffffffa04724d7>] drm_dev_register+0xa7/0xb0 [drm]
  [<ffffffffa0474d63>] drm_get_pci_dev+0xd3/0x1e0 [drm]
  [<ffffffffa0c78ab0>] nouveau_drm_probe+0x220/0x240 [nouveau]
  [<ffffffff813063d5>] local_pci_probe+0x45/0xa0
  [<ffffffff81306320>] ? pci_match_device+0xe0/0x110
  [<ffffffff81307563>] pci_device_probe+0x103/0x150
  [<ffffffff813e01f2>] driver_probe_device+0x222/0x490
  [<ffffffff813e04e4>] __driver_attach+0x84/0x90
  [<ffffffff813e0460>] ? driver_probe_device+0x490/0x490
  [<ffffffff813dde2c>] bus_for_each_dev+0x6c/0xc0
  [<ffffffff813df9ae>] driver_attach+0x1e/0x20
  [<ffffffff813df4fb>] bus_add_driver+0x1eb/0x280
  [<ffffffff813e0df0>] driver_register+0x60/0xe0
  [<ffffffff81305c4c>] __pci_register_driver+0x4c/0x50
  [<ffffffffa0474f50>] drm_pci_init+0xe0/0x110 [drm]
  [<ffffffffa09c6000>] ? 0xffffffffa09c6000
  [<ffffffffa09c6216>] nouveau_drm_init+0x216/0x1000 [nouveau]
  [<ffffffff81002123>] do_one_initcall+0xb3/0x200
  [<ffffffff8119e491>] ? __vunmap+0x91/0xe0
  [<ffffffff8115d510>] do_init_module+0x5f/0x1ef
  [<ffffffff810f9897>] load_module+0x2197/0x27e0
  [<ffffffff810f66e0>] ? symbol_put_addr+0x50/0x50
  [<ffffffff810fa02e>] SyS_init_module+0x14e/0x190
  [<ffffffff81583d2e>] entry_SYSCALL_64_fastpath+0x12/0x71
 Code: 8d bc 24 90 00 00 00 c1 e8 02 89 c3 4c 89 ff 41 01 de e8 9a b2 8f e0 89
d8 48 c1 e0 02 41 81 fe f7 03 00 00 76 7e 49 8b 44 24 38 <c7> 04 98 00 00 00 20
49 8b 74 24 18 48 85 f6 0f 84 95 00 00 00 
 RIP  [<ffffffffa0c868aa>] evo_wait+0x5a/0x130 [nouveau]
  RSP <ffff881013c4f878>
 CR2: ffff88110fa7cffc
 ---[ end trace cf00f17e0e1d2606 ]---

% lspci -nn -d 10de: 
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84 [GeForce 8600
GTS] [10de:0400] (rev a1)
05:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK110 [GeForce GTX
TITAN] [10de:1005] (rev a1)
05:00.1 Audio device [0403]: NVIDIA Corporation GK110 HDMI Audio [10de:0e1a]
(rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535779010.b753ACe.20573
Date: Sat, 23 Jan 2016 19:38:21 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG: unable to handle kernel paging request at ffff88110fa7cffc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93834">93834</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: unable to handle kernel paging request at ffff88110fa7cffc
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
          <td>freedesktop&#64;thecybershadow.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121235" name="attach_121235" title="Complete dmesg">attachment 121235</a> <a href="attachment.cgi?id=121235&amp;action=edit" title="Complete dmesg">[details]</a></span>
Complete dmesg

Running Arch Linux (4.3.3-3-ARCH) on a GA-X79S-UP5-WIFI with a GTX Titan and a
8600 GTS, nouveau seems to oops on load:

 BUG: unable to handle kernel paging request at ffff88110fa7cffc
 IP: [&lt;ffffffffa0c868aa&gt;] evo_wait+0x5a/0x130 [nouveau]
 PGD 2b3f067 PUD 0 
 Oops: 0002 [#1] PREEMPT SMP 

 CPU: 7 PID: 340 Comm: systemd-udevd Not tainted 4.3.3-3-ARCH #1
 Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./X79S-UP5,
BIOS F5f 03/19/2014
 task: ffff881013c40000 ti: ffff881013c4c000 task.ti: ffff881013c4c000
 RIP: 0010:[&lt;ffffffffa0c868aa&gt;]  [&lt;ffffffffa0c868aa&gt;] evo_wait+0x5a/0x130
[nouveau]
 RSP: 0018:ffff881013c4f878  EFLAGS: 00010202
 RAX: ffff88100fa7d000 RBX: 000000003fffffff RCX: 0000000000000000
 RDX: ffffc90006b24000 RSI: 0000000000000008 RDI: ffff88101569a498
 RBP: ffff881013c4f8a0 R08: ffffffffa0c36ad0 R09: ffff88101388a9c0
 R10: 0000000000019ca4 R11: 00000000000004d6 R12: ffff88101569a408
 R13: ffff88100d00a0d8 R14: 0000000040000007 R15: ffff88101569a498
 FS:  00007f6d7c64e7c0(0000) GS:ffff88105fce0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: ffff88110fa7cffc CR3: 000000101671f000 CR4: 00000000001406e0
 Stack:
  ffff88100d00c000 ffff88101569a400 ffff88100d00a0d8 ffff88101569a408
  ffff88100d00a878 ffff881013c4f8d0 ffffffffa0c871a7 ffff88100d00c000
  ffff881016b6fb80 ffffffffa0cec660 ffff88100d00a000 ffff881013c4f8f8
 Call Trace:
  [&lt;ffffffffa0c871a7&gt;] evo_sync+0x37/0xf0 [nouveau]
  [&lt;ffffffffa0c874a8&gt;] nv50_crtc_disable+0x28/0x90 [nouveau]
  [&lt;ffffffffa04ec466&gt;] __drm_helper_disable_unused_functions+0xa6/0xe0
[drm_kms_helper]
  [&lt;ffffffffa04ec4ba&gt;] drm_helper_disable_unused_functions+0x1a/0x30
[drm_kms_helper]
  [&lt;ffffffffa0c8c114&gt;] nouveau_fbcon_init+0xd4/0x110 [nouveau]
  [&lt;ffffffffa0c792a3&gt;] nouveau_drm_load+0x2f3/0x940 [nouveau]
  [&lt;ffffffffa04724d7&gt;] drm_dev_register+0xa7/0xb0 [drm]
  [&lt;ffffffffa0474d63&gt;] drm_get_pci_dev+0xd3/0x1e0 [drm]
  [&lt;ffffffffa0c78ab0&gt;] nouveau_drm_probe+0x220/0x240 [nouveau]
  [&lt;ffffffff813063d5&gt;] local_pci_probe+0x45/0xa0
  [&lt;ffffffff81306320&gt;] ? pci_match_device+0xe0/0x110
  [&lt;ffffffff81307563&gt;] pci_device_probe+0x103/0x150
  [&lt;ffffffff813e01f2&gt;] driver_probe_device+0x222/0x490
  [&lt;ffffffff813e04e4&gt;] __driver_attach+0x84/0x90
  [&lt;ffffffff813e0460&gt;] ? driver_probe_device+0x490/0x490
  [&lt;ffffffff813dde2c&gt;] bus_for_each_dev+0x6c/0xc0
  [&lt;ffffffff813df9ae&gt;] driver_attach+0x1e/0x20
  [&lt;ffffffff813df4fb&gt;] bus_add_driver+0x1eb/0x280
  [&lt;ffffffff813e0df0&gt;] driver_register+0x60/0xe0
  [&lt;ffffffff81305c4c&gt;] __pci_register_driver+0x4c/0x50
  [&lt;ffffffffa0474f50&gt;] drm_pci_init+0xe0/0x110 [drm]
  [&lt;ffffffffa09c6000&gt;] ? 0xffffffffa09c6000
  [&lt;ffffffffa09c6216&gt;] nouveau_drm_init+0x216/0x1000 [nouveau]
  [&lt;ffffffff81002123&gt;] do_one_initcall+0xb3/0x200
  [&lt;ffffffff8119e491&gt;] ? __vunmap+0x91/0xe0
  [&lt;ffffffff8115d510&gt;] do_init_module+0x5f/0x1ef
  [&lt;ffffffff810f9897&gt;] load_module+0x2197/0x27e0
  [&lt;ffffffff810f66e0&gt;] ? symbol_put_addr+0x50/0x50
  [&lt;ffffffff810fa02e&gt;] SyS_init_module+0x14e/0x190
  [&lt;ffffffff81583d2e&gt;] entry_SYSCALL_64_fastpath+0x12/0x71
 Code: 8d bc 24 90 00 00 00 c1 e8 02 89 c3 4c 89 ff 41 01 de e8 9a b2 8f e0 89
d8 48 c1 e0 02 41 81 fe f7 03 00 00 76 7e 49 8b 44 24 38 &lt;c7&gt; 04 98 00 00 00 20
49 8b 74 24 18 48 85 f6 0f 84 95 00 00 00 
 RIP  [&lt;ffffffffa0c868aa&gt;] evo_wait+0x5a/0x130 [nouveau]
  RSP &lt;ffff881013c4f878&gt;
 CR2: ffff88110fa7cffc
 ---[ end trace cf00f17e0e1d2606 ]---

% lspci -nn -d 10de: 
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84 [GeForce 8600
GTS] [10de:0400] (rev a1)
05:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK110 [GeForce GTX
TITAN] [10de:1005] (rev a1)
05:00.1 Audio device [0403]: NVIDIA Corporation GK110 HDMI Audio [10de:0e1a]
(rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535779010.b753ACe.20573--

--===============0710599974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0710599974==--
