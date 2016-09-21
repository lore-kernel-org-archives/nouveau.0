From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97438] Running a lot of Firefox instances causes
 kernel page fault.
Date: Wed, 21 Sep 2016 01:24:48 +0000
Message-ID: <bug-97438-8800-FRXeq4qRZg@http.bugs.freedesktop.org/>
References: <bug-97438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289512581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1289512581==
Content-Type: multipart/alternative; boundary="14744210880.01b3Fd.6910";
 charset="UTF-8"


--14744210880.01b3Fd.6910
Date: Wed, 21 Sep 2016 01:24:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97438

--- Comment #4 from Reuben <reuben.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same issue.

Kernel 4.7.4
Mesa 12.0.3

35.241925] resource sanity check: requesting [mem 0xfbfbb000-0xfc020fff], w=
hich
spans more than 0000:0a:00.0 [mem 0xfa000000-0xfbffffff 64bit]
[   35.241956] caller nv50_instobj_boot+0x94/0x100 [nouveau] mapping multip=
le
BARs
[   35.241969] BUG: unable to handle kernel paging request at ffffc900039f0=
000
[   35.241981] IP: [<ffffffff81478f6b>] iowrite32+0x2b/0x40
[   35.241994] PGD 437025067 PUD 437026067 PMD 432772067 PTE 0
[   35.242001] Oops: 0002 [#1] PREEMPT SMP
[   35.242003] Modules linked in: nf_conntrack_netbios_ns
nf_conntrack_broadcast ip6t_rpfilter xt_conntrack ebtable_nat ebtable_broute
ip6table_nat ip6table_raw ip6table_mangle ip6table_security iptable_nat
iptable_raw iptable_mangle iptable_security ebtable_filter ebtables
hid_logitech_hidpp wacom hid_logitech_dj nouveau snd_hda_codec_realtek
snd_hda_codec_generic k10temp snd_hda_intel snd_hda_codec 8250 snd_hwdep r8=
169
snd_rme96 snd_hda_core ttm 8250_base i2c_piix4 serial_core mii wmi sch_fq_c=
odel
tipc snd_aloop snd_pcm
[   35.242061] CPU: 2 PID: 1546 Comm: kded4 Not tainted 4.7.4-gentoo #1
[   35.242065] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8
02/24/2011
[   35.242069] task: ffff8803a49e8b80 ti: ffff88039f654000 task.ti:
ffff88039f654000
[   35.242076] RIP: 0010:[<ffffffff81478f6b>]  [<ffffffff81478f6b>]
iowrite32+0x2b/0x40
[   35.242082] RSP: 0018:ffff88039f657a48  EFLAGS: 00010292
[   35.242084] RAX: ffffffffa021ef20 RBX: 0000000000010000 RCX:
0000000000000009
[   35.242088] RDX: ffffc900039f0000 RSI: ffffc900039f0000 RDI:
000000001df13281
[   35.242092] RBP: 000000001df13281 R08: 0000000000000066 R09:
000000001dece000
[   35.242095] R10: ffffffffa0220060 R11: 000000001dece000 R12:
0000000000000000
[   35.242099] R13: 0000000000000008 R14: 0000000000000100 R15:
ffff8804303089c0
[   35.242103] FS:  00007fe55c501800(0000) GS:ffff880447c80000(0000)
knlGS:0000000000000000
[   35.242107] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.242110] CR2: ffffc900039f0000 CR3: 00000003a4bfa000 CR4:
00000000000006e0
[   35.242114] Stack:
[   35.242115]  ffffffffa019679b 000000001df33001 ffff8800b788a618
0000000000000010
[   35.242121]  0000000000000000 ffff88040f56af00 0000000000000066
0000000000000000
[   35.242127]  0000000000002021 ffff880433ca3000 0000000000000000
ffff8800b788a618
[   35.242133] Call Trace:
[   35.242148]  [<ffffffffa019679b>] ? nv50_vm_map+0x15b/0x1a0 [nouveau]
[   35.242164]  [<ffffffffa01949ec>] ? nvkm_vm_map_at+0xcc/0x1e0 [nouveau]
[   35.242179]  [<ffffffffa0191bea>] ? nv50_instobj_boot+0xaa/0x100 [nouvea=
u]
[   35.242195]  [<ffffffffa0191b1e>] ? nv50_instobj_acquire+0x3e/0x60 [nouv=
eau]
[   35.242210]  [<ffffffffa0190bce>] ? nvkm_instobj_acquire_slow+0xe/0x20
[nouveau]
[   35.242225]  [<ffffffffa0190f12>] ? nvkm_instobj_new+0x52/0x140 [nouveau]
[   35.242249]  [<ffffffffa015430c>] ? nvkm_memory_new+0x2c/0x60 [nouveau]
[   35.242260]  [<ffffffffa015320f>] ? nvkm_gpuobj_new+0x10f/0x200 [nouveau]
[   35.242271]  [<ffffffffa01528ee>] ? nvkm_engine_ref+0x2e/0x60 [nouveau]
[   35.242284]  [<ffffffffa01c8082>] ? nv50_gr_chan_bind+0x22/0x60 [nouveau]
[   35.242298]  [<ffffffffa01bb984>] ? nvkm_fifo_chan_child_new+0x124/0x240
[nouveau]
[   35.242309]  [<ffffffffa0153ade>] ? nvkm_ioctl_new+0x11e/0x260 [nouveau]
[   35.242321]  [<ffffffffa01fe3b6>] ?
nouveau_abi16_ioctl_notifierobj_alloc+0x1b6/0x2a0 [nouveau]
[   35.242336]  [<ffffffffa01bb860>] ? nvkm_fifo_chan_dtor+0xc0/0xc0 [nouve=
au]
[   35.242347]  [<ffffffffa01557a0>] ? nvkm_object_new_+0x60/0x60 [nouveau]
[   35.242358]  [<ffffffffa0154117>] ? nvkm_ioctl+0xf7/0x240 [nouveau]
[   35.242371]  [<ffffffffa01ea353>] ? usif_ioctl+0x4f3/0x760 [nouveau]
[   35.242383]  [<ffffffffa01e7761>] ? nouveau_drm_ioctl+0xa1/0xc0 [nouveau]
[   35.242390]  [<ffffffff811b42aa>] ? do_vfs_ioctl+0x8a/0x5a0
[   35.242394]  [<ffffffff8110e6a8>] ? audit_filter_inodes+0xe8/0x100
[   35.242397]  [<ffffffff8110e0c2>] ? audit_filter_syscall+0xa2/0x100
[   35.242401]  [<ffffffff811b482f>] ? SyS_ioctl+0x6f/0x80
[   35.242405]  [<ffffffff81002691>] ? do_syscall_64+0x51/0x100
[   35.242409]  [<ffffffff8193393c>] ? entry_SYSCALL64_slow_path+0x25/0x25
[   35.242412] Code: 48 81 fe ff ff 03 00 48 89 f2 77 1f 48 81 fe 00 00 01 =
00
76 07 0f b7 d6 89 f8 ef c3 48 c7 c6 0b 81 be 81 48 89 d7 e9 55 fe ff ff <89=
> 3e
c3 0f 1f 84 00 00 00 00 00 66 2e 0f 1f 84 00 00 00 00 00=20
[   35.245837] RIP  [<ffffffff81478f6b>] iowrite32+0x2b/0x40
[   35.245841]  RSP <ffff88039f657a48>
[   35.245843] CR2: ffffc900039f0000
[   35.252148] ---[ end trace a033f52a09912e38 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14744210880.01b3Fd.6910
Date: Wed, 21 Sep 2016 01:24:48 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438">bug 97438<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reuben.m&#64;gmail.com" title=3D"Reuben &lt;reuben.m&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Reuben</span></a>
</span></b>
        <pre>Same issue.

Kernel 4.7.4
Mesa 12.0.3

35.241925] resource sanity check: requesting [mem 0xfbfbb000-0xfc020fff], w=
hich
spans more than 0000:0a:00.0 [mem 0xfa000000-0xfbffffff 64bit]
[   35.241956] caller nv50_instobj_boot+0x94/0x100 [nouveau] mapping multip=
le
BARs
[   35.241969] BUG: unable to handle kernel paging request at ffffc900039f0=
000
[   35.241981] IP: [&lt;ffffffff81478f6b&gt;] iowrite32+0x2b/0x40
[   35.241994] PGD 437025067 PUD 437026067 PMD 432772067 PTE 0
[   35.242001] Oops: 0002 [#1] PREEMPT SMP
[   35.242003] Modules linked in: nf_conntrack_netbios_ns
nf_conntrack_broadcast ip6t_rpfilter xt_conntrack ebtable_nat ebtable_broute
ip6table_nat ip6table_raw ip6table_mangle ip6table_security iptable_nat
iptable_raw iptable_mangle iptable_security ebtable_filter ebtables
hid_logitech_hidpp wacom hid_logitech_dj nouveau snd_hda_codec_realtek
snd_hda_codec_generic k10temp snd_hda_intel snd_hda_codec 8250 snd_hwdep r8=
169
snd_rme96 snd_hda_core ttm 8250_base i2c_piix4 serial_core mii wmi sch_fq_c=
odel
tipc snd_aloop snd_pcm
[   35.242061] CPU: 2 PID: 1546 Comm: kded4 Not tainted 4.7.4-gentoo #1
[   35.242065] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8
02/24/2011
[   35.242069] task: ffff8803a49e8b80 ti: ffff88039f654000 task.ti:
ffff88039f654000
[   35.242076] RIP: 0010:[&lt;ffffffff81478f6b&gt;]  [&lt;ffffffff81478f6b&=
gt;]
iowrite32+0x2b/0x40
[   35.242082] RSP: 0018:ffff88039f657a48  EFLAGS: 00010292
[   35.242084] RAX: ffffffffa021ef20 RBX: 0000000000010000 RCX:
0000000000000009
[   35.242088] RDX: ffffc900039f0000 RSI: ffffc900039f0000 RDI:
000000001df13281
[   35.242092] RBP: 000000001df13281 R08: 0000000000000066 R09:
000000001dece000
[   35.242095] R10: ffffffffa0220060 R11: 000000001dece000 R12:
0000000000000000
[   35.242099] R13: 0000000000000008 R14: 0000000000000100 R15:
ffff8804303089c0
[   35.242103] FS:  00007fe55c501800(0000) GS:ffff880447c80000(0000)
knlGS:0000000000000000
[   35.242107] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.242110] CR2: ffffc900039f0000 CR3: 00000003a4bfa000 CR4:
00000000000006e0
[   35.242114] Stack:
[   35.242115]  ffffffffa019679b 000000001df33001 ffff8800b788a618
0000000000000010
[   35.242121]  0000000000000000 ffff88040f56af00 0000000000000066
0000000000000000
[   35.242127]  0000000000002021 ffff880433ca3000 0000000000000000
ffff8800b788a618
[   35.242133] Call Trace:
[   35.242148]  [&lt;ffffffffa019679b&gt;] ? nv50_vm_map+0x15b/0x1a0 [nouve=
au]
[   35.242164]  [&lt;ffffffffa01949ec&gt;] ? nvkm_vm_map_at+0xcc/0x1e0 [nou=
veau]
[   35.242179]  [&lt;ffffffffa0191bea&gt;] ? nv50_instobj_boot+0xaa/0x100 [=
nouveau]
[   35.242195]  [&lt;ffffffffa0191b1e&gt;] ? nv50_instobj_acquire+0x3e/0x60=
 [nouveau]
[   35.242210]  [&lt;ffffffffa0190bce&gt;] ? nvkm_instobj_acquire_slow+0xe/=
0x20
[nouveau]
[   35.242225]  [&lt;ffffffffa0190f12&gt;] ? nvkm_instobj_new+0x52/0x140 [n=
ouveau]
[   35.242249]  [&lt;ffffffffa015430c&gt;] ? nvkm_memory_new+0x2c/0x60 [nou=
veau]
[   35.242260]  [&lt;ffffffffa015320f&gt;] ? nvkm_gpuobj_new+0x10f/0x200 [n=
ouveau]
[   35.242271]  [&lt;ffffffffa01528ee&gt;] ? nvkm_engine_ref+0x2e/0x60 [nou=
veau]
[   35.242284]  [&lt;ffffffffa01c8082&gt;] ? nv50_gr_chan_bind+0x22/0x60 [n=
ouveau]
[   35.242298]  [&lt;ffffffffa01bb984&gt;] ? nvkm_fifo_chan_child_new+0x124=
/0x240
[nouveau]
[   35.242309]  [&lt;ffffffffa0153ade&gt;] ? nvkm_ioctl_new+0x11e/0x260 [no=
uveau]
[   35.242321]  [&lt;ffffffffa01fe3b6&gt;] ?
nouveau_abi16_ioctl_notifierobj_alloc+0x1b6/0x2a0 [nouveau]
[   35.242336]  [&lt;ffffffffa01bb860&gt;] ? nvkm_fifo_chan_dtor+0xc0/0xc0 =
[nouveau]
[   35.242347]  [&lt;ffffffffa01557a0&gt;] ? nvkm_object_new_+0x60/0x60 [no=
uveau]
[   35.242358]  [&lt;ffffffffa0154117&gt;] ? nvkm_ioctl+0xf7/0x240 [nouveau]
[   35.242371]  [&lt;ffffffffa01ea353&gt;] ? usif_ioctl+0x4f3/0x760 [nouvea=
u]
[   35.242383]  [&lt;ffffffffa01e7761&gt;] ? nouveau_drm_ioctl+0xa1/0xc0 [n=
ouveau]
[   35.242390]  [&lt;ffffffff811b42aa&gt;] ? do_vfs_ioctl+0x8a/0x5a0
[   35.242394]  [&lt;ffffffff8110e6a8&gt;] ? audit_filter_inodes+0xe8/0x100
[   35.242397]  [&lt;ffffffff8110e0c2&gt;] ? audit_filter_syscall+0xa2/0x100
[   35.242401]  [&lt;ffffffff811b482f&gt;] ? SyS_ioctl+0x6f/0x80
[   35.242405]  [&lt;ffffffff81002691&gt;] ? do_syscall_64+0x51/0x100
[   35.242409]  [&lt;ffffffff8193393c&gt;] ? entry_SYSCALL64_slow_path+0x25=
/0x25
[   35.242412] Code: 48 81 fe ff ff 03 00 48 89 f2 77 1f 48 81 fe 00 00 01 =
00
76 07 0f b7 d6 89 f8 ef c3 48 c7 c6 0b 81 be 81 48 89 d7 e9 55 fe ff ff &lt=
;89&gt; 3e
c3 0f 1f 84 00 00 00 00 00 66 2e 0f 1f 84 00 00 00 00 00=20
[   35.245837] RIP  [&lt;ffffffff81478f6b&gt;] iowrite32+0x2b/0x40
[   35.245841]  RSP &lt;ffff88039f657a48&gt;
[   35.245843] CR2: ffffc900039f0000
[   35.252148] ---[ end trace a033f52a09912e38 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14744210880.01b3Fd.6910--

--===============1289512581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1289512581==--
