Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78984D7976B
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 13:56:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4FC10E399;
	Sat, 31 Jan 2026 13:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxtdhDRa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3CDA540F62;
	Sat, 31 Jan 2026 13:47:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769867254;
 b=yeZopZLxiPlZbr1sbVSLqjOjvInHjAjYRHqwplKRLqsE+xXmA6KwPT5aq8VL2BMZzD62g
 6kNVjzJVzpeAi5Ox7R+PH8py2jWSvGci3WyPgdWQMAh8YkT6GghUHOw9A8yp61+6KwDA2gC
 dNdpaOHai/UBJQrGw/73b41x9TW6nbjrTrNevWcGLWJKuQfiGieHs8BxtaNYFkPrjTX9lOh
 yOjhhkOoDXs6H+rpsniz72x3bw0/oS2A1vfS86Y2cVUbkaiO2O6N94nHE9J1w5UM0KAG6IL
 q8HBMwp1yzfD9izO6QZK9v4hVrZmhKFluey0Tvs9TnwcXW6AtZtxzVQm+8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769867254; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Va3K+D30hZz0SN78oYxnmFtW/3mJg2NP0XZBLy7kYno=;
 b=MxkEOijWcCpJA1xTJZOEsunJgKFoi5XeOD3z5jOJrBrnGjvZV+BXz+nhoWQ8+7LhGlPp2
 35s8nTQdRZ2eavDN1XdBlralJCjOSnGPzlJUKbDXYOS5OvERTDHN2owot52TKx69Exq27/d
 AX9j4OUF65eDYszTglabZmCQXcv+5fOoA0rZSF9lBqSnl710xAHkx1mk+w77kYwQbGEkNFC
 B8xjXTE8x/9Xcbas4xNJ9M713VyZpIuTIBJLkg0ANUG9Q3hVNTY2SBiq+OL6Yxyb8yEslUd
 SbOCyBKAs/8MWtTx2Y55B3tmDTpZ1zZ4RmwictaYsa3hDn082doPAxW9B7dA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E99B64062B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 13:47:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9310E227;
	Sat, 31 Jan 2026 13:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52C99434BD;
	Sat, 31 Jan 2026 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349E6C4CEF1;
	Sat, 31 Jan 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769867800;
	bh=Va3K+D30hZz0SN78oYxnmFtW/3mJg2NP0XZBLy7kYno=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XxtdhDRaTFlFWArBkMQIoiYLwTVbVvlnRVj+oPvTRh6VHhtPmeTeAg0yCVPFs1tTm
	 2a35Vw6bDtIhUW5ADup/M9vKLuZZNdl1jqsnaoKnsmKbXgJN9jt2zqiACkxr48wgs1
	 1mEXdiwB2feodPC0/3tYGW9twh2lDcqpJuNzlTWf7JYwEuZBGxg70IRb+TJ9YgiPtv
	 T75RMvNu5A7rE/1lU0Z9SzPj4GFsBzXQHKhz/KVE2PJPUkwGrqW8nAqhIDOUnV4kp/
	 6N7dzdNBXZh23OKUXsG5ACyh72nzOcTPkU8bmgvP4VRojpviA3rPogml3K+ggpRe99
	 SFvPWcNLbzQtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:56:34 +0100
Message-Id: <DG2TRSA2LOJ4.3PMICD9ORSB5R@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
 <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
In-Reply-To: <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
Message-ID-Hash: XLLHAQZUWNSKW2NYH7PFFOJNJB2RFGDA
X-Message-ID-Hash: XLLHAQZUWNSKW2NYH7PFFOJNJB2RFGDA
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XLLHAQZUWNSKW2NYH7PFFOJNJB2RFGDA/>
Archived-At: 
 <https://lore.freedesktop.org/DG2TRSA2LOJ4.3PMICD9ORSB5R@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Lyude)

I assume something odd is going on with your mail client for people that ha=
ve
been added to a thread later on?

On Sat Jan 31, 2026 at 2:16 PM CET, Alexandre Courbot wrote:
> On Sat Jan 31, 2026 at 9:27 PM JST, Danilo Krummrich wrote:
>> We've just generalized I/O to support arbitrary I/O backends (busses, ba=
cking
>> storage, etc.).
>>
>> With this we can wire up the I/O traits to DMA and generalize the dma_re=
ad() and
>> dma_write() macros accordingly. I.e. we can extend the I/O traits with
>> field_write() and field_read().
>
> With the caveat that the I/O traits for now only support accessing
> primitive types; is the plan to add a function to read any type
> implementing `FromBytes`?

That's exactly what I say above: generalize the dma_read!() and dma_write!(=
)
macros by adding field_write() and field_read() to the I/O traits. :)

For reference, this is where I brought this up originally [1].

[1] https://lore.kernel.org/all/DFOP5BY09539.AFY5L5FV1HNV@kernel.org/

>> (Lyude is going to work on this as a more integrated alternative to iosy=
s_map.
>> It would be good to align with her regarding this work.)
>
> Heads up, I am also doing some plumbing in `io.rs` related to the
> register macro. Maybe we should have a thread on Zulip to discuss what
> everyone is working on.

Done!

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/Generic.20I.2FO.20backends/with/571198078

>> This has the advantage that we don't have to duplicate all this infrastr=
ucture
>> for I/O memory, DMA, etc.
>>
>> I also think that CoherentSlice is too specific of a type. I'd rather ha=
ve a
>> generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backe=
nd for
>> accesses.
>
> For me the main appeal of this patchset is that it provides a way to
> work infallibly with a single object or a fixed-size array. I hope
> that's something we can preserve.

Of course, the generic I/O backend infrastructure is based on the distincti=
on
between compile-time and run-time.
