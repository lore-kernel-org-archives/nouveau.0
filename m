Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A35BEF99E5
	for <nouveau@archiver.kernel.org>; Sat, 14 Feb 2026 00:09:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72F2110E844;
	Sat, 14 Feb 2026 00:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tV504CF8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9AF5242DA9;
	Fri, 13 Feb 2026 23:59:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771027198;
 b=v4vwyAeKZRUWTcd4uqXClTWZnUkicnnyL3MCGUB7Hr6agSpWIK/DSpreu2+a+PhkuLNVf
 g/w0THsEsfZ6+cqL1dt/Qh/rArkyCLWgUuZWojzLmzQsozEKt+EiNOAtPZtsZn+CXUMppCS
 F74Nw8cjT5Ggxn7Q2tjTm3vdwIuvjivFKX8qynwkTK1jiT32A8bUhNjV8zgDCf4krnTywEh
 tikJPeJnZoKShtd31ACAwSLB5e1eyPw3sp6m66U/Vpg5Hh5St+nBX47Sq8Fb/NJH82gimCL
 vC+IPcs1/hVeweFSiXwsboLAPRmicaD/JOlw1lvPJATsO5yoB5tsjDQE/ZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771027198; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xyOf2fWzxOJtK+0/50LLyIpdNvmN+b5hy/uifQGZjmQ=;
 b=BCojNiJsjxIDtQ041y807381wEHmj4OgNyVgoawRMO2BkkjDw+AExJcb4Pi0tQXc6zkq9
 SelXbXeLJf5kOdwgBRR6+Pe/G6LNdBFEeRB+xzdbsFOahjk7W2M5P6Hu6VEfAQz3oD9aS6x
 dTo5joK35+5chM+mvwobUDjJlVMQgv2E904c+fMD9+NO7/otCf+cIaHQiuJ3LF1Yo/wPVdU
 Y4rlvjn8pfya+541Cjh6PCgfugUo+1CoZkBXZs51wJ34CJQaYxWKlL/7aJ4hHmAZRTWAeLt
 1zG9zHJkTXtElDA3xy7TSXA4wt8SsDbKaGcBU4p9/koVsnm0v9HMRzRWpisA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D9EFE4016C
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 23:59:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7959B10E0A9;
	Sat, 14 Feb 2026 00:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4125E437A6;
	Sat, 14 Feb 2026 00:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C12C116C6;
	Sat, 14 Feb 2026 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771027774;
	bh=xyOf2fWzxOJtK+0/50LLyIpdNvmN+b5hy/uifQGZjmQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tV504CF88KgFFS510W5jd2+qGEBjYaza1H2B2t7tNFoBa/mtIW7CZIkMfhRuiYPTC
	 RLI7N7oV+LDSoTXSyuKAl0xIB/QUTFX74G7fFiUhicLCE64SXyXbBsgLQEaeHWIl9H
	 3H82IJgJKq9dMJO2cA1RmKdbMr3MN682E/w/CjGi2D16unBrQAO8f5FuN3ZAJX4eqc
	 0bEgVMYRseIB2dFGRH3UJp+2Zix3Xcw3Kk+NwtPqEevpzOxrd7hutHcAff5K/n8oaT
	 aM4Hd51G1XPaAPML5gsnCbTD4FiKrYScayQfdn1juepXEq19F5f03aTkkcnCRRhOUN
	 hFOBpuP/mnRgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:09:28 +0100
Message-Id: <DGE8Y55O5445.D6KRXL724153@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
In-Reply-To: <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
Message-ID-Hash: CX3W2MWYAMB3QMM2QFSPISXVBH5KSNUM
X-Message-ID-Hash: CX3W2MWYAMB3QMM2QFSPISXVBH5KSNUM
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CX3W2MWYAMB3QMM2QFSPISXVBH5KSNUM/>
Archived-At: 
 <https://lore.freedesktop.org/DGE8Y55O5445.D6KRXL724153@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
> (Sorry Danilo, resending as I didn't hit "Reply All". I was travelling=20
> and not on my usual email setup).

No worries, just noticed it before hitting "send". :)

> If you prefer, I can send out a version with just improved projections wi=
thout
> all the generic I/O improvement stuff.

Yes, that would be great. Otherwise, we can also use as_slice_mut() to avoi=
d
having to touch field_write() directly, but I much prefer the former.

In any case, I'd like to keep the PteArray type. It can at least provide a
function to calculate the value from the DMA address for a given index.

(Would be nice if we'd have something like a dma::Projection<T> type, such =
that we
could have PteArray::init(self: dma::Projection<Self>).)

> I've already suggested that in
> https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/.6=
0Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570456463.
> The issue is that however the PTE array needs the actual DMA address to
> initialize, which Alex and I feel that we shouldn't provide to the initia=
lizer
> when `dma::CoherentAllocation` is not yet constructed.

Ah, indeed -- that sucks.

And yes, it would be super pointless to give out the actual DMA address in =
the
initializer, as it would defeat its whole purpose. :)
