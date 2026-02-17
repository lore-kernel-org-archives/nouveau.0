Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC6EE9A038
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 20:04:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3CAC10E4E5;
	Tue, 17 Feb 2026 20:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="elz53fhM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A3B9433AD;
	Tue, 17 Feb 2026 19:55:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771358105;
 b=GGwqAK2wX24pAbiPa0mifHi/E5EGlyQtRTQP6efwQWEZPy42TtrBX1x3wd6dpw5QIXMuB
 O/0wiVRLni/o6hheSNKGC6R02Ompti5P2FA4q2pDutvSq9zTBc1UqhjkJdsz9RXQTt9nRVS
 Y9wOfkM4MshuXGxSYJ9/Ma5E8QO/RyaeBhAzAuRkFCrNz7Ldx1+7X6tF+MaUKSG48uS3bix
 BxarbZzUlBIB5CMtGu31zRdZBXAtLRCvUFM1cRd9xs2+9kMVrlaxiNBqv8i9Lu2cxGGWBjH
 TGkJK+3zGwOgfj+xd0YuCpTvLeahbnUG3OjvW5QggkdenO9jFmHtN8kVEN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771358105; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HCurQZuFCP5scehi7kspuvqdzoGskfJH4KluSW/C1uA=;
 b=sLnTFNdWXEPHR+b8LpV2JfVZAckDIiWdSuG09AhKcDPf69jAbpPJ0a6vAyB5H/2joDtDZ
 idP1laQpBJbwOe0LjiBEEXx7JqKaDNOHtl92RKXXVPW/RWdg6e8g95OqS5VbvDvvwhMF5fc
 9vGiWAL87lKCoK+X4RPnrNbRblDJtwTSvzffgpI7vZmbfddSAlrypYgiAPlxdqobSFD32WX
 S+3XBGSCMh9lAA1svBW23Bw3pERl0XP07TPli1h2vE51bbFVPaaAYKXjwLozkStm55N/jtk
 dZLQXa7PM65d+lmg2LP3W5RQlucu0nqOsLfLL7d108cqULkRAC46QDxQLyEQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A691840042
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 19:55:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4A2D10E1B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FFF843466;
	Tue, 17 Feb 2026 20:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E247C4CEF7;
	Tue, 17 Feb 2026 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771358688;
	bh=FWGqfACWR6qxzYLdlPeV/jH89j6hrb85/7pyBBauRuk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=elz53fhMadoUxaf0yucK7cWE8T0yYDyexu+ECKKT5miva2MTZ6o0PJllwOv3HLMJx
	 53NKM3gZOiRIs4/9SzgoD9CoLPPVdI9IDkexqk51bRHTNDHpnlSPerMHFtuKMgeH0n
	 kNc219PUvBf4BVDlqT6lSIedY7ZpEMpjxhguFlIyUhiNpVeQB3VkxafVDIN+vNDvTt
	 NBsfoCn/oyCZmMHXVaIqXPbyeoXigz1Amyhd2BvLoQojjMzF3cehe3HRbid5RZCFsI
	 yZttD0J5Z/NJ7Ppa/JLRNHS4+i/y6SCYzeYcwb1WaHJWbhAxfP33ltH3ZbV3gqhywF
	 TX63THKEM3GsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:04:42 +0100
Message-Id: <DGHI8WRKBQS9.38910L6FIIZTE@kernel.org>
Subject: Re: [PATCH v4 25/33] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-26-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-26-jhubbard@nvidia.com>
Message-ID-Hash: 73SHEXVJMQILAJGR62ERPKZWCP55G7KL
X-Message-ID-Hash: 73SHEXVJMQILAJGR62ERPKZWCP55G7KL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/73SHEXVJMQILAJGR62ERPKZWCP55G7KL/>
Archived-At: 
 <https://lore.freedesktop.org/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Hopper, Blackwell and later require more space for the non-WPR heap.
>
> Add a new FbHal method to return the non-WPR heap size, and create a new
> GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
> appropriate value for each GPU architecture.
>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           | 14 +++++++---
>  drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
>  5 files changed, 91 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 3a2b79a5c107..7c502f15622c 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>      }
>  }
> =20
> +/// Calculate non-WPR heap size based on chipset architecture.
> +/// This matches the logic used in FSP for consistency.
> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
> +    hal::fb_hal(chipset)
> +        .non_wpr_heap_size()
> +        .map(u64::from)
> +        .unwrap_or(SZ_1M as u64)

This should use u64::from_safe_cast().

Also, I already brought this up in the context of GPU buddy, I wonder if we
should just add SZ_* constants for 64-bit devices. Shouldn't be too hard to
generate the corresponding code.

I think it is a repeating pattern, and having to use u64::from_safe_cast() =
all
the time seems cumbersome.
