From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Thu, 17 Oct 2013 18:54:08 +0000
Message-ID: <bug-70390-8800-WUNDqhaKEj@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2136482492=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2136482492==
Content-Type: multipart/alternative; boundary="1382036047.a7dCccAF1.3048"; charset="us-ascii"


--1382036047.a7dCccAF1.3048
Date: Thu, 17 Oct 2013 18:54:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #12 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
(In reply to comment #11)
> Perhaps I can interest you in WARN_ON_ONCE.

That is very useful, thanks a lot.

So far I left the BUG_ON in place, assuming that it wouldn't trigger in any
case. I was wrong: I just got a kernel BUG report from what seems to be the
BUG_ON I added.

[45018.412278] ------------[ cut here ]------------
[45018.416902] kernel BUG at drivers/gpu/drm/nouveau/nouveau_bo.c:465!
[45018.423162] invalid opcode: 0000 [#1] PREEMPT SMP 
[45018.428001] Modules linked in: nls_cp850 vfat fat usb_storage tun autofs4
ipv6 btrfs xor zlib_deflate raid6_pq libcrc32c dm_mod fuse nfs lockd
nf_conntrack_h323 nf_conntrack_sip nf_conntrack_irc nf_conntrack_ftp
nf_conntrack uhci_hcd sunrpc loop nouveau usbhid snd_hda_codec_via
snd_hda_intel ohci_pci snd_hda_codec ohci_hcd snd_hwdep snd_bt87x ehci_pci
ehci_hcd snd_pcm video usbcore sr_mod cdrom mxm_wmi i2c_algo_bit kvm_amd kvm
ttm drm_kms_helper snd_page_alloc drm microcode k10temp pcspkr evdev snd_timer
snd ata_generic i2c_core r8169 asus_atk0110 sym53c8xx parport_pc
scsi_transport_spi backlight mii parport wmi button usb_common pata_atiixp
soundcore acpi_cpufreq mperf
[45018.488491] CPU: 0 PID: 2834 Comm: X Not tainted 3.11.4-gentoo #1
[45018.494579] Hardware name: System manufacturer System Product
Name/M4A785TD-V EVO, BIOS 2105    07/23/2010
[45018.504216] task: ffff8803ebc09910 ti: ffff8803e7dc4000 task.ti:
ffff8803e7dc4000
[45018.511689] RIP: 0010:[<ffffffffa038d7fb>]  [<ffffffffa038d7fb>]
nouveau_bo_wr32+0x4b/0x50 [nouveau]
[45018.520850] RSP: 0018:ffff8803e7dc5bd0  EFLAGS: 00010246
[45018.526157] RAX: 0000000000000000 RBX: ffff8803ec2d8780 RCX:
0000000000000000
[45018.533284] RDX: 0000000000406040 RSI: ffffc9001019f934 RDI:
0000000000000001
[45018.540409] RBP: 0000000000000000 R08: ffffc90010196000 R09:
ffffc90010196000
[45018.547535] R10: 0000000000000000 R11: 0000000000000000 R12:
000000002001a020
[45018.554660] R13: 0000000000406040 R14: ffff8802933b2280 R15:
0000000000000000
[45018.561787] FS:  00007f9d09b26880(0000) GS:ffff8803ffc00000(0000)
knlGS:00000000f6da2b90
[45018.569865] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[45018.575607] CR2: 00007ff639a65000 CR3: 00000003ec68f000 CR4:
00000000000007f0
[45018.582732] Stack:
[45018.584742]  ffffffffa039343a ffffffffa038ce76 ffff8803e934c6c0
ffff8803e97bde00
[45018.592196]  0000000000000000 ffff8803e7dc5d18 ffffffffa038a02d
ffff88015ebe80c0
[45018.599644]  ffff8803ec2d8780 ffff8803ec2d8780 ffff8803e7dc5d18
0000000000000000
[45018.607098] Call Trace:
[45018.609550]  [<ffffffffa039343a>] ? nv84_fence_emit32+0xda/0x1a0 [nouveau]
[45018.616424]  [<ffffffffa038ce76>] ? nouveau_bo_placement_set+0x76/0x130
[nouveau]
[45018.623904]  [<ffffffffa038a02d>] ? nouveau_fence_emit+0x3d/0xb0 [nouveau]
[45018.630780]  [<ffffffffa038a8c4>] ? nouveau_fence_new+0x64/0xb0 [nouveau]
[45018.637568]  [<ffffffffa0389898>] ? nv50_dma_push+0xc8/0xf0 [nouveau]
[45018.644012]  [<ffffffffa038fdbb>] ? nouveau_gem_ioctl_pushbuf+0x35b/0x12f0
[nouveau]
[45018.651746]  [<ffffffff811166f0>] ? __pollwait+0x110/0x110
[45018.657232]  [<ffffffffa00ed105>] ? drm_ioctl+0x4b5/0x5b0 [drm]
[45018.663156]  [<ffffffffa038fa60>] ? nouveau_gem_ioctl_new+0x1b0/0x1b0
[nouveau]
[45018.670456]  [<ffffffff8111587b>] ? do_vfs_ioctl+0x8b/0x510
[45018.676025]  [<ffffffff81104b45>] ? vfs_read+0x165/0x190
[45018.681333]  [<ffffffff81115da0>] ? SyS_ioctl+0xa0/0xc0
[45018.686553]  [<ffffffff813d7212>] ? system_call_fastpath+0x16/0x1b
[45018.692725] Code: 85 c0 75 04 89 16 c3 90 89 d7 66 0f 1f 44 00 00 e9 bb c8
e7 e0 0f b7 0d b4 30 06 00 8d 79 01 66 85 c9 66 89 3d a7 30 06 00 75 d5 <0f> 0b
0f 1f 00 41 57 41 bf ff 07 00 00 41 56 41 55 41 54 55 53 
[45018.712668] RIP  [<ffffffffa038d7fb>] nouveau_bo_wr32+0x4b/0x50 [nouveau]
[45018.719482]  RSP <ffff8803e7dc5bd0>
[45018.735366] ---[ end trace 706c9cb9b21fa0ba ]---
[45033.732881] nouveau E[ X[2834]] failed to idle channel 0xcccc0000 [X[2834]]
[45048.725980] nouveau E[ X[2834]] failed to idle channel 0xcccc0000 [X[2834]]

I compared the machine code to a disassembly of nouveau_bo_wr32, and this is
indeed in the code path conditioned by a comparison with 0x406040, even though
that comparison itself is not among the dumped bytes.

This time, I recall no extraordinary graphics workload. Machine was mostly
idle, with display in power save mode. Didn't wake up from that, though, and
didn't react to NumLock either. I managed to ssh into the machine and save a
dmesg before rebooting. So no automatic reboot this time, which might be
because the problematic value didn't proceed down the pipe.

Does the stack trace provide any insight into what might be going on here? Does
it tell us whether the bug is in kernel space or in user space?

(In reply to comment #11)
> Take a look at nouveau_gem_pushbuf_validate for that --
> it presently doesn't do any actual data validation.

Does that mean any unprivileged process with access to the video device can
send garbage to the GPU and crash the system?

> You could also do the check in nv50_dma_push.

Had a look at that, and didn't understand what kind of data to inspect. But now
it seems like this would pass through my bug reporting facility in any case.
Unless the thing I reported was a false alarm, and would have been interpreted
as something other than a command.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382036047.a7dCccAF1.3048
Date: Thu, 17 Oct 2013 18:54:07 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70390#c11">comment #11</a>)
<span class="quote">&gt; Perhaps I can interest you in WARN_ON_ONCE.</span >

That is very useful, thanks a lot.

So far I left the BUG_ON in place, assuming that it wouldn't trigger in any
case. I was wrong: I just got a kernel BUG report from what seems to be the
BUG_ON I added.

[45018.412278] ------------[ cut here ]------------
[45018.416902] kernel BUG at drivers/gpu/drm/nouveau/nouveau_bo.c:465!
[45018.423162] invalid opcode: 0000 [#1] PREEMPT SMP 
[45018.428001] Modules linked in: nls_cp850 vfat fat usb_storage tun autofs4
ipv6 btrfs xor zlib_deflate raid6_pq libcrc32c dm_mod fuse nfs lockd
nf_conntrack_h323 nf_conntrack_sip nf_conntrack_irc nf_conntrack_ftp
nf_conntrack uhci_hcd sunrpc loop nouveau usbhid snd_hda_codec_via
snd_hda_intel ohci_pci snd_hda_codec ohci_hcd snd_hwdep snd_bt87x ehci_pci
ehci_hcd snd_pcm video usbcore sr_mod cdrom mxm_wmi i2c_algo_bit kvm_amd kvm
ttm drm_kms_helper snd_page_alloc drm microcode k10temp pcspkr evdev snd_timer
snd ata_generic i2c_core r8169 asus_atk0110 sym53c8xx parport_pc
scsi_transport_spi backlight mii parport wmi button usb_common pata_atiixp
soundcore acpi_cpufreq mperf
[45018.488491] CPU: 0 PID: 2834 Comm: X Not tainted 3.11.4-gentoo #1
[45018.494579] Hardware name: System manufacturer System Product
Name/M4A785TD-V EVO, BIOS 2105    07/23/2010
[45018.504216] task: ffff8803ebc09910 ti: ffff8803e7dc4000 task.ti:
ffff8803e7dc4000
[45018.511689] RIP: 0010:[&lt;ffffffffa038d7fb&gt;]  [&lt;ffffffffa038d7fb&gt;]
nouveau_bo_wr32+0x4b/0x50 [nouveau]
[45018.520850] RSP: 0018:ffff8803e7dc5bd0  EFLAGS: 00010246
[45018.526157] RAX: 0000000000000000 RBX: ffff8803ec2d8780 RCX:
0000000000000000
[45018.533284] RDX: 0000000000406040 RSI: ffffc9001019f934 RDI:
0000000000000001
[45018.540409] RBP: 0000000000000000 R08: ffffc90010196000 R09:
ffffc90010196000
[45018.547535] R10: 0000000000000000 R11: 0000000000000000 R12:
000000002001a020
[45018.554660] R13: 0000000000406040 R14: ffff8802933b2280 R15:
0000000000000000
[45018.561787] FS:  00007f9d09b26880(0000) GS:ffff8803ffc00000(0000)
knlGS:00000000f6da2b90
[45018.569865] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[45018.575607] CR2: 00007ff639a65000 CR3: 00000003ec68f000 CR4:
00000000000007f0
[45018.582732] Stack:
[45018.584742]  ffffffffa039343a ffffffffa038ce76 ffff8803e934c6c0
ffff8803e97bde00
[45018.592196]  0000000000000000 ffff8803e7dc5d18 ffffffffa038a02d
ffff88015ebe80c0
[45018.599644]  ffff8803ec2d8780 ffff8803ec2d8780 ffff8803e7dc5d18
0000000000000000
[45018.607098] Call Trace:
[45018.609550]  [&lt;ffffffffa039343a&gt;] ? nv84_fence_emit32+0xda/0x1a0 [nouveau]
[45018.616424]  [&lt;ffffffffa038ce76&gt;] ? nouveau_bo_placement_set+0x76/0x130
[nouveau]
[45018.623904]  [&lt;ffffffffa038a02d&gt;] ? nouveau_fence_emit+0x3d/0xb0 [nouveau]
[45018.630780]  [&lt;ffffffffa038a8c4&gt;] ? nouveau_fence_new+0x64/0xb0 [nouveau]
[45018.637568]  [&lt;ffffffffa0389898&gt;] ? nv50_dma_push+0xc8/0xf0 [nouveau]
[45018.644012]  [&lt;ffffffffa038fdbb&gt;] ? nouveau_gem_ioctl_pushbuf+0x35b/0x12f0
[nouveau]
[45018.651746]  [&lt;ffffffff811166f0&gt;] ? __pollwait+0x110/0x110
[45018.657232]  [&lt;ffffffffa00ed105&gt;] ? drm_ioctl+0x4b5/0x5b0 [drm]
[45018.663156]  [&lt;ffffffffa038fa60&gt;] ? nouveau_gem_ioctl_new+0x1b0/0x1b0
[nouveau]
[45018.670456]  [&lt;ffffffff8111587b&gt;] ? do_vfs_ioctl+0x8b/0x510
[45018.676025]  [&lt;ffffffff81104b45&gt;] ? vfs_read+0x165/0x190
[45018.681333]  [&lt;ffffffff81115da0&gt;] ? SyS_ioctl+0xa0/0xc0
[45018.686553]  [&lt;ffffffff813d7212&gt;] ? system_call_fastpath+0x16/0x1b
[45018.692725] Code: 85 c0 75 04 89 16 c3 90 89 d7 66 0f 1f 44 00 00 e9 bb c8
e7 e0 0f b7 0d b4 30 06 00 8d 79 01 66 85 c9 66 89 3d a7 30 06 00 75 d5 &lt;0f&gt; 0b
0f 1f 00 41 57 41 bf ff 07 00 00 41 56 41 55 41 54 55 53 
[45018.712668] RIP  [&lt;ffffffffa038d7fb&gt;] nouveau_bo_wr32+0x4b/0x50 [nouveau]
[45018.719482]  RSP &lt;ffff8803e7dc5bd0&gt;
[45018.735366] ---[ end trace 706c9cb9b21fa0ba ]---
[45033.732881] nouveau E[ X[2834]] failed to idle channel 0xcccc0000 [X[2834]]
[45048.725980] nouveau E[ X[2834]] failed to idle channel 0xcccc0000 [X[2834]]

I compared the machine code to a disassembly of nouveau_bo_wr32, and this is
indeed in the code path conditioned by a comparison with 0x406040, even though
that comparison itself is not among the dumped bytes.

This time, I recall no extraordinary graphics workload. Machine was mostly
idle, with display in power save mode. Didn't wake up from that, though, and
didn't react to NumLock either. I managed to ssh into the machine and save a
dmesg before rebooting. So no automatic reboot this time, which might be
because the problematic value didn't proceed down the pipe.

Does the stack trace provide any insight into what might be going on here? Does
it tell us whether the bug is in kernel space or in user space?

(In reply to <a href="show_bug.cgi?id=70390#c11">comment #11</a>)
<span class="quote">&gt; Take a look at nouveau_gem_pushbuf_validate for that --
&gt; it presently doesn't do any actual data validation.</span >

Does that mean any unprivileged process with access to the video device can
send garbage to the GPU and crash the system?

<span class="quote">&gt; You could also do the check in nv50_dma_push.</span >

Had a look at that, and didn't understand what kind of data to inspect. But now
it seems like this would pass through my bug reporting facility in any case.
Unless the thing I reported was a false alarm, and would have been interpreted
as something other than a command.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382036047.a7dCccAF1.3048--

--===============2136482492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2136482492==--
