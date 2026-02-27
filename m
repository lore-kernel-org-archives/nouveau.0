Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498D5FEFB6A
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 16:06:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8595B10EBCC;
	Fri, 27 Feb 2026 16:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCww8nzk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4BA3C44CB0;
	Fri, 27 Feb 2026 15:55:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772207757;
 b=qqYZ1wePNuUuc1ARpQxn1NpxBNOMbTxRYU+eHZsfW6G0Jwx2O6MUajQrdkfqDRvFJehWu
 +pSY+31ZYF1RTqMQRFP+QwiqoQMx2nl5XdfB8gOCGnqKpTuicdhzAUzmTfFl1RZEH39v9/A
 bMi1PaFvS988AvmSgHKid6fbpgUmunULFjO1jM1MQ8SHB7B2ZsmKdNHfIzxTGOuWmoZFiil
 DP0L5Z7jguLt4x6w6bmAtPHowxWfNziGMuoHbC3E7rgAkOsF/xZAxLkv7eP5VX4yT0JCmyl
 X8jNijTa5UdFla2wgtJ3ANi+6iMwVX1A56DYuEc6pOuqQ2RB7JOKZwAKkdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772207757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+u5bT1TF88szjIwdvy0Wt/X9zJ1mz1ZEXNl1LHrjtZM=;
 b=FK8pnK2gnFke46OmtETRi2VgW3pOZd/dirnVi7/dck8pS7o/2vEqxp4T599BXAGhg0TKH
 UZWDqDwvZ9N6dLGCaUIqHEQHz3tqVyLJfKyAVeAFqppPqR4Ktx3vVsdxW+crsD113T6ucMQ
 0btJDzWqrSfGKZFU6Yn1gWuSmofjWc/TcVymhbqBaHBnxQYs2Esn81OtgHRUMy9ffCrsJ8O
 oAxa45r8XchrFCdhHa8W9c0ViO88G1lbv8751Y4xf6wHd1g6AMjlfQzWw41rXv3R/dH/De2
 YTSs5BrKe37seEk72uW8jw3j1uVgV0EOS19FC9wR+fjZKvFNQfOZ/ymO8ylQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 49AEA41C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 15:55:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0A710EBC8
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 16:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60E1C60008;
	Fri, 27 Feb 2026 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07B7C116C6;
	Fri, 27 Feb 2026 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772208362;
	bh=wyyunZ0riOSV6Xw1dmnP7CmSZ8Rh0E6BV7dz5L6dakM=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=gCww8nzk8MQC2CScyRsrKi5Qu6I5RP3YSjwzdp4kBw6B8dHful7fRLCb/b8kn7OTa
	 gE2LhFsAQP4PBsJinDB67BpI5mdQIfpkU6C6CQR6anLZE6IqYtVE0v8/bAlyBR7oF8
	 neUykMv8vkoEscAldARk1xhA6o+ZyNDBme46WNm4FKWcHvmUS0kBHIczKcr0Vmov0M
	 ie1tMYrO7KdhV3svT/wGQRn6WTKRVKYMrhf/sLJGYvwk4QRpWUZ8RM5cR+gctbk2AL
	 518emV8D16ohQBVyDzHN95ahskFZgnHavsrQ49thL7uTG0x80Tmq7zQc1Ro3n0sFOS
	 ZetQS5dK046ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 17:05:56 +0100
Message-Id: <DGPVFJES9GP4.3R0YQHAQP96EU@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration
 for multi-GPU systems
To: "Gary Guo" <gary@garyguo.net>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
 <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
 <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
 <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>
In-Reply-To: <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>
Message-ID-Hash: KRQQYCVPCCNPOYDNY2ZVQYQ6XBKJ37XQ
X-Message-ID-Hash: KRQQYCVPCCNPOYDNY2ZVQYQ6XBKJ37XQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KRQQYCVPCCNPOYDNY2ZVQYQ6XBKJ37XQ/>
Archived-At: 
 <https://lore.freedesktop.org/DGPVFJES9GP4.3R0YQHAQP96EU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 27, 2026 at 4:41 PM CET, Gary Guo wrote:
> On Fri Feb 27, 2026 at 3:37 PM GMT, Gary Guo wrote:
>> On Tue Feb 24, 2026 at 2:47 PM GMT, Danilo Krummrich wrote:
>>> On 2/21/26 3:09 AM, John Hubbard wrote:
>>>> The auxiliary device registration was using a hardcoded ID of 0, which
>>>> caused probe() to fail on multi-GPU systems with:
>>>>=20
>>>>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/Nov=
aCore.nova-drm.0'
>>>>=20
>>>> Fix this by using an atomic counter to generate unique IDs for each
>>>> GPU's aux device registration. The TODO item to eventually use XArray
>>>> for recycling aux device IDs is retained, but for now, this works very
>>>> nicely.
>>>>=20
>>>> This has the side effect of making debugfs[1] work on multi-GPU system=
s.
>>>>=20
>>>> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>>>>=20
>>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>
>>> Applied to drm-rust-next, thanks!
>>>
>>>     [ Use LKMM atomics; inline and slightly reword TODO comment. - Dani=
lo ]
>>
>> Danilo, can you drop this patch from drm-rust-next?
>>
>> The patch that is supposed to be queued is
>> https://lore.kernel.org/rust-for-linux/20260205221758.219192-1-jhubbard@=
nvidia.com/#t,
>> which does correctly use LKMM atomics and add comments about possible us=
e of
>> XArray.
>>
>> In fact, I am not sure why this patch carries my R-b.
>
> Hmm, actually this patch contains updated comment but somehow have LKMM a=
tomics
> changed back to Rust atomics. Not sure what happens. Anyhow that patch sh=
ould be
> picked instead.

I picked up the latest version of this patch and fixed up the LKMM atomics,=
 i.e.
the result should be correct:

https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/d3f36fa57aa289c43e0=
1da16c928a2cd971ad5dc

Looks like I could have picked v2 instead, as it seems to be identical exce=
pt
that it already uses LKMM atomics.

@John: For the future, please don't send patches in multiple series / ways.=
 I
think there was no reason to include the patch in this series in the first
place.

Thanks,
Danilo
