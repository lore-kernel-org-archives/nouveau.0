From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23847] New: kernel BUG when using nouveau
Date: Thu, 10 Sep 2009 10:48:46 -0700 (PDT)
Message-ID: <bug-23847-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=23847

           Summary: kernel BUG when using nouveau
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Loading nouveau drm module causes big kernel problems. Trying to load X always
results in hardlock.
If I blacklist nouveau drm module with the same kernel, it is perfectly stable.

* nouveau git kernel from 09/09 b4eaf6c7cf5621a7ccc556123ccab64811ab2e40
* ddx git from 09/09
* X.Org X Server 1.6.3.901 (1.6.4 RC 1)
* libdrm 2.4.13
* 01:00.0 VGA compatible controller: nVidia Corporation G84 [GeForce 8600M GT]
(rev a1)

[  281.450035] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2
[  281.463089] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[  281.486950] [TTM] Zone  kernel: Used memory at exit: 0 kiB.
[  281.486956] [TTM] Zone highmem: Used memory at exit: 0 kiB.
[  288.525197] ------------[ cut here ]------------
[  288.525215] WARNING: at block/cfq-iosched.c:1771 cfq_cic_lookup+0x61/0xce()
[  288.525222] Hardware name: XPS M1530                       
[  288.525226] Modules linked in: fuse nouveau ttm drm_kms_helper drm agpgart
i2c_algo_bit iwl3945 iwlcore mac80211 cfg80211 ohci1394 ieee1394 btusb
bluetooth rfkill sdhci_pci sdhci mmc_core ricoh_mmc sky2 cpufreq_conservative
acpi_cpufreq freq_table loop
[  288.525279] Pid: 2982, comm: hald-addon-stor Not tainted 2.6.31-rc8 #1
[  288.525284] Call Trace:
[  288.525296]  [<c0225a00>] warn_slowpath_common+0x65/0x7c
[  288.525305]  [<c03ada74>] ? cfq_cic_lookup+0x61/0xce
[  288.525313]  [<c0225a24>] warn_slowpath_null+0xd/0x10
[  288.525321]  [<c03ada74>] cfq_cic_lookup+0x61/0xce
[  288.525330]  [<c03adc27>] cfq_may_queue+0x1e/0xab
[  288.525338]  [<c039d892>] elv_may_queue+0x14/0x1b
[  288.525348]  [<c03a291f>] get_request+0x24/0x253
[  288.525356]  [<c03a300e>] get_request_wait+0x18/0x12f
[  288.525366]  [<c0239077>] ? hrtimer_wakeup+0x0/0x1c
[  288.525375]  [<c0236d61>] ? remove_wait_queue+0x31/0x36
[  288.525383]  [<c03a315c>] blk_get_request+0x37/0x58
[  288.525394]  [<c0428cd1>] scsi_execute+0x23/0x11b
[  288.525403]  [<c0428e1b>] scsi_execute_req+0x52/0x7f
[  288.525412]  [<c0433db0>] sr_test_unit_ready+0x41/0x99
[  288.525420]  [<c04347c8>] sr_media_change+0x37/0x1e3
[  288.525430]  [<c044d459>] media_changed+0x43/0x72
[  288.525438]  [<c044d4b0>] cdrom_media_changed+0x28/0x2e
[  288.525446]  [<c0433e4f>] sr_block_media_changed+0x11/0x13
[  288.525456]  [<c02b1e7d>] check_disk_change+0x19/0x42
[  288.525464]  [<c044f23f>] cdrom_open+0x794/0x7f7
[  288.525473]  [<c0423ba6>] ? scsi_done+0x0/0xd
[  288.525480]  [<c043f4d1>] ? atapi_xlat+0x0/0x15f
[  288.525491]  [<c05bfe39>] ? schedule_timeout+0x17/0xbd
[  288.525499]  [<c0423ba6>] ? scsi_done+0x0/0xd
[  288.525508]  [<c03b0907>] ? kobject_put+0x37/0x3c
[  288.525518]  [<c041bf8a>] ? put_device+0xf/0x11
[  288.525526]  [<c04280a2>] ? scsi_request_fn+0x326/0x3c6
[  288.525536]  [<c0380536>] ? avc_has_perm+0x3c/0x46
[  288.525545]  [<c0380536>] ? avc_has_perm+0x3c/0x46
[  288.525553]  [<c03b09e8>] ? kobject_get+0x12/0x17
[  288.525562]  [<c03a88cf>] ? get_disk+0x39/0x50
[  288.525571]  [<c03a88f0>] ? exact_lock+0xa/0x11
[  288.525579]  [<c03b09e8>] ? kobject_get+0x12/0x17
[  288.525587]  [<c041c01a>] ? get_device+0x13/0x18
[  288.525595]  [<c0433f8a>] sr_block_open+0x6d/0x82
[  288.525603]  [<c02b27a0>] __blkdev_get+0x7f/0x289
[  288.525612]  [<c02b29b4>] blkdev_get+0xa/0xc
[  288.525619]  [<c02b2a15>] blkdev_open+0x5f/0x8b
[  288.525629]  [<c0292e84>] __dentry_open+0x111/0x1f4
[  288.525638]  [<c0293005>] nameidata_to_filp+0x2d/0x42
[  288.525646]  [<c02b29b6>] ? blkdev_open+0x0/0x8b
[  288.525655]  [<c029cb6a>] do_filp_open+0x3b2/0x6a4
[  288.525663]  [<c044e0dd>] ? cdrom_release+0x16c/0x19f
[  288.525671]  [<c03b0907>] ? kobject_put+0x37/0x3c
[  288.525680]  [<c029069b>] ? __slab_alloc+0x9a/0x425
[  288.525689]  [<c0290af8>] ? kmem_cache_alloc+0x57/0xd9
[  288.525697]  [<c029cebb>] ? getname+0x1b/0xb9
[  288.525706]  [<c02a4787>] ? alloc_fd+0x53/0xb8
[  288.525715]  [<c0292c7d>] do_sys_open+0x48/0xdf
[  288.525724]  [<c0292d56>] sys_open+0x1e/0x26
[  288.525733]  [<c0202984>] sysenter_do_call+0x12/0x22
[  288.525739] ---[ end trace 1946ff4265fe09ba ]---
[  288.525759] ------------[ cut here ]------------
[  288.526043] kernel BUG at block/cfq-iosched.c:1775!
[  288.526104] invalid opcode: 0000 [#1] SMP


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
