Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C78FD4F2A
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 19:57:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1CA10E2D3;
	Tue, 10 Mar 2026 19:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZcMHmmm6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 24B6545022;
	Tue, 10 Mar 2026 19:46:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773171987;
 b=XiWa4JxQew2HPgRzfBkO8pA2mF4BW5DrDkOE4BG0R5IzRG7MdUizSpSdDdARbR61J4yyh
 6y5i6ODZKNnLLB0JERWf8/J/ueyKeOd4Th++6499NSBgoQ89Y5lbQ5KtR2tFcg5EoHmp2f/
 mZc2ldg8TFlmjtCxjKvWdxpmYYmJCB6qzzt0RjsCqY0VuGNASIOyZU+LtfhXPMSOKVr32T2
 xFZpr2AziObzyuDjRrk3QQlzipwYlGkNCdmu7vTokThWCZcabghF5avG+xSMwP6aefZFn6H
 suw0wUMCqI+iWqtjtlfi8vteV/8O84MHyukYBfsqU46SOxxsyvH8UnDTdTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773171987; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cv4yjyzENFU5kEK7DsChrzKxLOB6sFq+2/qynrTyzV0=;
 b=zoLk/x2VG4gZzcpP7Fk3koHNfUg9PVIXND8dRWtcMVm/+4f52eacHDPdbU3exnp/Gqds4
 qkVT7iubgE/nxb5sE1CInQNC4j1wf9DvPd98ADwwFOKTJjG4HMxAGhJEt+M3E6VH2/lv8pw
 DlaI79meSDV2nQ2m/jNEjWVOOMNCO7ftNAaNp3JZ2BPa6X55IeJZxmlY9b/74zRUiJvzH1n
 mL28TcP+kp7wN3x4ZwfvnRqw8tp7zJr+Z4EKaOBVHHuvR9QPpt66Ez5ndiCb8Pi678gR9W+
 dHZUprGSbN+pJcjCJd6eliBvEKmTiqQwk4XBzo+V3Kva4mMadkUxPmTXZQSQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5913344F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 19:46:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3208810E128
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 19:56:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67E7E60054;
	Tue, 10 Mar 2026 19:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF98C19423;
	Tue, 10 Mar 2026 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773172617;
	bh=MVBJnIqJflJGSFwfGDyGrwXlPsLUaoynPyttg2cgWFQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZcMHmmm6VcVdSlzHmiOLIgX+GOoN0DhFXgA19ksUc2hLPskNm24B/04DM/pc19ksH
	 Qy/TrcW7ZBZvBkKcIxRiahTJtv1MOXwtQo5u9GLJFanA9GbI61HtROPkYUex007wJY
	 HeAsAj5QOm7aFwDKQlzG/qT8W6SI9h6kfeXfWPf2bDVp4dj6MMGyeP0clPsp7rWl13
	 jv4pNk7XcyChbAnOX/NtUkWP8gzmJb7t4+hVttZPJCFtAHttuYoJT7Tqas8+/D1+qS
	 OXB8KXZ6MwHIHWQhfIEN3onRfwU+ulC/Biq1zigEnt33kmPvRf1JaycSNxtvEaZ7IB
	 37HhxW/+0QX0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:56:53 +0100
Message-Id: <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203224757.871729-1-ttabi@nvidia.com>
 <20260203224757.871729-3-ttabi@nvidia.com>
 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
 <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
In-Reply-To: <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
Message-ID-Hash: F42DVLPDM2SCF5MYJY3ZD6ZHPOVQNWJA
X-Message-ID-Hash: F42DVLPDM2SCF5MYJY3ZD6ZHPOVQNWJA
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F42DVLPDM2SCF5MYJY3ZD6ZHPOVQNWJA/>
Archived-At: 
 <https://lore.freedesktop.org/DGZD8D623QRZ.BXYEDETBVH84@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 8:52 PM CET, Timur Tabi wrote:
> On Mon, 2026-03-09 at 20:59 +0100, Danilo Krummrich wrote:
>
>> > +=C2=A0=C2=A0=C2=A0 /// Low-level write from a raw pointer. Caller mus=
t ensure ptr is valid for `len` bytes.
>> > +=C2=A0=C2=A0=C2=A0 fn write_raw(&mut self, ptr: *const u8, len: usize=
) -> Result {
>>=20
>> The method has to be unsafe as the caller has to promise that ptr is ind=
eed a
>> slice with len elements.
>
> Ok.
>
>> Another option would be to pass a fat pointer, i.e. *const [u8]. write_d=
ma()
>> would then need to use ptr::slice_from_raw_parts() and the safety requir=
ement of
>> this function becomes that ptr simply has to be valid.
>
> So I tried this approach, but the end result was that write_raw() and wri=
te_slice() were practically
> identical.

That sounds wrong, the only thing that write_slice() needs to do is to forw=
ard
to write_raw(), that's a one-liner and not different to what you have in yo=
ur
patch currently?

> At this point, why bother with write_raw() -- just have write_dma() call =
write_slice():
>
>         let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
>         let slice =3D unsafe { core::slice::from_raw_parts(src_ptr, count=
) };
>         self.write_slice(slice)
>
> I think this is better, but I wanted to get your opinion before I posted =
a v8 with this change.

The problem is that creating a slice of a DMA buffer, that is used by a dev=
ice
concurrently, is undefined behavior. Hence the indirection through write_ra=
w().
