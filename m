Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F638CD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 18:22:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65EAE10F522;
	Thu, 28 May 2026 18:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iNm4Xosb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 160EB465D0;
	Thu, 28 May 2026 18:08:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779991717;
 b=PxUBuJ2y8CIYqKQBrNHEf/ku/P71yJ/xxGW2zczd9eeKWnhQrpbVOK7AUZjgvQ46Gtz5b
 d7PZfy8jd5vxNE/mpGfjFkVb6b5ym4QgzpGyJwLp+6kWNHlvg1mYMZPwwQIIdR4rgvR+w9D
 2U8K77WZRyKtkmdvt6roUer9vRZ8pTG83PEZzl3x8MZyBrF6Mc043HHnKrfZ+hRknnBvFOy
 kDfKpYP3Jh8LlUHAxhTlQVs77QSNgol4arYTKpKkoH6gc5MczBAR4qFuNEWucqnCI939Y7O
 012c55OIfU85UHwhu3sbkQLb2lyrj7R8J7eDEu7fDAmPBqzXvHZRU+6N+i8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779991717; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MJ5qF671dc/eeaBWYfH5arIf631VPhhnj+1/wPlE+T0=;
 b=QhqVkFq85H1FIVQPPPJs53f2EvP96EL0cijwE3/2+fBXRiEqtQWtBsrzhoWN1oJFhsG14
 0Ubio/SkP/CZ4eArUhSMGYxs4wB/h1JwWfOnQ2Azk5wWPCcoCwYHWUuB+ej6FQeEzB7mrQx
 jZuCHt0qwHj5hmD6y8InJtx/BQGun6TNGCHD9cFyJA0VZnnCBeAzRv1sNy2qJh+0vNy7HMK
 L3N+EZCsjM+ZrxhTcttwNOjr9Plm6MfdRiukQrv6ff7J2d3QBUOLwASGuVUXpSjVHjR/HG1
 dfMTgT+EhJmLnQRKGKU6jTf8/iBX9SDUqR6K6cYYC1xhZOm36Tqmpo4g1PHw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 563B3401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 18:08:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D93310F51C
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779992522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJ5qF671dc/eeaBWYfH5arIf631VPhhnj+1/wPlE+T0=;
	b=iNm4Xosb38PWn0kGpymw1MRX+VNye5mzT5Y+UHP45EBA0U2rD3Byr8u92z1chf6PC7VtNA
	MJSJ2xVNr/55fPZZTgOfbY6HrP1lExzGvImL5V6LLiq0C3iXgG+yyps/9CzLkx0+lYwuLO
	0hZ8XqPGroyZWtS/OVfSZRjineaZ2PQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-jtHIVZzWMoGR_elX5H_FTA-1; Thu, 28 May 2026 14:22:00 -0400
X-MC-Unique: jtHIVZzWMoGR_elX5H_FTA-1
X-Mimecast-MFC-AGG-ID: jtHIVZzWMoGR_elX5H_FTA_1779992520
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-90ccab62c33so1409562185a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 28 May 2026 11:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779992520; x=1780597320;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ5qF671dc/eeaBWYfH5arIf631VPhhnj+1/wPlE+T0=;
        b=RBkew3G5dZ3cV/D56z4RwG1XGmBhEdmLUf9PtMFTInXWEqT0XU2dsXjK3dkX50hOCT
         idRV6xgGZgwTIBkz+wPKUCZIePlGL0mDXkaO+BDH92ZbPPOQOJIdyVvbenMJT4I1hzv+
         aHBbboKCee3pn6wIWOOwJukY+r7KmilKndi3Nw0hFEDSj9HBYGXxJHdSS1J/SN76deHM
         Ix2AIGnRH2y9m6rh/niUU7o6mXbcJWjXJD7NqWRBYsZzqX3TYp1QACgihgTacbeI1pPn
         J2iQOoqpD8PZHYsauzn3tMGGU1Psp5mM0UBv4WQ500iCw1pYN+6qbuE4Ut5RH0qQ4O+d
         5NFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oZP23tK8JAEp+73VXdc4L3CqMvdUqlHdYQ2xBwvymWI1it5Xaj4agdj95EkhTfg6+ODbIDz+4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJR6P+gogy5+mJBhZfrXQR+98U1lm58Y5tFzT7vlGKxQFErTrH
	LzA//UdBChPgJfQA20XdclIOd12pl7LtNSBT0KHcQQqWC5XZJQLsM80SG8M7AAUeIRiVGKlxXDx
	DDPvU6LR8aJbhG1te3ldjFUu29SZ38EEC95UGzAbpqcqzXAZG0CwtTYXLQi5tWzuPVvM=
X-Gm-Gg: Acq92OFG4jWa1+kQdJI17Ounnw14JAofbDTe/v/1xVj3lu3Cwe+vPZIAZ1xC4rHP78M
	5N4y6VWn+wZfdAepima59XGNirpzYHeOuOTiK620ythT47uspbom7tRllk/9QHyqJWWsGj0Q7TG
	XXqHp1gqfAni8QO56hAMQwbpd4Z0P92/EsVEX8WbfQb0fnNXPynngch4ueV4ntmsD/MuWVWGiZW
	PGC7IGAjd5gOrsnKDVh04E4ZCIW8pioBKjEqQ4Q7lkSK/Caos8lDAwTb6VrWgIY2rE/vZqhkv+L
	g6tM+o2E4GgzVyKqRn7haOr95PekBY1B3baHlJc21v84yMLLe1Mq7A8oaBMbKj3unNejQSmX3Ng
	gNI8QkLuJQOEQ1ca59zfs/bDGGHDf
X-Received: by 2002:a05:620a:40c6:b0:912:671b:d094 with SMTP id
 af79cd13be357-9152cef1054mr21225885a.31.1779992520097;
        Thu, 28 May 2026 11:22:00 -0700 (PDT)
X-Received: by 2002:a05:620a:40c6:b0:912:671b:d094 with SMTP id
 af79cd13be357-9152cef1054mr21217285a.31.1779992519378;
        Thu, 28 May 2026 11:21:59 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-914f87d1cc0sm962062085a.26.2026.05.28.11.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:21:58 -0700 (PDT)
Message-ID: <aa30d35addf72c9a1f56074984488aea8b8e472c.camel@redhat.com>
Subject: Re: [PATCH 0/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL() usage
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Date: Thu, 28 May 2026 14:21:57 -0400
In-Reply-To: <DIUI56CABZAF.3TU7XCIKTV93R@kernel.org>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
	 <794dbd35fd81f03478cdd3238d3d506d0d800187.camel@redhat.com>
	 <DIUI56CABZAF.3TU7XCIKTV93R@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JZUaMlSaD3LPZ-T3ezs2SinX5xzLCigfAFoQHJdXV4k_1779992520
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BQDFAO3RPGQD3SGSJ4U3M7YTBJR4ETBF
X-Message-ID-Hash: BQDFAO3RPGQD3SGSJ4U3M7YTBJR4ETBF
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Hongling Zeng <zenghongling@kylinos.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BQDFAO3RPGQD3SGSJ4U3M7YTBJR4ETBF/>
Archived-At: 
 <https://lore.freedesktop.org/aa30d35addf72c9a1f56074984488aea8b8e472c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Oh dear, thank you for catching this.

Would you mind sending a revert and I can give an R-B and push it?

On Thu, 2026-05-28 at 19:56 +0200, Danilo Krummrich wrote:
> On Thu May 28, 2026 at 6:41 PM CEST, lyude wrote:
> > Will push them to drm-misc in just a moment
>=20
> [...]
>=20
> > > =C2=A0 nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage
>=20
> I think at least this patch has to be reverted, it causes the
> following oops
> probing nouveau on my machine.
>=20
> I can't currently look into this, but I think Sashiko [1] has a valid
> point on
> this one.
>=20
> [1]
> https://sashiko.dev/#/patchset/20260528062451.54107-1-zenghongling%40kyli=
nos.cn
>=20
> May 28 19:49:27 cassiopeiae kernel: BUG: kernel NULL pointer
> dereference, address: 000000000000002c
> May 28 19:49:27 cassiopeiae kernel: #PF: supervisor read access in
> kernel mode
> May 28 19:49:27 cassiopeiae kernel: #PF: error_code(0x0000) - not-
> present page
> May 28 19:49:27 cassiopeiae kernel: PGD 0 P4D 0
> May 28 19:49:27 cassiopeiae kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> May 28 19:49:27 cassiopeiae kernel: CPU: 12 UID: 0 PID: 475 Comm:
> (udev-worker) Not tainted 7.1.0-rc5+ #14 PREEMPT(lazy)
> May 28 19:49:27 cassiopeiae kernel: Hardware name: ASUS System
> Product Name/TUF GAMING B850-E WIFI, BIOS 1627 02/05/2026
> May 28 19:49:27 cassiopeiae kernel: RIP:
> 0010:r535_gsp_rpc_rm_ctrl_push+0x60/0x110 [nouveau]
> May 28 19:49:27 cassiopeiae kernel: Code: 4c 8b 58 08 4c 89 f7 ba 02
> 00 00 00 89 e9 2e 2e 2e 41 ff d3 48 89 c6 48 3d 01 f0 ff ff 72 0b 48
> c7 03 00 00 00 00 89>
> May 28 19:49:27 cassiopeiae kernel: RSP: 0018:ffffd3b38178f250
> EFLAGS: 00010213
> May 28 19:49:27 cassiopeiae kernel: RAX: 0000000000000020 RBX:
> ffffd3b38178f2a0 RCX: 0000000000000000
> May 28 19:49:27 cassiopeiae kernel: RDX: 0000000000000038 RSI:
> 0000000000000020 RDI: ffff8aa9db3339d8
> May 28 19:49:27 cassiopeiae kernel: RBP: 0000000000000000 R08:
> ffffffffbe380560 R09: ffffffffc04c9300
> May 28 19:49:27 cassiopeiae kernel: R10: 0000000000000100 R11:
> ffffffffbd66c070 R12: 0000000090f10000
> May 28 19:49:27 cassiopeiae kernel: R13: 0000000000000000 R14:
> ffff8aa9db333000 R15: ffff8aa9e1c2d600
> May 28 19:49:27 cassiopeiae kernel: FS:=C2=A0 00007fb0623dc1c0(0000)
> GS:ffff8ab15f8b9000(0000) knlGS:0000000000000000
> May 28 19:49:27 cassiopeiae kernel: CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> May 28 19:49:27 cassiopeiae kernel: CR2: 000000000000002c CR3:
> 000000011efcc000 CR4: 0000000000f50ef0
> May 28 19:49:27 cassiopeiae kernel: PKRU: 55555554
> May 28 19:49:27 cassiopeiae kernel: Call Trace:
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 <TASK>
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 r535_mmu_vaspace_new+0x1f8/0x52=
0
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nvkm_uvmm_new+0x1b7/0x210
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nvkm_ioctl_new+0x22d/0x340
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? nvkm_uvmm_search+0x30/0x30
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nvkm_ioctl+0xf7/0x1f0 [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nvif_object_ctor+0x134/0x2b0
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? nvkm_uvmm_search+0x30/0x30
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __kmalloc_noprof+0x205/0x550
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? nvif_vmm_ctor+0x65/0x280
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nvif_vmm_ctor+0xe5/0x280
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nouveau_vmm_init+0x3b/0x50
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nouveau_cli_init+0x25f/0x450
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0
> nouveau_drm_device_init+0x69/0x840 [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> pci_bus_read_config_word+0x4b/0x80
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 nouveau_drm_probe+0xc7/0x190
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 pci_device_probe+0x1f9/0x300
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 really_probe+0x1b8/0x480
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 __driver_probe_device+0x9d/0x13=
0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 driver_probe_device+0x1e/0x100
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 __driver_attach+0xab/0x210
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? driver_attach+0x20/0x20
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 bus_for_each_dev+0x10b/0x150
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 bus_add_driver+0x184/0x2d0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 driver_register+0x61/0xf0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 init_module+0x1bd/0x1000
> [nouveau]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? cleanup_module+0x2e0/0x2e0
> [video]
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 do_one_initcall+0x12e/0x350
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> security_kernfs_init_security+0x58/0x130
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __kernfs_new_node+0x1be/0x270
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> security_kernfs_init_security+0x58/0x130
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __add_to_free_list+0x98/0x170
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __free_one_page+0x34c/0x450
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? free_pcppages_bulk+0x19d/0x27=
0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> free_frozen_page_commit+0xaa/0x4b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> __free_frozen_pages+0x29e/0x670
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? load_module+0x1354/0x14e0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ?
> __kmalloc_cache_noprof+0x189/0x420
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 do_init_module+0x82/0x270
> May 28 19:49:27 cassiopeiae kernel:=C2=A0
> __se_sys_finit_module+0x26a/0x3d0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 do_syscall_64+0x12a/0x3b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? vfs_read+0x14d/0x300
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __x64_sys_pread64+0x70/0xc0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_syscall_64+0x165/0x3b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_sys_openat2+0x93/0xd0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __x64_sys_openat+0x80/0xa0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_syscall_64+0x165/0x3b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? __x64_sys_pread64+0x70/0xc0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_syscall_64+0x165/0x3b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_user_addr_fault+0x273/0x6a=
0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? irqentry_exit+0x3f/0x630
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 ? do_syscall_64+0xe9/0x3b0
> May 28 19:49:27 cassiopeiae kernel:=C2=A0
> entry_SYSCALL_64_after_hwframe+0x67/0x6f
> May 28 19:49:27 cassiopeiae kernel: RIP: 0033:0x7fb062bb26bd
> May 28 19:49:27 cassiopeiae kernel: Code: ff c3 66 2e 0f 1f 84 00 00
> 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
> 4d 89 c8 4c 8b 4c 24>
> May 28 19:49:27 cassiopeiae kernel: RSP: 002b:00007ffe2bae4d58
> EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> May 28 19:49:27 cassiopeiae kernel: RAX: ffffffffffffffda RBX:
> 000055b4032b23e0 RCX: 00007fb062bb26bd
> May 28 19:49:27 cassiopeiae kernel: RDX: 0000000000000000 RSI:
> 000055b403434900 RDI: 0000000000000043
> May 28 19:49:27 cassiopeiae kernel: RBP: 00007ffe2bae4df0 R08:
> 0000000000000000 R09: 0000000000000000
> May 28 19:49:27 cassiopeiae kernel: R10: 0000000000000000 R11:
> 0000000000000246 R12: 000055b403434900
> May 28 19:49:27 cassiopeiae kernel: R13: 000055b40340c570 R14:
> 0000000000020000 R15: 000055b403437260
> May 28 19:49:27 cassiopeiae kernel:=C2=A0 </TASK>
> May 28 19:49:27 cassiopeiae kernel: Modules linked in: nouveau(+)
> drm_display_helper cec gpu_sched drm_gpuvm drm_exec drm_ttm_helper
> ttm nvme nvme_core nvme_k>
> May 28 19:49:27 cassiopeiae kernel: CR2: 000000000000002c
> May 28 19:49:27 cassiopeiae kernel: ---[ end trace 0000000000000000
> ]---
> May 28 19:49:27 cassiopeiae kernel: RIP:
> 0010:r535_gsp_rpc_rm_ctrl_push+0x60/0x110 [nouveau]
> May 28 19:49:27 cassiopeiae kernel: Code: 4c 8b 58 08 4c 89 f7 ba 02
> 00 00 00 89 e9 2e 2e 2e 41 ff d3 48 89 c6 48 3d 01 f0 ff ff 72 0b 48
> c7 03 00 00 00 00 89>
> May 28 19:49:27 cassiopeiae kernel: RSP: 0018:ffffd3b38178f250
> EFLAGS: 00010213
> May 28 19:49:27 cassiopeiae kernel: RAX: 0000000000000020 RBX:
> ffffd3b38178f2a0 RCX: 0000000000000000
> May 28 19:49:27 cassiopeiae kernel: RDX: 0000000000000038 RSI:
> 0000000000000020 RDI: ffff8aa9db3339d8
> May 28 19:49:27 cassiopeiae kernel: RBP: 0000000000000000 R08:
> ffffffffbe380560 R09: ffffffffc04c9300
> May 28 19:49:27 cassiopeiae kernel: R10: 0000000000000100 R11:
> ffffffffbd66c070 R12: 0000000090f10000
> May 28 19:49:27 cassiopeiae kernel: R13: 0000000000000000 R14:
> ffff8aa9db333000 R15: ffff8aa9e1c2d600
> May 28 19:49:27 cassiopeiae kernel: FS:=C2=A0 00007fb0623dc1c0(0000)
> GS:ffff8ab15f8b9000(0000) knlGS:0000000000000000
> May 28 19:49:27 cassiopeiae kernel: CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> May 28 19:49:27 cassiopeiae kernel: CR2: 000000000000002c CR3:
> 000000011efcc000 CR4: 0000000000f50ef0
> May 28 19:49:27 cassiopeiae kernel: PKRU: 55555554

