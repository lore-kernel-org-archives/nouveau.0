Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC78FFF885E
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 11:28:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24510E6E2;
	Mon, 27 Apr 2026 11:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hnrflk4Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BA3D545C6F;
	Mon, 27 Apr 2026 11:16:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777288583;
 b=ABeVrxDXunehHVizDK1KBkJr1axsePQkDeN1MFsw1vUupIyIoDNnAZjI9vVHdXktcY70+
 pie317wfBZmJ1hyN0KbhpXFjElvvCyMIFloxCQp7AC39XA1sV/ppHfeXQHHWb4kjacftcEP
 rJZWNawgphOD0jfcAbiM6mwnChvJ11kBcoTrFLMbJpHngkxbL1RJGZiiBAuN/0jCJIoqugP
 B5lBVJRHN6yicf583OUYMWUTcI7BTEnLUbOZ7APNW3hFhW0vlPVcIq46GP9DWx6CJh9ESFd
 vmX5qED2ZVcW2/257ZtLGBGeFkaU1RGvKcS7QTBNPmle90lmd9zpiE0Yq6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777288583; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0ntWNbklvUzaFLNmsuPMmji7kfRyTy64xl0FVAXz08k=;
 b=PHOEP7lAISS9N/KjtOeP/cuFnZj+VY0Shc0g0ehBJ8zUNSn05iHScTV5MyZmZ+TNugQQ1
 NVY4MDZCxiYSyJ+xvVBInuaH+GDUOxCuSHmcX1+WOpjA4075i/ELcNJie7jl2cF980GTKyu
 /uk1h78iNSibGs9yHI8AXsP+0I5931MRUXiNfC03LcA3EnWdDhJs9TmmjbEBQBDvfhOzADx
 ZifH0F++3JzawcpAL92NB23nSrxyGt1xuBeySNGRb7mpXivE92fFp0GQopAgyxJ8VOl67DX
 qa9gDRCL12ZE1J6Ltj4bAYyK5r/rRjTiG2sUSinMWZte+2H7WeWT7+573ciw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E3CE40F62
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 11:16:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D2CBA10E6DE;
	Mon, 27 Apr 2026 11:28:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAD07404C1;
	Mon, 27 Apr 2026 11:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590C8C2BCC4;
	Mon, 27 Apr 2026 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289320;
	bh=0ntWNbklvUzaFLNmsuPMmji7kfRyTy64xl0FVAXz08k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hnrflk4Qdm/hoBxk6yOl6mcleMj2mciyydKP3x2TywvalzuNUL2clXmwVx1M01F81
	 dHfQAC3sBQEswGY/g59rwWcF9kHVRsO+nIYj2grspkxCLvN8LweCcaeqUfMNpNMzVt
	 /V+ythcZMaiVBj+tdJu7kzNhSj6E4d4dXHrlLENZ8046FuAtCuUdDYP0GAavHXauOb
	 QFhoCqW199YPKadQcJX7qx50jzNhyrp8Saa4GGj1hkesMPLO+D/6NiIZpM4vF9BRD3
	 yF1v6bQ9P+UkMY6O5SXPc2a5Hl3pqnWYEjH+4YwGnwB6LowYXdEr9q1jlKIX3r5FJQ
	 AYb6BErMWmYfg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
In-Reply-To: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <ltBY5QYjK4tx6VmSUSi569gKrxT5ihMyaCPL6NuzcjUQNiX536ppjNAjUP9d5eTTBqcksl_pdY6QQrJ6Oy8rPg==@protonmail.internalid>
 <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Date: Mon, 27 Apr 2026 13:28:01 +0200
Message-ID: <87lde8r6bi.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: NOEW5PHZHN65J3D2FAQ26YVV7BWVUWDW
X-Message-ID-Hash: NOEW5PHZHN65J3D2FAQ26YVV7BWVUWDW
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NOEW5PHZHN65J3D2FAQ26YVV7BWVUWDW/>
Archived-At: 
 <https://lore.freedesktop.org/87lde8r6bi.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> All users have been converted to use keyworded index projection syntax to
> explicitly state their intention when doing index projection.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



