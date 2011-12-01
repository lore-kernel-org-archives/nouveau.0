From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43437] New: [NV4B] Crash when starting loads of 3D
	applications
Date: Thu, 01 Dec 2011 21:54:25 +0000
Message-ID: <bug-43437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=43437

             Bug #: 43437
           Summary: [NV4B] Crash when starting loads of 3D applications
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When starting a lot of 3D application on my NV4B (Geforce 7600GS AGP), a kernel
panic occurs bringing the entire system to a halt. In my case this was
Gnome-shell with several applications open, and glxgears running 8 or 9 times
concurrently. A rather synthetic environment I must admit, but having a
null-pointer dereference may never occur and/or bring the system down. :)

Reproducible:
1. Log in to your desktop (in my case gnome shell)
2. Start GLXGears
3. Start GLXGears
4. Start GLXGears
5. Start GLXGears
6. Start GLXGears
7. Start GLXGears
8. Start GLXGears
9. Start GLXGears
10. Start GLXGears

Expected behaviour:
Loads of gears on my screen running really really slow. Or applications being
killed because the GPU cannot service them

Actual behaviour:
Kernel BUG.

Software:
Fedora 16
kernel-3.1.2-1.fc16.i686
xorg-x11-drv-nouveau-0.0.16-27.20110720gitb806e3f.fc16.i686

Kernel log:
    Dec 1 14:35:24 Seven kernel: [16444.216143] BUG: unable to handle kernel
NULL pointer dereference at 00000001
    Dec 1 14:35:24 Seven kernel: [16444.216418] IP: [<f7dd2cd8>]
nouveau_fence_update+0xe/0xa5 [nouveau]
    Dec 1 14:35:24 Seven kernel: [16444.217012] *pde = 56152067
    Dec 1 14:35:24 Seven kernel: [16444.217012] Oops: 0000 [#1] SMP
    Dec 1 14:35:24 Seven kernel: [16444.217012] Modules linked in: nf_nat_h323
nf_conntrack_h323 nf_nat_pptp nf_conntrack_pptp nf_conntrack_proto_gre
nf_nat_proto_gre nf_nat_tftp nf_conntrack_tftp nf_nat_sip nf_conntrack_sip
nf_nat_irc nf_conntrack_irc nf_nat_ftp nf_conntrack_ftp fuse lockd rfcomm bnep
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6t_REJECT nf_conntrack_ipv6
nf_defrag_ipv6 xt_state ipt_MASQUERADE iptable_nat nf_nat nf_conntrack_ipv4
nf_conntrack nf_defrag_ipv4 ip6table_filter ip6_tables w83l785ts asb100
hwmon_vid snd_emu10k1_synth snd_emux_synth snd_seq_virmidi snd_seq_midi_event
snd_seq_midi_emul snd_emu10k1 snd_ac97_codec snd_cs4236 snd_wss_lib ac97_bus
snd_opl3_lib snd_seq ppdev arc4 ath5k ath mac80211 cfg80211 btusb bluetooth
snd_pcm snd_timer snd_mpu401 snd_mpu401_uart snd_page_alloc snd_util_mem
snd_rawmidi snd_hwdep snd_seq_device snd soundcore parport_pc parport rfkill
emu10k1_gp ns558 3c59x forcedeth mii i2c_nforce2 gameport binfmt_misc sunrpc
uinput firewire_ohci pata_acpi ata_generic
    Dec 1 14:35:24 Seven kernel: firewire_core crc_itu_t sata_sil pata_amd
nouveau ttm drm_kms_helper drm i2c_algo_bit i2c_core mxm_wmi wmi video [last
unloaded: scsi_wait_scan]
    Dec 1 14:35:24 Seven kernel: [16444.217012]
    Dec 1 14:35:24 Seven kernel: [16444.217012] Pid: 1541, comm: gnome-shell
Not tainted 3.1.2-1.fc16.i686 #1 ASUSTeK Computer INC. A7N8X2.0/A7N8X2.0
    Dec 1 14:35:24 Seven kernel: [16444.217012] EIP: 0060:[<f7dd2cd8>] EFLAGS:
00010296 CPU: 0
    Dec 1 14:35:24 Seven kernel: [16444.217012] EIP is at
nouveau_fence_update+0xe/0xa5 [nouveau]
    Dec 1 14:35:24 Seven kernel: [16444.217012] EAX: 00000001 EBX: ce179a60
ECX: 00000001 EDX: 00000001
    Dec 1 14:35:24 Seven kernel: [16444.217012] ESI: f0e63240 EDI: f0e63240
EBP: f31cfd10 ESP: f31cfcfc
    Dec 1 14:35:24 Seven kernel: [16444.217012] DS: 007b ES: 007b FS: 00d8 GS:
00e0 SS: 0068
    Dec 1 14:35:24 Seven kernel: [16444.217012] Process gnome-shell (pid: 1541,
ti=f31ce000 task=f0e63240 task.ti=f31ce000)
    Dec 1 14:35:24 Seven kernel: [16444.217012] Stack:
    Dec 1 14:35:24 Seven kernel: [16444.217012] ce179f00 ce179820 ce179a60
f0e63240 f0e63240 f31cfd1c f7dd2f7b 000003e8
    Dec 1 14:35:24 Seven kernel: [16444.217012] f31cfd48 f7dd2fc6 00000000
ce179a60 00f66310 0001cb83 00000000 00000004
    Dec 1 14:35:24 Seven kernel: [16444.217012] f6e80000 00000004 00000060
f31cfd78 f7dd31ba 00000000 00000017 ce179a60
    Dec 1 14:35:24 Seven kernel: [16444.217012] Call TraDec 1 14:36:53 Seven
kernel: imklog 5.8.5, log source = /proc/kmsg started.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
