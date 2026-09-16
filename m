Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A016C88E5C
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 10:38:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC2F310E784;
	Wed, 16 Sep 2026 10:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="VfKMb4cE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9B2B480E7;
	Wed, 16 Sep 2026 10:21:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789554070;
 b=gwsxi29xS80oLTt7ZmxD0/4OcE9PIv+l+FiYA9vdlcThwpibVr8IhsASpYbkU7HTa86eq
 fHpqIqdaTfR6EYUKUAZ2kMAOSTQ4n0Q+IX98gTjUYG7mUyNUF4Br0L73yf07xzCjkUNhnCN
 KR4tbnQbyoX4hoXUZcxChRUka/aFD5VGPUpnZuneUDRo7fYH5hlSmwMRRi7f9xpfMCHGBbn
 6wqfCWqloC/p943I/DnWR+snRCD5z22DizTbWmF38d38eLLGNbvHrDnkDY7jTWWRV1l9nVN
 J3HV94jIhLuU7mlLg19YR7ZyTRParff4VsPW1gu7QDhod2HckjWrKDB/f+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789554070; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iGkrWYHcQ7YXpnapjSfUIb99gIQOCYTG6EaseNLzoLY=;
 b=UTVbe5kXvGZVqFlz3MaFQRTv5eYhomwCAv8U8QI0eVq28WtG8keXvrxNZ9vQ0aAShoLMr
 zCGIH+d7Lf15kXoU7Jqs9XxPz44VuPEWwwKEtORR3KBQV3RlbdrIMYbZO3QyeuFqVqMbZsv
 z74e0LeA6zQo70DoBfsNCS2UjHlq/CcYQz321LgknKMdp93GoORV/MDRuFZR1PhZiUyXTzF
 8ZNsBoghyQfGHXBg36cMpIl2hDQ6LRxe+wXz6yzk2FVLGj+KT4kZPUGqM7tbNS4UUGFGrMk
 8XM499eoDNTlI7zhzRkVzQM1JkJin9GiIycOv4ADLBxSUefBcMncVzUabDCw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=smail.nju.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=smail.nju.edu.cn
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=smail.nju.edu.cn; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=smail.nju.edu.cn
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C1846478BC
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 10:21:03 +0000 (UTC)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F011010E301;
	Wed, 16 Sep 2026 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1789555110;
	bh=iGkrWYHcQ7YXpnapjSfUIb99gIQOCYTG6EaseNLzoLY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VfKMb4cENP/80OIgLJocZgDu99wzSl6ntt6nhfhOuRotjQk3PI6nJLuCjtIgSnys9
	 sJ4lnxVNCsVrBqPoM+cAuL6tRhuANBEVBqEGXTpKjG0S4mLnX0SOs53ag3DLvUXH/o
	 GJVRraUWnS+5NzPTiEzOmoWr+Y9nsqGEfzJ7AIa8=
X-QQ-mid: esmtpsz10t1789554879t9489ae65
X-QQ-Originating-IP: 8xkushD0enGkZitgOZg4YxLoUcCT5tnnAzqrZTZXvKQ=
Received: from hepeiyang-vm.wu.lxd ( [36.152.24.145])
	by bizesmtp.qq.com (ESMTP) with
	id ; Wed, 16 Sep 2026 18:34:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 407733813548067960
EX-QQ-RecipientCnt: 11
From: Peiyang He <peiyang_he@smail.nju.edu.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix double-free in nvif_vmm_dtor
Date: Wed, 16 Sep 2026 18:31:38 +0800
Message-ID: 
 <03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Mom5ezI3X1cDPiZtQu0mAQWbMl09Kp36GOV2PvD8cSKEGuO4Qa2NDEJY
	qp15dLDlV3ffwPNUOOE+Q7bCT+G4/V3Li4TlVsoCV1gEbeTVtFOSZZKEQuqVHegeo6TnK+a
	KObha2OdeCo5dDoDQk5UrKasK092XWu0dP0gOILyLUF2bWwF1EiNVFVJUE56H+2DZ+PZ7VU
	nszkMTR84WIYzyQyOsd/f7cvYOd6pPyCRBW06ZGSiCd23FmlE6VoRd/QV1TFqJ5Rtjt2xN9
	0NOAw7Pcaf4q484nh7YejkLU5RMlNG97y9FsSiV0Fc/2ybw3QUFyb8qmHiMVcRBsrtWrgCE
	zsTzNbUpsz1q0+1t708RcU/YuBRYlvYJbfLG8R5233NPm88vcF6TAYMTAI6QbFf7+beASAW
	w8F19OB0E/bsDbT8+6RSpkyKAOi9pBzLOlQBSNrxUzPAAhmInJQiCiiOlleQv4zd6qhKhie
	azdxA6Zr+TSXx3VoJSBnmvgmiRndzOqpOApFJsPfsE47mINuAEM37YyOzkyxTcXHpsr1j47
	4VKa5qMQl++AaX24XsXrWHKVLI3/k5l221mP+VEt7sS1oNe+0FEcc+ET7n7tE6fUNo3/uFL
	ivsWZCjtSpyAskzOrmsnt7GYMAh8+Gw6aczEOaOPbK1/sq/MVCC2fbQiV8OKr6GTpZk/a/0
	Eh5vIdP3JTXf7n0HUqF9LZa5CG9WG3WVKjJCIw0HeS9ETlV54mWM+8F98oX9wh0rKil/RYk
	dcgq5SbJV4ux+nhjE6gWKe6fKNcu1bOQbXePtB4V/6RUukFQ4xXa1gvUL04R3cd1wGKixWr
	moEBrx93oyZa6opuJ/Sx5i6LOaMnJ/K6bW32Ni0ZmTYMzfAKyh8PqTjTb9t4nYQKjboLQQy
	j7dRMsRM5R4CBdJLInk4foBl3VztgZC06t5q34Jotb7c/OivK2xYpMyO3vQ+G4Lh55Y9nUf
	wAKtP1jlx/g1BYmBIT3rJsMc6vvaV8E7JOwJgqlY7FvUGh2A6ZQVfndrVLzhTY8ZtnKjMRr
	LGH2pmZUR2zBruUT0LxdAdZ4S5ehGyp0mGMhl2nE6+EP2asTBetp//R3WaLm4=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
Message-ID-Hash: NDDPNEIYQXMMT23B56ZRSC7G2IERM7CP
X-Message-ID-Hash: NDDPNEIYQXMMT23B56ZRSC7G2IERM7CP
X-MailFrom: peiyang_he@smail.nju.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Peiyang He <peiyang_he@smail.nju.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NDDPNEIYQXMMT23B56ZRSC7G2IERM7CP/>
Archived-At: 
 <https://lore.freedesktop.org/03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On failure, nouveau_cli_init() calls nouveau_cli_fini() to tear
the client down. Then, nouveau_drm_open() also enters into its
cleanup path and calls nouveau_cli_fini() AGAIN. nouveau_cli_fini()
calls nouveau_vmm_fini():

	void
	nouveau_vmm_fini(struct nouveau_vmm *vmm)
	{
		nouveau_svmm_fini(&vmm->svmm);
		nvif_vmm_dtor(&vmm->vmm);
		vmm->cli = NULL;
	}

Inside nvif_vmm_dtor(), vmm->page is freed unconditionally:

	void
	nvif_vmm_dtor(struct nvif_vmm *vmm)
	{
		kfree(vmm->page);
		nvif_object_dtor(&vmm->object);
	}

vmm->page is never cleared after being freed, so the second call of
nvif_vmm_dtor() will cause a double-free.

Found by fuzzing the nouveau driver with a modified Syzkaller:

	BUG: KASAN: double-free in nvif_vmm_dtor+0x31/0x50 drivers/gpu/drm/nouveau/nvif/vmm.c:194
	Free of addr ffff888010fcdc30 by task syz.0.173/2567

	CPU: 1 UID: 0 PID: 2567 Comm: syz.0.173 Not tainted 7.2.0 #24 PREEMPT(lazy) 
	Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
	Call Trace:
	<TASK>
	__dump_stack lib/dump_stack.c:94 [inline]
	dump_stack_lvl+0x95/0xe0 lib/dump_stack.c:120
	print_address_description mm/kasan/report.c:378 [inline]
	print_report+0xcb/0x5a0 mm/kasan/report.c:482
	kasan_report_invalid_free+0xaa/0xd0 mm/kasan/report.c:557
	check_slab_allocation+0xe4/0x110 mm/kasan/common.c:235
	kasan_slab_pre_free include/linux/kasan.h:199 [inline]
	slab_free_hook mm/slub.c:2622 [inline]
	slab_free mm/slub.c:6377 [inline]
	kfree+0x192/0x590 mm/slub.c:6692
	nvif_vmm_dtor+0x31/0x50 drivers/gpu/drm/nouveau/nvif/vmm.c:194
	nouveau_vmm_fini+0x16/0x50 drivers/gpu/drm/nouveau/nouveau_vmm.c:127
	nouveau_cli_fini+0x10e/0x210 drivers/gpu/drm/nouveau/nouveau_drm.c:225
	nouveau_drm_open+0x24e/0x740 drivers/gpu/drm/nouveau/nouveau_drm.c:1255
	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
	chrdev_open+0x21c/0x660 fs/char_dev.c:411
	do_dentry_open+0x59d/0x12b0 fs/open.c:947
	vfs_open+0x82/0x390 fs/open.c:1052
	do_open fs/namei.c:4700 [inline]
	path_openat+0x2345/0x3420 fs/namei.c:4863
	do_file_open+0x207/0x460 fs/namei.c:4892
	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
	do_sys_open fs/open.c:1374 [inline]
	__do_sys_openat fs/open.c:1390 [inline]
	__se_sys_openat fs/open.c:1385 [inline]
	__x64_sys_openat+0x144/0x200 fs/open.c:1385
	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
	entry_SYSCALL_64_after_hwframe+0x77/0x7f
	RIP: 0033:0x7fc6d687594d
	Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
	RSP: 002b:00007fc6d5295008 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
	RAX: ffffffffffffffda RBX: 00007fc6d6b06180 RCX: 00007fc6d687594d
	RDX: 0000000000022501 RSI: 0000200000000000 RDI: ffffffffffffff9c
	RBP: 00007fc6d691c303 R08: 0000000000000000 R09: 0000000000000000
	R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
	R13: 00007fc6d6b06218 R14: 00007fc6d6b06180 R15: 00007ffd9451d760
	</TASK>

	Allocated by task 2567 on cpu 1 at 163.593900s:
	kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
	kasan_save_track+0x17/0x60 mm/kasan/common.c:78
	poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
	__kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
	kasan_kmalloc include/linux/kasan.h:263 [inline]
	__do_kmalloc_node mm/slub.c:5334 [inline]
	__kmalloc_noprof+0x304/0x7c0 mm/slub.c:5359
	_kmalloc_noprof include/linux/slab.h:992 [inline]
	nvif_vmm_ctor+0x3c0/0x7e0 drivers/gpu/drm/nouveau/nvif/vmm.c:237
	nouveau_vmm_init+0x40/0x90 drivers/gpu/drm/nouveau/nouveau_vmm.c:134
	nouveau_cli_init+0x7b9/0xe10 drivers/gpu/drm/nouveau/nouveau_drm.c:293
	nouveau_drm_open+0x236/0x740 drivers/gpu/drm/nouveau/nouveau_drm.c:1243
	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
	chrdev_open+0x21c/0x660 fs/char_dev.c:411
	do_dentry_open+0x59d/0x12b0 fs/open.c:947
	vfs_open+0x82/0x390 fs/open.c:1052
	do_open fs/namei.c:4700 [inline]
	path_openat+0x2345/0x3420 fs/namei.c:4863
	do_file_open+0x207/0x460 fs/namei.c:4892
	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
	do_sys_open fs/open.c:1374 [inline]
	__do_sys_openat fs/open.c:1390 [inline]
	__se_sys_openat fs/open.c:1385 [inline]
	__x64_sys_openat+0x144/0x200 fs/open.c:1385
	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
	entry_SYSCALL_64_after_hwframe+0x77/0x7f

	Freed by task 2567 on cpu 1 at 163.601355s:
	kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
	kasan_save_track+0x17/0x60 mm/kasan/common.c:78
	kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:584
	poison_slab_object mm/kasan/common.c:253 [inline]
	__kasan_slab_free+0x61/0x80 mm/kasan/common.c:285
	kasan_slab_free include/linux/kasan.h:235 [inline]
	slab_free_hook mm/slub.c:2677 [inline]
	slab_free mm/slub.c:6377 [inline]
	kfree+0x383/0x590 mm/slub.c:6692
	nvif_vmm_dtor+0x31/0x50 drivers/gpu/drm/nouveau/nvif/vmm.c:194
	nouveau_vmm_fini+0x16/0x50 drivers/gpu/drm/nouveau/nouveau_vmm.c:127
	nouveau_cli_fini+0x10e/0x210 drivers/gpu/drm/nouveau/nouveau_drm.c:225
	nouveau_cli_init+0x593/0xe10 drivers/gpu/drm/nouveau/nouveau_drm.c:324
	nouveau_drm_open+0x236/0x740 drivers/gpu/drm/nouveau/nouveau_drm.c:1243
	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
	chrdev_open+0x21c/0x660 fs/char_dev.c:411
	do_dentry_open+0x59d/0x12b0 fs/open.c:947
	vfs_open+0x82/0x390 fs/open.c:1052
	do_open fs/namei.c:4700 [inline]
	path_openat+0x2345/0x3420 fs/namei.c:4863
	do_file_open+0x207/0x460 fs/namei.c:4892
	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
	do_sys_open fs/open.c:1374 [inline]
	__do_sys_openat fs/open.c:1390 [inline]
	__se_sys_openat fs/open.c:1385 [inline]
	__x64_sys_openat+0x144/0x200 fs/open.c:1385
	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
	entry_SYSCALL_64_after_hwframe+0x77/0x7f

	The buggy address belongs to the object at ffff888010fcdc30
	which belongs to the cache kmalloc-16 of size 16
	The buggy address is located 0 bytes inside of
	16-byte region [ffff888010fcdc30, ffff888010fcdc40)

	The buggy address belongs to the physical page:
	page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10fcd
	flags: 0x100000000000000(node=0|zone=1)
	page_type: f5(slab)
	raw: 0100000000000000 ffff88800d441640 dead000000000100 dead000000000122
	raw: 0000000000000000 0000000000550055 00000000f5000000 0000000000000000
	page dumped because: kasan: bad access detected

	Memory state around the buggy address:
	ffff888010fcdb00: fc fc 00 04 fc fc fc fc fa fb fc fc fc fc fa fb
	ffff888010fcdb80: fc fc fc fc fa fb fc fc fc fc 00 07 fc fc fc fc
	>ffff888010fcdc00: fa fb fc fc fc fc fa fb fc fc fc fc fa fb fc fc
										^
	ffff888010fcdc80: fc fc fa fb fc fc fc fc 00 04 fc fc fc fc fa fb
	ffff888010fcdd00: fc fc fc fc 00 00 fc fc fc fc fa fb fc fc fc fc

Fix by removing the redundant teardown in nouveau_drm_open(),
since nouveau_cli_init() already does the cleanup work.
Also clear vmm->page after its freeing.

Cc: stable@vger.kernel.org
Fixes: 20d8a88e557a ("drm/nouveau: tidy up the client init/fini interfaces")
Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
Assisted-by: LLM
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +---
 drivers/gpu/drm/nouveau/nvif/vmm.c    | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e16f59b00f6f..c465d59ef0a6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1251,10 +1251,8 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 	mutex_unlock(&drm->clients_lock);
 
 done:
-	if (ret && cli) {
-		nouveau_cli_fini(cli);
+	if (ret && cli)
 		kfree(cli);
-	}
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 65c3e883b119..579af70766f2 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -192,6 +192,7 @@ void
 nvif_vmm_dtor(struct nvif_vmm *vmm)
 {
 	kfree(vmm->page);
+	vmm->page = NULL;
 	nvif_object_dtor(&vmm->object);
 }
 
-- 
2.43.0
