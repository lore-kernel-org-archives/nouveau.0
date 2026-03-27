Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C0610F2865
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1BA10EF81;
	Fri, 27 Mar 2026 20:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUszrW5j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B1C64532A;
	Fri, 27 Mar 2026 20:47:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774644444;
 b=qea5Ktt2cG4KQYNvmBjBfRDEKh5nLeATwBrCBbVL/58Nl+6q3okCrhavwPTZfSg/yeVaZ
 A3FPSdTkwyZ9KJ8RLSVFXl8KAtZ/nPILWcVlEy7Dx7ZzyvPTpOnNctKsdhB4xgLHwFenTVq
 knpQS4BeLJ66Vy/RxxoKnmjCwmoHpORL6pOvxRGI9duBrpNWsufbYFKv39Izj7HzRKkK+1F
 FRVLuiqWfTOT/6wfb0Bef4K6hBPBQZg+5YnF9SPN0FMdvuYaEEWxf/yuJlxuSVFqXsYpQd7
 D4JJOzEE4Kyq6ynXON34rzFdqWi78jxDY6c4L79MD1aJOhQveohg9lCe7yIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774644444; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=roABbtNrEE8A25dHU1WgsbJ86mMwEBW73hbxmy0umcU=;
 b=z7ZXs9FCtdFZIdG+SxbsUYWOSBzneB+oKUbAFcVfUJPz9MpX8w8Pv4hi6EBXeoAUOJpam
 mEBcbqHKTJps9HaO40iyeHxzvFr6zE/aup2z27vfm/67ZmWnk4YFLP+Z5s3g4PHAn2th3FW
 RBOUXsxvDupRzAopW0z0zw/udL6XLKcFd0inxbo3k4Y1GqiaOICBJ+CJFLfq8ChxF12i9jd
 0veM5R/E1sbn+ydzUw1NCcxvCD7ASfXrJMr7DIIwfuoScJhlfBN0WC/eSPCLtkvhMl96Pu8
 bN4eVUCHz2zfZcHmCtZcus0t4zkvK6bP95bFeD6FDj+1ZzQvsUIMvNlsZefg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB2A4445E1
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 20:47:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9A810EF6B;
	Fri, 27 Mar 2026 20:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC07B600AE;
	Fri, 27 Mar 2026 20:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BE4C2BC9E;
	Fri, 27 Mar 2026 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645112;
	bh=roABbtNrEE8A25dHU1WgsbJ86mMwEBW73hbxmy0umcU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mUszrW5j/RMyayjlk70PmmPBSyQO9a7Fu7fL0GcdYRxxRvyDJphb6mAhBzGgA1pAi
	 6ISM6kKGU3RUI3Fw8doTP5dHgNSkoYH88AsMIxqMinxHH3sMJhhFB3AXSeP65ZIzlj
	 HZEr5K+rDnWqlyJoxjfOIcNqY0kpX1LuVIBtkZONi6Ic6IrmH1MIctOtCOcZDG1lBp
	 ktD2/mEsErY3x6j3wxi66vaRFQM1/OFY2trbR2XG2B5Q5UzIMKIUI3jOU0ZN0xeZlB
	 4ZbH8ZsGakL3VTLRohjUZ9nlrWW3xqNxFBvMddMGA1w04Ntz26gdOsVmVJl1dSy1t3
	 2TXsNy04uufHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:27 +0100
Message-Id: <DHDV6RFKI785.8YH8VOWORAC@kernel.org>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
Message-ID-Hash: 7FQOZVDHO2246HOF7JAD7B2ZPWST7OBY
X-Message-ID-Hash: 7FQOZVDHO2246HOF7JAD7B2ZPWST7OBY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7FQOZVDHO2246HOF7JAD7B2ZPWST7OBY/>
Archived-At: 
 <https://lore.freedesktop.org/DHDV6RFKI785.8YH8VOWORAC@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
