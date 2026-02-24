Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AB2F3C985
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 14:48:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 046D710E5AB;
	Tue, 24 Feb 2026 14:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M0dt8YRY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8DF4843719;
	Tue, 24 Feb 2026 14:37:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771943879;
 b=ZhJv0xJAfh4EBRkcjp2mYGNsnbEDnJVzzFxNRv99dPFSNCuBI6Q4DWhr4AD/lB92rdn9R
 coTuLdeAWHjxs2Pl/rnMO13VdTJsHyBfG4910na9OcDFGSDdNWF3KvkbgWMhrk42zWqbdj5
 pieFtrxz8ZunL/fj9NZVaXQTZxN3P5pCPo4yTMcn0rhUyBDszPOg5LZPFybLpp1zVjN/3no
 aMgFgvvmGUm+iW1kMK34ZFg+JqzhkxbANjvNcj1Ed0MJHY2iQQGASR8DRYV+wE6ZaMKSq+H
 8VU+WE7tjKnhi+K5AniwhhCWW/3k1hheB4+PzDDMFELoUrpC5V/kQxf10VXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771943879; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HEcMMJmXe5bU9X+MoLhNGG2KTnfel7rgGdoNaCK5GCo=;
 b=ScgSKUoVCbbVnhwJno3rSmC51pSvDWYN3ofXvhxrflo7wTsqzN/aoC71mctu71ZRIdw6T
 6x4Rk/WAT+RB/AG7WmeVdjh8HC9pXyrJhTUUk1nsu3wybqp2UrlMSHEnm4bWK1aQgDuLEpN
 eLA8Gu5oDRyCPkYv4SYC3Dlmn8V1kLofnBUfwNl7Q7cv8T9ZQYxjdac71LF1s9sa5XdfT7k
 1gNC7EBPfhkMPwlCTvqXqyCM7aTz/93382b6HVXXXLqGKDj+kR5hALR0w55MT3jwuLgqBdr
 +fsDwuH9TPCg9bH2BeHD3JuuQehkSNPuGglBBzJ5pL9mj8Q65jBMpb4NNItg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 532B040ACE
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 14:37:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 90DE110E5A7
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 14:47:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 302A2438ED;
	Tue, 24 Feb 2026 14:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE78AC116D0;
	Tue, 24 Feb 2026 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944479;
	bh=VISfPsroj9CqNNLmyknkEDkN8jYvZkbvfaoN8GJsuxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M0dt8YRYHPrbnyx3uhNU19gYdoqIoN/XiGW9H++Fve4PwXRaVW1kicA+bbsQgO1Yn
	 BipsDgTygHnHxeakOINj61sk590zY2UuVzR2SN6pKqUBPEejasvWa7A2twGhQvgfz8
	 wqcvMYM0id8wlUkog7xotIYANaFXJ5EwSKXczuEkyOdjgMokKdQmAKdC4r59OiwjND
	 LEGWxGa7CQ7aH5iyZUvzaIzIS1x0NhM4UJyRR/suZL7qqz4TgPJvPOoKGYJ4ryYcer
	 G4oiaF0G3LjdaguBSh0jluKNojlGfp/umEFk7Ju2LbzXnIyz8oqk/JKLcS5wvUW23B
	 oEVfcTipjQLnQ==
Message-ID: <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
Date: Tue, 24 Feb 2026 15:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration for
 multi-GPU systems
To: John Hubbard <jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260221020952.412352-2-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X2E2MIKOSOJCTACLX5QCQNGAP2NC2TJ6
X-Message-ID-Hash: X2E2MIKOSOJCTACLX5QCQNGAP2NC2TJ6
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
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X2E2MIKOSOJCTACLX5QCQNGAP2NC2TJ6/>
Archived-At: 
 <https://lore.freedesktop.org/c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/21/26 3:09 AM, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
> 
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'
> 
> Fix this by using an atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained, but for now, this works very
> nicely.
> 
> This has the side effect of making debugfs[1] work on multi-GPU systems.
> 
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to drm-rust-next, thanks!

    [ Use LKMM atomics; inline and slightly reword TODO comment. - Danilo ]
