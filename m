From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Thu, 01 Mar 2018 13:32:26 +0000
Message-ID: <bug-105173-8800-hUKiex93mc@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1627224741=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1627224741==
Content-Type: multipart/alternative; boundary="15199111461.bf7Ea.6279"
Content-Transfer-Encoding: 7bit


--15199111461.bf7Ea.6279
Date: Thu, 1 Mar 2018 13:32:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #12 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> The NULL pointer dereference, or the =E2=80=9Ctrapped read at 0080000000 =
on channel 1=20
> [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M2M_=
IN]=20
> reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?

"NULL pointer dereference" AND "trapped read" after launtching supertuxkart

kernel-4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6
wayland session

[   63.992917] nouveau 0000:03:00.0: imem: OOM: 0004b000 00000000 -28
[   63.992930] BUG: unable to handle kernel NULL pointer dereference at
0000000000000000
[   63.993014] IP: nvkm_object_unmap+0x5/0x20 [nouveau]
[   63.993020] PGD 0 P4D 0=20
[   63.993027] Oops: 0000 [#1] SMP PTI
[   63.993034] Modules linked in: fuse xt_CHECKSUM ipt_MASQUERADE
nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast x=
t_CT
ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink
ebtable_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6
nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
iptable_mangle iptable_raw iptable_security ebtable_filter ebtables
ip6table_filter ip6_tables snd_hda_codec_hdmi sunrpc xfs libcrc32c
snd_hda_codec_realtek snd_hda_codec_generic coretemp snd_hda_intel
snd_hda_codec wmi_bmof pcspkr snd_hda_core snd_hwdep snd_seq snd_seq_device
snd_pcm snd_timer shpchp snd nv_tco soundcore i2c_nforce2 acpi_cpufreq
binfmt_misc nouveau
[   63.993122]  mxm_wmi i2c_algo_bit drm_kms_helper ttm drm serio_raw force=
deth
video wmi
[   63.993144] CPU: 0 PID: 2867 Comm: supertuxkart Not tainted
4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64 #1
[   63.993153] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2009
[   63.993182] RIP: 0010:nvkm_object_unmap+0x5/0x20 [nouveau]
[   63.993188] RSP: 0018:ffffad338456fc98 EFLAGS: 00010282
[   63.993194] RAX: ffffffffc036d400 RBX: ffff94b4cdf513d8 RCX:
0000000000000018
[   63.993201] RDX: ffffffffc028a9e0 RSI: ffff94b4cdf513f8 RDI:
0000000000000000
[   63.993207] RBP: ffff94b4cdf513c8 R08: 00000000000250c0 R09:
ffffffffc0287ca3
[   63.993213] R10: fffff9754294c340 R11: ffffffffaa9440cd R12:
ffff94b4cdf513f8
[   63.993219] R13: 0000000ecba0cfdc R14: ffff94b55c8e7020 R15:
0000000000000020
[   63.993226] FS:  00007f77ac70d840(0000) GS:ffff94b56fc00000(0000)
knlGS:0000000000000000
[   63.993233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.993238] CR2: 0000000000000000 CR3: 000000006d418000 CR4:
00000000000406f0
[   63.993244] Call Trace:
[   63.993276]  nvkm_object_dtor+0x9a/0x160 [nouveau]
[   63.993304]  nvkm_object_del+0x24/0xa0 [nouveau]
[   63.993331]  nvkm_ioctl_new+0x260/0x2b0 [nouveau]
[   63.993371]  ? nvkm_fifo_chan_dtor+0x100/0x100 [nouveau]
[   63.993398]  ? nvkm_object_new_+0x60/0x60 [nouveau]
[   63.993425]  nvkm_ioctl+0x10a/0x240 [nouveau]
[   63.993464]  usif_ioctl+0x62e/0x740 [nouveau]
[   63.993504]  nouveau_drm_ioctl+0xad/0xc0 [nouveau]
[   63.993514]  do_vfs_ioctl+0xa4/0x620
[   63.993521]  SyS_ioctl+0x74/0x80
[   63.993529]  do_syscall_64+0x74/0x180
[   63.993536]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[   63.993543] RIP: 0033:0x7f77a89bf8e7
[   63.993547] RSP: 002b:00007ffc62fbfd28 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   63.993554] RAX: ffffffffffffffda RBX: 0000000000000038 RCX:
00007f77a89bf8e7
[   63.993561] RDX: 000055a3912a7d70 RSI: 00000000c0386447 RDI:
0000000000000007
[   63.993566] RBP: 000055a3912a7d70 R08: 000055a39129f910 R09:
00007f77a8a14708
[   63.993572] R10: ffffffffffffff90 R11: 0000000000000246 R12:
00000000c0386447
[   63.993579] R13: 0000000000000007 R14: 000055a3912a7da8 R15:
0000000000000000
[   63.993585] Code: ff c3 0f 1f 40 00 66 66 66 66 90 48 8b 07 48 8b 40 28 =
48
85 c0 74 05 e9 6a 8f 97 e9 b8 ed ff ff ff c3 0f 1f 40 00 66 66 66 66 90 <48=
> 8b
07 48 8b 40 30 48 85 c0 74 05 e9 4a 8f 97 e9 b8 ed ff ff=20
[   63.993651] RIP: nvkm_object_unmap+0x5/0x20 [nouveau] RSP: ffffad338456f=
c98
[   63.993657] CR2: 0000000000000000
[   63.997842] ---[ end trace a49568284ce09eb6 ]---
[   79.659127] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[   79.659723] nouveau 0000:03:00.0: gr: TRAP_M2MF 00000002 [IN]
[   79.659729] nouveau 0000:03:00.0: gr: TRAP_M2MF 00320951 206f1fc0 000000=
00
04000430
[   79.659733] nouveau 0000:03:00.0: gr: 00200000 [] ch 1 [000fbb0000 DRM] =
subc
4 class 5039 mthd 0100 data 00000000
[   79.659746] nouveau 0000:03:00.0: fb: trapped read at 00206f0000 on chan=
nel
1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M2M_=
IN]
reason 00000002 [PAGE_NOT_PRESENT]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199111461.bf7Ea.6279
Date: Thu, 1 Mar 2018 13:32:26 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvlbox&#64;gmail.com" title=3D"Nick Lee &lt;nvlbox&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nick Lee</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; The NULL pointer dereference, or th=
e =E2=80=9Ctrapped read at 0080000000 on channel 1=20
&gt; [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M=
2M_IN]=20
&gt; reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?</span >

&quot;NULL pointer dereference&quot; AND &quot;trapped read&quot; after lau=
ntching supertuxkart

kernel-4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6
wayland session

[   63.992917] nouveau 0000:03:00.0: imem: OOM: 0004b000 00000000 -28
[   63.992930] BUG: unable to handle kernel NULL pointer dereference at
0000000000000000
[   63.993014] IP: nvkm_object_unmap+0x5/0x20 [nouveau]
[   63.993020] PGD 0 P4D 0=20
[   63.993027] Oops: 0000 [#1] SMP PTI
[   63.993034] Modules linked in: fuse xt_CHECKSUM ipt_MASQUERADE
nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast x=
t_CT
ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink
ebtable_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6
nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
iptable_mangle iptable_raw iptable_security ebtable_filter ebtables
ip6table_filter ip6_tables snd_hda_codec_hdmi sunrpc xfs libcrc32c
snd_hda_codec_realtek snd_hda_codec_generic coretemp snd_hda_intel
snd_hda_codec wmi_bmof pcspkr snd_hda_core snd_hwdep snd_seq snd_seq_device
snd_pcm snd_timer shpchp snd nv_tco soundcore i2c_nforce2 acpi_cpufreq
binfmt_misc nouveau
[   63.993122]  mxm_wmi i2c_algo_bit drm_kms_helper ttm drm serio_raw force=
deth
video wmi
[   63.993144] CPU: 0 PID: 2867 Comm: supertuxkart Not tainted
4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64 #1
[   63.993153] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2009
[   63.993182] RIP: 0010:nvkm_object_unmap+0x5/0x20 [nouveau]
[   63.993188] RSP: 0018:ffffad338456fc98 EFLAGS: 00010282
[   63.993194] RAX: ffffffffc036d400 RBX: ffff94b4cdf513d8 RCX:
0000000000000018
[   63.993201] RDX: ffffffffc028a9e0 RSI: ffff94b4cdf513f8 RDI:
0000000000000000
[   63.993207] RBP: ffff94b4cdf513c8 R08: 00000000000250c0 R09:
ffffffffc0287ca3
[   63.993213] R10: fffff9754294c340 R11: ffffffffaa9440cd R12:
ffff94b4cdf513f8
[   63.993219] R13: 0000000ecba0cfdc R14: ffff94b55c8e7020 R15:
0000000000000020
[   63.993226] FS:  00007f77ac70d840(0000) GS:ffff94b56fc00000(0000)
knlGS:0000000000000000
[   63.993233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.993238] CR2: 0000000000000000 CR3: 000000006d418000 CR4:
00000000000406f0
[   63.993244] Call Trace:
[   63.993276]  nvkm_object_dtor+0x9a/0x160 [nouveau]
[   63.993304]  nvkm_object_del+0x24/0xa0 [nouveau]
[   63.993331]  nvkm_ioctl_new+0x260/0x2b0 [nouveau]
[   63.993371]  ? nvkm_fifo_chan_dtor+0x100/0x100 [nouveau]
[   63.993398]  ? nvkm_object_new_+0x60/0x60 [nouveau]
[   63.993425]  nvkm_ioctl+0x10a/0x240 [nouveau]
[   63.993464]  usif_ioctl+0x62e/0x740 [nouveau]
[   63.993504]  nouveau_drm_ioctl+0xad/0xc0 [nouveau]
[   63.993514]  do_vfs_ioctl+0xa4/0x620
[   63.993521]  SyS_ioctl+0x74/0x80
[   63.993529]  do_syscall_64+0x74/0x180
[   63.993536]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[   63.993543] RIP: 0033:0x7f77a89bf8e7
[   63.993547] RSP: 002b:00007ffc62fbfd28 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   63.993554] RAX: ffffffffffffffda RBX: 0000000000000038 RCX:
00007f77a89bf8e7
[   63.993561] RDX: 000055a3912a7d70 RSI: 00000000c0386447 RDI:
0000000000000007
[   63.993566] RBP: 000055a3912a7d70 R08: 000055a39129f910 R09:
00007f77a8a14708
[   63.993572] R10: ffffffffffffff90 R11: 0000000000000246 R12:
00000000c0386447
[   63.993579] R13: 0000000000000007 R14: 000055a3912a7da8 R15:
0000000000000000
[   63.993585] Code: ff c3 0f 1f 40 00 66 66 66 66 90 48 8b 07 48 8b 40 28 =
48
85 c0 74 05 e9 6a 8f 97 e9 b8 ed ff ff ff c3 0f 1f 40 00 66 66 66 66 90 &lt=
;48&gt; 8b
07 48 8b 40 30 48 85 c0 74 05 e9 4a 8f 97 e9 b8 ed ff ff=20
[   63.993651] RIP: nvkm_object_unmap+0x5/0x20 [nouveau] RSP: ffffad338456f=
c98
[   63.993657] CR2: 0000000000000000
[   63.997842] ---[ end trace a49568284ce09eb6 ]---
[   79.659127] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[   79.659723] nouveau 0000:03:00.0: gr: TRAP_M2MF 00000002 [IN]
[   79.659729] nouveau 0000:03:00.0: gr: TRAP_M2MF 00320951 206f1fc0 000000=
00
04000430
[   79.659733] nouveau 0000:03:00.0: gr: 00200000 [] ch 1 [000fbb0000 DRM] =
subc
4 class 5039 mthd 0100 data 00000000
[   79.659746] nouveau 0000:03:00.0: fb: trapped read at 00206f0000 on chan=
nel
1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient 04 [M2M_=
IN]
reason 00000002 [PAGE_NOT_PRESENT]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199111461.bf7Ea.6279--

--===============1627224741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1627224741==--
