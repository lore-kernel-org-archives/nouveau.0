Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A017CD8CA4
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 19:57:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3453610F961;
	Mon,  8 Jun 2026 19:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0Iar3lD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 540374688C;
	Mon,  8 Jun 2026 19:43:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780947795;
 b=fgxka7yaIE0v9eL7x7LRNc1XF1fScF45c2tP2I29vAVDW8tQQsH4dHnpnZP7Kw77jkeQC
 NBBbWLrIPC9Yoxf9ayz2tl1T0VNYaXK7AvaNdy9AwSVnpQtjJ5rZZr6q9KS9tQublLVZ+/2
 qSZ8rpEo/9EYITcj4VXM/JgHeArLz5vWLe8x61S8wEjefc07V5RMFcNn+WMPydqrlMWZO8q
 xfImMlnpM6pUalyciigXRam719zW1asFKkuL5WSG/ADZaJKtUMAnMrVvHrj5Lcd20qwM7I3
 Jaw0AfjtmVFiLjI8kVZy3G4YKoHAPzGtqUN0Z56mtogEuw/TeR63EMnpfZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780947795; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x6JwvLsWsLYWBCdua6MGpYaGoK7ZZnWaJbNlGrTrnXA=;
 b=u+qHJtjuWovhTFMWN0WPsvcWy0OHM9D4BH05F2jaooAOmJGS5gystCnhaes+4sytZmdPJ
 VZA3My3BK1TFUYHuexUZpgcfZsd4xzetgjB+N7+SfvobqWSqkdN2Y/BhySOkUeMevtLx6LA
 FYhkOqDmSTe6pM8pQ/IDWEYWmS1fxPnQU0uy08j4uaXp12zVnj0TgBSTNWcYvBMqLUdFUJu
 ZkXC/96+EtMdH/93rN9RBJ3Ao2unCmkQWFtkNsAs0h96+ejVMvcDXkpUHLyt84bI2N6S9ns
 7RECS43Q7JAyFTwOPi40EjhSxONdEDxQdHhovie4zhz2jiJCSxLrMM3J4x+g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1A9B346868
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 19:43:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA4A710F959
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 19:57:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490c28f84fdso7735855e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 08 Jun 2026 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780948624; x=1781553424;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:date:references:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6JwvLsWsLYWBCdua6MGpYaGoK7ZZnWaJbNlGrTrnXA=;
        b=d0Iar3lDXot8Tvg8tb0IM8Cidc/QtppAxa1WVIDCOtyLR7OruPpLtuYC7+ap+Wus2c
         1q7/mrtdya1n8iT4fuOXUMOpn9XQvrn+1OW2ClgxaFQ2vSoERi4noxJjeoMon3diuJLY
         kCp+z7FtfWbyuGso5vegcJVVSFb0fvRB0Ll5Gna+1g9LSLw7v7YUJ+gO0GX9bl6GG3VC
         2ifqjuXpZMPQ9QyfqUcK6mXReCdANmIamzj1gFG4ByjlO6QLXh97bq8G3Q8tybCiqu68
         VSJoSl1Mod0Ii94HdDUAuZMXJJzTl//0ihtQMNgQO8o0OqdtW/KcbWNbNWGabeqXN9az
         1xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780948624; x=1781553424;
        h=mime-version:content-transfer-encoding:date:references:in-reply-to
         :subject:cc:to:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6JwvLsWsLYWBCdua6MGpYaGoK7ZZnWaJbNlGrTrnXA=;
        b=bWZQIMRK1qR5WhJOXJTrPOvJDPRIqdEvGfL/3LAaoIhM8W1EE+5tNGJDwhTRkFvE3Z
         ZakZXwlLQFYV6Pv6lv3YFebD8m1KuAhTFzBEIYaW0I9quV5m799d+FRodf/lWZnmlcKw
         eIrmsVFgmwy4USp1NiWXEQfnLrAQSpgr18iE1ewL4UHws04fOtxkms0fse9IPpAci0zq
         QpgGaHkQLeBVKjcoFuH0hVQe9ic767DAxPQP+Zl8f4jyf9dvYfM8spZZou656SX5zgX/
         JAfv6gNR+mx0CAzKbKQTgqi/7i4yNwBIefDfSE8itnka+ADeNd7NE6H+G9rVM472opit
         fOaA==
X-Gm-Message-State: AOJu0YxI8wNr7ZCHuVGf5GCNnTVmp8ta45B1XpCXHZH7sv8il/qX6v9W
	5FuWzPI/zZcKtkayl8PW3+H+fVFT+0zianknyXUMbzntw0sqiFsy5+aj
X-Gm-Gg: Acq92OH2mQi9mkVRNhM4a8AF6mjvhzj/Jc6pj7WXCelhCWbhvtTz06ujkUVE5Tstcib
	REuKh6dO/fYXnCed672j9DMoK3LLthLavVMWMOBS01aOMX57Os6pCNW+o3h0gGG7nWz1+HsqIKd
	a9RXqW+HDQHN/vJDM2QmhLpv0F7/ymoATMXPIX/wgWGKHBWaUoaChFA9Iin+jH/9OzMmj0aVfnW
	IvpkDrrbtnHGWaAxIHdk3iTr/mior0rltxPEc8VC6su4VQQgaU8s8G8lrDoyd5Qfg8qb66zh/4C
	RToZHu9wQGzbJ473eGTpn/JhSykH5F2T80cVAa2BoD2lJpDFiV15MZ1TGbaMZB9U7DDR1bgVBQr
	eCQ2G+dlN3CdBnGK1cvUM63ghQ7hxkIpkcwSCLZ3FrdNqoaST/UKqW5831wXJaNV+C8rQJ48iKw
	ok12uIREeMvqGxX1x9m32rnXK+pHSY3GgpO7AlzW96Jpo94nL34aVFVkUlm4mScidkW1ItITZYX
	Ve7+aKq77M+hKruBcqBBHI=
X-Received: by 2002:a05:600c:3551:b0:490:af9d:8b6f with SMTP id
 5b1f17b1804b1-490c2617419mr116664765e9.7.1780948623972;
        Mon, 08 Jun 2026 12:57:03 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3918fcsm479793855e9.3.2026.06.08.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:57:03 -0700 (PDT)
Message-ID: <6a271e8f.0c2aff9d.374a2c.9275@mx.google.com>
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: Fab Stz <fabstz-it@yahoo.fr>
Subject: Re: [PATCH 0/3] drm/nouveau: stability fixes for NVAC (MCP79/MCP7A)
In-Reply-To: <2c6340fe-2d3f-4d38-ae6c-d89adfea98b6@yahoo.fr>
References: <20260409172126.115441-1-marek@czernohous.de>
 <2c6340fe-2d3f-4d38-ae6c-d89adfea98b6@yahoo.fr>
Date: Mon, 08 Jun 2026 21:57:02 +0200
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID-Hash: BD4K2WFCH44O3BVH56CYBX33MSRCP3FH
X-Message-ID-Hash: BD4K2WFCH44O3BVH56CYBX33MSRCP3FH
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BD4K2WFCH44O3BVH56CYBX33MSRCP3FH/>
Archived-At: 
 <https://lore.freedesktop.org/6a271e8f.0c2aff9d.374a2c.9275@mx.google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Fab,

Thanks for reaching out.

On the crash you linked (gitlab #443): I had a careful look and I don't
think this series will fix that one. The oops is in nouveau_fence_sync(),
on the TTM buffer-eviction / nouveau_bo_move() path, hit while a renderer
process allocates a GEM buffer and the IGP runs out of instance memory
(the "imem: OOM ... -28" line right before it). My patches are all
elsewhere:

  1/3 swaps the MSI re-arm method (interrupt delivery / FIFO stability).
  2/3 adds a NULL check in nv50_sor_atomic_disable() (display-encoder
      teardown). That is also a NULL deref, but in the modeset path, not
      the fence/BO path, so it is a different bug.
  3/3 retries a DisplayPort link check on an HPD IRQ.

None of them touch nouveau_fence.c or nouveau_bo.c, so they won't help
that specific crash, and I didn't want to give you false hope. For #443
itself, the fence/eviction code was reworked quite a bit after 6.12
(around 6.15/6.16), so the most useful next step is probably to check
whether a current kernel (6.15+ or 6.18) still reproduces it, and if so
attach a fresh oops to the gitlab issue. That part of the driver is
outside what I work on, so the maintainers there are better placed than I
am to chase it.

Where the series might actually help you is if you also see any of these,
which is exactly what it targets:

  - sporadic FIFO errors / hangs that you work around with NvMSI=0
    (nouveau.config=NvMSI=0)                  -> patch 1/3
  - a kernel oops in nv50_sor_atomic_disable() when ending a Wayland
    session or switching VTs                  -> patch 2/3
  - DisplayPort flicker or a brief blackout after DPMS / monitor wake
                                              -> patch 3/3

It was developed on 6.18 but does not depend on anything 6.18-only, so it
is easy to try on 6.12:

  - Patches 2/3 and 3/3 apply to 6.12 as-is.
  - Patch 1/3 needs a one-line manual edit, because the g94_pci_func
    struct was reorganised between 6.12 and 6.18. The change is identical:
    in drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c set
        .msi_rearm = nv46_pci_msi_rearm,
    instead of nv40_pci_msi_rearm. nv46_pci_msi_rearm already exists in
    6.12, so that single line is the whole change.

If you give them a try and they help with the MSI or display symptoms, I
would be glad to hear back. A Tested-by on the list would also genuinely
help the case for getting these merged.

Regards,
Marek

(Disclosure: drafted with help from an AI assistant, Claude; conclusions
are mine and verified.)
