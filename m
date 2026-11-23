Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163A606A31A
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=LQfu8CMo
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C61C10ECD1;
	Mon, 23 Nov 2026 10:57:18 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 796E84038F;
	Mon, 23 Nov 2026 10:57:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795431433;
 b=Ni/5jla59c7j9gVXESgd7AOEwh0VfhhrSyibC5If2yZuTosDn0zpB4Zlq371989PJXbv5
 SZJ2g0SZqOX6UYoJFWZR4KAbFVLGZylsKd82xb9lJR+N3iMvJBDaU7kvR5+TBK66PzPwlG8
 rjhlU37SDT/B0+ZWYzXVD5PcwFu52fObr9vJOfIL26Fh1us7nPmu34oFsZ8f4Lh3FOcTF2k
 Oq0EKMpYh8hmAT9ySj4p9LaTYsumkFfzy/YQFvt4Irfe2QOIVHylslYaSSh62RcfhXZwTKY
 9uQH6Ee3BlcJOjKnOaH8+ePEyVKLdyID8MqxmVEIufBPTZtaIcQ7V6//f63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795431433; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X5svZ998AfK7SFajFSBgAeoI0l40RLsVySjObineKnM=;
 b=Dh44h1znUFdvEo0K35ztad+9niLtR9JRTKR1FEufs5/UxJLZl7zOBa3yWgU85opfbbqaM
 ZWJ1dCO5MwZWidCQ9ba7iYvkEHbh5H+kyhska1oRlTJrIc5yqp4xgpI4oSCY/133hnYSPbQ
 r7f8v7sjpu79GbcBA4I8PCKt/Kor3PPYIEXl28BWfwlU0XKXy38WT7GufP69aFRQ7CR8APF
 ma2ptBoKQjmggu2ZF2n3Tn86IoPWXgilbW4oAa/yX9rWRresRQdPMXJoYzPRHoWGvtGm9YA
 AmUpSbXuPSyl+uEj94Uicd/q8B4P6ICDVgshMdKYEDyWN4Se7agcl7/1kbzg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info;
 arc=none;
 dmarc=pass header.from=leemhuis.info policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=leemhuis.info
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D11B2402F0
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:57:09 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABF010E375
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:57:04 +0000 (UTC)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jY2st2bTXz9HF1;
	Mon, 23 Nov 2026 11:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795431346;
	bh=rxwxq7gPotnmPGcefVQ3QwGpF3KbLCwKtYmRQBY/L+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQfu8CMomI9wbHqn9dA9sjkUsdWTqhpkd+3BKy5iWLoMX+iwvR0ZQ0V1EXK/X/TNa
	 x2U+T1sXkHnQNvsFqIYnmojLzz16FGlzNUSsp+EHJ5PYf2rOvrtHoPNK3QE9RiJUMr
	 L1HHRvnQ3OjK0g9Q4rU4yazQxkDAujbJ3oUg2pqtf3SkUwNWfazJI1zW8xjHB2o1Zz
	 YXo5efkCLW9Kpvt11ezv0rsOmBPIy/kvHLAmiGqM13ctF64DxkmF8LmGp4+FvsHBlg
	 P5/aSCfRVfNsd2woY6bvvntlFmwZwpml1S8YwvYyxNC+RFvdrDSFDAKDX2naR4GKAo
	 5gSQtkUzNcygA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jY2st1tkpz7vRN;
	Mon, 23 Nov 2026 11:55:46 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jY2sq21vTz8svc;
	Mon, 23 Nov 2026 11:55:43 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4E55B5F8B0;
	Mon, 23 Nov 2026 11:55:27 +0100 (CET)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b2c5e6b7-d579-449c-b894-ee162230e328@leemhuis.info>
Date: Mon, 23 Nov 2026 11:55:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
To: lyude@redhat.com
References: 
 <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
 <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
 <b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179543132790.1428421.6043635296124573607@mxe9fb.netcup.net>
X-NC-CID: ykwqwavNXtJHKi1LboJkRmODmsG3XG50Gpsc1NWLrA1tquAvwVc=
Message-ID-Hash: 3ON3IJ7MT5IGA44O3LKFVQ2DOTWEWFWD
X-Message-ID-Hash: 3ON3IJ7MT5IGA44O3LKFVQ2DOTWEWFWD
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: dakr@kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 maarten.lankhorst@linux.intel.com, Eric Kim <seohyun.kim@outlook.kr>,
 mripard@kernel.org, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ON3IJ7MT5IGA44O3LKFVQ2DOTWEWFWD/>
Archived-At: 
 <https://lore.freedesktop.org/b2c5e6b7-d579-449c-b894-ee162230e328@leemhuis.info/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 01:54, lyude@redhat.com wrote:
> Hi - I'm back! Sorry about this, I've been busy moving and only just
> got my machine setup. I will take a look at this tomorrow

Any progress on this? Looks like nothing happened, but it's easy to miss
something from the outside.

Just wondering: should we maybe just revert the culprit for now and
retry in a later cycle?

Ciao, Thorsten
> On Mon, 2026-11-09 at 08:45 +0100, Thorsten Leemhuis wrote:
>> On 11/2/26 13:47, Eric Kim wrote:
>>>
>>> On my laptop, which has GP107 GPU with intel graphics and uses
>>> nouveau
>>> driver, booting kernels after commit
>>> 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer
>>> dereference
>>> at initialization.
>>
>> Thx for your report. Hmm, no reply yet afaics. Wondering if it would
>> have been better to report it at the dedicated place for nouveau
>> kernel
>> bugs: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/
>>
>> You thus might want to at least check if any similar reports are
>> found
>> there.
>>
>> Would also be good to know if reverting 2652aca460dc ontop of latest
>> mainline fixes this.
>>
>> Ciao, Thorsten
>>> [   17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on
>>> minor 0
>>> [   17.556364] nouveau 0000:01:00.0: [drm] No compatible format
>>> found
>>> [   17.556792] nouveau 0000:01:00.0: [drm] Cannot find any crtc or
>>> sizes
>>> [   17.557237] BUG: kernel NULL pointer dereference, address:
>>> 0000000000000000
>>> [   17.583880] #PF: supervisor instruction fetch in kernel mode
>>> [   17.598078] #PF: error_code(0x0010) - not-present page
>>> [   17.601475] PGD 0 P4D 0 [   17.608839] Oops: Oops: 0010 [#1] SMP
>>> PTI
>>> [   17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tainted
>>> 7.3.0+
>>> #1 PREEMPT(lazy) [   17.608954] Hardware name: SAMSUNG ELECTRONICS
>>> CO.,
>>> LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ
>>> 08/29/2017
>>> [   17.608990] RIP: 0010:0x0
>>> [   17.609090] Code: Unable to access opcode bytes at
>>> 0xffffffffffffffd6.
>>> [   17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
>>> [   17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RCX:
>>> ffffffffa97d8091
>>> [   17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RDI:
>>> ffff89b74c466800
>>> [   17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R09:
>>> 0000000000000000
>>> [   17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R12:
>>> ffff89b74c466800
>>> [   17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R15:
>>> ffff89b77f1a2400
>>> [   17.610320] FS:  00007fc4a888d780(0000)
>>> GS:ffff89bac4364000(0000)
>>> knlGS:0000000000000000
>>> [   17.610357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR4:
>>> 00000000003726f0
>>> [   17.610448] Call Trace:
>>> [   17.610483]  <TASK>
>>> [   17.610521]  drm_atomic_commit+0xb1/0xe0
>>> [   17.610558]  ? __pfx___drm_printfn_info+0x10/0x10
>>> [   17.610590]  drm_client_modeset_commit_atomic+0x25c/0x2d0
>>> [   17.610618]  drm_client_modeset_commit_locked+0x5a/0x170
>>> [   17.610647]  ? drm_master_internal_acquire+0x1d/0x40
>>> [   17.610675]  drm_client_modeset_commit+0x25/0x40
>>> [   17.610700]  drm_fb_helper_single_fb_probe+0x1aa/0x1c0
>>> [   17.610729] 
>>> __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
>>> [   17.610754]  drm_fbdev_client_hotplug+0x79/0xb0
>>> [   17.610782]  ? drm_client_init+0x13e/0x180
>>> [   17.610811]  drm_client_register+0x79/0xc0
>>> [   17.610839]  drm_fbdev_client_setup+0xc9/0x1c0
>>> [   17.610867]  drm_client_setup+0x6a/0x90
>>> [   17.610893]  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
>>> [   17.610922]  local_pci_probe+0x4a/0x90
>>> [   17.610951]  ? cpu_hotplug_disable+0x15/0x30
>>> [   17.610977]  pci_call_probe+0x5a/0x1a0
>>> [   17.611009]  pci_device_probe+0xdb/0x180
>>> [   17.611060]  call_driver_probe+0x23/0x100
>>> [   17.611104]  ? driver_sysfs_add+0x55/0xc0
>>> [   17.611137]  really_probe+0xd7/0x2d0
>>> [   17.611171]  ? __pm_runtime_resume+0x50/0x60
>>> [   17.611220]  __driver_probe_device+0x9c/0x1b0
>>> [   17.611261]  driver_probe_device+0x1f/0x80
>>> [   17.611297]  ? __pfx___driver_attach+0x10/0x10
>>> [   17.611335]  __driver_attach+0xcc/0x200
>>> [   17.611373]  ? __pfx___driver_attach+0x10/0x10
>>> [   17.611409]  bus_for_each_dev+0x97/0x100
>>> [   17.611451]  bus_add_driver+0x1d0/0x280
>>> [   17.611493]  ? __pfx_init_module+0x10/0x10 [nouveau]
>>> [   17.611530]  ? __pfx_init_module+0x10/0x10 [nouveau]
>>> [   17.611567]  driver_register+0x75/0xe0
>>> [   17.611602]  nouveau_drm_init+0x60/0xff0 [nouveau]
>>> [   17.611633]  do_one_initcall+0x89/0x3d0
>>> [   17.611667]  do_init_module+0x8e/0x290
>>> [   17.611703]  init_module_from_file+0xc8/0x180
>>> [   17.611736]  idempotent_init_module+0x23e/0x360
>>> [   17.611773]  __x64_sys_finit_module+0x7f/0x110
>>> [   17.611805]  do_syscall_64+0xbe/0x470
>>> [   17.611844]  ? do_syscall_64+0x37/0x470
>>> [   17.611883]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>
>>> It boots without this problem when booting with nouveau.atomic=0
>>> kernel parameter.
>>>
>>> My guess is that atomic_(commit|check) operation is not present in
>>> nouveau_mode_config_funcs, and commit
>>> 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
>>> atomic modesetting by default for NV50+ gpus caused
>>> the problem.
>>>
>>> Also, drm_helper_(commit|check) was added to
>>> nouveau_mode_config_funcs
>>> at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
>>> reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
>>> unreliability.
>>>
>>> I hope this problem can be fixed at one of the next releases.
>>>
>>> Thanks,
>>> Eric Kim
>>>
>>> #regzbot introduced: 2652aca460dc
> 

