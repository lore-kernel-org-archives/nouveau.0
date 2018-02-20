From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference since kernel 4.15
Date: Tue, 20 Feb 2018 10:07:26 +0000
Message-ID: <bug-105173-8800-ZgsBz1DyVA@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1447350158=="
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


--===============1447350158==
Content-Type: multipart/alternative; boundary="15191212452.CCA7D93.20925"
Content-Transfer-Encoding: 7bit


--15191212452.CCA7D93.20925
Date: Tue, 20 Feb 2018 10:07:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|With kernel >=3D4.15 nouveau  |[MCP79][Regression]
                   |- artefacts and freezes     |Unhandled NULL pointer
                   |                            |dereference since kernel
                   |                            |4.15
             Status|NEW                         |ASSIGNED

--- Comment #3 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Thanks for the report. I=E2=80=99ll try to reproduce the issue on my laptop=
 and if that
works, bisect the kernel to figure out which change introduce the issue.

Looking at the logs, it seems like there is some out-of-memory error

> [   56.900580] nouveau 0000:03:00.0: imem: OOM: 0004b000 00000000 -28

followed by a NULL pointer dereference when trying to unmap an object

> [   56.900593] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [   56.900747] IP: nvkm_object_unmap+0x5/0x20 [nouveau]
> [   56.900754] PGD 0 P4D 0=20
> [   56.900761] Oops: 0000 [#1] SMP PTI
> [   56.900767] Modules linked in: fuse xt_CHECKSUM ipt_MASQUERADE nf_nat_=
masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip=
6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtabl=
e_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defra=
g_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security iptable_n=
at nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack iptable=
_mangle iptable_raw iptable_security ebtable_filter ebtables ip6table_filte=
r ip6_tables sunrpc snd_hda_codec_hdmi xfs libcrc32c snd_hda_codec_realtek =
snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep sn=
d_seq coretemp snd_seq_device snd_pcm wmi_bmof shpchp snd_timer snd soundco=
re nv_tco i2c_nforce2 acpi_cpufreq binfmt_misc nouveau i2c_algo_bit
> [   56.900857]  mxm_wmi drm_kms_helper ttm drm serio_raw forcedeth video =
wmi
> [   56.900870] CPU: 1 PID: 2856 Comm: supertuxkart Not tainted 4.16.0-0.r=
c2.git0.1.fc28.x86_64 #1
> [   56.900876] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2009
> [   56.900910] RIP: 0010:nvkm_object_unmap+0x5/0x20 [nouveau]
> [   56.900916] RSP: 0018:ffffae3c4188bca0 EFLAGS: 00010282
> [   56.900922] RAX: ffffffffc0592400 RBX: ffff9c81cb2cf198 RCX: 000000000=
0000018
> [   56.900928] RDX: ffffffffc04ac1b0 RSI: ffff9c81cb2cf1b8 RDI: 000000000=
0000000
> [   56.900934] RBP: ffff9c81cb2cf188 R08: 00000000000250c0 R09: ffffffffc=
04a9b63
> [   56.900941] R10: ffffd07b4280a8c0 R11: ffffffff959711ed R12: ffff9c81c=
b2cf1b8
> [   56.900947] R13: 0000000d4fb70488 R14: ffff9c8200180020 R15: 000000000=
0000006
> [   56.900955] FS:  00007fad6be37840(0000) GS:ffff9c822fc80000(0000) knlG=
S:0000000000000000
> [   56.900961] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   56.900967] CR2: 0000000000000000 CR3: 0000000086db2000 CR4: 000000000=
00406e0
> [   56.900974] Call Trace:
> [   56.901012]  nvkm_object_dtor+0x96/0x100 [nouveau]
> [   56.901046]  ? nvkm_object_del+0x24/0xa0 [nouveau]
> [   56.901075]  ? nvkm_ioctl_new+0x1ee/0x220 [nouveau]
> [   56.901116]  ? nvkm_fifo_chan_dtor+0xf0/0xf0 [nouveau]
> [   56.901148]  ? nvkm_object_new_+0x60/0x60 [nouveau]
> [   56.901180]  ? nvkm_ioctl+0xd8/0x170 [nouveau]
> [   56.901222]  ? usif_ioctl+0x6b1/0x730 [nouveau]
> [   56.901262]  ? nouveau_drm_ioctl+0xad/0xc0 [nouveau]
> [   56.901271]  ? do_vfs_ioctl+0xa4/0x610
> [   56.901277]  ? SyS_ioctl+0x74/0x80
> [   56.901285]  ? do_syscall_64+0x74/0x180
> [   56.901295]  ? entry_SYSCALL_64_after_hwframe+0x3d/0xa2
> [   56.901301] Code: ff c3 0f 1f 40 00 66 66 66 66 90 48 8b 07 48 8b 40 2=
8 48 85 c0 74 05 e9 0a 76 75 d4 b8 ed ff ff ff c3 0f 1f 40 00 66 66 66 66 9=
0 <48> 8b 07 48 8b 40 30 48 85 c0 74 05 e9 ea 75 75 d4 b8 ed ff ff=20
> [   56.901373] RIP: nvkm_object_unmap+0x5/0x20 [nouveau] RSP: ffffae3c418=
8bca0
> [   56.901380] CR2: 0000000000000000
> [   56.910903] ---[ end trace bde3a9a90b3fc089 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15191212452.CCA7D93.20925
Date: Tue, 20 Feb 2018 10:07:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pierre.mo=
rrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"=
> <span class=3D"fn">Pierre Moreau</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>With kernel &gt;=3D4.15 nouveau - artefacts and freezes
           </td>
           <td>[MCP79][Regression] Unhandled NULL pointer dereference since=
 kernel 4.15
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Thanks for the report. I=E2=80=99ll try to reproduce the issue=
 on my laptop and if that
works, bisect the kernel to figure out which change introduce the issue.

Looking at the logs, it seems like there is some out-of-memory error

<span class=3D"quote">&gt; [   56.900580] nouveau 0000:03:00.0: imem: OOM: =
0004b000 00000000 -28</span >

followed by a NULL pointer dereference when trying to unmap an object

<span class=3D"quote">&gt; [   56.900593] BUG: unable to handle kernel NULL=
 pointer dereference at           (null)
&gt; [   56.900747] IP: nvkm_object_unmap+0x5/0x20 [nouveau]
&gt; [   56.900754] PGD 0 P4D 0=20
&gt; [   56.900761] Oops: 0000 [#1] SMP PTI
&gt; [   56.900767] Modules linked in: fuse xt_CHECKSUM ipt_MASQUERADE nf_n=
at_masquerade_ipv4 tun nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT=
 ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebt=
able_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_de=
frag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security iptabl=
e_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack ipta=
ble_mangle iptable_raw iptable_security ebtable_filter ebtables ip6table_fi=
lter ip6_tables sunrpc snd_hda_codec_hdmi xfs libcrc32c snd_hda_codec_realt=
ek snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep=
 snd_seq coretemp snd_seq_device snd_pcm wmi_bmof shpchp snd_timer snd soun=
dcore nv_tco i2c_nforce2 acpi_cpufreq binfmt_misc nouveau i2c_algo_bit
&gt; [   56.900857]  mxm_wmi drm_kms_helper ttm drm serio_raw forcedeth vid=
eo wmi
&gt; [   56.900870] CPU: 1 PID: 2856 Comm: supertuxkart Not tainted 4.16.0-=
0.rc2.git0.1.fc28.x86_64 #1
&gt; [   56.900876] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2=
009
&gt; [   56.900910] RIP: 0010:nvkm_object_unmap+0x5/0x20 [nouveau]
&gt; [   56.900916] RSP: 0018:ffffae3c4188bca0 EFLAGS: 00010282
&gt; [   56.900922] RAX: ffffffffc0592400 RBX: ffff9c81cb2cf198 RCX: 000000=
0000000018
&gt; [   56.900928] RDX: ffffffffc04ac1b0 RSI: ffff9c81cb2cf1b8 RDI: 000000=
0000000000
&gt; [   56.900934] RBP: ffff9c81cb2cf188 R08: 00000000000250c0 R09: ffffff=
ffc04a9b63
&gt; [   56.900941] R10: ffffd07b4280a8c0 R11: ffffffff959711ed R12: ffff9c=
81cb2cf1b8
&gt; [   56.900947] R13: 0000000d4fb70488 R14: ffff9c8200180020 R15: 000000=
0000000006
&gt; [   56.900955] FS:  00007fad6be37840(0000) GS:ffff9c822fc80000(0000) k=
nlGS:0000000000000000
&gt; [   56.900961] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
&gt; [   56.900967] CR2: 0000000000000000 CR3: 0000000086db2000 CR4: 000000=
00000406e0
&gt; [   56.900974] Call Trace:
&gt; [   56.901012]  nvkm_object_dtor+0x96/0x100 [nouveau]
&gt; [   56.901046]  ? nvkm_object_del+0x24/0xa0 [nouveau]
&gt; [   56.901075]  ? nvkm_ioctl_new+0x1ee/0x220 [nouveau]
&gt; [   56.901116]  ? nvkm_fifo_chan_dtor+0xf0/0xf0 [nouveau]
&gt; [   56.901148]  ? nvkm_object_new_+0x60/0x60 [nouveau]
&gt; [   56.901180]  ? nvkm_ioctl+0xd8/0x170 [nouveau]
&gt; [   56.901222]  ? usif_ioctl+0x6b1/0x730 [nouveau]
&gt; [   56.901262]  ? nouveau_drm_ioctl+0xad/0xc0 [nouveau]
&gt; [   56.901271]  ? do_vfs_ioctl+0xa4/0x610
&gt; [   56.901277]  ? SyS_ioctl+0x74/0x80
&gt; [   56.901285]  ? do_syscall_64+0x74/0x180
&gt; [   56.901295]  ? entry_SYSCALL_64_after_hwframe+0x3d/0xa2
&gt; [   56.901301] Code: ff c3 0f 1f 40 00 66 66 66 66 90 48 8b 07 48 8b 4=
0 28 48 85 c0 74 05 e9 0a 76 75 d4 b8 ed ff ff ff c3 0f 1f 40 00 66 66 66 6=
6 90 &lt;48&gt; 8b 07 48 8b 40 30 48 85 c0 74 05 e9 ea 75 75 d4 b8 ed ff ff=
=20
&gt; [   56.901373] RIP: nvkm_object_unmap+0x5/0x20 [nouveau] RSP: ffffae3c=
4188bca0
&gt; [   56.901380] CR2: 0000000000000000
&gt; [   56.910903] ---[ end trace bde3a9a90b3fc089 ]---</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15191212452.CCA7D93.20925--

--===============1447350158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1447350158==--
