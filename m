Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2808C88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 19:21:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C992C10F0A2;
	Thu, 17 Sep 2026 19:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gbl5bPWC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D6D6A48216;
	Thu, 17 Sep 2026 19:03:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789671818;
 b=Vr/pGeXhPHsDynjoYgdPNJO/wXoffyWfL9ybKSK7SpacLXaRLN7tt9cSZhEMEdTLm2TUs
 XAEBVGzxOTkIPT0Y9H6vqtNkyNKil89Q15AQmgnxh0gHDBZiyuZOTuDbsDbS6UoIPGa/0eE
 kso5V9ObjmU30FFKLyCXEYIvy6OaqgRz/LQl9EAuMzz3OVqibvDcsSOFKbzAr+ARSS1to0s
 d8SmNVZdpurJSoGRa6uYBn6mXC01W1m4GaYDXwgdwuus6tvGCCJ9SpN5fXkOhl0bZ6+NKqB
 zDpFZ2SKzFoua9Fj0obeaP/DFl3mxFdhSX0m868/Yby1FOsz7iHCLT1/AA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789671818; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FyzJyJeSPWpqg7lw8x1mCB1MBijseGVtrutxbMvcJzw=;
 b=kn2zlIE+5/o1ucInn4SS4M/47JK2f7Ls/r39xl4cdGR/oX5OVnRX6XNKfFmPiHCqUWlxh
 iKTV4dYIXZrPjO/wCdwN+LwQlPoWGv2qSLQML416Ks/Kes5zF5fl+in26KM5bxVtGnSQZUt
 UGsr98Iqm27GDk3119uQcCJX06E1DMFUt4H20wwDHRPxGeZJeTKzqxHLB3/zFL31qZEVFvg
 dFdZJNgJlC/XgB8kflL4db4GW3FYIh0D98O40on9o7MUg7WZGLdPLn58Krz3Q4QIi8kgZQG
 jGyC4rBub7Yt5fcw/kQZBfgeHdkaldGRYTjFFGdNBCekNtY275EsaeBS3hMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3863F481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:03:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B67B610F090
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyzJyJeSPWpqg7lw8x1mCB1MBijseGVtrutxbMvcJzw=;
	b=Gbl5bPWC6UzoNZ/yJxGCZyxanbckhWa1noBEscZGihL3VZkpMgxRALXhtTvu9n4CoCI1dN
	2wzqaS14FGYOgBnZVEGk0szj9wnJabVpCkvyg9upKcCTDU5Ry/XwK5B/gYhe3FT7Wwn4Jj
	Fwx//spPSpl38wTLA3REQBgRApkw/9E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-nBUQ1ceXOsqvDIIKIz5pAw-1; Thu, 17 Sep 2026 15:21:10 -0400
X-MC-Unique: nBUQ1ceXOsqvDIIKIz5pAw-1
X-Mimecast-MFC-AGG-ID: nBUQ1ceXOsqvDIIKIz5pAw_1789672870
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93918756165so225386585a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 12:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672870; x=1790277670;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpLLCOIJaNkZQflZrI+TWuCqX2syaV6YM6JlIfmZxEk=;
        b=vbHT++FfmEzsJHeVGvlZpWGE/rfVje4lstcI7aMVt0bsJ6Lb1UNGLKmue71bNcpa7T
         uGkrxaM8nxIV7ueGUiGFcXT6+K+EoHAGVmd6c+lFqYMCNFvPG6i5RLwo8DoRGVekdJPF
         pIEFzNTfuhVgSXrZBuhN8Jg3nglDkOt/4qWWkQ+jKaPBWjVntGxx68hZEwT8ZDzbafGW
         qrK4JeDUogKjTxJfP0nsbw6+UE17uPAZ/h0D46f8WqAcPUZ76CjAMtckUOjKazsFabyZ
         sxe6KjRZJ8FC25b/9ldeInL+wxe2qxEcBNDN+vByPBqqx3FrFYppfEyBVYNgoKhSB4fN
         e8Og==
X-Forwarded-Encrypted: i=1;
 AKwUvByDvgVZSVPKnI3g0jd1dpybzelSTZ7zFOfNEJ3ZfbmQLekMDoo772ZSfeLhLXIJGRXCJ3p2TN3K@lists.freedesktop.org
X-Gm-Message-State: AFuF++mqAQoD5hDTLvmtIu6u0T4szksOXm5fvT9DQ5WUBlKiNwkfwIzN
	rrnRIH5Fou50RYX/4Fs/O5JdfPuWl2Hygsv+Eo1+9cpKQV0VQHOaidbBRsC3BgkOy2eTYUhagAB
	Xy5Kz/AWRz3vUegiV1inXXjBXbbV+pgWeowmeMOyWzRolnmZbwi2fGY0QZLTekUr0t5M=
X-Gm-Gg: AYBFou2dUIW4bI+dS3px+bqcqr02H67E5pFgiJZcvgoRshiurpPsz+rOz77KhB9IEfD
	QMJJ88Xykwv1eG/79t3wYuTnpT9EZHcICBOapuIK+VecELPac7qf1WCYaHR/qClu9C0YLYEJ2RX
	j8n7HCqYkWtBzmfxsAwp5ESVDHvwQGZMhezuJWHjG1UqfIYxv/dBpXgg29U4UwRwdhFIKA2w4qP
	LsyNp41zfputFXPFNmumRpniXX7Go+aUCdqqt+b8zAOo8v0pFGfTehBaYSSlI+Z3v2WJqOdoH+9
	vs9o225HIbEUn5LI5aGbEAiY+d4EslnajFjTbEXlRVm00N1jlEolrzGB9M5TKXmgqMEeQCPr
X-Received: by 2002:a05:620a:4147:b0:939:ba2e:455f with SMTP id
 af79cd13be357-93bb797001amr1475885385a.51.1789672865253;
        Thu, 17 Sep 2026 12:21:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:939:ba2e:455f with SMTP id
 af79cd13be357-93bb797001amr1475870885a.51.1789672863572;
        Thu, 17 Sep 2026 12:21:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b780cfa83sm522700085a.3.2026.09.17.12.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:21:03 -0700 (PDT)
Message-ID: <9fd4458240f45ea1ea6d4d79362f72d847b958aa.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix double-free in nvif_vmm_dtor
From: lyude@redhat.com
To: Peiyang He <peiyang_he@smail.nju.edu.cn>, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Thu, 17 Sep 2026 15:21:02 -0400
In-Reply-To: 
 <03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn>
References: 
 <03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: olZdHG4xUoqQGXlbT2AOReyN4ow8q9V0PIHOFqlR8m0_1789672870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IZYF74NF4EVUCSAX6KA677YBO3Q7KEF4
X-Message-ID-Hash: IZYF74NF4EVUCSAX6KA677YBO3Q7KEF4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IZYF74NF4EVUCSAX6KA677YBO3Q7KEF4/>
Archived-At: 
 <https://lore.freedesktop.org/9fd4458240f45ea1ea6d4d79362f72d847b958aa.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment

On Wed, 2026-09-16 at 18:31 +0800, Peiyang He wrote:
> On failure, nouveau_cli_init() calls nouveau_cli_fini() to tear
> the client down. Then, nouveau_drm_open() also enters into its
> cleanup path and calls nouveau_cli_fini() AGAIN. nouveau_cli_fini()
> calls nouveau_vmm_fini():
>=20
> =09void
> =09nouveau_vmm_fini(struct nouveau_vmm *vmm)
> =09{
> =09=09nouveau_svmm_fini(&vmm->svmm);
> =09=09nvif_vmm_dtor(&vmm->vmm);
> =09=09vmm->cli =3D NULL;
> =09}
>=20
> Inside nvif_vmm_dtor(), vmm->page is freed unconditionally:
>=20
> =09void
> =09nvif_vmm_dtor(struct nvif_vmm *vmm)
> =09{
> =09=09kfree(vmm->page);
> =09=09nvif_object_dtor(&vmm->object);
> =09}
>=20
> vmm->page is never cleared after being freed, so the second call of
> nvif_vmm_dtor() will cause a double-free.
>=20
> Found by fuzzing the nouveau driver with a modified Syzkaller:
>=20
> =09BUG: KASAN: double-free in nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> =09Free of addr ffff888010fcdc30 by task syz.0.173/2567
>=20
> =09CPU: 1 UID: 0 PID: 2567 Comm: syz.0.173 Not tainted 7.2.0
> #24 PREEMPT(lazy)=20
> =09Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2 04/01/2014
> =09Call Trace:
> =09<TASK>
> =09__dump_stack lib/dump_stack.c:94 [inline]
> =09dump_stack_lvl+0x95/0xe0 lib/dump_stack.c:120
> =09print_address_description mm/kasan/report.c:378 [inline]
> =09print_report+0xcb/0x5a0 mm/kasan/report.c:482
> =09kasan_report_invalid_free+0xaa/0xd0 mm/kasan/report.c:557
> =09check_slab_allocation+0xe4/0x110 mm/kasan/common.c:235
> =09kasan_slab_pre_free include/linux/kasan.h:199 [inline]
> =09slab_free_hook mm/slub.c:2622 [inline]
> =09slab_free mm/slub.c:6377 [inline]
> =09kfree+0x192/0x590 mm/slub.c:6692
> =09nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> =09nouveau_vmm_fini+0x16/0x50
> drivers/gpu/drm/nouveau/nouveau_vmm.c:127
> =09nouveau_cli_fini+0x10e/0x210
> drivers/gpu/drm/nouveau/nouveau_drm.c:225
> =09nouveau_drm_open+0x24e/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1255
> =09drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> =09drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> =09drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> =09drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> =09chrdev_open+0x21c/0x660 fs/char_dev.c:411
> =09do_dentry_open+0x59d/0x12b0 fs/open.c:947
> =09vfs_open+0x82/0x390 fs/open.c:1052
> =09do_open fs/namei.c:4700 [inline]
> =09path_openat+0x2345/0x3420 fs/namei.c:4863
> =09do_file_open+0x207/0x460 fs/namei.c:4892
> =09do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> =09do_sys_open fs/open.c:1374 [inline]
> =09__do_sys_openat fs/open.c:1390 [inline]
> =09__se_sys_openat fs/open.c:1385 [inline]
> =09__x64_sys_openat+0x144/0x200 fs/open.c:1385
> =09do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =09do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> =09entry_SYSCALL_64_after_hwframe+0x77/0x7f
> =09RIP: 0033:0x7fc6d687594d
> =09Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
> 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01
> 48
> =09RSP: 002b:00007fc6d5295008 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000101
> =09RAX: ffffffffffffffda RBX: 00007fc6d6b06180 RCX:
> 00007fc6d687594d
> =09RDX: 0000000000022501 RSI: 0000200000000000 RDI:
> ffffffffffffff9c
> =09RBP: 00007fc6d691c303 R08: 0000000000000000 R09:
> 0000000000000000
> =09R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000000000
> =09R13: 00007fc6d6b06218 R14: 00007fc6d6b06180 R15:
> 00007ffd9451d760
> =09</TASK>
>=20
> =09Allocated by task 2567 on cpu 1 at 163.593900s:
> =09kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
> =09kasan_save_track+0x17/0x60 mm/kasan/common.c:78
> =09poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
> =09__kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
> =09kasan_kmalloc include/linux/kasan.h:263 [inline]
> =09__do_kmalloc_node mm/slub.c:5334 [inline]
> =09__kmalloc_noprof+0x304/0x7c0 mm/slub.c:5359
> =09_kmalloc_noprof include/linux/slab.h:992 [inline]
> =09nvif_vmm_ctor+0x3c0/0x7e0
> drivers/gpu/drm/nouveau/nvif/vmm.c:237
> =09nouveau_vmm_init+0x40/0x90
> drivers/gpu/drm/nouveau/nouveau_vmm.c:134
> =09nouveau_cli_init+0x7b9/0xe10
> drivers/gpu/drm/nouveau/nouveau_drm.c:293
> =09nouveau_drm_open+0x236/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1243
> =09drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> =09drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> =09drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> =09drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> =09chrdev_open+0x21c/0x660 fs/char_dev.c:411
> =09do_dentry_open+0x59d/0x12b0 fs/open.c:947
> =09vfs_open+0x82/0x390 fs/open.c:1052
> =09do_open fs/namei.c:4700 [inline]
> =09path_openat+0x2345/0x3420 fs/namei.c:4863
> =09do_file_open+0x207/0x460 fs/namei.c:4892
> =09do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> =09do_sys_open fs/open.c:1374 [inline]
> =09__do_sys_openat fs/open.c:1390 [inline]
> =09__se_sys_openat fs/open.c:1385 [inline]
> =09__x64_sys_openat+0x144/0x200 fs/open.c:1385
> =09do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =09do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> =09entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> =09Freed by task 2567 on cpu 1 at 163.601355s:
> =09kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
> =09kasan_save_track+0x17/0x60 mm/kasan/common.c:78
> =09kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:584
> =09poison_slab_object mm/kasan/common.c:253 [inline]
> =09__kasan_slab_free+0x61/0x80 mm/kasan/common.c:285
> =09kasan_slab_free include/linux/kasan.h:235 [inline]
> =09slab_free_hook mm/slub.c:2677 [inline]
> =09slab_free mm/slub.c:6377 [inline]
> =09kfree+0x383/0x590 mm/slub.c:6692
> =09nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> =09nouveau_vmm_fini+0x16/0x50
> drivers/gpu/drm/nouveau/nouveau_vmm.c:127
> =09nouveau_cli_fini+0x10e/0x210
> drivers/gpu/drm/nouveau/nouveau_drm.c:225
> =09nouveau_cli_init+0x593/0xe10
> drivers/gpu/drm/nouveau/nouveau_drm.c:324
> =09nouveau_drm_open+0x236/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1243
> =09drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> =09drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> =09drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> =09drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> =09chrdev_open+0x21c/0x660 fs/char_dev.c:411
> =09do_dentry_open+0x59d/0x12b0 fs/open.c:947
> =09vfs_open+0x82/0x390 fs/open.c:1052
> =09do_open fs/namei.c:4700 [inline]
> =09path_openat+0x2345/0x3420 fs/namei.c:4863
> =09do_file_open+0x207/0x460 fs/namei.c:4892
> =09do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> =09do_sys_open fs/open.c:1374 [inline]
> =09__do_sys_openat fs/open.c:1390 [inline]
> =09__se_sys_openat fs/open.c:1385 [inline]
> =09__x64_sys_openat+0x144/0x200 fs/open.c:1385
> =09do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> =09do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> =09entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> =09The buggy address belongs to the object at ffff888010fcdc30
> =09which belongs to the cache kmalloc-16 of size 16
> =09The buggy address is located 0 bytes inside of
> =0916-byte region [ffff888010fcdc30, ffff888010fcdc40)
>=20
> =09The buggy address belongs to the physical page:
> =09page: refcount:0 mapcount:0 mapping:0000000000000000
> index:0x0 pfn:0x10fcd
> =09flags: 0x100000000000000(node=3D0|zone=3D1)
> =09page_type: f5(slab)
> =09raw: 0100000000000000 ffff88800d441640 dead000000000100
> dead000000000122
> =09raw: 0000000000000000 0000000000550055 00000000f5000000
> 0000000000000000
> =09page dumped because: kasan: bad access detected
>=20
> =09Memory state around the buggy address:
> =09ffff888010fcdb00: fc fc 00 04 fc fc fc fc fa fb fc fc fc fc
> fa fb
> =09ffff888010fcdb80: fc fc fc fc fa fb fc fc fc fc 00 07 fc fc
> fc fc
> =09>ffff888010fcdc00: fa fb fc fc fc fc fa fb fc fc fc fc fa fb
> fc fc
> =09=09=09=09=09=09=09=09
> =09=09^
> =09ffff888010fcdc80: fc fc fa fb fc fc fc fc 00 04 fc fc fc fc
> fa fb
> =09ffff888010fcdd00: fc fc fc fc 00 00 fc fc fc fc fa fb fc fc
> fc fc
>=20
> Fix by removing the redundant teardown in nouveau_drm_open(),
> since nouveau_cli_init() already does the cleanup work.
> Also clear vmm->page after its freeing.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 20d8a88e557a ("drm/nouveau: tidy up the client init/fini
> interfaces")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: LLM
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +---
> =C2=A0drivers/gpu/drm/nouveau/nvif/vmm.c=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e16f59b00f6f..c465d59ef0a6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1251,10 +1251,8 @@ nouveau_drm_open(struct drm_device *dev,
> struct drm_file *fpriv)
> =C2=A0=09mutex_unlock(&drm->clients_lock);
> =C2=A0
> =C2=A0done:
> -=09if (ret && cli) {
> -=09=09nouveau_cli_fini(cli);
> +=09if (ret && cli)
> =C2=A0=09=09kfree(cli);
> -=09}
> =C2=A0
> =C2=A0=09pm_runtime_mark_last_busy(dev->dev);
> =C2=A0=09pm_runtime_put_autosuspend(dev->dev);
> diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c
> b/drivers/gpu/drm/nouveau/nvif/vmm.c
> index 65c3e883b119..579af70766f2 100644
> --- a/drivers/gpu/drm/nouveau/nvif/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
> @@ -192,6 +192,7 @@ void
> =C2=A0nvif_vmm_dtor(struct nvif_vmm *vmm)
> =C2=A0{
> =C2=A0=09kfree(vmm->page);
> +=09vmm->page =3D NULL;
> =C2=A0=09nvif_object_dtor(&vmm->object);
> =C2=A0}
> =C2=A0

