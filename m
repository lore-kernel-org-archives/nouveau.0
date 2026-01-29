Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69621D46C0F
	for <nouveau@archiver.kernel.org>; Thu, 29 Jan 2026 00:02:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7914F10E784;
	Thu, 29 Jan 2026 00:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uyzN/XNr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4C42D40B8C;
	Wed, 28 Jan 2026 23:53:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769644384;
 b=kXhfm12vjqGxSFjRe8JA6vuM4kWAjl2Yv8x5M3dvKiRIDj+QNALgXapmqvNj69K9e2Trj
 IsT9pP0N8hjbWC9ABDji2dgVDvrxiWo25nWqbQbiBjQnlpTVSifWsyqx11HEYgnepP7JtGR
 P3VAzaKtQeQYvq4h2jdbhVmbpfkmM4OLdk6TVL+EmZ22cVoN+F+YFlapPjRdz6zr1u+W6Ak
 OO4toz95lIrjtwK0jWUh9HpCraVfPocC1HAFE2i98g68RDzyB0uDqswh6ac+V9ZkBwVQNGZ
 seOJf7cbTvctA73Sp2bZHaz6aPseC9EdprWBqiwCPaIjNS2ClXS+zdBC7SHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769644384; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=J/qTG4pGilyGtjcne9Wna5dgdSlO8aWgnStkPw5cJ5s=;
 b=bzWzV05Gi6CkbZwx9XubUHrhJSz5nhiG/Rs1mYLDN6C5sUlvOrIxdWhAYee+wFAziLFlh
 SQXUynVHstF7fYNoGW6uxJJ18iGQ+RN39MZ4TLMwwRsE5p/SmOMgIC4yr8AqQJ6ekYUtuF8
 2Dmf6vBSED5l6DtifahoCG1/H+WBDdwvpK1mxz9W0dJOETSgrfL4a+yKiQTAIFXbgZALDCW
 GL8bk4JG0iGFMyDUc/pa5BzRMTRjvEkDStqZWDYdPVO8WWGG4aIWOGcaK4m03gzqmWxwJVL
 Qt47OhfWYC95ZdoiAzCr8NH8kGJrmk07VSxG7oZqYXpeBJnpDwoT/8OZGPGw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 46D73400C6
	for <nouveau@lists.freedesktop.org>; Wed, 28 Jan 2026 23:53:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3401310E0ED;
	Thu, 29 Jan 2026 00:02:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DB5660054;
	Thu, 29 Jan 2026 00:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D92C4CEF1;
	Thu, 29 Jan 2026 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769644922;
	bh=J/qTG4pGilyGtjcne9Wna5dgdSlO8aWgnStkPw5cJ5s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uyzN/XNryhWrkcwztJ1WDKwN2hRmBTjqVOAbay5Pscnv+XQjxVH9M6+HD/FyMGR3K
	 TaHM9mmkVsQZcgRFbQStI4OOiB17+Pc+1XtzMZaameGAmZoU19Ew4kHWBmraxKbs9M
	 wJWQAzCywbHH8zz+cBXS5jx+ozMnDrqk90az1LyFCu6iTt0o0tHpr0DZgRyRLYa9//
	 6+lNbiu3M/msZ7e/cB9u6XpAJJgV/yTK9VVM4FJPIl43xDuVeHACpSTUX6CGD+s5WP
	 HjycssjkDZgJZTrOO9ArKose7tzewQYeNivbhVsN62lQzGPKv0YuDTITCXQP7zUwzW
	 aqiQRk2BQY3sA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:01:51 +0100
Message-Id: <DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org>
Subject: Re: [PATCH RFC v6 00/26] nova-core: Memory management
 infrastructure (v6)
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DG06XUWOJLO5.1ESB8ES6A6081@kernel.org>
 <4540DD73-77BA-45F0-B686-32EB96402717@nvidia.com>
In-Reply-To: <4540DD73-77BA-45F0-B686-32EB96402717@nvidia.com>
Message-ID-Hash: GYDOL5AE5A5GB75HV677LPOROZXQDZSF
X-Message-ID-Hash: GYDOL5AE5A5GB75HV677LPOROZXQDZSF
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GYDOL5AE5A5GB75HV677LPOROZXQDZSF/>
Archived-At: 
 <https://lore.freedesktop.org/DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 28, 2026 at 1:44 PM CET, Joel Fernandes wrote:
> I will split into CList, GPU buddy, and Nova MM as you suggest.

Thanks, together with a proper changelog this will help a lot.

> One question: what version numbers should each split series use? CList wa=
s at
> v3 before being combined, and similar story for GPU buddy and Nova MM. Sh=
ould
> I continue from the last version number they were posted with, or continu=
e
> from v6?

I'd say from the last version is probably best. Maybe you also want to move=
 out
of the RFC stage for some of them.

Thanks,
Danilo
