Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7240EA3F27
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 10:16:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE210E36E;
	Wed, 11 Feb 2026 10:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ip8Ufoey";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7C9E841E87;
	Wed, 11 Feb 2026 10:06:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770804400;
 b=rNBhHQwBZjr8vxMhu8EQ1LjGzJLx22WeCB3yqf/+bL6LTNx8ET4kXhhp579Cgxr/MGP1p
 sT5oqCqKcrIDm8JNljou9fLrtSb/NXyezDuy9POZZjV/9V+wW/tu4HfduRiQWJC3dXznnpI
 SBiD0yc/kqMuURvR929kTXS7rs6UVz/uvokRoFND7WYxzOWCbKflW3CL/wUT0B+zMMEK4pI
 Ei4MLTcvNna4jDQ4EhuDIVqYEgZZ2Tn4G4QSA7MewKngPFg9RNOaNqb8/+IhQcQ3IZrpdUV
 QrBtyxip5EtfiotKaUHP4crYLgrAwaZzwj++jU9/Xcv5QAi5RSd4Sx1tJx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770804400; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x5rWCQhMKwhkCg1G7zx1EnHpWG9dQHwqUMTYxjsL22U=;
 b=G/j6wvyXzbyY+Fst3mWXbCDOT6ofgJTffvDQn7TjpinKQ08ntw1jL4gxlGZxUz/mIEpeV
 Ht1vptNp1YmCOaCP0Wzxvy00ThlWGK4Kf9ZpjjVY6AkMQcYC8vY8sRZ9+MdEbsxshrhW/Kp
 h21BZrWl1A+7PyoMHE87hPrwhcripiir9ZySwt7kDjiDeQefTX4uANPCLhBqLRcc5p0znv8
 ux3P4j9UDvQcGFfAFKmq/sHZgqmO8muZ1LP2hHpvhSm7XrLlINNqWc+s34msBnFUAdClSXF
 Je0RVcvMLM3j0uV3+asDylgZCUN27gAeaPwP8q1F0aA+ZE/4+fxoVZCxFqww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8D65C4053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:06:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE4B10E36A
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:16:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21F904376D;
	Wed, 11 Feb 2026 10:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32C4C4CEF7;
	Wed, 11 Feb 2026 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804971;
	bh=/ptKmBy7kspACRVtX9kbf2ZmQcL19HctAf/KjpLPts0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ip8Ufoeyby11wAsjwYyvFDjNYqcI8kJO7NhL15LOyxWYhM563UAUktV7Q7RF9gzWR
	 14FuH7SLoYie5I3eEKi8d98d3Y85Pg+Ornkxdt9iVw8f6majr9bAktffe7CT4X+Lgj
	 ORgzBzTYoNVyo2AX+xCugSvD1EL0Z+eTqY8DYuVjZHPwvOLpHkvtZkpCp5Y9tonoEz
	 YpkR9Af7qfCvntVTtMHKdrIFVxKj2e8LCei4LXzQqEx9G73RsLKuiR/Yo0Fb6Ky1hl
	 tqLP6tIUPIg/Lrr7ZAVa5/8vUcSCnWp/bwU5Tr2P0wX6kUpEDl+nSNLZD4jNxPcFxb
	 4/fsIgVnsCNGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:16:05 +0100
Message-Id: <DGC1YYNXOV10.3P1P49DNY20K7@kernel.org>
Subject: Re: [PATCH v4 05/33] gpu: nova-core: factor .fwsignature* selection
 into a new get_gsp_sigs_section()
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-6-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-6-jhubbard@nvidia.com>
Message-ID-Hash: GN72OJIJCMNEDRDG77O3I2B3JJVF3OUE
X-Message-ID-Hash: GN72OJIJCMNEDRDG77O3I2B3JJVF3OUE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GN72OJIJCMNEDRDG77O3I2B3JJVF3OUE/>
Archived-At: 
 <https://lore.freedesktop.org/DGC1YYNXOV10.3P1P49DNY20K7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Keep Gsp::new() from getting too cluttered, by factoring out the
> selection of .fwsignature* items. This will continue to grow as we add
> GPUs.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index bc2243450989..10761716ed93 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
>  }
> =20
>  impl GspFirmware {
> +    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {

Please don't use the 'get' prefix, as it commonly indicates taking a refere=
nce
count.

Let's use something like find_gsp_sigs_section().
