Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EFF506CF
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 13:21:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD79510E526;
	Mon, 16 Mar 2026 13:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BgHkyyN1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 04DFE45142;
	Mon, 16 Mar 2026 13:10:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773666644;
 b=OeHDPwByyO1p3JmyRY82i1nl8gm58X9D6uOMTr9cHV/mgf/gnzNzYzLFb5B6xTANbBtcm
 UBMPVMRLQm4K9KHxaPDMpKIMStKwGplyc2n/3UFbctT8wy8J4ohGym6DLSKVbZXVtHe/gGR
 /YxLPf1RWcqHjXnrK+mBEN8U/c5L9wyfcZDvXY/7FW5eiUMC0NZnm8mcUwlo8lGwQjhQKBR
 nKf2nJdjemRZF7X6k5ZLaXGdiYEpGbKFyODDEWD5NkKuHgoZsE0A5jJQewod7vcMm5ACPvo
 pG9vMlSSVBrhUN94V0JDyImHti71FWGGN7PQF5jQ0ugpvUVOMRq3vgFoDrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773666644; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r8Pt+Pp2Ftl++kbOelkEcmT75Oa144vnnykFTqZCrzY=;
 b=i041wI6CK54n42vcPuoKU8Xc7cJ4XJKGi4iysqYjuX/FrdQ6tXwnROMNa7ZakfVu7Izj+
 fDh348niVZh0IA54JrtKO/4qL2GuoLaRtiniXsVt55Q4daeMKjwzOPn3fioqkX9bCPIpZUy
 mfnZNIgGPdU/MvQVFb2v+vC0m8F7PaDlXQYqu5k6xLnjZjV8xQYqMr0jYItFidzWDMx5MkW
 hSt9qz8XG5s8UpKNn42olE/70xXZSkfgfu/LjqkD8AdIJ5CQB3C6QstWAj+BZ1Vqm7GCUFT
 6gA3wdDNK0oXiIcWSzDIPwnBwyFZWuj1BagYtZ6HnXMFiQX4nuPJauWeTvtA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D172440696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 13:10:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5639E10E522;
	Mon, 16 Mar 2026 13:21:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 846EE60018;
	Mon, 16 Mar 2026 13:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A192C19421;
	Mon, 16 Mar 2026 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773667287;
	bh=r8Pt+Pp2Ftl++kbOelkEcmT75Oa144vnnykFTqZCrzY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BgHkyyN1QaslyLHvC+Ve2AC/4PCTdfxBB0nQW5SmFmq4vmvgATMSTFGi2guHWHrom
	 NCwtnaRCBdxk596/kON8pWMkFEh73gt9eEsoTdPk+VjrxBlRG+6eqImRifqvZvWmrw
	 gBnaWnJSQTnjdPds6RYkcnNB/+lkWxP5GlAoWLJI0cFTEbVaX8wtdk6FV2i0EDEInk
	 B6tMCVeIEFUIyi2DnclChIItrMrXSeYxzKIKDxLdNz5Nu+Qfuh8kCS8dJ/bJbP5WHh
	 BwB7QLxdCuf1PiTV47DUnC4iG/Qy8DyOBUXzsNxS7oJrQ2lLUn9qnBdkM1SZ30Bbyy
	 GS2H+pUiOkAQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 13:21:23 +0100
Message-Id: <DH47AVPEKN06.3BERUSJIB4M1R@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
 <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
 <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
In-Reply-To: <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
Message-ID-Hash: U4Z56QXWLDGX6FXAYINLSD2WEIRNBT5U
X-Message-ID-Hash: U4Z56QXWLDGX6FXAYINLSD2WEIRNBT5U
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U4Z56QXWLDGX6FXAYINLSD2WEIRNBT5U/>
Archived-At: 
 <https://lore.freedesktop.org/DH47AVPEKN06.3BERUSJIB4M1R@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Gary)

On Mon Mar 16, 2026 at 12:44 PM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 7:01 AM JST, Danilo Krummrich wrote:
>> On Mon Mar 9, 2026 at 10:57 PM CET, Danilo Krummrich wrote:
>>> On 2/27/2026 1:32 PM, Eliot Courtney wrote:
>>>> Add general `flush_into_vec` function. Add `flush_into_kvvec`
>>>> convenience wrapper alongside the existing `flush_into_kvec` function.
>>>> This is generally useful but immediately used for e.g. holding RM
>>>> control payloads, which can be large (~>=3D20 KiB).
>>>
>>> Why not just always use KVVec? It also seems that the KVec variant is n=
ot used?
>>
>> (Besides its single usage in GspSequence, which wouldn't hurt to be a KV=
Vec.)
>>
>>> If there's no reason for having both, I'd also just call this into_vec(=
).
>
> I think always using KVVec should be fine, thanks!
>
> For the naming, I think `read_to_vec` may be more conventional for this
> -- `into_vec` implies consuming the object, but if we want to keep the
> warning in `Cmdq::receive_msg` if not all the data is consumed we need
> to take &mut self.

I had another look at this and especially how the SBuffer you refer to is u=
sed.
Unfortunately, the underlying code is broken.

driver_read_area() creates a reference to the whole DMA object, including t=
he
area the GSP might concurrently write to. This is undefined behavior. See a=
lso
commit commit 0073a17b4666 ("gpu: nova-core: gsp: fix UB in DmaGspMem point=
er
accessors"), where I fixed something similar.

Additionally, even if it would only create a reference to the part of the b=
uffer
that can be considerd untouched by the GSP and hence suits for creating a
reference, driver_read_area() and all subsequent callers would still need t=
o be
unsafe as they would need to promise to not keep the reference alive beyond=
 GSP
accessing that memory region again.

(The situation is similar for driver_write_area().)

So, unfortunately, commit 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP comma=
nd
queue bindings and handling") seems broken in this aspect.

This needs to be fixed first, and I think we should probably create a copy =
in
driver_read_area() right away.

I don't want to merge any code that builds on top of this before we have so=
rted
this out.
