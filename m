Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149EB106ACE3
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:48:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C72E710EAA4;
	Thu, 12 Mar 2026 19:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DaInQI0w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47D54450E1;
	Thu, 12 Mar 2026 19:37:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773344260;
 b=FR7XNCw2F4lsjfCJeFtjUuqxvSERV8FAcpUAJeGqR0DM67ygCQ3iTbTuj7xGgWhNxLeLv
 Y+W+mdDXrsWL9NzgHcxG/AjL9BNd8xTTFn3B6/mewyeQDKcfQifGbUIUctdd2y+5JgzFY1d
 o/QBEDBgmMKUyqoZE6CXGVOxnZGczxJts/Bo4RzpmXnCUHn1cGM92C/xApBDuQpIXlXeldi
 6qGALbf3EqMyN/O/XP1ts67pl6EeN8PDu1NMiiq0UStmpaj6JgLr8eKFqYLYiv6JzMGsJ/v
 Nmx/WtwoeGmSizV3vmqBF4JH/TEEt78EMdKIOQbHcF/fbdnS1GSW4mF/PHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773344260; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wndq8iBCEqRzUT+VKBsxzL58KvDKmHiLNAq3uNeStmY=;
 b=An2igB99HChd+UAoD0vp9kLwrL8VqlBg+5W5nGl1m308tryHN34htyHpIV/oa/XfnP5Gs
 ODpl5B3aHvR48KZ1o4RFS6sRKZEGsjIBgEwlMbbqa0mYF7DuMgSbDM4ycu1qtZw+xRZ4ls0
 e3x3bwrfC11CZzWN/61Jyw7ezxOuW6t8BgmI1Fd2uuGCrimWcJbptHbe5fNvXWbcqtEpDec
 yWvS56MRaWlSROk5W7XsWrzEhOapwNURTXEgrAIndUgRe5udo9BaaLDpdACQ39oPP2j4Zk6
 kCMdqK7EcMtQoSPPfoLPnQG7C3YrhywDLm0cZFM3vIIQfrDOnmix1SDVMQug==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D3C1D45021
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:37:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2FB10EAAA;
	Thu, 12 Mar 2026 19:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E52860054;
	Thu, 12 Mar 2026 19:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC371C4CEF7;
	Thu, 12 Mar 2026 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773344894;
	bh=W4Jp6yZmE/mcvnxtVjIKwwqHA5bULQpY4kKR1xyLVEA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=DaInQI0w8THjKsyVNUtCrsFKt9B8SnzhAhcnxEQd74zVnWaEKzqaQlqtm5PIOqQ8x
	 35p/ZeEduH6tCiaGeWT7HN3g5atUUkye8UMRusIzhCZwpbverPxQAIxesoFXRHpprI
	 VKWCAQktLywIbThs4tVOMOruTssHNEgx1k97Z/40qpHJ8U+y3+m5EZt63NhemfsddD
	 +vYF76/5EdHtTG9mn6F9OHUmH7mKlyo691x5SrUjDre1XdhRfvtAcBvLGGF2dU75OH
	 KZO1bHdpqutDijBfPEgQNnqD8LodGPVas23HmQu8Yl2pxaIzldm8dEQ6DNOW13DduA
	 u7TEnK25KwopQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 20:48:11 +0100
Message-Id: <DH12ASFNVZD0.3986IKB8HOVIK@kernel.org>
Subject: Re: [PATCH] gpu: nova: rename drivers to use kebab-case convention
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310062443.2763230-1-yphbchou0911@gmail.com>
 <99af9d88-05a0-4dcd-85f4-9d5fe9ee6744@nvidia.com>
 <abMJsUpvcUrITCVi@eric-acer> <DH11MBCZFQIJ.33U3GFVI1HFZF@kernel.org>
 <f1398086-ff75-42c8-ad43-97077dd22267@nvidia.com>
In-Reply-To: <f1398086-ff75-42c8-ad43-97077dd22267@nvidia.com>
Message-ID-Hash: FY3MZQJHVJLYGYHVW3JDR3VK7XLA3CA2
X-Message-ID-Hash: FY3MZQJHVJLYGYHVW3JDR3VK7XLA3CA2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FY3MZQJHVJLYGYHVW3JDR3VK7XLA3CA2/>
Archived-At: 
 <https://lore.freedesktop.org/DH12ASFNVZD0.3986IKB8HOVIK@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Mar 12, 2026 at 8:21 PM CET, John Hubbard wrote:
> On 3/12/26 12:16 PM, Danilo Krummrich wrote:
>> On Thu Mar 12, 2026 at 7:45 PM CET, Cheng-Yang Chou wrote:
> ...
>>> Would that work for you?
>>=20
>> I think the module name should ideally match the directoy name, i.e. we =
have
>>=20
>> 	drivers/gpu/nova-core/
>>=20
>> with the module name "nova-core" and
>>=20
>> 	drivers/gpu/drm/nova/
>>=20
>> with the module name "nova-drm".
>
> When p
>
> When people do things like lsmod(1), they don't see the directory
> path for the module source code, so if the name doesn't include
> drm, then no one knows that "nova" implies "nova-drm".
>
> On the other hand, I was OK with just explaining to people that "nova"
> is the upper layer kernel module, and that it's the one that does
> DRM things.
>
> Which is why I'm merely "OK" with the name change, as opposed to
> thinking that it's required.

Just to clarify, I think we should change the directory name and the module=
 name
to nova-drm; the above is what we'd get with the current patch.

>>=20
>> The reason why this is not .../nova-drm/ already is that I figured it wo=
uld be a
>> bit redundant given that "drm" is already part of the path.
>>=20
>> While I don't mind changing this, I wonder what this would mean for the
>> Kconfig, CONFIG_DRM_NOVA_DRM? :)
>
> I also worry that we might not have enough DRM's in that
> CONFIG item. haha :)
