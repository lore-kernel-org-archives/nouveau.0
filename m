Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0408D3569E
	for <nouveau@archiver.kernel.org>; Wed, 28 Jan 2026 10:47:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3183510E64D;
	Wed, 28 Jan 2026 10:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u86qh55p";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3C68640B86;
	Wed, 28 Jan 2026 10:38:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769596685;
 b=xNyHm9zMklElrmeVyT5nnsyi+0YemJR8KITKtJcushi3m5Y3WDBBWk+lFsD2XN+jlIIVe
 0hBbwSkCBrB4Ntxdip9XNiocM44ZLoISboviBJsexzEdIHg0Gu4eDDLg+XhL2YUCEB63txx
 jCbKbM8wHOueoTDAdAROwxcLS030TGDFoVpGb5p70khQruvuuOho+RT8QZKa9EkECLQ6fZl
 kO/zvZeMiPSo5vxKm6zJPOgWz0vV0+lvBHjHHj/Pxfkt7HDrJXGFAlY0ejYlIJKUhuCoNg+
 PHpvhy6mxo6wGTpJ7onkVHpLf/aVwdLYNuB23Yavds4pUMr8EKUVdHle0Ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769596685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xKmKGHblPsSZenvqrZey8InJuq6tz0WVn85z4/keYKU=;
 b=DQb5+FB47w0/nt+WH/0CCn1y/NJ77No1hccyG9BU/e3QNZn4RDRfC3pwfCy/cXUFGt+Oy
 z4WNY+cPMr66SF3cOmaJKNDCjrSR9YdAiSqrFiSZYZHgygfCn7cynncsKMMYPy5TdeNR70N
 Qt3gKs/yc/45K6J0ZCCDm3wD4UvkuZebQqdt9LnUikiYXgTj/2Bu/r+l+FBmGmOwxabll3/
 8P2Kt3UDC0fKjlrsW1qMpF1oaBJp2+sf8+UdNOc1NIQsNooCWJu126lByZDUKmDdtbhKAVo
 6exNCvbVnVOfZXgBiXiwWT7as+1hVmdnHzZPE5vHMsqtjZlXZGABeaKyaJuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0D2A940803
	for <nouveau@lists.freedesktop.org>; Wed, 28 Jan 2026 10:38:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C694110E63F;
	Wed, 28 Jan 2026 10:47:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 801ED40733;
	Wed, 28 Jan 2026 10:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C4AF09;
	Wed, 28 Jan 2026 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597224;
	bh=xKmKGHblPsSZenvqrZey8InJuq6tz0WVn85z4/keYKU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=u86qh55pZvVbKWRIoIpanUlPoJfy10TkSP4JTWfZCrSGe+dmfZFd1ZyDBDSycARvb
	 4b4hd+IJLC+jiK0NFDM2B/P80jirpXwKuS358BRWxyrfQx0JBzDzFdOX1boeIDdhg7
	 5eZ0NB0p99mzHigmu9Pgum/eidSNbRpTslQHnwJSBeBCcMPLG+WkgQPBNVd1Yq1DL/
	 QcRZAV3IuKxcbJHc4/LJppHIvUNS2g1G1N5eqRjRi0bUfvjnkwpt9f8IjacXMBk287
	 imvtYpVwXX9UT6SNHwSh2MoaO5fV9WED5g+7E3/ctPEAIkIDylvru7poUlVAfJnvOf
	 yGpRvNmy3yUJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:46:59 +0100
Message-Id: <DG05UZS433N1.378WELIDPRZVE@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
 <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
 <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
 <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
In-Reply-To: <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
Message-ID-Hash: R75B7GV4D4ZIWHYF3IMI2FO2W6KIOM4Q
X-Message-ID-Hash: R75B7GV4D4ZIWHYF3IMI2FO2W6KIOM4Q
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R75B7GV4D4ZIWHYF3IMI2FO2W6KIOM4Q/>
Archived-At: 
 <https://lore.freedesktop.org/DG05UZS433N1.378WELIDPRZVE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 28, 2026 at 9:17 AM CET, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 1:35 PM JST, Eliot Courtney wrote:
>> On Tue Jan 27, 2026 at 3:04 AM JST, Gary Guo wrote:
>>> I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others t=
hink?
>>
>> I think this is very reasonable, since this is part of the rust
>> range syntax so it should be understandable. I also considered the
>> mathematical syntax `[0, MSGQ_NUM_PAGES)`, but not sure if this would
>> be conventional - it does seem that this notation is used in a bunch
>> of places though. Will apply your suggestion in the next version unless
>> there is a definitive convention for this.
>
> Since this is Rust code, the Rust syntax to express ranges (within ``
> quotes) makes sense IMHO.

While I really like the mathematical syntax, I think using the Rust syntax =
is
superior, as it requires zero mental cycles to translate it to what is like=
ly to
be found in the code as well.

(There also have been some considerations of using tools to validate safety
comments or invariants to some extend eventually.)
