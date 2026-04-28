Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33163FF886C
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 09:02:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 37E3410EAA0;
	Tue, 28 Apr 2026 09:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NAK5XUKF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6B02D45C81;
	Tue, 28 Apr 2026 08:50:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777366235;
 b=C5xOkuoKHIouw+blJtu3U4fHSFMs0rxNZ67EzwQNUbAUegLlYSpAllHGSVoYti0OXXyc8
 1tMsLpBk287NZCWVn+MYfR/0vStIzc/IIloReEo/GzB2Qgu12cLWRXTfd5Tm9klUN87rjjO
 YcOF0V7f+bKVDKNH+8vhs4YcL55q4ED2kBSAopg04g6ji1GLt6B2LWiyakXCVKpaYd7LnqS
 o1yS/K38arDSasdtmxMgb4ye9c/aICJNcHR7840lkanC4aFz3kac0esedTFcToVprkIPgWq
 Kup/aJEmtgHimb+aWiui07cmLZZ02FnhkIAf7diQmaixTjusikEoMm5JUn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777366235; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PKClDgr1wdejR+52WQGzIzuBpKe+/ihFHqwm7WwPm/o=;
 b=H1XuQzEyu35SHJCIi9tSi3csX1y9gx0lxPClVd0qOjgxArSr2XJCKoohoEacf4Do7GzQy
 d8xROIAopSyTDlXovyTGOAKBK5giI7genntzpPvSAfjUhqGe8rL++vRwHxhwQp4hYmiyLc2
 vwonJP+OOSPipEeyigFckh4etE0KmBVkoGKIOVtl4YSCci7OMR6338LgPPw9pmvPBRRfEiJ
 WLQJ++TpUmUPh6tx9/Qm+cSzMj3Jq7DZCxi+Og7ryXBBHKdizI4iyRlOqnzKdRQGY0gUsPB
 IIwF76nqSuc9NpcKfBdrQqv6QcqI6r624mSAEvNtJZHRlc6h5sxsq/fKmshw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1776B45560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 08:50:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACB6910EA8F;
	Tue, 28 Apr 2026 09:02:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C4CB6014C;
	Tue, 28 Apr 2026 09:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850B2C2BCB8;
	Tue, 28 Apr 2026 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777366974;
	bh=8yzRRXLfiwZ2u7ZWEAZNz76TJ2spxwIMhj+GhPigBKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NAK5XUKFRmLvqRelgIUloT12JrGj0EmUjRNIskUaTVK2a5V/ox1zt+THQitdNIg9c
	 RqGpzHBeqlKpoaJq4I4DoXIo/SECYCRRAqBZcxsYI3YegEMHORAK+l/81mLmRYoki7
	 qP4nEhF/iftVYz6t6sSWxhVv63EnzjjbXykiPMSwQxa62dPSmrJH1afsQZoLOkhm/3
	 QE83XQUuL+MeT3hqVsqg3QynmRI9RU8UhyjT0l9o/ucbSFZzLgoTR4liXiKzYHweiE
	 luji4sr8gPkUUwLuCu+dE49xwvCG4M4W9ED397hh5YoBfZJB6l/rMhQ1z4WHhlhtc4
	 +4bziSKpNX6zg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Abdiel
 Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 05/11] rust: io: restrict untyped IO access and
 `register!` to `Region`
In-Reply-To: <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
Date: Tue, 28 Apr 2026 11:02:34 +0200
Message-ID: <874ikvqwyd.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: FRGSOIAYTKLCAJYXSGZ525IHGDSITACL
X-Message-ID-Hash: FRGSOIAYTKLCAJYXSGZ525IHGDSITACL
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FRGSOIAYTKLCAJYXSGZ525IHGDSITACL/>
Archived-At: 
 <https://lore.freedesktop.org/874ikvqwyd.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> Currently the `Io` trait exposes a bunch of untyped IO accesses, but if the
> `Io` region itself is typed, then it might be weird to have
>
>     let io: Mmio<u32> = /* ... */;
>     io.read8(1);
>
> while not unsound, it is surely strange. Thus, restrict the untyped methods
> and also the register macro to `Region` type only.
>
> The way it is implemented is by adding a generic type to `IoLoc`. This also
> paves the way to add typed register blocks in the future; for example, we
> could use this mechanism to block driver A's `register!()` generated macro
> from being used on driver B's MMIO. The same mechanism could be used for
> relative IO registers. These are future opoortunities, and for this patch I
> just restricted everything to require `IoLoc<Region<SIZE>, _>`.

Does this not prevent `usize` from being used to index anything but
`Mmio<Region<_>>`?

It is my understanding that the following would work before this patch:

   fn do_read(io: &Mmio<u32>) -> Result {
       let v: u32 = io.try_read(8usize)?;
       Ok(())
   }

But I think this will no longer work with this patch. Is that the intention?


Best regards,
Andreas Hindborg


