From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104181] [NV50/G94] system freeze on youtube with
 epiphany 3.26
Date: Tue, 14 Aug 2018 19:47:56 +0000
Message-ID: <bug-104181-8800-8Rd3Xg1COV@http.bugs.freedesktop.org/>
References: <bug-104181-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0236409051=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104181-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0236409051==
Content-Type: multipart/alternative; boundary="15342760762.c9caE.23613"
Content-Transfer-Encoding: 7bit


--15342760762.c9caE.23613
Date: Tue, 14 Aug 2018 19:47:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104181

--- Comment #5 from guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org ---
Maybe the following output is more meaningful (kernel 4.18):

[  860.276334] WARNING: CPU: 1 PID: 3296 at
drivers/gpu/drm/nouveau/nvif/vmm.c:71 nvif_vmm_put+0x65/0x70 [nouveau]
[  860.276338] Modules linked in: xt_iprange ipv6 crc_ccitt arc4 brcmsmac
cordic brcmutil mac80211 sha256_ssse3 sha256_generic cfg80211 acer_wmi
sparse_keymap rfkill iTCO_wdt iTCO_vendor_support joydev pcc_cpufreq
acpi_cpufreq snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
snd_hda_codec bcma snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore
mei_me i2c_i801 pcspkr mei lpc_ich mfd_core dm_crypt serio_raw atl1c nouveau
mxm_wmi i2c_algo_bit wmi drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops ttm video drm i2c_core
[  860.276369] CPU: 1 PID: 3296 Comm: kworker/1:2 Not tainted 4.18.0 #3
[  860.276371] Hardware name: Acer Aspire 5745G/JV51_CP, BIOS V1.19 22/03/2=
011
[  860.276389] Workqueue: events nouveau_cli_work [nouveau]
[  860.276402] RIP: 0010:nvif_vmm_put+0x65/0x70 [nouveau]
[  860.276404] Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 =
48
89 44 24 08 e8 b9 e6 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 <0f> 0=
b eb
f2 e8 22 64 e5 e9 66 90 53 48 83 ec 20 65 48 8b 04 25 28
[  860.276428] RSP: 0018:ffffa1344253fdf0 EFLAGS: 00010282
[  860.276430] RAX: 00000000fffffffe RBX: ffffa1344253fe18 RCX:
0000000000000000
[  860.276431] RDX: 0000000000000000 RSI: ffffa1344253fd60 RDI:
ffffa1344253fe00
[  860.276433] RBP: ffffa1344253fe48 R08: 0000000000af4000 R09:
0000000000000000
[  860.276434] R10: fffffc22023aa7c0 R11: ffff933153403a00 R12:
ffff93314f563260
[  860.276436] R13: dead000000000200 R14: dead000000000100 R15:
ffff93314f563270
[  860.276438] FS:  0000000000000000(0000) GS:ffff933157c40000(0000)
knlGS:0000000000000000
[  860.276439] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  860.276441] CR2: 00007f8462b05ff0 CR3: 000000012d00a003 CR4:
00000000000206e0
[  860.276442] Call Trace:
[  860.276462]  nouveau_vma_del+0x6b/0xb0 [nouveau]
[  860.276479]  nouveau_gem_object_delete_work+0x31/0x60 [nouveau]
[  860.276497]  nouveau_cli_work+0x71/0x100 [nouveau]
[  860.276502]  process_one_work+0x1bb/0x330
[  860.276505]  worker_thread+0x28/0x3c0
[  860.276507]  ? set_worker_desc+0xb0/0xb0
[  860.276509]  kthread+0x109/0x120
[  860.276511]  ? kthread_create_worker_on_cpu+0x70/0x70
[  860.276515]  ret_from_fork+0x35/0x40
[  860.276517] ---[ end trace 4129b6c001bb82f1 ]---
[  860.342881] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 8
[ositorWorkQueue[5997]] get 0000090664 put 0000091400 ib_get 000002b2 ib_put
000002b9 state 80006efc (err: INVALID_CMD) push 00400040
[  860.342911] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 8
[ositorWorkQueue[5997]] get 0000602004 put 000060200c ib_get 000002b3 ib_put
000002b9 state 80000000 (err: INVALID_CMD) push 00400040
[  860.343162] nouveau 0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE]
[  860.343168] nouveau 0000:01:00.0: gr: 00100000 [] ch 8 [003f55d000
ositorWorkQueue[5997]] subc 3 class 8597 mthd 0ef4 data 0fac6881

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15342760762.c9caE.23613
Date: Tue, 14 Aug 2018 19:47:56 +0000
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
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181">bug 10418=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
guido&#64;trentalancia.com" title=3D"guido&#64;trentalancia.com">guido&#64;=
trentalancia.com</a>
</span></b>
        <pre>Maybe the following output is more meaningful (kernel 4.18):

[  860.276334] WARNING: CPU: 1 PID: 3296 at
drivers/gpu/drm/nouveau/nvif/vmm.c:71 nvif_vmm_put+0x65/0x70 [nouveau]
[  860.276338] Modules linked in: xt_iprange ipv6 crc_ccitt arc4 brcmsmac
cordic brcmutil mac80211 sha256_ssse3 sha256_generic cfg80211 acer_wmi
sparse_keymap rfkill iTCO_wdt iTCO_vendor_support joydev pcc_cpufreq
acpi_cpufreq snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
snd_hda_codec bcma snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore
mei_me i2c_i801 pcspkr mei lpc_ich mfd_core dm_crypt serio_raw atl1c nouveau
mxm_wmi i2c_algo_bit wmi drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops ttm video drm i2c_core
[  860.276369] CPU: 1 PID: 3296 Comm: kworker/1:2 Not tainted 4.18.0 #3
[  860.276371] Hardware name: Acer Aspire 5745G/JV51_CP, BIOS V1.19 22/03/2=
011
[  860.276389] Workqueue: events nouveau_cli_work [nouveau]
[  860.276402] RIP: 0010:nvif_vmm_put+0x65/0x70 [nouveau]
[  860.276404] Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 =
48
89 44 24 08 e8 b9 e6 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 &lt;0f=
&gt; 0b eb
f2 e8 22 64 e5 e9 66 90 53 48 83 ec 20 65 48 8b 04 25 28
[  860.276428] RSP: 0018:ffffa1344253fdf0 EFLAGS: 00010282
[  860.276430] RAX: 00000000fffffffe RBX: ffffa1344253fe18 RCX:
0000000000000000
[  860.276431] RDX: 0000000000000000 RSI: ffffa1344253fd60 RDI:
ffffa1344253fe00
[  860.276433] RBP: ffffa1344253fe48 R08: 0000000000af4000 R09:
0000000000000000
[  860.276434] R10: fffffc22023aa7c0 R11: ffff933153403a00 R12:
ffff93314f563260
[  860.276436] R13: dead000000000200 R14: dead000000000100 R15:
ffff93314f563270
[  860.276438] FS:  0000000000000000(0000) GS:ffff933157c40000(0000)
knlGS:0000000000000000
[  860.276439] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  860.276441] CR2: 00007f8462b05ff0 CR3: 000000012d00a003 CR4:
00000000000206e0
[  860.276442] Call Trace:
[  860.276462]  nouveau_vma_del+0x6b/0xb0 [nouveau]
[  860.276479]  nouveau_gem_object_delete_work+0x31/0x60 [nouveau]
[  860.276497]  nouveau_cli_work+0x71/0x100 [nouveau]
[  860.276502]  process_one_work+0x1bb/0x330
[  860.276505]  worker_thread+0x28/0x3c0
[  860.276507]  ? set_worker_desc+0xb0/0xb0
[  860.276509]  kthread+0x109/0x120
[  860.276511]  ? kthread_create_worker_on_cpu+0x70/0x70
[  860.276515]  ret_from_fork+0x35/0x40
[  860.276517] ---[ end trace 4129b6c001bb82f1 ]---
[  860.342881] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 8
[ositorWorkQueue[5997]] get 0000090664 put 0000091400 ib_get 000002b2 ib_put
000002b9 state 80006efc (err: INVALID_CMD) push 00400040
[  860.342911] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 8
[ositorWorkQueue[5997]] get 0000602004 put 000060200c ib_get 000002b3 ib_put
000002b9 state 80000000 (err: INVALID_CMD) push 00400040
[  860.343162] nouveau 0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE]
[  860.343168] nouveau 0000:01:00.0: gr: 00100000 [] ch 8 [003f55d000
ositorWorkQueue[5997]] subc 3 class 8597 mthd 0ef4 data 0fac6881</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15342760762.c9caE.23613--

--===============0236409051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0236409051==--
