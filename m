Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B91FD7077
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 10:50:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49D10E5C9;
	Tue, 17 Mar 2026 10:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GEuFQVpp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9278A451E6;
	Tue, 17 Mar 2026 10:39:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773743951;
 b=Y9hr1G4/dAP/RUSWaQKxEjm2hTNApH/s3FjoSMxUeEvuv1NMpHj5rqa4HFNgoInCr1eyZ
 MeoWCD3j6Kchwvv9zYaaVFU6jjWJtoZoUjKbr0YTbfwaXUZRETXzNMd7PY2RyhqHjiYBeEs
 aWLsLYnmhbS7D4Np4DLY74AZn+eOT3a2/nrkTkD8m3spjZOAJ82bqNtPGEjrAcCVjdhpLl7
 1NYPUu2NF3HK7/s8XsI2ELsD+0YuhwuKQghimEfbjIbA4jaV+5WB3fjA5iZ56eFw29AycUg
 j6DAVt3Mb+HQg7J8KjCEqbqKtTgfQ4DQjhy0qlaBPLUbSP5xEseYXjeOUEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773743951; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gC4YwwaxKENkrUEmePVzTll2qRzfjFRPq4NhVoC45Zc=;
 b=ARkNrF4Rgi/cvBoQFCZTiZsHQLwJX69dL9ot2tkWc9mX+rJZ7wyJ0qTHJAzo6mh1IC5eu
 tTpb0T1yOjGtFA8GTmzkEfIP/mtEQ7hxCzD2KGc8KU4qFieKp/Cl5kTNwJNirkkzQgeVnZL
 feZ9pKLDEBCiNFFh5ydZOPp04itqEQOMk5JoP9rNQZqW+HqCcD5/ZBuThKPFbw+uwloXKfo
 iA9fXSDZwPfszpM/WCl6FHAWCtL3DS1VsKIj1ojfH1QtWgD9e8L8cNu1OehbTEoalI/doK+
 Y8caJWbeCTUWHRU76fr+O8j8GPs6F9/AtPljGjxP1xzndOUbKwvNr6dhPfhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1AAB1451C9
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 10:39:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDBB10E1ED;
	Tue, 17 Mar 2026 10:49:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB66560008;
	Tue, 17 Mar 2026 10:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6534BC4CEF7;
	Tue, 17 Mar 2026 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773744596;
	bh=zIXYt4MiSYtrZ/ljb1b2PTErSHLZeJRlzjd8rOa85Wg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GEuFQVppox1B2Wla3Jmq+DSI1wc+jSic+ZFpjguH/c0Y6jc/xEAAvM9W9lDReDO6n
	 NaV0/NQZVi9MTci/Pas8fUNCManAhUactuZSJn6qPbaKpymRdyOWbpzNUdXfheg5hv
	 9ZF9ntagjKViTR70j5YWJQtq0UqriEHQtEz5+vKMeId9wLJuY9k2TBMI6YanzhhfmR
	 C7c6VfHqh1S64pcT6Po9NoiUAV/pnh+lKhWzJUgR3gdpqxOFG+U/sZs5iHf5eeZjLO
	 L/FMR3W68MDybsNM7j7aF5sUZKn4pkpcmg7UwTD+xfZ5D4kCH7c2/jemFHvP/JDsen
	 VEcw+34dTequA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:49:53 +0100
Message-Id: <DH4ZZD12V0R6.2G7IIL87QTK0S@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
 <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
 <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
 <DH47AVPEKN06.3BERUSJIB4M1R@kernel.org>
 <DH4OM17DJ47V.3NJG7G02O7P1L@nvidia.com>
In-Reply-To: <DH4OM17DJ47V.3NJG7G02O7P1L@nvidia.com>
Message-ID-Hash: VATZQYOSDMQBIWEDFKZRNKIDNEPFM4Y7
X-Message-ID-Hash: VATZQYOSDMQBIWEDFKZRNKIDNEPFM4Y7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VATZQYOSDMQBIWEDFKZRNKIDNEPFM4Y7/>
Archived-At: 
 <https://lore.freedesktop.org/DH4ZZD12V0R6.2G7IIL87QTK0S@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 2:55 AM CET, Alexandre Courbot wrote:
> We shouldn't be doing that - I think we are limited by the current
> CoherentAllocation API though. But IIUC this is something that I/O
> projections will allow us to handle properly?

Why do we need projections to avoid UB here? driver_read_area() already eve=
n
peeks into the firmware abstraction layer, which is where MsgqData technica=
lly
belongs into (despite being trivial).

	let gsp_mem =3D &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
	let data =3D &gsp_mem.gspq.msgq.data;

Why do we need I/O projections to do raw pointer arithmetic where creating =
a
reference is UB?

(Eventually, we want to use IoView of course, as this is a textbook example=
 of
what I proposed IoSlice for.)

Another option in the meantime would be / have been to use dma_read!() and
extract (copy) the data right away in driver_read_area(), which I'd probabl=
y
prefer over raw pointer arithmetic.

But in any case, this can (and should) be fixed even without IoView.

Besides that, nothing prevents us doing the same thing I did for gsp_write_=
ptr()
in the meantime to not break out of the firmware abstraction layer.

> This is guaranteed by the inability to update the CPU read pointer for
> as long as the slices exists.

Fair enough.

> Unless we decide to not trust the GSP, but that would be opening a whole
> new can of worms.

I thought about this as well, and I think it's fine. The safety comment wit=
hin
the function has to justify why the device won't access the memory. If the
device does so regardless, it's simply a bug.

>> I don't want to merge any code that builds on top of this before we have=
 sorted
>> this out.
>
> If what I have written above is correct, then the fix should simply be
> to use I/O projections to create properly-bounded references.

I still don't think we need I/O projections for a reasonable fix and I also
don't agree that we should keep UB until new features land.
