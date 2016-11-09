From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98654] New: kernel paging request at iowrite32
Date: Wed, 09 Nov 2016 10:56:19 +0000
Message-ID: <bug-98654-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0149735139=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0149735139==
Content-Type: multipart/alternative; boundary="14786889790.D2f5.14948";
 charset="UTF-8"


--14786889790.D2f5.14948
Date: Wed, 9 Nov 2016 10:56:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98654

            Bug ID: 98654
           Summary: kernel paging request at iowrite32
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: germano.massullo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This is the upstream bugreport clone of
https://bugzilla.redhat.com/show_bug.cgi?id=3D1343242
I attach only the first comment, for more information please see the previo=
us
URL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Additional info:
reporter:       libreport-2.7.1
BUG: unable to handle kernel paging request at ffffc90000eb0000
IP: [<ffffffff813ec9ce>] iowrite32+0x2e/0x40
PGD 1b90a0067 PUD 1b90a1067 PMD bb976067 PTE 0
Oops: 0002 [#1] SMP=20
Modules linked in: bnep nfnetlink_queue nfnetlink_log bluetooth rfkill xfs =
fuse
xt_CHECKSUM ipt_MASQUERADE nf_nat_masquerade_ipv4 tun ip6t_rpfilter ip6t_RE=
JECT
nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_broute bridge stp llc
ebtable_nat ip6table_mangle ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_security ip6table_raw iptable_mangle iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_ta=
bles
rc_dib0700_rc5 dib7000p raid456 async_raid6_recov async_memcpy async_pq
async_xor xor async_tx raid6_pq coretemp kvm_intel kvm iTCO_wdt gpio_ich
iTCO_vendor_support snd_hda_codec_analog snd_hda_codec_generic irqbypass
dvb_pll cx22702 cx88_dvb cx88_vp3054_i2c videobuf2_dvb
 ir_lirc_codec lirc_dev dvb_usb_dib0700 rc_cinergy_1400 dib7000m dib0090
dib0070 dib3000mc dibx000_common dvb_usb i2c_i801 dvb_core dm_thin_pool
dm_persistent_data dm_bio_prison libcrc32c joydev cx8800 cx8802 cx88xx
snd_hda_intel videobuf2_dma_sg tveeprom videobuf2_memops videobuf2_v4l2
snd_hda_codec videobuf2_core rc_core v4l2_common snd_hda_core videodev
snd_hwdep snd_seq media snd_seq_device lpc_ich snd_pcm snd_timer snd
asus_atk0110 soundcore shpchp acpi_cpufreq tpm_tis tpm binfmt_misc nfsd
auth_rpcgss nfs_acl lockd grace sunrpc ata_generic pata_acpi nouveau video
mxm_wmi wmi i2c_algo_bit drm_kms_helper serio_raw ttm firewire_ohci
firewire_core skge crc_itu_t drm hid_logitech uas ff_memless usb_storage
pata_jmicron fjes
CPU: 1 PID: 10062 Comm: multiqueue24:sr Not tainted 4.5.5-300.fc24.x86_64 #1
Hardware name: System manufacturer System Product Name/P5B-Deluxe, BIOS 123=
8=20=20=20
09/30/2008
task: ffff8801a28bba80 ti: ffff88010ee74000 task.ti: ffff88010ee74000
RIP: 0010:[<ffffffff813ec9ce>]  [<ffffffff813ec9ce>] iowrite32+0x2e/0x40
RSP: 0018:ffff88010ee77948  EFLAGS: 00010292
RAX: ffffffffa0205100 RBX: 0000000000010000 RCX: 0000000000000009
RDX: 000000001dfc5201 RSI: ffffc90000eb0000 RDI: 000000001dfc5201
RBP: ffff88010ee77950 R08: 0000000000000100 R09: 000000001deda000
R10: ffff8801a49ca800 R11: 000000001deda000 R12: 0000000000000000
R13: 000000001dfc5201 R14: 0000000000000080 R15: ffff880036a65340
FS:  00007ff0a66ea700(0000) GS:ffff8801bfc80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90000eb0000 CR3: 00000000a6bd1000 CR4: 00000000000006e0
Stack:
 ffffffffa0174494 ffff88010ee779a8 ffffffffa017a1c6 ffff8801a49ca800
 ffff8800a7426258 000000001dfd5001 0000002800000000 0000000000000100
 0000000000000000 0000000000002015 ffff8801b5d6f600 ffff8800a7426258
Call Trace:
 [<ffffffffa0174494>] ? nvkm_instobj_wr32+0x14/0x20 [nouveau]
 [<ffffffffa017a1c6>] nv50_vm_map+0x156/0x1a0 [nouveau]
 [<ffffffffa017833d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
 [<ffffffffa017521b>] nv50_instobj_map+0x1b/0x20 [nouveau]
 [<ffffffffa0175482>] nv50_instobj_boot+0xc2/0x120 [nouveau]
 [<ffffffffa017539b>] nv50_instobj_acquire+0x4b/0x70 [nouveau]
 [<ffffffffa01743c7>] nvkm_instobj_acquire_slow+0x17/0x30 [nouveau]
 [<ffffffffa017473a>] nvkm_instobj_new+0x6a/0x170 [nouveau]
 [<ffffffffa01363f4>] nvkm_memory_new+0x44/0x80 [nouveau]
 [<ffffffffa0178e7f>] nvkm_vm_get+0x15f/0x250 [nouveau]
 [<ffffffffa01d1b00>] nouveau_bo_vma_add+0x30/0x90 [nouveau]
 [<ffffffffa01e34a9>] nouveau_channel_prep+0x1d9/0x2a0 [nouveau]
 [<ffffffffa01e35c7>] nouveau_channel_new+0x57/0x6e0 [nouveau]
 [<ffffffffa0133a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
 [<ffffffff8121ab52>] ? kmem_cache_alloc_trace+0x1c2/0x1d0
 [<ffffffffa01e2736>] nouveau_abi16_ioctl_channel_alloc+0xd6/0x2c0 [nouveau]
 [<ffffffffa0050712>] drm_ioctl+0x152/0x540 [drm]
 [<ffffffffa01e2660>] ? nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
 [<ffffffffa01cb144>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
 [<ffffffff81256183>] do_vfs_ioctl+0xa3/0x5d0
 [<ffffffff81256729>] SyS_ioctl+0x79/0x90
 [<ffffffff817cecee>] entry_SYSCALL_64_fastpath+0x12/0x6d
Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 89 f8 ef c3 55 =
48
89 f7 48 c7 c6 52 84 aa 81 48 89 e5 e8 54 fe ff ff 5d c3 <89> 3e c3 0f 1f 4=
4 00
00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
RIP  [<ffffffff813ec9ce>] iowrite32+0x2e/0x40
 RSP <ffff88010ee77948>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14786889790.D2f5.14948
Date: Wed, 9 Nov 2016 10:56:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel paging request at iowrite32"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98654">98654</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel paging request at iowrite32
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>germano.massullo&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is the upstream bugreport clone of
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1343242">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1343242</a>
I attach only the first comment, for more information please see the previo=
us
URL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Additional info:
reporter:       libreport-2.7.1
BUG: unable to handle kernel paging request at ffffc90000eb0000
IP: [&lt;ffffffff813ec9ce&gt;] iowrite32+0x2e/0x40
PGD 1b90a0067 PUD 1b90a1067 PMD bb976067 PTE 0
Oops: 0002 [#1] SMP=20
Modules linked in: bnep nfnetlink_queue nfnetlink_log bluetooth rfkill xfs =
fuse
xt_CHECKSUM ipt_MASQUERADE nf_nat_masquerade_ipv4 tun ip6t_rpfilter ip6t_RE=
JECT
nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_broute bridge stp llc
ebtable_nat ip6table_mangle ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_security ip6table_raw iptable_mangle iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
iptable_security iptable_raw ebtable_filter ebtables ip6table_filter ip6_ta=
bles
rc_dib0700_rc5 dib7000p raid456 async_raid6_recov async_memcpy async_pq
async_xor xor async_tx raid6_pq coretemp kvm_intel kvm iTCO_wdt gpio_ich
iTCO_vendor_support snd_hda_codec_analog snd_hda_codec_generic irqbypass
dvb_pll cx22702 cx88_dvb cx88_vp3054_i2c videobuf2_dvb
 ir_lirc_codec lirc_dev dvb_usb_dib0700 rc_cinergy_1400 dib7000m dib0090
dib0070 dib3000mc dibx000_common dvb_usb i2c_i801 dvb_core dm_thin_pool
dm_persistent_data dm_bio_prison libcrc32c joydev cx8800 cx8802 cx88xx
snd_hda_intel videobuf2_dma_sg tveeprom videobuf2_memops videobuf2_v4l2
snd_hda_codec videobuf2_core rc_core v4l2_common snd_hda_core videodev
snd_hwdep snd_seq media snd_seq_device lpc_ich snd_pcm snd_timer snd
asus_atk0110 soundcore shpchp acpi_cpufreq tpm_tis tpm binfmt_misc nfsd
auth_rpcgss nfs_acl lockd grace sunrpc ata_generic pata_acpi nouveau video
mxm_wmi wmi i2c_algo_bit drm_kms_helper serio_raw ttm firewire_ohci
firewire_core skge crc_itu_t drm hid_logitech uas ff_memless usb_storage
pata_jmicron fjes
CPU: 1 PID: 10062 Comm: multiqueue24:sr Not tainted 4.5.5-300.fc24.x86_64 #1
Hardware name: System manufacturer System Product Name/P5B-Deluxe, BIOS 123=
8=20=20=20
09/30/2008
task: ffff8801a28bba80 ti: ffff88010ee74000 task.ti: ffff88010ee74000
RIP: 0010:[&lt;ffffffff813ec9ce&gt;]  [&lt;ffffffff813ec9ce&gt;] iowrite32+=
0x2e/0x40
RSP: 0018:ffff88010ee77948  EFLAGS: 00010292
RAX: ffffffffa0205100 RBX: 0000000000010000 RCX: 0000000000000009
RDX: 000000001dfc5201 RSI: ffffc90000eb0000 RDI: 000000001dfc5201
RBP: ffff88010ee77950 R08: 0000000000000100 R09: 000000001deda000
R10: ffff8801a49ca800 R11: 000000001deda000 R12: 0000000000000000
R13: 000000001dfc5201 R14: 0000000000000080 R15: ffff880036a65340
FS:  00007ff0a66ea700(0000) GS:ffff8801bfc80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90000eb0000 CR3: 00000000a6bd1000 CR4: 00000000000006e0
Stack:
 ffffffffa0174494 ffff88010ee779a8 ffffffffa017a1c6 ffff8801a49ca800
 ffff8800a7426258 000000001dfd5001 0000002800000000 0000000000000100
 0000000000000000 0000000000002015 ffff8801b5d6f600 ffff8800a7426258
Call Trace:
 [&lt;ffffffffa0174494&gt;] ? nvkm_instobj_wr32+0x14/0x20 [nouveau]
 [&lt;ffffffffa017a1c6&gt;] nv50_vm_map+0x156/0x1a0 [nouveau]
 [&lt;ffffffffa017833d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
 [&lt;ffffffffa017521b&gt;] nv50_instobj_map+0x1b/0x20 [nouveau]
 [&lt;ffffffffa0175482&gt;] nv50_instobj_boot+0xc2/0x120 [nouveau]
 [&lt;ffffffffa017539b&gt;] nv50_instobj_acquire+0x4b/0x70 [nouveau]
 [&lt;ffffffffa01743c7&gt;] nvkm_instobj_acquire_slow+0x17/0x30 [nouveau]
 [&lt;ffffffffa017473a&gt;] nvkm_instobj_new+0x6a/0x170 [nouveau]
 [&lt;ffffffffa01363f4&gt;] nvkm_memory_new+0x44/0x80 [nouveau]
 [&lt;ffffffffa0178e7f&gt;] nvkm_vm_get+0x15f/0x250 [nouveau]
 [&lt;ffffffffa01d1b00&gt;] nouveau_bo_vma_add+0x30/0x90 [nouveau]
 [&lt;ffffffffa01e34a9&gt;] nouveau_channel_prep+0x1d9/0x2a0 [nouveau]
 [&lt;ffffffffa01e35c7&gt;] nouveau_channel_new+0x57/0x6e0 [nouveau]
 [&lt;ffffffffa0133a2d&gt;] ? nvif_device_init+0x2d/0x30 [nouveau]
 [&lt;ffffffff8121ab52&gt;] ? kmem_cache_alloc_trace+0x1c2/0x1d0
 [&lt;ffffffffa01e2736&gt;] nouveau_abi16_ioctl_channel_alloc+0xd6/0x2c0 [n=
ouveau]
 [&lt;ffffffffa0050712&gt;] drm_ioctl+0x152/0x540 [drm]
 [&lt;ffffffffa01e2660&gt;] ? nouveau_abi16_ioctl_setparam+0x10/0x10 [nouve=
au]
 [&lt;ffffffffa01cb144&gt;] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
 [&lt;ffffffff81256183&gt;] do_vfs_ioctl+0xa3/0x5d0
 [&lt;ffffffff81256729&gt;] SyS_ioctl+0x79/0x90
 [&lt;ffffffff817cecee&gt;] entry_SYSCALL_64_fastpath+0x12/0x6d
Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 89 f8 ef c3 55 =
48
89 f7 48 c7 c6 52 84 aa 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt;89&gt; 3e c3 0=
f 1f 44 00
00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
RIP  [&lt;ffffffff813ec9ce&gt;] iowrite32+0x2e/0x40
 RSP &lt;ffff88010ee77948&gt;
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14786889790.D2f5.14948--

--===============0149735139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0149735139==--
