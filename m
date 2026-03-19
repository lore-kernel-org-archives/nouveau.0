Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277791090233
	for <nouveau@archiver.kernel.org>; Thu, 19 Mar 2026 14:14:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3E10E911;
	Thu, 19 Mar 2026 14:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T5MqYvtC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A50145212;
	Thu, 19 Mar 2026 14:04:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773929044;
 b=uBFpUdcsrG5NranrnDb7MiWJTLIkyjndLMAroP/EB6dRWueaYcXXe6rhlE9zUxkOuT3xC
 xs4KatD16Ax0MtRaAuKms3Fg8HgGOnyHQyzOWpQn/JjrGqyzRh5V/fgNifeOiiWdPyTfFAZ
 VMvQjsi0kexawT4m+CYzrk6Os400doyGwW4DMwRxZQDojMyofmRkla664PEstHn2HGzEoz0
 c6CbFbcvLolm8DjD4MiVP+EbSG0ItYm9YPK+csFQUBhHfcmJKzduyH5ZH61fkPWFEI0XBQ9
 J1DU3GIblHVHFNZOQPNLXGz9lFCqo5jDBB0ywnncJIEZV+Ez9zgDzSRShMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773929044; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VC9hynXxBnoI+0NAzGDpMmBY1Ss6w6PNU/nQSnnru4Y=;
 b=XKC7fkTLdMNzT20WnFjydV45uDOP63JW7xOxGhfb1W+7z85RrwrQrf4cKW/wxWSf2yD3E
 K91oIzBV3ZkUjr1YIXa9VPsXy9jIqgkP3WH+Pj/C43Dnykcyo70aSD2CryWW+PxyFgQj09w
 MhZrRJ7DN7M7dpRxB+e113UjbDdfWR0f0x+mLNbxFk7GGWBpW9ramlIwCNrKVDzga0clESK
 +mHILvBGmUHOuYErJT84KHnmzyhM6bRw1d1NpcEZVCM60yRz+yN1gQ9Dz5R7sl4a5pAu0c0
 FKSixQYRNHfttY5hrBbRghy6lAEcBbX/RUDTLOKOo9TAjoL2j2zK/fFoOwiQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4297C44C8D
	for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2026 14:04:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 967F110E136;
	Thu, 19 Mar 2026 14:14:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40B8740C2B;
	Thu, 19 Mar 2026 14:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1DEC2BC9E;
	Thu, 19 Mar 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929694;
	bh=SqniqHh5Ik1ps7BNGsywr1yt7QD7NKi1YUt1MM6i934=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T5MqYvtCT7ObTwXgR2p+nw2yf5V+jHNx77N9Wa8V/HkcqW6Ha2FeMimqYGgMUhCBU
	 6kBq1xNyjH5uH7SKalLKYpssfHb3SSF6+gzYfEG/LJOHLe1MjexccHfUYty2tfOdTn
	 hYc8acTfS4OCrpG/JHMYAM1s+BEJc1vBWkObG8dsJyzfl/H3m8hRGwi3d8McjzCLQI
	 7xnLdjdyAbqPuHB+Fc8r+eyGKsqf8SLwkIbETw6je/4AIV/7KbicJGLGhjvMd6hh8D
	 yyiEj3ayn8EHYJbNR3h2lro6llMjx5mkizS9rfGYwTYB3UyFCdm4hXzFdyfsgjFN4P
	 i6617eR58Z0dg==
Message-ID: <e35fb1b7-266e-48b6-a7cb-3ebe2319605c@kernel.org>
Date: Thu, 19 Mar 2026 15:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YBGROWK5SJR6YU3HVMMGFR6C2L3KECZL
X-Message-ID-Hash: YBGROWK5SJR6YU3HVMMGFR6C2L3KECZL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YBGROWK5SJR6YU3HVMMGFR6C2L3KECZL/>
Archived-At: 
 <https://lore.freedesktop.org/e35fb1b7-266e-48b6-a7cb-3ebe2319605c@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/19/26 1:16 PM, Gary Guo wrote:
>  drivers/gpu/nova-core/bitfield.rs    |  4 ++--
>  drivers/gpu/nova-core/num.rs         |  2 +-
>  rust/kernel/dma.rs                   |  5 +++--
>  rust/kernel/io/register.rs           | 19 ++++++++++++-------
>  rust/kernel/io/resource.rs           |  2 +-

Acked-by: Danilo Krummrich <dakr@kernel.org>
