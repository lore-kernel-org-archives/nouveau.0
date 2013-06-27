From: Peter Maloney <peter.maloney-bU717sqhW2kTELwDM1PSjyEWGD4kr0XT@public.gmane.org>
Subject: Re: kernel bug nouveau, total system hang, X crashed
Date: Thu, 27 Jun 2013 11:52:01 +0200
Message-ID: <51CC0B41.70606@brockmann-consult.de>
References: <51C0573E.4000402@brockmann-consult.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <51C0573E.4000402-bU717sqhW2kTELwDM1PSjyEWGD4kr0XT@public.gmane.org>
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

Before, it was Mesa 9.0.2-34.16.1

Now I have 8.0.4-20.23.1 to test it. And now it still crashes X, but
doesn't cause a kernel BUG, so X just restarts and things run smoothly
again.

And I see lots of spam like this in syslog:

2013-06-26T18:45:13.863153+02:00 peter kernel: [194813.965019] nouveau
E[  PGRAPH][0000:04:00.0] ch 2 [0x0037b10000 Xorg[915]] subc 2 class
0x0030 mthd 0x0860 data 0xff4a5862
2013-06-26T18:45:13.863154+02:00 peter kernel: [194813.965028] nouveau
E[  PGRAPH][0000:04:00.0]  ILLEGAL_MTHD

... (repeated hundreds of times)

2013-06-26T18:45:14.058691+02:00 peter kernel: [194814.158981] nouveau
E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[915]] get 0x002002a800
put 0x002002a820 ib_get 0x00000371 ib_put 0x00
000372 state 0x80000000 (err: INVALID_CMD) push 0x00400040

... (repeated a few, or tens of times, with different hex numbers)

2013-06-26T18:45:34.266775+02:00 peter kernel: [194834.362663] nouveau
E[   PFIFO][0000:04:00.0] CACHE_ERROR - ch 2 [Xorg[915]] subc 1 mthd
0x0c98 data 0xffff8806

... (repeated hundreds of times, with different hex numbers)

My log from yesterday has 491442 lines.


And I'm not on the list, so please CC me if you reply. (I didn't see any
replies to my last message)

Thanks,
Peter

On 2013-06-18 14:49, Peter Maloney wrote:
> Hi,
>
> Using kernel 3.9.4, with openSUSE 12.1 (KDE 4.7.4 I think), I was
> running fine for a long time with no problems. Today with openSUSE 12.3
> (KDE 4.10.3, Xorg 1.13.2, upgraded on Jun. 10), my machine hung
> completely. I believe the nouveau driver is at fault rather than KDE or
> X, so chose this list. I think it might have been triggered by the
> "Clock" ScreenLocker (screen saver). It happened twice so far.
>
> I'm not on the list, so please CC me.
>
>
> Here is a snippet from syslog where some strange stuff begins (while I
> am not using the computer):
>
> 2013-06-14T03:59:34.103035+02:00 linux-zxd7 kernel: [303714.267370]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b0d4 put 0x002003b134 ib_get 0x00000360 ib_put 0x00000361 state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.104254+02:00 linux-zxd7 kernel: [303714.267632]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b134 put 0x002003b194 ib_get 0x00000362 ib_put 0x00000363 state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120218+02:00 linux-zxd7 kernel: [303714.283686]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b194 put 0x002003b1f4 ib_get 0x00000364 ib_put 0x00000365 state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120238+02:00 linux-zxd7 kernel: [303714.283903]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b1f4 put 0x002003b254 ib_get 0x00000366 ib_put 0x00000367 state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120241+02:00 linux-zxd7 kernel: [303714.284025]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b254 put 0x002003b2c0 ib_get 0x00000368 ib_put 0x00000369 state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120244+02:00 linux-zxd7 kernel: [303714.284060]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b2c0 put 0x002003b32c ib_get 0x0000036a ib_put 0x0000036b state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120250+02:00 linux-zxd7 kernel: [303714.284092]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b32c put 0x002003b398 ib_get 0x0000036c ib_put 0x0000036d state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.120252+02:00 linux-zxd7 kernel: [303714.284125]
> nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 2 [Xorg[1761]] get
> 0x002003b398 put 0x002003b404 ib_get 0x0000036e ib_put 0x0000036f state
> 0x80000024 (err: INVALID_CMD) push 0x00400040
> 2013-06-14T03:59:34.124255+02:00 linux-zxd7 kernel: [303714.285213]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF IN
> 2013-06-14T03:59:34.124266+02:00 linux-zxd7 kernel: [303714.285219]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF 00320051 6ade1280 00000000
> 04000432
> 2013-06-14T03:59:34.124267+02:00 linux-zxd7 kernel: [303714.285222]
> nouveau E[  PGRAPH][0000:04:00.0]  TRAP
> 2013-06-14T03:59:34.124268+02:00 linux-zxd7 kernel: [303714.285225]
> nouveau E[  PGRAPH][0000:04:00.0] ch 2 [0x0037b10000 Xorg[1761]] subc 0
> class 0x5039 mthd 0x0314 data 0x00000108
> 2013-06-14T03:59:34.124269+02:00 linux-zxd7 kernel: [303714.285236]
> nouveau E[     PFB][0000:04:00.0] trapped read at 0x006adce9f0 on
> channel 0x00037b10 [Xorg[1761]] PGRAPH/DISPATCH/M2M_IN reason:
> PAGE_NOT_PRESENT
> 2013-06-14T03:59:34.136377+02:00 linux-zxd7 kernel: [303714.299033]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF IN
> 2013-06-14T03:59:34.136392+02:00 linux-zxd7 kernel: [303714.299041]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF 00320151 6add5080 00000000
> 04000000
> 2013-06-14T03:59:34.136394+02:00 linux-zxd7 kernel: [303714.299044]
> nouveau E[  PGRAPH][0000:04:00.0]  TRAP
> 2013-06-14T03:59:34.136396+02:00 linux-zxd7 kernel: [303714.299047]
> nouveau E[  PGRAPH][0000:04:00.0] ch 2 [0x0037b10000 Xorg[1761]] subc 0
> class 0x5039 mthd 0x023c data 0x00000000
> 2013-06-14T03:59:34.136404+02:00 linux-zxd7 kernel: [303714.299057]
> nouveau E[     PFB][0000:04:00.0] trapped read at 0x006add4de0 on
> channel 0x00037b10 [Xorg[1761]] PGRAPH/DISPATCH/M2M_IN reason: NULL_DMAOBJ
> 2013-06-14T03:59:34.136406+02:00 linux-zxd7 kernel: [303714.299066]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF IN
> 2013-06-14T03:59:34.136407+02:00 linux-zxd7 kernel: [303714.299071]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF 00320151 00000380 00000000
> 04000000
> 2013-06-14T03:59:34.136417+02:00 linux-zxd7 kernel: [303714.299073]
> nouveau E[  PGRAPH][0000:04:00.0]  TRAP
> 2013-06-14T03:59:34.136418+02:00 linux-zxd7 kernel: [303714.299075]
> nouveau E[  PGRAPH][0000:04:00.0] ch 2 [0x0037b10000 Xorg[1761]] subc 0
> class 0x5039 mthd 0x0200 data 0x00000001
> 2013-06-14T03:59:34.136420+02:00 linux-zxd7 kernel: [303714.299476]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF IN
> 2013-06-14T03:59:34.136420+02:00 linux-zxd7 kernel: [303714.299481]
> nouveau E[  PGRAPH][0000:04:00.0] TRAP_M2MF 00320151 6abdf380 00000000
> 04000000
> 2013-06-14T03:59:34.136421+02:00 linux-zxd7 kernel: [303714.299484]
> nouveau E[  PGRAPH][0000:04:00.0]  TRAP
> 2013-06-14T03:59:34.136422+02:00 linux-zxd7 kernel: [303714.299486]
> nouveau E[  PGRAPH][0000:04:00.0] ch 2 [0x0037b10000 Xorg[1761]] subc 0
> class 0x5039 mthd 0x0328 data 0x00000000
>
>
>
> And here is a stack trace with X crashing a bit later (also while I am
> not using the computer):
>
> 2013-06-14T04:23:09.912406+02:00 linux-zxd7 kernel: [305129.599004] BUG:
> soft lockup - CPU#0 stuck for 23s! [Xorg:29026]
> 2013-06-14T04:23:09.916319+02:00 linux-zxd7 kernel: [305129.599048]
> Modules linked in: dm_snapshot af_packet arc4 ecb md4 sha256_generic md5
> nls_utf8 cifs fscache vboxpci(O) vboxnetadp(O) vb
> oxnetflt(O) vboxdrv(O) bnep bluetooth rfkill btrfs raid6_pq zlib_deflate
> xor ufs qnx4 hfsplus hfs minix vfat msdos fat jfs xfs libcrc32c reiserfs
> xt_tcpudp xt_pkttype xt_physdev xt_LOG xt_li
> mit bridge stp llc ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6
> ip6table_raw ipt_REJECT iptable_raw xt_CT iptable_filter ip6table_mangle
> nf_conntrack_netbios_ns nf_conntrack_broadcast nf_con
> ntrack_ipv4 nf_defrag_ipv4 ip_tables xt_conntrack nf_conntrack
> ip6table_filter fuse ip6_tables x_tables dm_mod snd_hda_codec_analog
> snd_hda_intel snd_hda_codec snd_hwdep acpi_cpufreq snd_pcm
>  mperf coretemp snd_seq snd_timer snd_seq_device kvm_intel snd mvsas
> libsas kvm ata_generic shpchp firewire_ohci sr_mod i7core_edac
> pci_hotplug firewire_core asus_atk0110 edac_core i2c_i801
> pata_marvell cdrom r8169 iTCO_wdt iTCO_vendor_support ehci_pci lpc_ich
> mfd_core sg crc32c_intel soundcore crc_itu_t scsi_transport_sas
> snd_page_alloc pcspkr microcode autofs4 hid_generic usb
> hid uhci_hcd ehci_hcd nouveau ttm xhci_hcd drm_kms_helper drm usbcore
> i2c_algo_bit usb_common mxm_wmi video wmi button processor thermal_sys
> scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_al
> ua scsi_dh
> 2013-06-14T04:23:09.916333+02:00 linux-zxd7 kernel: [305129.599163] CPU 0
> 2013-06-14T04:23:09.916336+02:00 linux-zxd7 kernel: [305129.599168] Pid:
> 29026, comm: Xorg Tainted: G           O 3.9.4-1.g51bf0ff-default #1
> System manufacturer System Product Name/P6T WS P
> RO
> 2013-06-14T04:23:09.916353+02:00 linux-zxd7 kernel: [305129.599170] RIP:
> 0010:[<ffffffff81584219>]  [<ffffffff81584219>]
> _raw_spin_unlock_irqrestore+0x9/0x10
> 2013-06-14T04:23:09.916355+02:00 linux-zxd7 kernel: [305129.599179] RSP:
> 0018:ffff880605ecbb00  EFLAGS: 00000286
> 2013-06-14T04:23:09.916356+02:00 linux-zxd7 kernel: [305129.599181] RAX:
> 0000000000010001 RBX: ffffffffa016a2bc RCX: 0000000000000001
> 2013-06-14T04:23:09.916357+02:00 linux-zxd7 kernel: [305129.599183] RDX:
> ffffc90013b00500 RSI: 0000000000000286 RDI: 0000000000000286
> 2013-06-14T04:23:09.916358+02:00 linux-zxd7 kernel: [305129.599185] RBP:
> 0000000000000501 R08: 0000000000000000 R09: 0000000000002e31
> 2013-06-14T04:23:09.916359+02:00 linux-zxd7 kernel: [305129.599187] R10:
> 0000000000000002 R11: 0000000000002e30 R12: ffff88061ab62d80
> 2013-06-14T04:23:09.916360+02:00 linux-zxd7 kernel: [305129.599189] R13:
> ffff88061ab623c0 R14: ffffffffa016a595 R15: 0000000000000001
> 2013-06-14T04:23:09.916361+02:00 linux-zxd7 kernel: [305129.599194] FS:
> 0000000000000000(0000) GS:ffff88063fc00000(0000) knlGS:0000000000000000
> 2013-06-14T04:23:09.916362+02:00 linux-zxd7 kernel: [305129.599195] CS:
> 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 2013-06-14T04:23:09.916363+02:00 linux-zxd7 kernel: [305129.599197] CR2:
> 000000000280ad58 CR3: 0000000001a0d000 CR4: 00000000000007f0
> 2013-06-14T04:23:09.916364+02:00 linux-zxd7 kernel: [305129.599198] DR0:
> 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> 2013-06-14T04:23:09.916364+02:00 linux-zxd7 kernel: [305129.599199] DR3:
> 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> 2013-06-14T04:23:09.916365+02:00 linux-zxd7 kernel: [305129.599200]
> Process Xorg (pid: 29026, threadinfo ffff880605eca000, task
> ffff8805ed822340)
> 2013-06-14T04:23:09.916366+02:00 linux-zxd7 kernel: [305129.599201] Stack:
> 2013-06-14T04:23:09.916367+02:00 linux-zxd7 kernel: [305129.599204]
> ffffffffa01b4c6d 0000000000000015 ffff8801f65aa200 ffff88061b341980
> 2013-06-14T04:23:09.916368+02:00 linux-zxd7 kernel: [305129.599206]
> ffff88061b341998 ffff88061b3419e8 ffffffffa016cec8 ffff88061b341998
> 2013-06-14T04:23:09.916369+02:00 linux-zxd7 kernel: [305129.599208]
> ffff88061b3419b0 ffff880034815400 ffffffffa01c311a ffff88061b341980
> 2013-06-14T04:23:09.916370+02:00 linux-zxd7 kernel: [305129.599209] Call
> Trace:
> 2013-06-14T04:23:09.916371+02:00 linux-zxd7 kernel: [305129.599248]
> [<ffffffffa01b4c6d>] nv84_graph_tlb_flush+0x28d/0x2c0 [nouveau]
> 2013-06-14T04:23:09.916372+02:00 linux-zxd7 kernel: [305129.599370]
> [<ffffffffa016cec8>] nv50_vm_flush+0x78/0x90 [nouveau]
> 2013-06-14T04:23:09.916373+02:00 linux-zxd7 kernel: [305129.599457]
> [<ffffffffa01c311a>] nouveau_bo_vma_del+0x9a/0xa0 [nouveau]
> 2013-06-14T04:23:09.916374+02:00 linux-zxd7 kernel: [305129.599601]
> [<ffffffffa01c5040>] nouveau_abi16_chan_fini.isra.1+0xa0/0x170 [nouveau]
> 2013-06-14T04:23:09.916375+02:00 linux-zxd7 kernel: [305129.599747]
> [<ffffffffa01c5310>] nouveau_abi16_fini+0x30/0x80 [nouveau]
> 2013-06-14T04:23:09.916376+02:00 linux-zxd7 kernel: [305129.599889]
> [<ffffffffa01bc0d7>] nouveau_drm_preclose+0x27/0x90 [nouveau]
> 2013-06-14T04:23:09.916377+02:00 linux-zxd7 kernel: [305129.600006]
> [<ffffffffa00fe7fe>] drm_release+0x6e/0x620 [drm]
> 2013-06-14T04:23:09.916378+02:00 linux-zxd7 kernel: [305129.600019]
> [<ffffffff81173c9b>] __fput+0xdb/0x240
> 2013-06-14T04:23:09.916379+02:00 linux-zxd7 kernel: [305129.600027]
> [<ffffffff810655c4>] task_work_run+0xb4/0xd0
> 2013-06-14T04:23:09.916380+02:00 linux-zxd7 kernel: [305129.600033]
> [<ffffffff8104b606>] do_exit+0x2b6/0xa40
> 2013-06-14T04:23:09.916380+02:00 linux-zxd7 kernel: [305129.600038]
> [<ffffffff8104be08>] do_group_exit+0x38/0xa0
> 2013-06-14T04:23:09.916381+02:00 linux-zxd7 kernel: [305129.600044]
> [<ffffffff8105a9f2>] get_signal_to_deliver+0x1b2/0x5d0
> 2013-06-14T04:23:09.916382+02:00 linux-zxd7 kernel: [305129.600051]
> [<ffffffff81002353>] do_signal+0x63/0x8c0
> 2013-06-14T04:23:09.916383+02:00 linux-zxd7 kernel: [305129.600056]
> [<ffffffff81002c48>] do_notify_resume+0x98/0xc0
> 2013-06-14T04:23:09.916384+02:00 linux-zxd7 kernel: [305129.600064]
> [<ffffffff8158c36a>] int_signal+0x12/0x17
> 2013-06-14T04:23:09.916385+02:00 linux-zxd7 kernel: [305129.600074]
> [<00007f93254763d5>] 0x7f93254763d4
> 2013-06-14T04:23:09.916386+02:00 linux-zxd7 kernel: [305129.600077]
> Code: 66 39 c2 74 0f 0f 1f 44 00 00 f3 90 0f b7 07 66 39 d0 75 f6 c3 66
> 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 83 07 01 48 89 f7 57 9d <66> 66
> 90 66 90 c3 90 ba ff ff ff ff f0 0f c1 17 83 ea 01 b8 01
> 2013-06-14T04:23:14.912452+02:00 linux-zxd7 kernel: [305132.598016]
> nouveau E[Xorg[29026]] failed to idle channel 0xcccc0000 [Xorg[29026]]
> 2013-06-14T04:23:14.912466+02:00 linux-zxd7 kernel: [305134.597340]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail
> 2013-06-14T04:23:14.912468+02:00 linux-zxd7 kernel: [305134.597343]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_STATUS  : 0x00000501 BUSY
> CTXPROG CCACHE_UNK4
> 2013-06-14T04:23:14.912470+02:00 linux-zxd7 kernel: [305134.597349]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS0: 0x00000008 CCACHE
> 2013-06-14T04:23:14.912472+02:00 linux-zxd7 kernel: [305134.597353]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS1: 0x00000000
> 2013-06-14T04:23:14.912475+02:00 linux-zxd7 kernel: [305134.597357]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS2: 0x00000000
> 2013-06-14T04:23:16.912520+02:00 linux-zxd7 kernel: [305136.596773]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail
> 2013-06-14T04:23:16.912527+02:00 linux-zxd7 kernel: [305136.596777]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_STATUS  : 0x00000501 BUSY
> CTXPROG CCACHE_UNK4
> 2013-06-14T04:23:16.912530+02:00 linux-zxd7 kernel: [305136.596782]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS0: 0x00000008 CCACHE
> 2013-06-14T04:23:16.912532+02:00 linux-zxd7 kernel: [305136.596786]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS1: 0x00000000
> 2013-06-14T04:23:16.912534+02:00 linux-zxd7 kernel: [305136.596789]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS2: 0x00000000
> 2013-06-14T04:23:18.912705+02:00 linux-zxd7 kernel: [305138.596280]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail
> 2013-06-14T04:23:18.912711+02:00 linux-zxd7 kernel: [305138.596285]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_STATUS  : 0x00000501 BUSY
> CTXPROG CCACHE_UNK4
> 2013-06-14T04:23:18.912714+02:00 linux-zxd7 kernel: [305138.596291]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS0: 0x00000008 CCACHE
> 2013-06-14T04:23:18.912716+02:00 linux-zxd7 kernel: [305138.596295]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS1: 0x00000000
> 2013-06-14T04:23:18.912718+02:00 linux-zxd7 kernel: [305138.596298]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS2: 0x00000000
> 2013-06-14T04:23:20.912856+02:00 linux-zxd7 kernel: [305140.595790]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail
> 2013-06-14T04:23:20.912868+02:00 linux-zxd7 kernel: [305140.595794]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_STATUS  : 0x00000501 BUSY
> CTXPROG CCACHE_UNK4
> 2013-06-14T04:23:20.912872+02:00 linux-zxd7 kernel: [305140.595798]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS0: 0x00000008 CCACHE
> 2013-06-14T04:23:20.912875+02:00 linux-zxd7 kernel: [305140.595801]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS1: 0x00000000
> 2013-06-14T04:23:20.912877+02:00 linux-zxd7 kernel: [305140.595804]
> nouveau E[  PGRAPH][0000:04:00.0] PGRAPH_VSTATUS2: 0x00000000
> 2013-06-14T04:23:22.915949+02:00 linux-zxd7 kdm[1402]: X server for
> display :0 terminated unexpectedly
> 2013-06-14T04:23:22.916194+02:00 linux-zxd7 kernel: [305142.595270]
> nouveau E[   PFIFO][0000:04:00.0] channel 2 [Xorg[29026]] unload timeout
>
>
> After X crashed, I could hit ctrl+alt+f1 to get to a text terminal,
> where I tried to restart X, which made the system hang completely;
> ctrl+alt+del, and even alt+sysrq+b would not reboot the system.
>
> Here is a screenshot of what it looked like at this point:
> http://s270.photobucket.com/user/peetaur/media/afterXrestarted_zps0b6fcbad.jpg.html
>
>
>
> # lspci | grep VGA
> 04:00.0 VGA compatible controller: NVIDIA Corporation GT200 [GeForce GTX
> 260] (rev a1)
> # uname -a
> Linux peter 3.9.4-1.g51bf0ff-default #1 SMP Fri May 24 19:52:42 UTC 2013
> (51bf0ff) x86_64 x86_64 x86_64 GNU/Linux
> # kde4-config --version
> Qt: 4.8.4
> KDE Development Platform: 4.10.3 "release 1"
> kde4-config: 1.0
> # X -version
>
> X.Org X Server 1.13.2
> Release Date: 2013-01-24
> X Protocol Version 11, Revision 0
> Build Operating System: openSUSE SUSE LINUX
> Current Operating System: Linux peter 3.9.4-1.g51bf0ff-default #1 SMP
> Fri May 24 19:52:42 UTC 2013 (51bf0ff) x86_64
> Kernel command line: BOOT_IMAGE=/vmlinuz-3.9.4-1.g51bf0ff-default
> root=UUID=93a77b67-6950-476c-9709-f248bfa94e76
> resume=/dev/disk/by-id/ata-Hitachi_HDS5C3030ALA630_MJ1311YNG44E5A-part5
> splash=silent quiet showopts
> Build Date: 30 April 2013  08:24:17AM
>  Current version of pixman: 0.28.2
>         Before reporting problems, check http://wiki.x.org
>         to make sure that you have the latest version.
>
>


-- 

--------------------------------------------
Peter Maloney
Brockmann Consult
Max-Planck-Str. 2
21502 Geesthacht
Germany
Tel: +49 4152 889 300
Fax: +49 4152 889 333
E-mail: peter.maloney-bU717sqhW2kTELwDM1PSjyEWGD4kr0XT@public.gmane.org
Internet: http://www.brockmann-consult.de
--------------------------------------------
