Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D262FF8868
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 14:42:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46C6B10ECDE;
	Tue, 28 Apr 2026 14:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L86izWPw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBABB45C9E;
	Tue, 28 Apr 2026 14:29:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777386584;
 b=l5YQGaKzvKJchGStOM4qHopcY9sJ+mnblY410qHYSPZoO5fJIN9SAfZgIHVMGg4II4lUd
 y/XlKazA+ljCn6ri4wFF6GYftpRyKjynF1eXdlAfXoRHSKXlgRcgkM3gIYVGSD1lNIyA9we
 6VaDJ/PCYBiCQzPIPEOFaqGJqp0bwCYoCBIG4Iw1z4cNddZRQ8wmsPp2z5N6fvuc3i5vbbU
 PFMusKC+mgD6NIVd1EOkg/t/BsZsIC3Ay7kD/yzxEy6DiTyYgQOZMF4OyXyPzHB9dYkbV4O
 9UTUjA4Tu92FcHJjqDKyqtwca3CCS2FS7xrRbIzKlx2u2WhhPpWId/lCc3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777386584; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZMOTWHw3xFPjQhDVjAJL6lscujxQPVyZa9V3FU3l114=;
 b=SxPp/ath7MSGuN5RlgZ9wK0c6xY4PbBLm+H75LXZvE2xxbtbdx/MaBfTKNkFtNIMJYQ2/
 iHEkHl1X0TrrH4vcWcymhu3ekDefnSCdB+nN6VuZOcwiBhxU8ufUxURJ++VJCaaSeC3SkFt
 IeuCr03OyAMCThRBp8K+wFrsuAvs8EF1ZUche9IcopC1XogldhK1D3WEDmmmhF+Uha++i7k
 HJDruT0aq3MPogRaqBqaLNNVoiCFZkbln4FABeh7RYkCcA4jwexnIMQtDuKUWGr+PvqlIOA
 pUl+jn7vxL8vTQmfZ+FteJev7HEzlLX9G+Y6197c6VTztm12DeqymoyZc5Fg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9CB8B45C91
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 14:29:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A210E2B5;
	Tue, 28 Apr 2026 14:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F363861119;
	Tue, 28 Apr 2026 14:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD327C2BCB8;
	Tue, 28 Apr 2026 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777387322;
	bh=j9TDaxTAxDjeJyvR+byZsADBd2oV8lsBN3Q0InXYURY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L86izWPwCrWDdFrBS97EC2ayPfon6jIRd1JRHdDR5ndn3D/TUCpsnn+i+Sl83l4HY
	 o2IR+/XduPzcgLd/kuYM79Atz2Fr7WKOJw0Xcn4PBxVD2A+S9VQM+rVLos/E3Kd+Ll
	 0+fTEPViNfywYfzwRj34MpdW+HGTfMRRHEPdJDq59u706zq4qbeq0UUUJeYr2kJN0X
	 uGcl3sU3n7e4Ilq0n/MvPQ2BtepjIL1rjef/wekTkO7QUmgOEIpugmZalznvKa09Z1
	 pOYfsCcAhPPIOWV6S4wKtJOEd9P+nfRnrr8kmwUCgoW2SSzLpTKxxeFRqgCmuVxAcI
	 fUlfAbrfUuwjQ==
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
In-Reply-To: <DI4SY1NXU1XW.2VHPFEKIFBQVW@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
 <874ikvqwyd.fsf@t14s.mail-host-address-is-not-set>
 <vYp32vOGPut322JQ-5jSBZQNd6eXvnOvg8b6YDhYcYzBqTBVUvSajCJng33oXSQ9wiMvb62VLERzLYSa4g2pJQ==@protonmail.internalid>
 <DI4QT2U1098S.3K9K7INQ86M0Q@garyguo.net>
 <87tssvp9sq.fsf@t14s.mail-host-address-is-not-set>
 <DI4SY1NXU1XW.2VHPFEKIFBQVW@garyguo.net>
Date: Tue, 28 Apr 2026 16:41:51 +0200
Message-ID: <87ik9bp2og.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ENWPZYDVRETFHECM4LSZP7LMOYZ4OHBW
X-Message-ID-Hash: ENWPZYDVRETFHECM4LSZP7LMOYZ4OHBW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ENWPZYDVRETFHECM4LSZP7LMOYZ4OHBW/>
Archived-At: 
 <https://lore.freedesktop.org/87ik9bp2og.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Apr 28, 2026 at 1:08 PM BST, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Tue Apr 28, 2026 at 10:02 AM BST, Andreas Hindborg wrote:
>>>> Gary Guo <gary@garyguo.net> writes:
>>>>
>>>>> Currently the `Io` trait exposes a bunch of untyped IO accesses, but =
if the
>>>>> `Io` region itself is typed, then it might be weird to have
>>>>>
>>>>>     let io: Mmio<u32> =3D /* ... */;
>>>>>     io.read8(1);
>>>>>
>>>>> while not unsound, it is surely strange. Thus, restrict the untyped m=
ethods
>>>>> and also the register macro to `Region` type only.
>>>>>
>>>>> The way it is implemented is by adding a generic type to `IoLoc`. Thi=
s also
>>>>> paves the way to add typed register blocks in the future; for example=
, we
>>>>> could use this mechanism to block driver A's `register!()` generated =
macro
>>>>> from being used on driver B's MMIO. The same mechanism could be used =
for
>>>>> relative IO registers. These are future opoortunities, and for this p=
atch I
>>>>> just restricted everything to require `IoLoc<Region<SIZE>, _>`.
>>>>
>>>> Does this not prevent `usize` from being used to index anything but
>>>> `Mmio<Region<_>>`?
>>>>
>>>> It is my understanding that the following would work before this patch:
>>>>
>>>>    fn do_read(io: &Mmio<u32>) -> Result {
>>>>        let v: u32 =3D io.try_read(8usize)?;
>>>>        Ok(())
>>>>    }
>>>>
>>>> But I think this will no longer work with this patch. Is that the inte=
ntion?
>>>
>>> Your example would always fail, as you're reading 4 bytes from offset 4=
 from a
>>> region that is only 4 bytes in size. I suppose you're trying to say
>>>
>>>     fn do_read(io: &Mmio<[u32]>) -> Result {
>>>         let v: u32 =3D io.try_read(8usize)?;
>>>         Ok(())
>>>     }
>>
>> Yep, that was my intention, with the assumption that final offset
>> becomes 8*4. I think that is also what would happen here as we would
>> invoke `try_read::<u32, usize>(&Mmio<[u32]>, usize) -> Result<u32>` with
>>
>>   usize: IoLoc<u32>
>>   Mmio<[u32]>: IoCapable<u32>
>
> No, these methods behave the same as the old try_read32 macros, so these =
are
> absolute byte offsets. I think the fact you're confused is a good indicat=
ion
> that we probably want to remove these methods, or at least make them as
> inaccessible as possible :)

That is probably a good call =F0=9F=98=85 Going over the pieces again, I am=
 not
sure when and where I decided this was an index rather than a byte
offset.


Best regards,
Andreas Hindborg


