Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF3DCD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 17:34:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 095E389A5E;
	Thu, 28 May 2026 17:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o02ecept";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BDC394339B;
	Thu, 28 May 2026 17:21:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779988860;
 b=KRHkGD1M2Q9vvUWohfprVj18dzpJ7ibqg3A/4Y4m9x5o2swLI5uBjGcY+LkgSQdSaAkij
 TGLWfATfcHjDKyZsaWUD4KoRqMV+gA1NRxUxxsYVYI2Ewc8ZKksAuXub4Vip2//0RmxE5RF
 y6PfblRCcsyQMMrr5rZTDc2pr9TmG2MNjfGHFTIjoEPyHCIW9Hs5TjD94wojWFs1BtcfCQC
 o7gCq4waM7OaMIzE2Q/vLNeXfA/ZZpCMKjVC/WvhE0FTU/HLZxg0J6YwsHHeSkXStyhgfkN
 HkxuFSl+TVwgHd1qFwL4knsQU9AeS6RwRigml1RURKJbp8KtVSGThg4t4zNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779988860; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zCvbrJc/HxGvhAGTRUvT4i83nHmZ78eEycG2Ya6TcGg=;
 b=NcBMvWcp3rBnmaSIpW2fzPXU8qblZk7EPJSyrSqmtxLF8FWwNdnJ0snHjz8RDgtCpm883
 GfDJ0lmEaRb/eU5/m30AOzcKv8ve98qXwTwtcf6Izz5dRpbTKs5x14qZPvMmKT8aFbfzOqr
 kvPJjC4sAPF80M59RC77mqzX2AFltZ5iGvqKc+k0pN9+FDUaNbmW8GPUjkVFHwRTlpMQs1o
 MyKMRQHAeGw5xrhm2B2d5R9DW/rFA56fOYNoC8ZPLUt4cA28U8dQzd8e1dEm+EPAp1gli+3
 z4qZukDGNuzVwv723jgSXPgQKvAWMldb0YHnjX4S/bPiak61UQY/SRcDF27A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 343FF4021F
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 17:20:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5B10F4CC
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 17:34:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7972F6020A;
	Thu, 28 May 2026 17:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B1F1F000E9;
	Thu, 28 May 2026 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779989665;
	bh=zCvbrJc/HxGvhAGTRUvT4i83nHmZ78eEycG2Ya6TcGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o02eceptRgii2ESui7nNsVScmxKdcIAwRuszs4khnYEJmqv0f4o3wZ0Tap13ZbzDS
	 NAseZGXXiZ5zBjpDpkY5Kop30m5e4telR/9vFicBfr7skU1b3LY8P6zURw/G77HFQu
	 VvEUqPMQdfPnDQW/N9NCaJpuluU3eria4kfbWzJAE9dC85xecautx8INg2fGaAKoJV
	 weR5E7+33wm07vzKpPGEFhmDnT+z+PR6ZGQ5SttsuKZ9xwVplUAgLg/VgVKqjKLFsL
	 d/6btp2Ri3xo0vb8G8Q0bozfswkgMwsfnVMDxZ/zMpWDMMrMAod/2kjszQ4kfqb8k9
	 I3QMVWGFD4OOw==
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: (subset) [PATCH v2 00/10] drm/nouveau: fix GA100 issues
Date: Thu, 28 May 2026 19:33:33 +0200
Message-ID: <20260528173332.1938700-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430223838.2530778-1-ttabi@nvidia.com>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FKA7FEY7P7ADOSJBEA4TAAJM6WWYRVB6
X-Message-ID-Hash: FKA7FEY7P7ADOSJBEA4TAAJM6WWYRVB6
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FKA7FEY7P7ADOSJBEA4TAAJM6WWYRVB6/>
Archived-At: 
 <https://lore.freedesktop.org/20260528173332.1938700-2-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 30 Apr 2026 17:38:28 -0500, Timur Tabi wrote:=0D
> [PATCH v2 00/10] drm/nouveau: fix GA100 issues=0D
=0D
Applied, thanks!=0D
=0D
  Branch: drm-misc-next=0D
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git=0D
=0D
[2/10] drm/nouveau/gsp: add SEC2 to GA100 chip table=0D
      commit: 604d0efb17cc=0D
[3/10] drm/nouveau/gsp: use fb.bios.addr for gspFwWprEnd instead of vga_wor=
kspace.addr=0D
      commit: 3cee1a10b8a6=0D
[4/10] drm/nouveau/gsp: read MMU_LOCK to fix WPR placement on GA100=0D
      commit: 0094a7a95d52=0D
[5/10] drm/nouveau: only boot FRTS if its region is allocated=0D
      commit: 0ae50100b228=0D
[6/10] drm/nouveau: GA100 has an FRTS region size of zero=0D
      commit: 16d4747cd152=0D
[7/10] drm/nouveau/bios: specify correct display fuse register for Ampere a=
nd Ada=0D
      commit: c1cf2d5db80c=0D
[8/10] drm/nouveau/bios: skip the IFR header if present=0D
      commit: 4beeac5d2015=0D
[9/10] drm/nouveau/gsp: require GSP-RM for GA100 support=0D
      commit: f0de0f89cc1e=0D
[10/10] drm/nouveau/gsp: formally support GA100=0D
      commit: 61de054a772a=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are queued up for the upcoming merge window for the next major=
=0D
kernel release.=0D
