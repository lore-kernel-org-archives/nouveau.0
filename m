Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62A9E9A04D
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 23:23:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8259F10E642;
	Wed, 18 Feb 2026 23:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nUrVkqPg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 93DDC433F3;
	Wed, 18 Feb 2026 23:13:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771456436;
 b=Lkzydq9lLllFBEqkU+rdHaxf8FGzuA3xT6lkj56geaWcrGbI/zXWnbwJ09gcfK/jExdwO
 JL1itqqWjyun9v/cxxFXOCngGAnrYDxl0odpDOLYElKf1ot66+QGVaroSVUzj/70sYQQmzb
 UTXbjhs6xWdfatlbmB7GPsLNjqvsvt9rjo3baUZbb5HOoaODQs+ai2rd6A2pbUYu/k9si8D
 8jUYc6r6jy9lBimbXy1qF1wq2MOgFKTWOOOSV4i0Tw52tmDp32Yuo6hoVYnd+Ap/e43jm0E
 8ZOr2RyFndoy5069hMq6KAqLBM7yvroV9dO1lvOMZgH/OCg0bFjfBuvCBVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771456436; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nBVjQkJFDX3VjQiW4eWmU8OZmkrJ29qxfRAvYofnZ4U=;
 b=Tsw3Tpf8EflEWBOS7ZHueOwFfn7p/C645d+kCPL4A/aGoGsLAzAsbFDvLCvYRKDDqmpmG
 RLNa0EBYDNFOj84Gx8jDnlbkjV6dI3/Ki3oJTEjy/gNvSNE7nk0WUYGJGQNBufWCdKIFmnm
 3iNdIIT9PLdgQ/0bEmXZYUc39da2HvO2IGyL00uo1zqBoDJwrbFmX+DoE05fFnrIu0xzOU0
 M6/e4NtDHOg0+dHoEUuYLd/xNOCJQvUKVcr+4N06TXZL0XekALDOm4d2fq1wXmu38NmjIqQ
 ndbZf6tOvFMyv7pObC6ve8S+GZ4zPyxEAuSCs6UfJf1NhAghizLJR/2hMIBQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D66ED41E98
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 23:13:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24610E04A;
	Wed, 18 Feb 2026 23:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BFB743FD0;
	Wed, 18 Feb 2026 23:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82C0C116D0;
	Wed, 18 Feb 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771457022;
	bh=q0iO2ljlV0MFFC/vV07sdCxQMgbw432DuvfkuBRn4gM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nUrVkqPgItrxOCe2NunlWOI0X9iDkWaR4VmlQaUZSP4r4ilF6N5RCnEglIFzPNfrL
	 4Z7srVAihVudfix6XmV0DyQ+7aL5Cl5bN6HoaWPId2Hx3+lbkn3enPSIcVDlXlXeeJ
	 bzqHJrtsT6U2EdBGpgqqZ1BQ8Wzkk2esZTl2qqO88aO3DmksX1IXhfx7yHjbT8jzlE
	 xCaZGZYeVeOsRIJGf3FieWCvsNsiFah6GG4LghXL2ZzR4SxsXZlPDJ7Fsn7t+1zx/M
	 BOBYZ8ETtM3cOzHTP3sux4V43fMFPu7kjYnsvvD6gf94xmxXNwFD3vegP/Dn/jxPF4
	 BSeK+u19tQ7yg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 00:23:36 +0100
Message-Id: <DGIH3QYWSOG9.2E6DVO2CNGOHI@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
Message-ID-Hash: 4DT4KHON3XHTD7WHVSVBGV7YNTKHD7DZ
X-Message-ID-Hash: 4DT4KHON3XHTD7WHVSVBGV7YNTKHD7DZ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4DT4KHON3XHTD7WHVSVBGV7YNTKHD7DZ/>
Archived-At: 
 <https://lore.freedesktop.org/DGIH3QYWSOG9.2E6DVO2CNGOHI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> Changes in v3:
> - Addressed the comments and re-instated the PteArray type.
> - PteArray now uses `init` instead of `new` where it writes to `self`
>   page by page.
> - PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_m=
ut`.
>
> I hope I understood everything in the V2 email chain and implemented it c=
orrectly :)

What I meant in the v2 discussion is that we can see how the patch series f=
rom
Gary [1] goes and once landed base this fix on top of it, so we can avoid a=
n
intermediate (conflicting) solution.

If, for some reason, [1] does not progress as expected, we could still fall=
 back
to using as_slice_mut(). So, given that this fix is not super urgent, the i=
dea
is to wait a bit, see how things go and then take the corresponding directi=
on.

But don't worry, this is your first contribution and it is not on you at al=
l --
I should have explained it better.

For now I suggest to wait a bit more, see how [1] goes and then let's follo=
w up
on this.

Thanks,
Danilo

> - Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094=
f78721a@proton.me

[1] https://lore.kernel.org/rust-for-linux/20260214053344.1994776-1-gary@ga=
ryguo.net/
