Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17796D2629F
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 01:13:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C21210E678;
	Wed, 21 Jan 2026 01:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pt7AZS2s";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C73E44CC0;
	Wed, 21 Jan 2026 01:04:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768957458;
 b=JQIBYDwS1//nWFiklhr3Y/Sjl3tpuw9dGtqJJWaM938RHZsVYmiwLKNoxf9p9HqmYkchy
 GaEkMcjFLH2cg5LolBTZl4pQGdIKPlqgrbRZ4RK57nrg3MZ6I0U225IcmbnQql7jQFc8zgp
 t6Dy+LammBh1+r3yOJmJLRFfWZXLDGZwY1xlqqNo+2PJXAcNi50Oi4y6GfVboWS9x9TKxn0
 bxcMrLht6kWpfKPpCoTMFaPSc3fGqdo6SpDBJKbXUZKcEGMMtfWPpzBI0CBBlsWbnginnmI
 2t+GgGWiyZPY0RSmG7QE1wdHQ+/ZvRsH9pU2C3pK7x/c4MC6iZ4lt/ymzYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768957458; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FmwTQ029mYWT6UK12h8nXPhgqZ2iBtY5Hkic+DgoSfI=;
 b=eb8C9XHJBT8tKqoK/OP9CXRdSkjDnE7oW/81s1in+5ib0AVURv5EHtGlEUEG9BNAA9y81
 W9duOeDLQVPE6cTK3VTjcka+SMhwHfh7GBxRi0SOUOvrr43XsFQyDf22hEXhoSeQ/EyH7YC
 5QJTJTncoGeUcV4oUmFzEVQ1/ebGUU4BeUjZQFOTBBGLRIaUuGvpdZ5ey0P/I1xS1CEvLK5
 vYlTh3pKT5LfOpF7ufbnCCyS96M5xXHTH5uumNeQdOP5LoYBZhpbimGmODhTGM9+nkjeQke
 j/U6jf5lBzRFUPDGXJb7dXph4o4/oPxRL7+y6IhHfUxX9OlW29KruOkVy/ig==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 68A144401E
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 01:04:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B804010E049;
	Wed, 21 Jan 2026 01:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76EFC44351;
	Wed, 21 Jan 2026 01:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50305C16AAE;
	Wed, 21 Jan 2026 01:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768957980;
	bh=/GNei2JmWT5PlnwMApcKkDG9Vb/qfVkL/dGZeOAGVmg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=pt7AZS2s+M/Nsyee8SAmBXkqzUdmV3ejHtNMNaeTwCxQE9fEOdg7RA7P2xh4CHMYM
	 4sjml1B8e51ThZnP0QsOfBO7Knsz72oAFv4P0k9LP3BTL1DL10PrbPfrNGtcV2qj/o
	 jC542owMQZO8nCpJ44CpywN1Ka4G9DNgv0t/jFbxMHSKiSscz0PeKFYpn21Yu+pfYm
	 2oU2PChKP4nhzDkr1lf71NMqtozHCVXzZgL/2Lf4Pg90H5R4VblYiwFqWJ5hqwzGul
	 iD7paYKMFL8JXl09j+GgCUg5LYP1nTWyXhviB10X/CGsQXyn42Z1SPLpyHPqzkgwsx
	 bLoDpNBK/5wEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 02:12:56 +0100
Message-Id: <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
To: "Li Chen" <me@linux.beauty>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
In-Reply-To: <19bde085588.1b451560725069.154128025837198067@linux.beauty>
Message-ID-Hash: 2QE5DLFDMTAHGDRGFTO4KHZ7RKSR4K6P
X-Message-ID-Hash: 2QE5DLFDMTAHGDRGFTO4KHZ7RKSR4K6P
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2QE5DLFDMTAHGDRGFTO4KHZ7RKSR4K6P/>
Archived-At: 
 <https://lore.freedesktop.org/DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
>  > > +       usleep_range(200, 400);\
>  >=20
>  > Why is this needed? it at least needs a comment.
>
> This patch is needed for kexec/KHO/LUO reboot: firmware reset is skipped,=
 so the GPU may remain in an active/DMA=20
> state and the next kernel can fail to re-init nouveau. We can=E2=80=99t c=
all the full DRM/TTM teardown from ->shutdown() because
> userspace may still hold DRM fds during shutdown, which triggers WARNs.
>
> So the shutdown hook reuses the suspend/quiesce path (safe with open fds)=
 and then powers down the PCI function (D3hot)
> to leave the device in a consistent state for the next kernel.

I think the question was about the usleep_range() specifically. :)
