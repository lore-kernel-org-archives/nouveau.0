Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289ED262A5
	for <nouveau@archiver.kernel.org>; Tue, 20 Jan 2026 21:36:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 766B810E259;
	Tue, 20 Jan 2026 21:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFPcCKFE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4D5E744CC4;
	Tue, 20 Jan 2026 21:27:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768944455;
 b=QWAl4LVKYm//nbYq+D9cpbB33+V3VUSkYXAyXnT+2ypEWy2g5ccuMvnjCMDxjbncqPtp1
 uvDaQ8+VEQNxaUEQkw1n7NsOCvZz3j7aAh2RnoNFuDFOOy2QAsRw5zxxbIsrSZfuEa+1h89
 dVVw13GXvyZFdk/b7VvSEJznFdORHK7Fi98q0o7rf7SOiOqaBEjvvUh9JYTz0AFcobE8MGY
 8Gu8880f5h6neiep1wDsO07Y55bjPmXMc8EqWrV7zPC+438bruV2+sreXTKQWStvwd9zGYq
 J/OIvCs3WnwIMjZ1mhHGjux545/74cDXgOHaKQRdhMmkdWUge9tYeKR07J3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768944455; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
 b=ngOt8dJi9G4OF7GEXa6I0mC/Qe9C6gpRHrlvM179kIUzq8K+OfUJiqs9injZZHXeTX/0K
 TxWCDeg+OwqFYl1UXIb4iMka5kwbdO/0oudaUU1jim5OdsL/TmlMIx426pix/TDhZYka1/+
 y5MISgdq+Qeaa05zVSUshrBIznbobDGDs4RcGThPsAmVP11arXiNfrsjk9NaIZT8lkOr/Z5
 KOCbPN3b0Lk5WZWxukQSSJ9S/EtDWlIIXt6mZCI5yvL7tqnbegb7X6kvZ8Tdd79F14r80bd
 hwMnDCLVcatqxNmUsJKR6XwgI83qG2oyZv7x+7eJd4E7QAdFYbMYwShr4E8w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F259E44C49
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 21:27:32 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD5E610E09D
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 21:36:17 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89464760408so6357766d6.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 20 Jan 2026 13:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768944977; cv=none;
        d=google.com; s=arc-20240605;
        b=SYNIGvH1sMFTn9mlzKaVGfCuPwTOcZz8XAhuSNhdqe3MTA2pJVaM/sEvohUYAO1fF2
         4OkGNiRrDEb8ufoBwX/LKWziwru3jpzmgCx/FtsMzW1z0LVyGN1SIarSVn15moJVlcbd
         7xZai0cY0vV9nPGwjLWeh31sINzTisNYjdPra/uoNpMmTbFIaSli4iS9N1V+D899IHyM
         uGmBE0hljyhgWP5000b9agErv90Q4OuzpoLOxyPF0TG+HBa1+lcjclwHmexffed9B7eE
         2mt6Ll7P6FhQoHGq88w3dhfgScUb97Qn5ia1EjDNJv6HwjUV7zUk3uR5eatKVTE74YH3
         MpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
        fh=jh/cr0zcNdVyb7FIvS4cqSvParLusHGtnzVKpZRBJg8=;
        b=dmWVJPX1JoKErSDM9qcLooUT/C6VOIF0i8u8CqRgi+rDkd+L97FQQoIfvAGgt+VB61
         e6Y0QPjOdWcDKCTOS10lzhyK3ngMIA0TqustLOkc09VkJyvCzR7N3C7Eb6bjYoZvYneB
         LMlIbCKj0gG5NK1fpTcebTyyVwCJ2iNF09Kk1sENbXg/+b9Oj0uELtcwJ/s1HWemP3/Z
         5OaXpu1Ju3Lf6sDmu1D98UjrjwrYUeSHMuJVHfKvoqCWHCGFMF/ZlD8deeS0FtGkolds
         c6rLuyowQQVxrqUYB6D7vMBS6tFQUk8z2R2QPZW3dkXWThQL159xGq2uIP3gGntsLJuz
         WG/Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768944977; x=1769549777;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
        b=kFPcCKFEObsRI90w671a70UaZhCMjdUnQnM14cm6333O7kVPbtTQF8Tp/ttkB49kxz
         Qy9lvXIoOg1OzwPYy7gCSweEC3STRJ22Ny29PxDGpW9E246bFKRQb5aRe5O2vNpN+FKx
         noPqipepALChtO8TCc0zfeXm0d9hDlrfjDDgVDQhojwmD9NyXMqIiGz1ba6p4lUCIXlU
         TUQ/3tmta5nTdYduJpLlZnTY6lpcUfoplUG0vACKNAY5K4ph7CpoJ5JjfBUhYqZYsmFC
         unGiq4cU/8Tzj9crPBC9BWjECe3KF/qyZZHzcAHxyfUjvPd+JAuIalDAtX11p0x3lgs7
         2Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768944977; x=1769549777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
        b=hOgKyxrihjUSWb8d1dFtKgV9Iw5HR+XAg6sdu7hNQIMvNFHXpPfL1d7BwsUS75EnLY
         oNqTYiVMqN7lnli7MvCg2EGxQSzwJNu0aaGHEebbCCN59nPbCY62Y2XN2C/QHmpraMWq
         bZLjJZqgtDcYXa8sFhllSm+rS41LV2Kzd0zjywTtgJJcZZTPw0WJyXw4xve583xLewbk
         qMDFGEZGFEHh8wTCnybiGqI/whCQLdRf6eaICpIhLdW0DgdmDJqGvf2Qrhug9IvV7KBq
         5j2uuX0H/ebUAuUSbrl10AcegF1CNJn7uow2cJE+3i+iHgBIpYQVbgdlsjo4OUin2GWf
         BluA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4WhABFiqqUIUOHxNVtpKkRQ3ThTbLbPnDxHZfpLAi+xuSEuHUl7lhA5EqZtnKD5oEOUQ3DaLB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOAqagKP1game8W9D6NWG/Bl8n3poPT8rsJfxki+sA5JlyB1+8
	8jcb788SXzbCP0kvMV+Abc7pI0aHxBXiGsPe5myJMxrNmg+GQZ268SZ/rhx8vb7mD8DWlI+QYFX
	N+5li4azjdoMHV1NMBu6CVzKZPbiIJVk=
X-Gm-Gg: AZuq6aKM5AuAIM0afWopLfaSs+X9bezpoGiPK7uvw5GwBK6JA7V/VO7GGSoVzgFhxPr
	Bl4CSa4xdBfx0uHl4vHRcVycjzYuQyQkqzzE92n/4D3GsAN7IjZpPMg47Cu/iWsX6vNTt1lDl29
	+B419a5UHBLsBI5SnfICE+gcuSUjpN0DNc2T8DlwWt8lxz1Gd1/atjfyA8yfFDUofJ3E22pv463
	xBt6h+N95rjpVdR2Q86OiGzg/VeNnF02pbxOlJ5Ftcjdi8LOQMC2IWC1J+jr25K/VLFpd59RxTo
	2kB0mfpG9nCKuso4yciaYSSvgjQcghqCRFCrANQpFTTjU8UNe1swK3g=
X-Received: by 2002:a05:6214:1cc5:b0:893:886:3816 with SMTP id
 6a1803df08f44-8946384ec3bmr42134286d6.6.1768944976692; Tue, 20 Jan 2026
 13:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20260120121455.142960-1-me@linux.beauty>
In-Reply-To: <20260120121455.142960-1-me@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 Jan 2026 07:36:05 +1000
X-Gm-Features: AZwV_QjLXpEQk5YXuxnS3fiq692HSHgxKn8FGedpRxe-Gcn5B8D9KpLEWZ-rRoM
Message-ID: 
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: N2U5FOBA4EHJKRZ2GPKTLVW626FF3S6U
X-Message-ID-Hash: N2U5FOBA4EHJKRZ2GPKTLVW626FF3S6U
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N2U5FOBA4EHJKRZ2GPKTLVW626FF3S6U/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 20 Jan 2026 at 22:15, Li Chen <me@linux.beauty> wrote:
>
> Kexec reboot does not reset PCI devices.
> Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
> userspace still holds DRM file descriptors.
>
> Quiesce the GPU through the suspend path and then power down the PCI
> function so the next kernel can re-initialize the device from a consistent
> state.
>
> WARNING: drivers/gpu/drm/drm_mode_config.c:578 at drm_mode_config_cleanup+0x2e7/0x300, CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  ? srso_return_thunk+0x5/0x5f
>  ? enable_work+0x3a/0x100
>  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> nouveau 0000:26:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
> WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free+0x73/0xa0, CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  drm_mode_config_cleanup+0x248/0x300
>  ? __pfx___drm_printfn_dbg+0x10/0x10
>  ? drm_mode_config_cleanup+0x1dc/0x300
>  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> WARNING: include/drm/ttm/ttm_resource.h:406 at nouveau_ttm_fini+0x257/0x270 [nouveau], CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  nouveau_drm_device_fini+0x93/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Signed-off-by: Li Chen <me@linux.beauty>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 1527b801f013..50384462723b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1079,6 +1079,29 @@ nouveau_pmops_resume(struct device *dev)
>         return ret;
>  }
>
> +static void
> +nouveau_drm_shutdown(struct pci_dev *pdev)
> +{
> +       struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +       int ret;
> +
> +       if (!drm)
> +               return;
> +
> +       if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> +           drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
> +               return;
> +
> +       ret = nouveau_do_suspend(drm, false);
> +       if (ret)
> +               NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
> +
> +       pci_save_state(pdev);
> +       pci_disable_device(pdev);
> +       pci_set_power_state(pdev, PCI_D3hot);
> +       usleep_range(200, 400);\

Why is this needed? it at least needs a comment.

Dave.
