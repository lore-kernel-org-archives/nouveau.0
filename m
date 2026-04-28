Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549A8FF8868
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 12:08:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4D8410EB4D;
	Tue, 28 Apr 2026 12:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DKwT5p8s";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C3BEE45C8F;
	Tue, 28 Apr 2026 11:56:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777377380;
 b=gQGnaHoBlSjJPez+aXW8W8TcNVp3m9yi/w/x3ZrTsxcC4j686OlsBBkZVBQM+88QW6Y+F
 aniCUj0EADqjqeTHppZQ//sl1uUWJ8iyEDwvCtvQ5ALDjNqejt88mSvcfrWb12tr2QYE1Mt
 kK3KzpNihyjr0I0UWiRv34P5baKQCKKGmbZoHxzFlpE4rFBtGPjnxoCNWnpasJ2DpmYh1/M
 IShkWFfO1Iv0QnqPe5xHJb9GVATiucFkhGnnexy1HdytN1Gz1gsDaIukCM5dx3Ob1QuvKhm
 8s2CJMGrq8pzafoNya77DWXwZJxR+ANZ9SNPEQo8yFkLqy90uy7lQRSAjlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777377380; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GN4U75MrK5++kGQdDBCKM2cc5rM9/KoH/abu3wt/hEM=;
 b=f8p7/0rE/J1gT9uNW08MCbiI5Jh59WWTiLx3d7Mq/uVIZeErdPbVyUh868Kan6OeIxsmL
 0eXF1TCP3Cu+LTZZ3mJmzd4BAtb0kLWSnRA1+oFgGofl9QyFowMfKLjZIsiX4xok/O7ShEV
 Ly2iqQiaOT7vsNdBL1AsJyORHQh8gkG0N9PSa/NUFdOmCbM/qPE45CPwUGWKlHKpkdrQaG4
 apCViBOTxw5QH5o9nPxBD8GuuO/mKxsd5ldHjRElnigmZjs+qF4g1XQWimYlaPi3PSQf9bs
 FMFs2dOuPyFjPm/633Q8yzdv0CTuEpzRH9pKAWktWkyiiVCf/kiMCAAYUBWA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7CF7245560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 11:56:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 34FDC10EB3F;
	Tue, 28 Apr 2026 12:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA11E60121;
	Tue, 28 Apr 2026 12:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B8AC2BCAF;
	Tue, 28 Apr 2026 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777378118;
	bh=bx1ifRArObM42P8yCs3Ae3LAphgQ1Y9Mfvr1LOcdNP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DKwT5p8sXqLksai0T4gDZsYJaBgGe5jxxcx4RdviKe4CnegOWRIq6oeEFJ96xctcA
	 HNpcFq0+xxHcc9Gtt0BkKVn3a/ff/5P31tYFcbr7fSLFi8sB0M+tkoJo6XPykqee8J
	 Ssn5NHe6xcqGqLS10l5SAK4FOig28JEOzReRi2lA28uPK/RYRuhBxNhlq//T2uZsVp
	 t7STRp7Nk4KMLQgBxzDqOSAJRLpW3PYptqwXyAbuw8eK3wuRVGXj+wQAxD4/fa0wys
	 OmUUfrBT5XX4rAsNkOWeYSHB125rLT/HpcKoPCAV1GOKs/IvPjCvhQVfDLbFBQJBbQ
	 yOKz9vYE7a1+Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 05/11] rust: io: restrict untyped IO access and
 `register!` to `Region`
In-Reply-To: <DI4QT2U1098S.3K9K7INQ86M0Q@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
 <874ikvqwyd.fsf@t14s.mail-host-address-is-not-set>
 <vYp32vOGPut322JQ-5jSBZQNd6eXvnOvg8b6YDhYcYzBqTBVUvSajCJng33oXSQ9wiMvb62VLERzLYSa4g2pJQ==@protonmail.internalid>
 <DI4QT2U1098S.3K9K7INQ86M0Q@garyguo.net>
Date: Tue, 28 Apr 2026 14:08:05 +0200
Message-ID: <87tssvp9sq.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 2ZIXKPDHD24ZZAQDFDOJHKMQHICAOZDI
X-Message-ID-Hash: 2ZIXKPDHD24ZZAQDFDOJHKMQHICAOZDI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2ZIXKPDHD24ZZAQDFDOJHKMQHICAOZDI/>
Archived-At: 
 <https://lore.freedesktop.org/87tssvp9sq.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Apr 28, 2026 at 10:02 AM BST, Andreas Hindborg wrote:
>> Gary Guo <gary@garyguo.net> writes:
>>
>>> Currently the `Io` trait exposes a bunch of untyped IO accesses, but if the
>>> `Io` region itself is typed, then it might be weird to have
>>>
>>>     let io: Mmio<u32> = /* ... */;
>>>     io.read8(1);
>>>
>>> while not unsound, it is surely strange. Thus, restrict the untyped methods
>>> and also the register macro to `Region` type only.
>>>
>>> The way it is implemented is by adding a generic type to `IoLoc`. This also
>>> paves the way to add typed register blocks in the future; for example, we
>>> could use this mechanism to block driver A's `register!()` generated macro
>>> from being used on driver B's MMIO. The same mechanism could be used for
>>> relative IO registers. These are future opoortunities, and for this patch I
>>> just restricted everything to require `IoLoc<Region<SIZE>, _>`.
>>
>> Does this not prevent `usize` from being used to index anything but
>> `Mmio<Region<_>>`?
>>
>> It is my understanding that the following would work before this patch:
>>
>>    fn do_read(io: &Mmio<u32>) -> Result {
>>        let v: u32 = io.try_read(8usize)?;
>>        Ok(())
>>    }
>>
>> But I think this will no longer work with this patch. Is that the intention?
>
> Your example would always fail, as you're reading 4 bytes from offset 4 from a
> region that is only 4 bytes in size. I suppose you're trying to say
>
>     fn do_read(io: &Mmio<[u32]>) -> Result {
>         let v: u32 = io.try_read(8usize)?;
>         Ok(())
>     }

Yep, that was my intention, with the assumption that final offset
becomes 8*4. I think that is also what would happen here as we would
invoke `try_read::<u32, usize>(&Mmio<[u32]>, usize) -> Result<u32>` with

  usize: IoLoc<u32>
  Mmio<[u32]>: IoCapable<u32>


> ? In any case, it's intended to be unsupported. For types regions you can use
> projection. So the same code can be written as
>
>     fn do_read(io: &Mmio<[u32]>) -> Result {
>         let v: u32 = io_read!(io, [try: 2]);
>         Ok(())
>     }
>
> i.e. reading from index 2 instead of byte offset 8. If one cares about byte
> offset they would probably want to use the register macro instead or having the
> MMIO region untyped.

Right, makes sense. Again, my thoughts were not around the byte-offset,
but the `location` parameter being in count of elements of `T`.

But why remove the ability to call `try_read::<u16, usize>(&Mmio<[u32]>,
usize) -> Result<u16>`?

Best regards,
Andreas Hindborg


