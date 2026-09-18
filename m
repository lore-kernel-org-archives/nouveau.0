Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE0C982D8
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 18:14:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D16A310F4B4;
	Fri, 18 Sep 2026 18:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R8+345AF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BA33D482FB;
	Fri, 18 Sep 2026 17:56:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789754181;
 b=whKEsirpWUsHkYz9wxjme/SWWChnR/4bdMVmf3rS+RTYAA8uWx4Fk0R5sc0Wo/Xceg0tI
 whryEvbclE3rK+fPuwJ4U6NeK9yDelnbR2p+yxd8atgvIuLouRapmZ1avnFfNTM3ZcUJ5qW
 UDdNUt3QIpV+Fxh4l5g3uQhBid/0T2ytohI4b9RHe//zk0DHYv9EIQceG5x4KinyIAMpSdo
 rVHJvSde/S7hH0i5gBkdL03BGYCxSyJleVLIvNGNRGjqUuD9DMPZcQZOGjNAXsEi6TjTlnV
 QKfRHZggAHghf+Vkn9jF81lAhwfYu2gIlebjMB9BomWSh3N5zdLV9Kw5h+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789754181; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4ZCWUomW5I9+ms3uPjNitTm1N4lAbHHCP3LaSArR6L8=;
 b=TbnsKYigbFdEH8fSzyYeAjrv36Fl03wVtvEjSWEA9pKznTqv3IgyX+syobwUl0MStnwBV
 Vs1uUzsIDP8vECsane9rMl1KKqwK0wtie7+CBpshY/VtmwnZWiLTYjDXyd3+Gc3BR8n+2or
 28WIcrYUM8Joz6FwYKHBlxdScODekOuI/17rde9sxaJ5W+PQGelIjyp2Mf9Mk1VPIW/L/RP
 4A4VnLhetSDNHu49WRuA+jk17gEs039zWPzzjbQb3SfcQbZcf6wWPLFeL1ViptFgeVdxUYK
 IXt5bMvlyB0SVzft+gOXc3BOVXALYhVgNQEqV48PxjwypS9SLBKIKbDua5IQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 52E18482C7
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 17:56:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1DB10F4AF
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789755237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZCWUomW5I9+ms3uPjNitTm1N4lAbHHCP3LaSArR6L8=;
	b=R8+345AFtWCN1iSHZ79182olo1EgnEuCs9qULaoTLN2V1M7xBDsyEcg+DI6nNoT/+gHAE6
	oiQI6HfguhvQ2quVWCVJIP3mMjIiWs15fZVZD97u92/cz7+6GFzeH/OrZ4UbJX0ldK+urH
	5IGM71HDjDvNkqk9NbfJ8W5rV+Xi9R0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-PzNySM2zN-mQOcO1G9N5KA-1; Fri, 18 Sep 2026 14:13:55 -0400
X-MC-Unique: PzNySM2zN-mQOcO1G9N5KA-1
X-Mimecast-MFC-AGG-ID: PzNySM2zN-mQOcO1G9N5KA_1789755232
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-530e39c5625so21101131cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 11:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755232; x=1790360032;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1jtneS41EfApWU8IJSvGq3jJfWC73gwxxyLVnNUCV4=;
        b=xqYNBcsMJlcuWBuFCxKyjIucDRO5MeZ7LpGrE0iDqlu/MIEVTeiVl1qrZ6TfIdOiPk
         mQydZiT1wUE4wmtdmFyMZJRdYuzSHCMawRbSDtbR8yVJA0f+5i7Ct1sCSplG0HDXvHwd
         hKPMo2l8QHumgzlY0hwXuz/1RZDkPOMkbnET52OvhOtuGv3eVG6JDP1t2Z8lD12salXw
         7MszQ04n/DGe8fr1T5U8e2Kjr9ZFF1Y4WlaXCZafK/I0uioaA7QdWxhrdlFIO2ouEi1D
         /J560uUPJtGfg/2C1d4kJn9yCq1TlGA5dIRaAgKuvOyNkQ3xv2Yt+TZRFyyuSxzyrLQU
         H2qw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzd4fenOmRGb8+M932mvfCQEU+gAgnUNJ7kcQAgmZ0frFAeJX737mHI2WGkv3+4fKiG4LNRpCCQ@lists.freedesktop.org
X-Gm-Message-State: AFuF++mB8QKZAoHfcJZqWD76lcA6f4MBRzQXzQur72MKkGrxDV0ELv2w
	8F1Aw5CwnK4cKnFMR4jBJbSy2pN0OY8zTTIOU5dq8ypevcZEaMDGzESlcZf2kUeIwfjYSUN9WVk
	FEFz8gkLv71K441obdC0X23uxhs2bVIhCLunV7sqBGli+PvSLx+jePK3FXNxMDuIUnA8=
X-Gm-Gg: AYBFou2G8gMQUgS/7es8qVKIQvX7Qw0tu3mpE0uQ+dVxvOhiflWZ8oscHlAr+MEn6tY
	qtJvHYRi0eToanKz+J5k1FKEqjXA8QEC/BgKh7sAfwlcWD6aKWYBQmnhNOqbMIw9hE1TVT0f6IR
	nKqDsbSfVL3XY70wCxzw3tRdES5g+4n+1r01aWTNj5Z1zJ1LbyFhf6Z0Qpj/sHlVecxG4Bwrpgu
	Pxpw0a+oa82NRvecul+mKT8kIjW6+Qglrb8IJ29G7Jpo3llNzja5UnS6wEeHrjtoq2vV2TLY1y+
	lqnfUMW/sxoOYNxOG9zqz9wzCfXkzYhOP0fDS3pXNkKTXen88IG1YQJBaAsHdTeW5zWhNj0X
X-Received: by 2002:a05:622a:5c16:b0:532:9add:50b4 with SMTP id
 d75a77b69052e-5329e3f97b8mr62334631cf.68.1789755231760;
        Fri, 18 Sep 2026 11:13:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5c16:b0:532:9add:50b4 with SMTP id
 d75a77b69052e-5329e3f97b8mr62333991cf.68.1789755231255;
        Fri, 18 Sep 2026 11:13:51 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91260968826sm1929916d6.4.2026.09.18.11.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:13:50 -0700 (PDT)
Message-ID: <794fc2ed6ee73b65a5d714c16fd9c24bf92c4340.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: don't bump pin count on failed re-pin
 in nouveau_bo_pin_locked()
From: lyude@redhat.com
To: Peiyang He <peiyang_he@smail.nju.edu.cn>, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Fri, 18 Sep 2026 14:13:49 -0400
In-Reply-To: 
 <EACEF2F4E098413F+20260918025312.2814889-1-peiyang_he@smail.nju.edu.cn>
References: 
 <EACEF2F4E098413F+20260918025312.2814889-1-peiyang_he@smail.nju.edu.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_Qz-XM2RsIUoNvfVdqisPtt5OE2S1FxBZ1LqWgijB8_1789755232
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IVRLE6RAH5RVLFDDM6E6KDMVGHRSTVQ4
X-Message-ID-Hash: IVRLE6RAH5RVLFDDM6E6KDMVGHRSTVQ4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IVRLE6RAH5RVLFDDM6E6KDMVGHRSTVQ4/>
Archived-At: 
 <https://lore.freedesktop.org/794fc2ed6ee73b65a5d714c16fd9c24bf92c4340.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Fri, 2026-09-18 at 10:53 +0800, Peiyang He wrote:
> nouveau_bo_pin_locked() checks whether an already pinned BO is in a
> memory domain compatible with a new pin request. When the domains are
> incompatible, it sets -EBUSY but still calls ttm_bo_pin() before
> returning.
>=20
> Callers treat a failed nouveau_bo_pin() as not having acquired a new
> pin,
> so the extra pin count is never decreased by a matching unpin.
> This triggers the warning in ttm_bo_release():
>=20
> =09WARN_ON_ONCE(bo->pin_count);
>=20
> Found when fuzzing the nouveau driver with a modified Syzkaller:
>=20
> =09WARNING: drivers/gpu/drm/ttm/ttm_bo.c:256 at
> ttm_bo_release+0x827/0x9e0 drivers/gpu/drm/ttm/ttm_bo.c:256, CPU#1:
> syz.3.24/2212
> =09Modules linked in:
> =09CPU: 1 UID: 0 PID: 2212 Comm: syz.3.24 Not tainted 7.2.0 #24
> PREEMPT(lazy)
> =09nouveau 0000:01:00.0: gsp:msg fn:103 len:0x40/0x20 res:0x19
> resp:0x19
> =09Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2 04/01/2014
> =09RIP: 0010:ttm_bo_release+0x827/0x9e0
> drivers/gpu/drm/ttm/ttm_bo.c:256
> =09Code: 02 00 0f 85 51 01 00 00 48 8b 7b 08 e8 d2 20 01 00 e9
> 80 fd ff ff e8 d8 15 c0 fe 90 0f 0b 90 e9 e1 f8 ff ff e8 ca 15 c0 fe
> 90 <0f> 0b 90 e9 a4 f8 ff ff e8 bc 15 c0 fe be 03 00 00 00 4c 89 e7
> e8
> =09msg: 00000000: 05 00 d0 c1 04 00 f0 f1 01 30 00 00 2d 90 00
> 00=C2=A0 .........0..-...
> =09RSP: 0018:ffffc9000f5cf710 EFLAGS: 00010293
> =09RAX: 0000000000000000 RBX: ffff888018e5d2a8 RCX:
> ffffffff82bb1b36
> =09RDX: ffff888017b68000 RSI: 0000000000000004 RDI:
> ffff888018e5d2a8
> =09msg: 00000010: 19 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00=C2=A0 ................
> =09RBP: ffff88801261c720 R08: 0000000000000001 R09:
> ffffed10031cba55
> =09R10: ffff888018e5d2ab R11: 00000000000000f3 R12:
> ffff888018e5d290
> =09R13: ffff888018e5d2d4 R14: ffff88801b219c18 R15:
> dffffc0000000000
> =09FS:=C2=A0 0000000000000000(0000) GS:ffff8880e0f6f000(0000)
> knlGS:0000000000000000
> =09CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> =09CR2: 0000001b31223ffc CR3: 0000000028e00005 CR4:
> 0000000000770ef0
> =09PKRU: 80000000
> =09Call Trace:
> =09<TASK>
> =09kref_put include/linux/kref.h:65 [inline]
> =09ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:325 [inline]
> =09ttm_bo_fini+0x55/0x80 drivers/gpu/drm/ttm/ttm_bo.c:330
> =09nouveau_gem_object_del+0xb2/0x1b0
> drivers/gpu/drm/nouveau/nouveau_gem.c:90
> =09drm_gem_object_free+0x5f/0x90 drivers/gpu/drm/drm_gem.c:1165
> =09kref_put include/linux/kref.h:65 [inline]
> =09__drm_gem_object_put include/drm/drm_gem.h:562 [inline]
> =09drm_gem_object_put include/drm/drm_gem.h:575 [inline]
> =09nouveau_abi16_chan_fini.constprop.0+0x44f/0x5a0
> drivers/gpu/drm/nouveau/nouveau_abi16.c:195
> =09nouveau 0000:01:00.0: syz.2.23[2209]: Unknown handle
> 0x00000000
> =09nouveau_abi16_fini+0x1d0/0x340
> drivers/gpu/drm/nouveau/nouveau_abi16.c:225
> =09nouveau_drm_postclose+0x18b/0x3e0
> drivers/gpu/drm/nouveau/nouveau_drm.c:1284
> =09nouveau 0000:01:00.0: syz.2.23[2209]: validate_init
> =09drm_file_free.part.0+0x6d6/0xb60
> drivers/gpu/drm/drm_file.c:267
> =09drm_file_free drivers/gpu/drm/drm_file.c:237 [inline]
> =09drm_close_helper.isra.0+0x11a/0x160
> drivers/gpu/drm/drm_file.c:290
> =09drm_release+0x1ab/0x330 drivers/gpu/drm/drm_file.c:438
> =09__fput+0x39c/0xa60 fs/file_table.c:512
> =09nouveau 0000:01:00.0: syz.2.23[2209]: validate: -2
> =09task_work_run+0x15a/0x230 kernel/task_work.c:233
> =09exit_task_work include/linux/task_work.h:40 [inline]
> =09do_exit+0x82b/0x25a0 kernel/exit.c:1009
> =09do_group_exit+0xc2/0x280 kernel/exit.c:1152
> =09get_signal+0x1d6e/0x1f30 kernel/signal.c:3046
> =09arch_do_signal_or_restart+0x7d/0x6e0
> arch/x86/kernel/signal.c:337
> =09__exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
> =09exit_to_user_mode_loop+0xdf/0x440 kernel/entry/common.c:101
> =09__exit_to_user_mode_prepare include/linux/irq-entry-
> common.h:207 [inline]
> =09syscall_exit_to_user_mode_prepare include/linux/irq-entry-
> common.h:230 [inline]
> =09syscall_exit_to_user_mode include/linux/entry-common.h:318
> [inline]
> =09do_syscall_64+0x4f8/0x690 arch/x86/entry/syscall_64.c:100
> =09entry_SYSCALL_64_after_hwframe+0x77/0x7f
> =09RIP: 0033:0x7f12bac8594d
> =09Code: Unable to access opcode bytes at 0x7f12bac85923.
> =09RSP: 002b:00007f12b96e70d8 EFLAGS: 00000246 ORIG_RAX:
> 00000000000000ca
> =09RAX: 0000000000000001 RBX: 00007f12baf15fa8 RCX:
> 00007f12bac8594d
> =09RDX: 00000000000f4240 RSI: 0000000000000081 RDI:
> 00007f12baf15fac
> =09RBP: 00007f12baf15fa0 R08: 00007f12baee8000 R09:
> 0000000000000000
> =09R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000000000
> =09R13: 00007f12baf16038 R14: 0000000000000006 R15:
> 00007ffe2ed394b0
> =09</TASK>
> =09irq event stamp: 47867
> =09hardirqs last=C2=A0 enabled at (47883): [<ffffffff815cafc6>]
> __up_console_sem+0x66/0x70 kernel/printk/printk.c:347
> =09hardirqs last disabled at (47892): [<ffffffff815cafab>]
> __up_console_sem+0x4b/0x70 kernel/printk/printk.c:345
> =09softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> __do_softirq kernel/softirq.c:656 [inline]
> =09softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> invoke_softirq kernel/softirq.c:496 [inline]
> =09softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> __irq_exit_rcu+0x137/0x1c0 kernel/softirq.c:735
> =09softirqs last disabled at (47875): [<ffffffff81434277>]
> __do_softirq kernel/softirq.c:656 [inline]
> =09softirqs last disabled at (47875): [<ffffffff81434277>]
> invoke_softirq kernel/softirq.c:496 [inline]
> =09softirqs last disabled at (47875): [<ffffffff81434277>]
> __irq_exit_rcu+0x137/0x1c0 kernel/softirq.c:735
>=20
> Fix by calling ttm_bo_pin() only when the existing placement is
> compatible
> with the new pin request. This matches the correct behavior in other
> DRM
> drivers such as amdgpu_bo_pin() in amdgpu.
>=20
> Cc: stable@vger.kernel.org
> Fixes: ad76b3f7c7a0 ("drm/nouveau: teach nouveau_bo_pin() how to
> force a contig vram allocation")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: LLM
> ---
> Changes in v2:
> =C2=A0 - replace goto with else branch (suggested by Lyude Paul)
> =C2=A0 - fix Assisted-by tag
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 0e8de6d4b36f..6dcb92575eb4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -578,8 +578,9 @@ int nouveau_bo_pin_locked(struct nouveau_bo
> *nvbo, uint32_t domain, bool contig)
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x%08x vs 0x%08x\n", bo=
,
> =C2=A0=09=09=09=09 bo->resource->mem_type, domain);
> =C2=A0=09=09=09ret =3D -EBUSY;
> +=09=09} else {
> +=09=09=09ttm_bo_pin(&nvbo->bo);
> =C2=A0=09=09}
> -=09=09ttm_bo_pin(&nvbo->bo);
> =C2=A0=09=09goto out;
> =C2=A0=09}
> =C2=A0
>=20
> base-commit: df2908090cda368b01ff43709f51890076c56157

