Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA0D79768
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 12:27:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07DA410E1CD;
	Sat, 31 Jan 2026 12:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EHJeQ0It";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3549640F62;
	Sat, 31 Jan 2026 12:18:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769861889;
 b=UH8FWF2ash6j0VNV/2lElzGD+xKrtz4wP9uH6aZc9fcXwLbYTFrvyV9oLungCRYdnTveT
 1DSPqjiI+qRO83RhvYGH9+Tgv/1PcnmByF2KSmmhBkT3egyvtTWSjlc6oNKDx3Asac4xIB/
 Oqa0qIA2KSB3z7ZfS+qJw0m0Ozye8yLffkOczT49yBHrWV0DO+TCJGSaD3gXVDu2+G9lUvv
 TGLC0fLbawTwWu8S6uyQ4cQnEmO2yee3zJbZbv2WNoG1usWrvp5bG4WirLK+p/F2jTicq5l
 PqNJg/2L06ytxbkc8z4DJs7Xv0RGMoEkY4egt9afD9oL0fx83Vd2+2I9ycdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769861889; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2fTkhAUP5p8/EG0o4I2HX5HD4RSHs9zkMP98Fcb/6XM=;
 b=Bi2mRa5aFed9/2ddSpAlowg5pNKJGMGrKKmp5hN+fhPmKaBVsqMTwvD+SI6NaJ52T7Isf
 x3ai32ZLTAIeYOqzlOaO7+az5ab4mTxUhw7qaQJkYGavNjx44m/OS33Wf4rTQzoSg6Qac58
 02VQ47PVaqBzzgjeekXSNwK569MqWjySc+8ZZt/NNMIdwBQ0jnS0fV7Z3MsAQmFBD5e6E/z
 6v2w3yEHYeiu6d8+kozYyA+v0Q2UCbPj3Bgs3YilHJ86+hEjWMsSm2gLqsZXCh0MLSz2ytC
 QDMnkkvgrZYXjli1aRHtHt+tkP2pMlFhIPiIbBsp6wouuBcHUcZsc/lh4uug==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 864F94062B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 12:18:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D37DD10E042;
	Sat, 31 Jan 2026 12:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7D796001A;
	Sat, 31 Jan 2026 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5EFC19421;
	Sat, 31 Jan 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769862432;
	bh=2fTkhAUP5p8/EG0o4I2HX5HD4RSHs9zkMP98Fcb/6XM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=EHJeQ0ItVPSJjv4Jmi+vbS4l02KXRVHbuPygJkkFwtXr/bXADaVsDAgBcvTjog/zi
	 MnL0byblG1dhDo4GmZ4xiinVA3SW+Qq7nXDPipRavAjiim9Kg9JShwQRWcgnYhSK1x
	 HoHqWiXSdA2DLJJDPqmxxueUORw6vAKKrXnOQz/XeMHrrVQgcKFgtttGg5CZUyTMa6
	 +sDqrpjbbST5XynxHPuh+5/Tcf2bu6Rr6Crxoawt/tCrm5bSGeN0tB79mM7p75qS4J
	 VbuKNHuo7vffsGmjuY8XNP8uIGsNk/odg6PPIRoutntFMOUb/5pTU2mpy8raWq2/iK
	 +/caWR1/xwcpw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:27:06 +0100
Message-Id: <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
Message-ID-Hash: F2ALDMQLVZZDHEBIRLK3F45RAYLPVPBG
X-Message-ID-Hash: F2ALDMQLVZZDHEBIRLK3F45RAYLPVPBG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F2ALDMQLVZZDHEBIRLK3F45RAYLPVPBG/>
Archived-At: 
 <https://lore.freedesktop.org/DG2RVAALGX4W.1L637C8NXXEEM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Lyude)

On Fri Jan 30, 2026 at 9:34 AM CET, Eliot Courtney wrote:
> This series extends the DMA coherent allocation API to support compile-ti=
me
> known sizes. This lets bounds checking to be moved from runtime to build
> time, which is useful to avoid runtime panics from index typos. It also
> removes the need for a Result return type in some places.
>
> The compile time size is specified via a marker type: StaticSize<N>.
> Statically sized allocations can decay to runtime sized ones via deref
> coercion for code that doesn't need to know the size at compile time, or =
to
> avoid having to carry around extra type parameters. The implementation
> follows a similar pattern to Device/DeviceContext.
>
> The series defines three type aliases: CoherentSlice<T> (for runtime size=
),
> CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (for
> single object allocations). It also adds infallible dma_read!/dma_write!
> macros and methods to CoherentArray, while prefixing the existing fallibl=
e
> methods and macros with `try_`.
>
> The macros keep the same syntax (i.e.
> coherent_allocation[index].optional_fields =3D expression) even for
> CoherentObject, because the [] syntax is needed to know where to split th=
e
> actual CoherentAllocation object from the fields. This means that
> CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
> alternative is defining a separate macro for single object access, but it
> still would need a way to delineate between the allocation and the fields=
,
> perhaps by using commas (dma_read_obj!(object, fields),
> dma_write_obj!(object, fields, value)). This would be inconsistent with t=
he
> array/slice syntax.

We've just generalized I/O to support arbitrary I/O backends (busses, backi=
ng
storage, etc.).

With this we can wire up the I/O traits to DMA and generalize the dma_read(=
) and
dma_write() macros accordingly. I.e. we can extend the I/O traits with
field_write() and field_read().

(Lyude is going to work on this as a more integrated alternative to iosys_m=
ap.
It would be good to align with her regarding this work.)

This has the advantage that we don't have to duplicate all this infrastruct=
ure
for I/O memory, DMA, etc.

I also think that CoherentSlice is too specific of a type. I'd rather have =
a
generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backend =
for
accesses.
