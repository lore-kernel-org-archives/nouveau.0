From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71620] nouveau_fence_wait_uevent NULL pointer
	dereference
Date: Sat, 28 Jun 2014 00:19:45 +0000
Message-ID: <bug-71620-8800-WZagLC8QRJ@http.bugs.freedesktop.org/>
References: <bug-71620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0418461108=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0418461108==
Content-Type: multipart/alternative; boundary="1403914785.31dB16DF2.16117"; charset="us-ascii"


--1403914785.31dB16DF2.16117
Date: Sat, 28 Jun 2014 00:19:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71620

--- Comment #5 from James TD Smith <ahktenzero+freedesktop-foGQJe5GvY4KlTDg6p0iyA@public.gmane.org> ---
Looks like I've run into the same problem. X crashed while I was using Firefox
and I found the traceback below in my logs. There were no errors in the Xorg
logs so I've omitted those. I'm running Debian 7.5 amd64, kernel 3.13.5, Xorg
7.7, Nouveau 1.0.10-1+b1. Graphics card is a GF114 [GeForce GTX 560 Ti] (rev
a1).

Jun 27 23:48:46 nyarlathotep kernel: [421145.711394] BUG: unable to handle
kernel NULL pointer dereference at 0000000000000008
Jun 27 23:48:46 nyarlathotep kernel: [421145.711427] IP: [<ffffffffa0306f0e>]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.711471] PGD 0 
Jun 27 23:48:46 nyarlathotep kernel: [421145.711477] Oops: 0000 [#1] PREEMPT
SMP 
Jun 27 23:48:46 nyarlathotep kernel: [421145.711490] Modules linked in: cpuid
sha256_generic cbc tcp_diag inet_diag xt_addrtype xt_conntrack ipt_MASQUERADE
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
bridge stp llc aufs(C) iptable_filter ip_tables x_tables bnep rfcomm bluetooth
rpcsec_gss_krb5 nfsv4 dns_resolver cpufreq_conservative cpufreq_userspace
cpufreq_powersave cpufreq_stats battery snd_hrtimer vboxpci(O) vboxnetadp(O)
vboxnetflt(O) vboxdrv(O) binfmt_misc uinput fuse nfsd auth_rpcgss oid_registry
nfs_acl nfs lockd fscache sunrpc synaptics_usb ext3 jbd dm_crypt md_mod
firewire_sbp2 loop parport_pc ppdev parport snd_hda_codec_hdmi powermate
snd_hda_codec_analog arc4 hid_generic snd_emu10k1_synth snd_emux_synth
snd_seq_midi_emul joydev snd_seq_virmidi usbhid hid snd_usb_audio
snd_usbmidi_lib xpad ff_memless rtl8187 nfc mac80211 cfg80211 eeprom_93cx6
rfkill snd_emu10k1 snd_seq_midi snd_seq_midi_event snd_hda_intel snd_util_mem
snd_ac97_codec snd_hda_codec snd_hwdep snd_pcm_oss snd_m
Jun 27 23:48:46 nyarlathotep kernel: ixer_oss snd_rawmidi evdev snd_pcm
ac97_bus coretemp snd_page_alloc kvm_intel kvm emu10k1_gp gameport snd_seq
nouveau snd_seq_device video snd_timer serio_raw lpc_ich mxm_wmi mfd_core wmi
pcspkr i2c_algo_bit i2c_i801 ttm drm_kms_helper drm snd asus_atk0110 i2c_core
soundcore acpi_cpufreq processor thermal_sys button ext4 crc16 jbd2 mbcache
dm_mirror dm_region_hash dm_log dm_mod sr_mod cdrom sg sd_mod usb_storage r8169
mii firewire_ohci firewire_core crc_itu_t pata_jmicron ahci libahci sky2 libata
scsi_mod xhci_hcd ehci_pci uhci_hcd ehci_hcd usbcore usb_common
Jun 27 23:48:46 nyarlathotep kernel: [421145.711942] CPU: 3 PID: 5115 Comm:
Xorg Tainted: G         C O 3.13.5 #1
Jun 27 23:48:46 nyarlathotep kernel: [421145.711951] Hardware name: System
manufacturer P5K3 Deluxe/P5K3 Deluxe, BIOS 1206    04/16/2009
Jun 27 23:48:46 nyarlathotep kernel: [421145.711969] task: ffff880222f4ef90 ti:
ffff880225014000 task.ti: ffff880225014000
Jun 27 23:48:46 nyarlathotep kernel: [421145.711979] RIP:
0010:[<ffffffffa0306f0e>]  [<ffffffffa0306f0e>]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RSP: 0018:ffff880225015c90
 EFLAGS: 00010286
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RAX: 0000000000000000 RBX:
0000000000000000 RCX: 0000000000000000
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RDX: ffff88012e55ec80 RSI:
0000000000000001 RDI: ffff88012e55ef00
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RBP: ffff88012e55ef00 R08:
ffff880225015c90 R09: 000000000000e200
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] R10: 0000000000000000 R11:
0000000000000246 R12: ffff880036478101
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] R13: ffff88003657b601 R14:
ffff88003649bd01 R15: 0000000000000001
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] FS: 
00007f7cc13fa980(0000) GS:ffff88022fd80000(0000) knlGS:0000000000000000
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] CS:  0010 DS: 0000 ES:
0000 CR0: 000000008005003b
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] CR2: 0000000000000008 CR3:
00000000ca894000 CR4: 00000000000407e0
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Stack:
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  00000000000013fb
0000000080000000 0000000000000000 ffff88012e55ec80
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  0000000000000001
ffff88012e55ef00 0000000000000000 ffff88012e55ef00
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  ffff880036478101
ffff88003657b601 ffff88003649bd80 0000000000000001
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Call Trace:
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa030721d>] ?
nouveau_fence_wait+0x43/0x128 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8138dc4b>] ?
_raw_spin_unlock+0xd/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa0306ec2>] ?
nouveau_fence_done+0x48/0x79 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa022906d>] ?
ttm_bo_wait+0xa2/0x158 [ttm]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa030ba5c>] ?
nouveau_gem_ioctl_cpu_prep+0x49/0x75 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa030ba13>] ?
nouveau_gem_ioctl_pushbuf+0xbde/0xbde [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa0243fa2>] ?
drm_ioctl+0x27b/0x3ba [drm]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa030ba13>] ?
nouveau_gem_ioctl_pushbuf+0xbde/0xbde [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff81286cef>] ?
rpm_resume+0x49c/0x4ad
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8138de57>] ?
_raw_spin_lock+0xe/0x17
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8138dc4b>] ?
_raw_spin_unlock+0xd/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffffa0305b45>] ?
nouveau_drm_ioctl+0x48/0x7c [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8111c928>] ?
do_vfs_ioctl+0x3f8/0x441
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff811105c5>] ?
__fput+0x176/0x197
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff81125aa1>] ?
mntput_no_expire+0x1a/0x118
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8104c398>] ?
task_work_run+0x7b/0x8a
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff8111c9bf>] ?
SyS_ioctl+0x4e/0x79
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [<ffffffff813924e6>] ?
system_call_fastpath+0x1a/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Code: 7d 28 00 5a 0f 94 c0
5b 5d 41 5c 41 5d 41 5e c3 41 57 41 56 41 88 f6 41 55 41 54 55 48 89 fd 53 48
83 ec 30 48 8b 47 28 49 89 e0 <48> 8b 48 08 48 8b 91 f0 00 00 00 4c 8b a9 68 07
00 00 48 8b 42 
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RIP  [<ffffffffa0306f0e>]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  RSP <ffff880225015c90>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403914785.31dB16DF2.16117
Date: Sat, 28 Jun 2014 00:19:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71620#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71620">bug 71620</a>
              from <span class="vcard"><a class="email" href="mailto:ahktenzero+freedesktop&#64;mohorovi.cc" title="James TD Smith &lt;ahktenzero+freedesktop&#64;mohorovi.cc&gt;"> <span class="fn">James TD Smith</span></a>
</span></b>
        <pre>Looks like I've run into the same problem. X crashed while I was using Firefox
and I found the traceback below in my logs. There were no errors in the Xorg
logs so I've omitted those. I'm running Debian 7.5 amd64, kernel 3.13.5, Xorg
7.7, Nouveau 1.0.10-1+b1. Graphics card is a GF114 [GeForce GTX 560 Ti] (rev
a1).

Jun 27 23:48:46 nyarlathotep kernel: [421145.711394] BUG: unable to handle
kernel NULL pointer dereference at 0000000000000008
Jun 27 23:48:46 nyarlathotep kernel: [421145.711427] IP: [&lt;ffffffffa0306f0e&gt;]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.711471] PGD 0 
Jun 27 23:48:46 nyarlathotep kernel: [421145.711477] Oops: 0000 [#1] PREEMPT
SMP 
Jun 27 23:48:46 nyarlathotep kernel: [421145.711490] Modules linked in: cpuid
sha256_generic cbc tcp_diag inet_diag xt_addrtype xt_conntrack ipt_MASQUERADE
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
bridge stp llc aufs(C) iptable_filter ip_tables x_tables bnep rfcomm bluetooth
rpcsec_gss_krb5 nfsv4 dns_resolver cpufreq_conservative cpufreq_userspace
cpufreq_powersave cpufreq_stats battery snd_hrtimer vboxpci(O) vboxnetadp(O)
vboxnetflt(O) vboxdrv(O) binfmt_misc uinput fuse nfsd auth_rpcgss oid_registry
nfs_acl nfs lockd fscache sunrpc synaptics_usb ext3 jbd dm_crypt md_mod
firewire_sbp2 loop parport_pc ppdev parport snd_hda_codec_hdmi powermate
snd_hda_codec_analog arc4 hid_generic snd_emu10k1_synth snd_emux_synth
snd_seq_midi_emul joydev snd_seq_virmidi usbhid hid snd_usb_audio
snd_usbmidi_lib xpad ff_memless rtl8187 nfc mac80211 cfg80211 eeprom_93cx6
rfkill snd_emu10k1 snd_seq_midi snd_seq_midi_event snd_hda_intel snd_util_mem
snd_ac97_codec snd_hda_codec snd_hwdep snd_pcm_oss snd_m
Jun 27 23:48:46 nyarlathotep kernel: ixer_oss snd_rawmidi evdev snd_pcm
ac97_bus coretemp snd_page_alloc kvm_intel kvm emu10k1_gp gameport snd_seq
nouveau snd_seq_device video snd_timer serio_raw lpc_ich mxm_wmi mfd_core wmi
pcspkr i2c_algo_bit i2c_i801 ttm drm_kms_helper drm snd asus_atk0110 i2c_core
soundcore acpi_cpufreq processor thermal_sys button ext4 crc16 jbd2 mbcache
dm_mirror dm_region_hash dm_log dm_mod sr_mod cdrom sg sd_mod usb_storage r8169
mii firewire_ohci firewire_core crc_itu_t pata_jmicron ahci libahci sky2 libata
scsi_mod xhci_hcd ehci_pci uhci_hcd ehci_hcd usbcore usb_common
Jun 27 23:48:46 nyarlathotep kernel: [421145.711942] CPU: 3 PID: 5115 Comm:
Xorg Tainted: G         C O 3.13.5 #1
Jun 27 23:48:46 nyarlathotep kernel: [421145.711951] Hardware name: System
manufacturer P5K3 Deluxe/P5K3 Deluxe, BIOS 1206    04/16/2009
Jun 27 23:48:46 nyarlathotep kernel: [421145.711969] task: ffff880222f4ef90 ti:
ffff880225014000 task.ti: ffff880225014000
Jun 27 23:48:46 nyarlathotep kernel: [421145.711979] RIP:
0010:[&lt;ffffffffa0306f0e&gt;]  [&lt;ffffffffa0306f0e&gt;]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RSP: 0018:ffff880225015c90
 EFLAGS: 00010286
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RAX: 0000000000000000 RBX:
0000000000000000 RCX: 0000000000000000
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RDX: ffff88012e55ec80 RSI:
0000000000000001 RDI: ffff88012e55ef00
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RBP: ffff88012e55ef00 R08:
ffff880225015c90 R09: 000000000000e200
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] R10: 0000000000000000 R11:
0000000000000246 R12: ffff880036478101
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] R13: ffff88003657b601 R14:
ffff88003649bd01 R15: 0000000000000001
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] FS: 
00007f7cc13fa980(0000) GS:ffff88022fd80000(0000) knlGS:0000000000000000
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] CS:  0010 DS: 0000 ES:
0000 CR0: 000000008005003b
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] CR2: 0000000000000008 CR3:
00000000ca894000 CR4: 00000000000407e0
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Stack:
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  00000000000013fb
0000000080000000 0000000000000000 ffff88012e55ec80
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  0000000000000001
ffff88012e55ef00 0000000000000000 ffff88012e55ef00
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  ffff880036478101
ffff88003657b601 ffff88003649bd80 0000000000000001
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Call Trace:
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa030721d&gt;] ?
nouveau_fence_wait+0x43/0x128 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8138dc4b&gt;] ?
_raw_spin_unlock+0xd/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa0306ec2&gt;] ?
nouveau_fence_done+0x48/0x79 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa022906d&gt;] ?
ttm_bo_wait+0xa2/0x158 [ttm]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa030ba5c&gt;] ?
nouveau_gem_ioctl_cpu_prep+0x49/0x75 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa030ba13&gt;] ?
nouveau_gem_ioctl_pushbuf+0xbde/0xbde [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa0243fa2&gt;] ?
drm_ioctl+0x27b/0x3ba [drm]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa030ba13&gt;] ?
nouveau_gem_ioctl_pushbuf+0xbde/0xbde [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff81286cef&gt;] ?
rpm_resume+0x49c/0x4ad
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8138de57&gt;] ?
_raw_spin_lock+0xe/0x17
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8138dc4b&gt;] ?
_raw_spin_unlock+0xd/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffffa0305b45&gt;] ?
nouveau_drm_ioctl+0x48/0x7c [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8111c928&gt;] ?
do_vfs_ioctl+0x3f8/0x441
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff811105c5&gt;] ?
__fput+0x176/0x197
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff81125aa1&gt;] ?
mntput_no_expire+0x1a/0x118
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8104c398&gt;] ?
task_work_run+0x7b/0x8a
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff8111c9bf&gt;] ?
SyS_ioctl+0x4e/0x79
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  [&lt;ffffffff813924e6&gt;] ?
system_call_fastpath+0x1a/0x1f
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] Code: 7d 28 00 5a 0f 94 c0
5b 5d 41 5c 41 5d 41 5e c3 41 57 41 56 41 88 f6 41 55 41 54 55 48 89 fd 53 48
83 ec 30 48 8b 47 28 49 89 e0 &lt;48&gt; 8b 48 08 48 8b 91 f0 00 00 00 4c 8b a9 68 07
00 00 48 8b 42 
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004] RIP  [&lt;ffffffffa0306f0e&gt;]
nouveau_fence_wait_uevent+0x1b/0x2e7 [nouveau]
Jun 27 23:48:46 nyarlathotep kernel: [421145.712004]  RSP &lt;ffff880225015c90&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403914785.31dB16DF2.16117--

--===============0418461108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0418461108==--
