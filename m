Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57034606A31C
	for <nouveau@archiver.kernel.org>; Mon,  9 Nov 2026 07:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=HHqVTevZ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 74D9810E837;
	Mon,  9 Nov 2026 07:46:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9DCC349142;
	Mon,  9 Nov 2026 07:26:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794209207;
 b=V9Z8gwPgNSYEcd0aLPt7lTJlbqnni4NxDhI7zbtB9fKCeNU+SFWlGsNeQijRnMN8s05oL
 15QYkfLe8rWYT2lBnj0YbPPXYd9tsmcY5qGsJUPid9KeWzLg8xAFI4sRumHADfDMMiBsH7e
 mJZrVzIIU947PAuzPEHGwCkA2EyYweFiU5zMtXSC3KsamMBRmntpFpqn6JlukTD5+YBz1o3
 XHOWKSdqGeGfsqDbY9gLIBJsrK5pHN9S1DP/sV5ydJkM83RD9fJ1dlEQ5zUHpp9zVLt5WEM
 0qNwBAJDs59TH49OElgYrpD7eXC2iHC/M/E5OtYBilzHluLR78tyvMCvXQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794209207; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xASE8Ihl9ubpRr2yJMy6txVTU32hyHVBsROgs0Mm94o=;
 b=EjtzwWFGFNMdLplvc6tEKPZ0teS4dJKtTvVgjK0YaieACtqgEsOj5hwCO2WzSflnxoPgR
 y1u/B+zQpJN/CH85rK4Ss+quKfCatsloj5a5sVpUKvGKIWbIKbC6+w7FVhyxRo75zrrybAB
 qdLKULPBHPYnhtXUKXB20qJHt0JSx89qqJVZnOvZBtvhw5qX2bLEVKpFq+mxnzUMWmYQ63+
 dxtbg1tsseVMhOE0VkxWDYhVkTuWLOXZi4YCZKeGY4/dkE7tfYvvPBX2KJApT6i9fKJBZjK
 a85qZs3770vqSlsbGfWB0fYTggkf+7Az0k643L21wa6mKilKeJgOxx/Pwf9Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=leemhuis.info
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=leemhuis.info
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6498B45D9E
	for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2026 07:26:44 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA34510F099
	for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2026 07:46:12 +0000 (UTC)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jNMJP4vW0z9DLf;
	Mon,  9 Nov 2026 08:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794210309;
	bh=7EJFEzh4a9nVJlafp+CeyAQpCbAsvzRXh8/8xJ4NWqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HHqVTevZvmNgeBlZrEQARmcnAUZ3ygSHVkYG8g8SMPlzMwCWGLfG9rue3vbjkqNpS
	 3rjxat+3r+wJYFyQMxNsas8hJFEAbWBRPmvJrfy9n9Coae2S5QuTDI7sXEAh6YTXz8
	 2FMUldqG34j+mRnYVohsjoICb5saV9GUxVSUndq5kXNnVp340/aebiVwnbFq6e7rFS
	 o8zWsYui9en4ZAFFjvDiOoq1VzEYXZTcVJMg1mdWTVnhszC0hobhGKgHW9/1xpVOgz
	 G1Undo5Q+y35FRZagO1eOdac2fGpl9YJnW73r/z4ng011b7ImSiNTj/hrbh0egbON6
	 xSw1ZdrAK0egQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jNMJP4BWnz7vJT;
	Mon,  9 Nov 2026 08:45:09 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jNMJM4XtPz8svc;
	Mon,  9 Nov 2026 08:45:07 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F16995F934;
	Mon,  9 Nov 2026 08:45:01 +0100 (CET)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
Date: Mon, 9 Nov 2026 08:45:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
To: Eric Kim <seohyun.kim@outlook.kr>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: 
 <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179421030255.541038.7952286833943374927@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: F16995F934
X-NC-CID: i2KHFedQaNOZ9hcnZ4DoltFOmQ/49g4l9F7N8VdG7sp0d5WYNv0=
Message-ID-Hash: TBQP4VFEVCBE4FIUTL2N5K2QP4GTMJZX
X-Message-ID-Hash: TBQP4VFEVCBE4FIUTL2N5K2QP4GTMJZX
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TBQP4VFEVCBE4FIUTL2N5K2QP4GTMJZX/>
Archived-At: 
 <https://lore.freedesktop.org/b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info/>
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

On 11/2/26 13:47, Eric Kim wrote:
> 
> On my laptop, which has GP107 GPU with intel graphics and uses nouveau
> driver, booting kernels after commit
> 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer dereference
> at initialization.

Thx for your report. Hmm, no reply yet afaics. Wondering if it would
have been better to report it at the dedicated place for nouveau kernel
bugs: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/

You thus might want to at least check if any similar reports are found
there.

Would also be good to know if reverting 2652aca460dc ontop of latest
mainline fixes this.

Ciao, Thorsten
> [   17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
> [   17.556364] nouveau 0000:01:00.0: [drm] No compatible format found
> [   17.556792] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> [   17.557237] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> [   17.583880] #PF: supervisor instruction fetch in kernel mode
> [   17.598078] #PF: error_code(0x0010) - not-present page
> [   17.601475] PGD 0 P4D 0 [   17.608839] Oops: Oops: 0010 [#1] SMP PTI
> [   17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tainted 7.3.0+
> #1 PREEMPT(lazy) [   17.608954] Hardware name: SAMSUNG ELECTRONICS CO.,
> LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ 08/29/2017
> [   17.608990] RIP: 0010:0x0
> [   17.609090] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
> [   17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RCX:
> ffffffffa97d8091
> [   17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RDI:
> ffff89b74c466800
> [   17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R09:
> 0000000000000000
> [   17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R12:
> ffff89b74c466800
> [   17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R15:
> ffff89b77f1a2400
> [   17.610320] FS:  00007fc4a888d780(0000) GS:ffff89bac4364000(0000)
> knlGS:0000000000000000
> [   17.610357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR4:
> 00000000003726f0
> [   17.610448] Call Trace:
> [   17.610483]  <TASK>
> [   17.610521]  drm_atomic_commit+0xb1/0xe0
> [   17.610558]  ? __pfx___drm_printfn_info+0x10/0x10
> [   17.610590]  drm_client_modeset_commit_atomic+0x25c/0x2d0
> [   17.610618]  drm_client_modeset_commit_locked+0x5a/0x170
> [   17.610647]  ? drm_master_internal_acquire+0x1d/0x40
> [   17.610675]  drm_client_modeset_commit+0x25/0x40
> [   17.610700]  drm_fb_helper_single_fb_probe+0x1aa/0x1c0
> [   17.610729]  __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
> [   17.610754]  drm_fbdev_client_hotplug+0x79/0xb0
> [   17.610782]  ? drm_client_init+0x13e/0x180
> [   17.610811]  drm_client_register+0x79/0xc0
> [   17.610839]  drm_fbdev_client_setup+0xc9/0x1c0
> [   17.610867]  drm_client_setup+0x6a/0x90
> [   17.610893]  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
> [   17.610922]  local_pci_probe+0x4a/0x90
> [   17.610951]  ? cpu_hotplug_disable+0x15/0x30
> [   17.610977]  pci_call_probe+0x5a/0x1a0
> [   17.611009]  pci_device_probe+0xdb/0x180
> [   17.611060]  call_driver_probe+0x23/0x100
> [   17.611104]  ? driver_sysfs_add+0x55/0xc0
> [   17.611137]  really_probe+0xd7/0x2d0
> [   17.611171]  ? __pm_runtime_resume+0x50/0x60
> [   17.611220]  __driver_probe_device+0x9c/0x1b0
> [   17.611261]  driver_probe_device+0x1f/0x80
> [   17.611297]  ? __pfx___driver_attach+0x10/0x10
> [   17.611335]  __driver_attach+0xcc/0x200
> [   17.611373]  ? __pfx___driver_attach+0x10/0x10
> [   17.611409]  bus_for_each_dev+0x97/0x100
> [   17.611451]  bus_add_driver+0x1d0/0x280
> [   17.611493]  ? __pfx_init_module+0x10/0x10 [nouveau]
> [   17.611530]  ? __pfx_init_module+0x10/0x10 [nouveau]
> [   17.611567]  driver_register+0x75/0xe0
> [   17.611602]  nouveau_drm_init+0x60/0xff0 [nouveau]
> [   17.611633]  do_one_initcall+0x89/0x3d0
> [   17.611667]  do_init_module+0x8e/0x290
> [   17.611703]  init_module_from_file+0xc8/0x180
> [   17.611736]  idempotent_init_module+0x23e/0x360
> [   17.611773]  __x64_sys_finit_module+0x7f/0x110
> [   17.611805]  do_syscall_64+0xbe/0x470
> [   17.611844]  ? do_syscall_64+0x37/0x470
> [   17.611883]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> It boots without this problem when booting with nouveau.atomic=0
> kernel parameter.
> 
> My guess is that atomic_(commit|check) operation is not present in
> nouveau_mode_config_funcs, and commit
> 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
> atomic modesetting by default for NV50+ gpus caused
> the problem.
> 
> Also, drm_helper_(commit|check) was added to nouveau_mode_config_funcs
> at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
> reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
> unreliability.
> 
> I hope this problem can be fixed at one of the next releases.
> 
> Thanks,
> Eric Kim
> 
> #regzbot introduced: 2652aca460dc

