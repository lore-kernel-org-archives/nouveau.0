Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A9EB104B
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 11:20:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBCC10E6B0;
	Tue, 10 Mar 2026 11:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fkJHucYB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0825545016;
	Tue, 10 Mar 2026 11:10:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773141010;
 b=ZVK6mzETeJDbav2R8vBO23NfJ3IfCueQvx7Yu83gPzkKZfV5cbMPfrnzrVAgl1t9rUgLX
 rCra3cnOM0NHHFeYWFjY8VVrK6p3++QfC/osYzn/H5BLe8UjIQfwxqit2huuaOBRK5c+vqM
 X5jY46BsONM9f6pSAEfHPnBHmiAIBR9AZJgtBV/mBVcOQU1HPqLDGNwZBxuqYOKwZ+HoFGU
 v0eIIuNPjjszBWMkj8jtu2z49Ksh5DlpVgs9jCOsfHDz5s69tTOQ5ATNPF15Jmaaz3cB2aJ
 7HlaoHYQmFFFX8X2hUQtaD4iQe1qRLWznQ0d6r873nIiPC1P5GF5hj6cxcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773141010; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EJ1O8k3Yq8RYdcbEWETbephaZE2EV/+leCIQCwE4SoM=;
 b=0I2/quoS6IiApSmgfE5MBl8sPavPc1Eg5VXuZ8HhpucSyPZ2nNtWdAnD4QMiuD//NLsC+
 r4JIIRaUc7l1tsT7LMg1qVJaPuGJmzpQKkls6rX1yLthuhP7RrVQwqfjOaw+0bgMTbhHdGn
 T1GxwTIUDIPJ6LYvcJ6D8lADQRqjvoSV/wSHsKecxzCTceYlVpiHHCZTHFqnkOfDYiQ88wR
 w01uz0z6yA4yKGgRnFw+/pWV3U0BobYc+1jJaBEAcD+daUvp1os0shfd3qx3vWGClatIKyh
 igd2IQTpDo0s7+sjO0hqTfq7ZnhhoBmYjm9dY6hxWWbZIYDTPJzhe5hy9cJA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E379244E0F
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 11:10:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7010E240;
	Tue, 10 Mar 2026 11:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3806E600C4;
	Tue, 10 Mar 2026 11:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB06C2BC86;
	Tue, 10 Mar 2026 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773141639;
	bh=xGjVBeTYpyjTZwX3gFYF54w9+q8HTHPh6xi2cya8jck=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fkJHucYBWZLi6X7ajADYfz3hex8bL9zwxxf+Qg3QdznH8ruuShORbyaf9dUBWKX/k
	 6IMV9Es4zvdNSfxvDlqIMwT7zIdwOLAuxhMhzKIsfgLA6HLecsylVuJDKzGC8cuNkf
	 LgqHol1mk5uZmDxj7FqcxlgCxi3W5AVSAWd7ykXP9sHcykWOuPx5SbDsfELXrF9BHS
	 HmU4OEXbmHGyc37rBbdTcH9za6VVEoNQCk/3piTjjK02V307rPoqT7DWwRSDv7JVAP
	 0V0VL5KLuTW/tKbUB6bq3SmsOuOZ8oIUH2Ct9ebL0+m/iaoiZam6FXuUeTSZYs0enq
	 4owbJQt4gDS8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:20:33 +0100
Message-Id: <DGZ291D7Z9ED.FMSHMARM51HP@kernel.org>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
 <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
 <DGYQ5EYS1LB0.TP93SPR5Q3BX@garyguo.net>
 <DGYQXEUSVZ0Q.23B895V08LWQ5@nvidia.com>
In-Reply-To: <DGYQXEUSVZ0Q.23B895V08LWQ5@nvidia.com>
Message-ID-Hash: DHB22E7QLB2M4FBDCAUO6QJSNVJ3TDBO
X-Message-ID-Hash: DHB22E7QLB2M4FBDCAUO6QJSNVJ3TDBO
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>,
 Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DHB22E7QLB2M4FBDCAUO6QJSNVJ3TDBO/>
Archived-At: 
 <https://lore.freedesktop.org/DGZ291D7Z9ED.FMSHMARM51HP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 3:28 AM CET, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 10:51 AM JST, Gary Guo wrote:
>> On Tue Mar 10, 2026 at 1:40 AM GMT, Alexandre Courbot wrote:
>>> On Tue Mar 10, 2026 at 1:34 AM JST, Tim Kovalenko via B4 Relay wrote:
>>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core=
/gsp/cmdq.rs
>>>> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee=
99038ad10a16e1e32d 100644
>>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Re=
sult<Self> {
>>>> =20
>>>>          let gsp_mem =3D
>>>>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_=
KERNEL | __GFP_ZERO)?;
>>>> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_hand=
le())?);
>>>> +
>>>> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
>>>> +
>>>> +        let start =3D gsp_mem.dma_handle();
>>>> +        // One by one GSP Page write to the memory to avoid stack ove=
rflow when allocating
>>>> +        // the whole array at once.
>>>> +        for i in 0..NUM_PTES {
>>>> +            dma_write!(
>>>> +                gsp_mem,
>>>> +                [0]?.ptes.0[i],
>>>> +                PteArray::<NUM_PTES>::entry(start, i)?
>>>
>>> Does `::<NUM_PTES>` need to be mentioned here, or is the compiler able
>>> to infer it?
>>
>> The function signature doesn't mention NUM_PTES at all, so no. In fact, =
perhaps
>> the `entry` shouldn't be an associated method at all (even if is, it pro=
bably
>> should be of `PteArray::<0>` or something.

I think <0> is probably the best choice for this fix for now.

> I had that thought as well - this calls for a redesign of the `PteArray`
> business - but also didn't want to interfere too much as this fix is
> very much (and quickly) needed. We will probably re-write this once we
> have access to the new I/O code anyway.

Not sure it actually needs a redesign, as I think this just goes away with =
I/O
projections. That's also why I would add the following TODO comment on entr=
y().

	// TODO: Replace with `IoView` projections once available.

I.e. it is just a workaround for now.
