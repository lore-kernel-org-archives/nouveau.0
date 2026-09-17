Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68019C982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:20:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F04910F08F;
	Thu, 17 Sep 2026 21:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eVSQvUEr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7105348268;
	Thu, 17 Sep 2026 21:03:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789679000;
 b=D7BeeWsY5I9F05mk7d8A1h/1vH3+Y1kW0IW80gQ3g9L2/Gh8ImgRna+1Q8JsqyIoiQIp6
 9H5bmQXu2T/Tb8fmyDfBR3JqDupv46519FVn2WPpZ031oK719b1kLPXeZ7tkj7QimdLJxlb
 J+yLqMj22ilUDuqILnL4M8o1WMBXq8xyh1D/MG5TEZisjZ3Yz04q4ABkWQM8LyM1k5l95+N
 iv1AutPCr7UflEPs5ygqwe1A0EzVv64ic66M2NcnvMBTt2u/5vvPx9bsJDynnpJYRnyWZ2c
 CNy01kdvPlzZdys78JejKEmHIWUszdbLGiPWNO9NnREHGpc5OB7sj+ahNFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789679000; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gs0ZA/ay3udSCcdGUTHlIySdt1oxO2eK9Nory3aiYPY=;
 b=HtBnb1JxaY4YxafEUt/ui0GjDfLrm/e/Zz3zwEEzqizcayChognIPXcCQM8z3fKww5VHU
 zG0v+xAxV02CcXbejF/uk4LPzKQzS2K/l5gtRAtFYut0iPB6zwD50opwi8145Ut84LAe31u
 QMdf6S7qVO9MVdAgF5z/ExAG2Ful3OnctAS471ysHagXt2qHUNE1DAAvCw2uTe9XdK3dFYp
 qWJjYVDktstqmlD77HojAbbhOdzl8c9QqAuzuiVYH1S2okcZ7wL/YalWU4jP9Ba2sUAhaAe
 6bZQIvO4UPna8UzoZK0LhtuqRgJbn4/1ASgeWs+aPyfzhDZwDaOR/ikeap9A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B7F148233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:03:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0144D10ECCD
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789680055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gs0ZA/ay3udSCcdGUTHlIySdt1oxO2eK9Nory3aiYPY=;
	b=eVSQvUErgXVVuYISqwKdv2qgIpWX0Ve5bkA8akidwA7u3K0SSyoYU/6GMuFUv6Av16mQPS
	VmoSrMvpnFtWTejucBcvyvdHV5TBcGskS3e/O1XPZiRjfPJKBnmCQDmpdV/6n9lWtJzHSc
	rGTlisMOZQ/7MiGnIbVmp50BbzLz7kk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-0iu961IeNZ-j0pW-Y59NAg-1; Thu, 17 Sep 2026 17:20:51 -0400
X-MC-Unique: 0iu961IeNZ-j0pW-Y59NAg-1
X-Mimecast-MFC-AGG-ID: 0iu961IeNZ-j0pW-Y59NAg_1789680050
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9123be39eeaso2659926d6.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680050; x=1790284850;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VsOqYOO7JiWmEXlBhZj+zFUtxnW7W9uLbNfBZMlGXA=;
        b=hDEYgx/eRI2dXTedljVklcFRgu+KTKNh/mJAweZZYa+RyeUN94wEdL54RNqLPti15l
         y7JU3Vidalbt8+ZZ6uC9/GQQJOhLEwsrmks7Tj3jU5nRud8uq74B1T78q33Rzgy2iH6h
         uAVtsRkW73NDGleJjrdb+BARuQAgiIx2BkewubWmV5jQuUR1syZncldGMoEJGe0INLSz
         2frFbZ8s2Dt5/LWFSsZdO78M8cceBFjAsqBaruCFMwND2tSbJZyn5vxr7Bkd41mo/kxH
         QlOlo4WU9LmELC47d7WHsuyZqG2/Rg+lyS8nS8COivorj2bQ8JAhTPwIQu3bBlX5khR5
         Dh3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwTu1wyP9kbi0NLIR5OfMipWNHH9e2JLlV311GmshW1TU362RXA2Xentd5fS/IZU3PP1qYJrpOi@lists.freedesktop.org
X-Gm-Message-State: AFuF++nhHqbDZbvQnFSRSaBeGWBYXe/hG6KO31vSGxsMhR8LlcDW15gn
	FZI6iIM38e1Q0ahRMx1stR2WbCl/hQdbY5I7MZVNj+9JkBsEckgTI2CZLpSpIWHND/2HKax9pBM
	R+Lbvm9U7iwY877hbvJRKDZ4w09ayCQntOpsLdUS4AIIrGpX/1DbGXTzUy6O7CfXCiM2p95JaFd
	A=
X-Gm-Gg: AYBFou35lfMy82FptGCV+wRwINrtvLhTKl7j0UcyHwWvDxF1jn53h/dWuLl6hH9uzcw
	Mp56TjmBlXtAL7tYd+NKhNuGut27/OWsrUzSmWavCZHLp7gCeJFjHSu+RigQmIxLtlEwNfXZbzv
	eseWvpipkCStZIiSdDISCziOQc+RA/83NGqV9HHAc5AgCxD8U/JyA/N+aZ7/FZHFFrDUZoM9jFK
	uSbA7c6mgCaOlE3V6312NhuJSsXk0hC2sbOqF9WdgRoV+sHCEvSuo+yQZXJmyyTW8HNga6Fl6LA
	HjScN2+09DwjvbfKdS4lkgwhbWgIkoA0mTBeeJ+c2fi0eIMt/VxRN6tkvamUlTWg14KRpcJD
X-Received: by 2002:a05:620a:4503:b0:93b:d79f:d94a with SMTP id
 af79cd13be357-93bdca2b54cmr40080885a.63.1789680050288;
        Thu, 17 Sep 2026 14:20:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:93b:d79f:d94a with SMTP id
 af79cd13be357-93bdca2b54cmr40075985a.63.1789680049769;
        Thu, 17 Sep 2026 14:20:49 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b78223240sm561790285a.23.2026.09.17.14.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:20:49 -0700 (PDT)
Message-ID: <fb1701bbd7fb65ae808f495488880e2f0fbbced3.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: don't bump pin count on failed re-pin in
 nouveau_bo_pin_locked()
From: lyude@redhat.com
To: Peiyang He <peiyang_he@smail.nju.edu.cn>, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Thu, 17 Sep 2026 17:20:48 -0400
In-Reply-To: 
 <4C61D1CE5BB7CD58+20260910080659.2798052-1-peiyang_he@smail.nju.edu.cn>
References: 
 <4C61D1CE5BB7CD58+20260910080659.2798052-1-peiyang_he@smail.nju.edu.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EG8M2PL5jovc8X87o0_VVUGyKRCJsCo7Q1JBCSb07iU_1789680050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KXT6Y4STKZZ3XAY7GSMU34WQMBD5CYG4
X-Message-ID-Hash: KXT6Y4STKZZ3XAY7GSMU34WQMBD5CYG4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KXT6Y4STKZZ3XAY7GSMU34WQMBD5CYG4/>
Archived-At: 
 <https://lore.freedesktop.org/fb1701bbd7fb65ae808f495488880e2f0fbbced3.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-09-10 at 16:06 +0800, Peiyang He wrote:
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
> PREEMPT(lazy)=20
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
> Fix by going to the out path as soon as the incompatible placement
> is detected. This matches the correct bahaviour in other DRM drivers
> such as amdgpu_bo_pin() in amdgpu.
>=20
> Cc: stable@vger.kernel.org
> Fixes: ad76b3f7c7a0 ("drm/nouveau: teach nouveau_bo_pin() how to
> force a contig vram allocation")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: Codex:gpt-5.5

This can and probably should just be:

Assisted-by: LLM

Instead of mentioning the LLM specifically used.

> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 0e8de6d4b36f..bdd0390b590e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -578,6 +578,7 @@ int nouveau_bo_pin_locked(struct nouveau_bo
> *nvbo, uint32_t domain, bool contig)
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x%08x vs 0x%08x\n", bo=
,
> =C2=A0=09=09=09=09 bo->resource->mem_type, domain);
> =C2=A0=09=09=09ret =3D -EBUSY;
> +=09=09=09goto out;

Would probably be better to just turn this into an else:

=09if (error) {
=09=09NV_ERROR(drm, "bo %p pinned elsewhere: "
=09=09=09      "0x%08x vs 0x%08x\n", bo,
=09=09=09 bo->resource->mem_type, domain);
=09=09ret =3D -EBUSY;
=09} else {
=09=09ttm_bo_pin(&nvbo->bo);
=09}


> =C2=A0=09=09}
> =C2=A0=09=09ttm_bo_pin(&nvbo->bo);
> =C2=A0=09=09goto out;
>=20
> base-commit: df2908090cda368b01ff43709f51890076c56157

