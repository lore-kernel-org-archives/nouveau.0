Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFBFCA5FE0
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 19:10:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4910F9D8;
	Fri,  2 Oct 2026 19:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQNl8Fku";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A661B488F7;
	Fri,  2 Oct 2026 18:52:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790967150;
 b=uHJaAqW4zd6LYnl1D2fOHqT2aUON+TqExWhdoDV7jqjJg1rdc1iX7ErgMBIvh2cNOq24Z
 0VgQPTWf7Qzh01D8BqwhTRBWakoTTyDuSzmJYHVFUpc9qsy1IbcpCv3Q8X7S024J2Va1q3w
 PLxKzSDodH3lxz8T9IsYdDtc2r23L5q4wkSQ9rm6fOjS/90tSRW8gwsj10CSKsmEyg1hzSM
 NCYMoQLcna5KFvvbbRH7cEb1PTu4bxCKrwT8/U9fLZcXH3f8YuM3iZX/J2WgWhQaXMka4TS
 hJo9GgAPgVfhmBJ8aSOqKUyRaa2Edvkbx2coGFxS+7cpQ8zlfa6gFsvJWu/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790967150; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
 b=p62ZeoTa4El3Ze4/V0WJeQm7n1F4g8kN1JbKuyYs9/2MaUhIqJN/nhOc0RYGTLsi8+nEm
 2+DntCA1zsq4fGGBQnTmCWG8OXzRcWy0FPIHxsxzOn04GjJ2L0xzisPRYdC+B4/l3ruI2k5
 LwPffCU6iQqCzozBl3iVuZd57nbWsJKD0YPQyBXV9M/eEEyZZGORXe1wGGNTW4aKDkDEb56
 ncaxsuUt5k/KuY4Zx2pgwQ7h8Lr+yG+m9zk96M4BI96q7g/oF35zFfD4eVm3xbgrfed9N/7
 Q2YMT+Sxel1a59QhB423RXikZb0+GJX7U2o7o3ZIy1S/mfOtTySHUBZIGs5Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CEA38488F9
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 18:52:27 +0000 (UTC)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com
 [74.125.227.39])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE4EA10F9A4
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 19:10:38 +0000 (UTC)
Received: by mail-vs2-f39.google.com with SMTP id
 ada2fe7eead31-7b2c2be2633so1445399137.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 02 Oct 2026 12:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790968237; cv=none;
        d=google.com; s=arc-20260327;
        b=ajnJ5asoG+fJFFbYp61utfYudgrozmmC64P627Yi2ovNBytVQmqWiVA+IbZXfxkPHQ
         Ac0dFs2MhkXjvLXreURINw1RP5VYrjwlh37xlUE46s4O4WlySSSNhwIFHzJhnaUBAg1N
         FMy8ljcLv3z8DSgVMCjnY9nm/uDUzX5MRq3sUz89o1oNPNKGi7DHJkBi9xB2XmX1NtIa
         Y8OkNh3QygGVWxc4dRjP97lzMNfZK4NGKi7hjwsyGfTK4OnNZEhZtPqSXvPFifEZqSEd
         l8CLNQdmlR1fAawO/iC8lGm5PJ4puMCsb2xylXwP59rByfbr5uY0S+/FFEYAWeisF6kF
         v8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        fh=lqmHg/2bRt0SGef8vnpfEm7DBNJ/vXEhejTMLgNmlMM=;
        b=KkjL7GDyO0yiE/RmcUpKveTIQhcUaeyBvo8brqT4Lt1vH8r4iGpDK5N9vX25ouGXfZ
         CGMTw52ZUL0A/40UQA2KX1pRjUFGC51ezHGeZSiuPo1XAdsuu+jtpQEqCkJBz1g6lCwe
         ro4vu2R/m8D1PDBAhD1KgEOreE1VUv3Jv1fmFUXVukH7Vl7oHAVh60RGQ5Zy8/47rUFq
         X9kxlIXaMQfG/hE+5GWrC289x2zaGGf1eOXZzFVK8rHTwxymKYf/R1eHlRsnxWJ8eBJN
         04dVTxnLGkwaRNdWCLKJgXOeg1dGlYobqXKKSQbmcYNjjEGnGkqxgvV6ChHWfziNZ+h+
         zgAQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968237; x=1791573037;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        b=VQNl8FkuMKr8slWOAOhQtFiKqXlz0IT803RzsY6TxzjlGd/ufSDUm99lvHx+ryZygF
         mIH5UH7DxOVtiDOXR7jsI4mg/oq+/SyYLu/omM9MwVbrpwwvUnDKshZqxt3d1GDVvJ0i
         BRhwF/dsOB5ZMrmDFOzzmMurO7kXITnNEOAbe7m4/h3s4QDUTMm7cUWclyliEZdAd6Mx
         F8wCD+LRZq92qWi/UysJU5LC4RHHZdKAVSydb+ZhjEFCa91FRR5ghfKpAKvkSOloRwxD
         iRk0/4cdOjHC2evLrHCNJ42Nfph5o7pDmI0km31Z1t3SWrvuWRL8zdqibcgJNIsMg8Fi
         /WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968237; x=1791573037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g3omsTMsYA6NLMPlVoAQ+bgFVlwbEDqlJ8MBK/lW3M=;
        b=GwjsgGZI67jfAP9ZMs3h2FKcsglHmyX/eP11ZvQIEh/ejwA8bhTKGcWDpXHT/JBFJz
         X+3tBrAJbpkhVOyzJhvOeghujMkkcDMAxvN1GagIJqDDHA3vC/Fk+l5rtQ0XHABF/8Ee
         SYXxXn5bjt6mmC8b1UErUaLXeLBSblp8+0/70Gp1sfhXEUZIgUYMtmGHU5Cw4lC4CZvp
         7CUzG1JDvIj/+Z+7hgWUr25kQ6AXToI7Bd5Rlf2ENHf7BH7aQn+K2CMv+iFFYPpQ3835
         5sxBnsiuO8+mzXAH19I6ZsuDTIjfvRamrq2szHlqbem+845DVw2fLLQsRCm5P9tGbWyL
         fe4g==
X-Forwarded-Encrypted: i=1;
 AKwUvByCKZ+MAJyVkivxpezMSIhOS0+vgWFMuXidzxKF602Q7GfYXeBfbASxEO6lQv6lV6ZIPGcd5Fu9@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLwcb529nwSQxipoMB/k7CIGWxHLsJDtHfUBlNLkl/59ePFPekT
	wuzQ3YlKlBc04vN0SQhRjF30DxrEw+dSG9GHGsDYKKwYH8nrMRb1dobEAeijCJLlT8c5bdcidvd
	grMRMCR50xLR/iK2MPZ4ROC8oWX8wQhk=
X-Gm-Gg: AYBFou3JB8Uwd+cvAtCY+kfLK9EBoKwCdvsxPmoaFHpMMdXguIahehcURLlnrvdLuQ5
	i6g/0sBLa5EbS1ecy4tv6izEiRyXM91jnWz+IuUsrEp5hr3WpLERaNnPbGe6oPKCHBc/YiFg78g
	kjxwwISkHucDDE86tfUh5FJmytX8G0OyZHJmEfgci878I41bJmsdyfeap0fAZd/HhfSBGfBSjn8
	Mrh/mdXRqAdRY8gRYVGvpKxvQHLE8biSNTou89EQEXU5b4IgPblitu4Je2lPVI92Ga7r9Q6puu6
	OsE8HEJeTcuyphyTmZPGAwOKhPkE5Ab8VxBtyQv8iNcig1D8t35QZK3vFtpsXqoTil2ptR55kO3
	Mop2LWLcxm/u8L+nMmPwtq/bmk5dmqYm4OQ==
X-Received: by 2002:a05:6102:e0a:b0:7b5:4700:3a58 with SMTP id
 ada2fe7eead31-7c0f54adbebmr792755137.31.1790968237259; Fri, 02 Oct 2026
 12:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260815-null-fixes-v1-2-0df9dda951fb@gmail.com>
 <20261002171818.281885-1-Capitain_Jack@yahoo.com>
In-Reply-To: <20261002171818.281885-1-Capitain_Jack@yahoo.com>
From: jim.cromie@gmail.com
Date: Fri, 2 Oct 2026 13:10:10 -0600
X-Gm-Features: AclHuK8zRY0hMOMSSnnxlFny3tvMylToD5uT6sSAGguetyweFEx6Xv_BTi4bCcs
Message-ID: 
 <CAJfuBxwGvKQrT_CVtvk7xX7pbf8WyE+LS=KAFyc9zSxD=v686Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3W57Z3WZF5PIG2SL5ZRLZHKU6S5JY5XP
X-Message-ID-Hash: 3W57Z3WZF5PIG2SL5ZRLZHKU6S5JY5XP
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3W57Z3WZF5PIG2SL5ZRLZHKU6S5JY5XP/>
Archived-At: 
 <https://lore.freedesktop.org/CAJfuBxwGvKQrT_CVtvk7xX7pbf8WyE+LS=KAFyc9zSxD=v686Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

hi Daniel,

thanks for testing this -
I didnt want to screw with my firmware,
but you're clearly prepared to do so.

I just sent rev-3, with another null-ptr fix I need locally.
Im pretty certain the patch you tested is unchanged,
but if you could test rev3 that would be marvelous.

fwiw - mine is a GA107

01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce
RTX 3050 Ti Mobile] (rev a1) (prog-if 00 [VGA controller])
Subsystem: ASUSTeK Computer Inc. Device 125c
Physical Slot: 0
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupts: pin B disabled, MSI(X) routed to IRQ 101
IOMMU group: 10
Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=3D16M]
Region 1: Memory at fe00000000 (64-bit, prefetchable) [size=3D4G]
Region 3: Memory at ff00000000 (64-bit, prefetchable) [size=3D32M]
Region 5: I/O ports at f000 [size=3D128]
Expansion ROM at fc000000 [disabled] [size=3D512K]
Capabilities: <access denied>
Kernel driver in use: nouveau
Kernel modules: nouveau


On Fri, Oct 2, 2026 at 11:18=E2=80=AFAM Daniel Campos Ramos
<Capitain_Jack@yahoo.com> wrote:
>
> Hi Jim, Lyude,
>
> This one repeats here every time.
> Setup: an RTX 3060 (GA106) passed through to a VM, kernel 7.3-rc1,
> Mesa 26.1.6 (Debian testing), firmware-nvidia-gsp not installed.
> nouveau probes with "gr: firmware unavailable", so nvxx_gr() is NULL.
> As soon as KWin starts, Mesa's NVK asks for the zcull info and the
> kernel oopses:
>
>   BUG: kernel NULL pointer dereference, address: 00000000000000f0
>   RIP: 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
>   Comm: kwin_wayland
>
> kwin_wayland dies with it, so the whole session goes, not only
> acceleration.
>
> With this patch alone the zcull oops is gone, but the next NULL
> dereference follows right away, in GETPARAM with
> NOUVEAU_GETPARAM_GRAPH_UNITS:
>
>   RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
>
> With this patch plus Zhenhao Wan's "drm/nouveau: prevent NULL deref of
> gr in GETPARAM_GRAPH_UNITS", there is no oops: KWin starts and
> composites, and NVK refuses the device cleanly (vkEnumeratePhysicalDevice=
s
> returns VK_ERROR_INITIALIZATION_FAILED).
>
> To reproduce: a Turing or newer card on nouveau without
> firmware-nvidia-gsp, then start any Vulkan or zink client.
> Both fixes are needed for a desktop to survive a missing firmware
> package.
> Whatever helped find it, the bug is real, it repeats, and the check is
> the obvious one.
>
> Disclosure: I did this testing with an AI assistant, Claude Code
> (Claude Opus 5.5). It built the kernels, ran the VM and read the
> traces under my direction; I checked the results on the hardware.
>
> For this patch, tested together with Zhenhao's:
>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
>
> Daniel
