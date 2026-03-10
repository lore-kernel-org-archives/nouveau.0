Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E6EB104A
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 11:02:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B247D10E23D;
	Tue, 10 Mar 2026 11:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nkLecvUF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7204845015;
	Tue, 10 Mar 2026 10:51:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773139904;
 b=fl0pzagZM7W92SxCKKV6BwQ9XdBCWPS2H7B08PssCAKgW8mHXNJQdbSn3V43krI0/0nEC
 zkq/qzw3CGvDk6616fwhOBfExITX1Hx3XeVMAYplvHfBtSrC6H/v2xWP9U7qyHGsj/8cb6B
 zJkBHGyO06cqnQMMRKyVlrVMZ13J3D1K1KMUE5MbyKmJ7Tq6LcryEw22EQ0qa6/SJ4IbtpW
 BYHk1NenzCk6yHxo2LELrOojgmlqN0Sw4SsQF49rBpW35vHYJP3f3GfIGcBUsHPr8uf8bem
 E9r5geCk7H5i/efalhQnCfBjtjRfwjVVURJdO/eRS2rZx+/7Y+SA2zakgyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773139904; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Kt7wtEaRe7yCo91NdAvuNdlI+LWljcfJIg25LvQqTOc=;
 b=jBUZRLRBFjRkK8T7Dko7i9f60TwMCv0dcq65+G9VU+wgfJoofk+MfFj3PLtBOFISHg5WS
 JIMb0bmPI0z0ob+W26lbvL6Oz0HY9/HZTwNHb4Mim5AUF7yf4LUF16+dbWsQpLdWXhU1FEx
 dNNz+lb+BT4gnLTwCp0aLMpArgcjB3OIVdk2scv1nBheAczDy/p7r2f/VuEt9XIF9uzl6zB
 5Dumue0Utb+5KNRBZ6ZZSMTT7/fVhQ0QxmO421+3emY3UHvYlSrlrqknEaqf57Nk9w1zO7W
 UBQEXsCdkkCwARjf3UdRFDjISvJA31/9qU0e8+gv6MElvhqkjjWF4sugDfNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4883E44F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 10:51:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56C2B10E033;
	Tue, 10 Mar 2026 11:02:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D89F4406F;
	Tue, 10 Mar 2026 11:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD46C19423;
	Tue, 10 Mar 2026 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140534;
	bh=dHWlZJmR6/6WkpRMJABXI0hAch+SQenJXJrexpHItY4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nkLecvUF3FTw2CNEygB1r+ArDl5q2EFV/f7A2Tnyxy5F97Swgz7BjLHdBZ4xgs4Pd
	 +MR162o+7KW65dCcF3+It4au4K956ZSYO+dqHOozHa3OpaD9NUNQeVSt2w0QY/JWLR
	 dR9CYt4jEnUnhAJutGIMrZ/5LX2ziIajZzUcWqFPZ/nuY4M/hjNquMiCzoHJrBRr1A
	 qL1q0zvhPNfp2VxifwU4QXf3d3sfvCeJAwigQiStD2fLE8JxwTslrA0bAaHvhUrMHB
	 fJzjfmHQg7g7bE6bwOkAisjslPKn7lBlydMYTlslAgGAFMuLdUv/u3V1FgOA30tINw
	 ATn9HOIlBkB7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:02:10 +0100
Message-Id: <DGZ1UYLTMFQW.1ZBAMJN70OOQI@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
In-Reply-To: <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
Message-ID-Hash: ZGTZHQUDN4WPCRLE6VPDMK6ZYLQXU6KX
X-Message-ID-Hash: ZGTZHQUDN4WPCRLE6VPDMK6ZYLQXU6KX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, acourbot@nvidia.com, aliceryhl@google.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZGTZHQUDN4WPCRLE6VPDMK6ZYLQXU6KX/>
Archived-At: 
 <https://lore.freedesktop.org/DGZ1UYLTMFQW.1ZBAMJN70OOQI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 4:56 AM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 11:01 AM JST, Gary Guo wrote:
>>> +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocatio=
n<GspMem>, count: u32) {
>>> +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_=
PAGES;
>>
>> Not really related to your change, but this `&` probably require a comme=
nt, as
>> it has different behaviour compared to `%` given the `MSGQ_NUM_PAGES` is=
 not
>> power of two. I suppose this is actually intended so there's a way to
>> distinguish between empty and full ring buffer?
>
> This is actually incorrect and I have fixed it here[1]. I think it
> should be merged in drm-rust-next now.

Probably should have been going through -fixes. Anyways, I will fix it up i=
n
this patch too.

> [1]: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-0-2ede85493a=
27@nvidia.com/
