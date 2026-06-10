Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22752CD8CB2
	for <nouveau@archiver.kernel.org>; Wed, 10 Jun 2026 00:20:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9727010E69C;
	Wed, 10 Jun 2026 00:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="kZOwsiH2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 14BF5469E0;
	Wed, 10 Jun 2026 00:06:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781049982;
 b=Ak8oxKeCdsl6lH3lmykkHhM/X9SUwOvM4D4cYMosLMGC8FqMD9QBpCOnH8AQRPcEWWMCP
 fdVZ6yuAHLIZy8DH9s1v/EuDBm9JKYR3HnBacYyyw/MhnbTfu9E5bhi3Ev8i4MSsQ6fNoqL
 6238iUOEiZuosmL4vxljdNdpGCO3Z6ehc7ij0Uzww4aT+Zdv3e6xjEvQIVKeVWPDyqZmE9b
 LypIfPZCOVxUrSjE08M4ommDRcMb0A7wCbCU2tGiGfeA9lhZiMoYBhq7XxAk73qahB21vIG
 1xoRuUKrL1SU0LrGU8mNURO1zw+RDfRL9ktHZIGnipMwNM/ztOA5/b/3oPKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781049982; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=;
 b=cixI/099BJC+rSG7caSskwOoIIUhuPLkvezuQ5RdyH+C6YGsVtEVpKlOJAJgZm3YoMEOa
 aXEwTnyM8nk6UhJOmWh54MLfEaEiWBfWf18RaRUmcFmQ2uIMWuS4vTc4L4YMbepdL8EupUN
 qDsM59ZcOGfdVH92RGtYDvavZ3/2wr2SzDfnaQ0ArKU3+0wfqTmM1PFIAw7srJmk8TH8xQE
 dWdtc/WBmUA5GHCg4BJdBhe83mUYM5ArVYe2Hyvtu0M0W3u2SoFOLlphcb2x/oCXk4CN8gK
 G9ICSbh0RaznI6qfZHwgpXcOhiMXV3vtHc/Mr6rOtvFVIqeDlW+l0w9qOfAQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 56ECF46980
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 00:06:19 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA4110E3A1;
	Wed, 10 Jun 2026 00:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781050811; cv=none;
	d=zohomail.com; s=zohoarc;
	b=Md6nNVHOEmyf92T+nDS9CJqqPti1DRSk4EGTpu6C0HNPBqi7DA1DYIbBx6XVRwZKGYg+7FAMp+zRe7yCffEmmdzShm8ChVUIErNYfWJ2C0Z5rs+Jr8hsTWIn9J8BQuxRZb4sbMgl4VDNNe+Fp/YF9+TLnLcWHr/2HsETWIA/0Fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1781050811;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=;
	b=CtLCFoN/HUmgdMdaKxivguNvewtVOqnOf/GU04aTbIVSPmsAiqq9UfL62Sh1qJdTXzHGhlCky8R8LX2pYa39GqhrE6Q5y6NWBjh3JAboYzSpnuOv/I0JcGJ2wxwR6L9BGZsTO/owZFYHVWFWX4701w6nqoN2HlVw+vD+Fu7sY3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781050811;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=;
	b=kZOwsiH29/dAC81lSN65kYEuoTOcxiFWnRZI3eUfAzUyKksZvENO4jOoeUKfRUoY
	DRrLnkZ+tvZiLYP+qTTiiMl8pibUI+SDHnj/H9Qez+JfTBfn21bbtaEiqZZVW628ZQS
	t+lDFRobsq/ZdrPqaZCGglTpHn7wVk4iLg/THklE=
Received: by mx.zohomail.com with SMTPS id 1781050810087120.3536602556942;
	Tue, 9 Jun 2026 17:20:10 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:20:09 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v19 0/4] Rust bindings for gem shmem
Message-ID: <aiituaFg3i4Qpb-a@um790>
References: <20260608183057.2001376-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
Message-ID-Hash: GZNLXTKZSSTMQZ6EXCMOWDJGLPF353LQ
X-Message-ID-Hash: GZNLXTKZSSTMQZ6EXCMOWDJGLPF353LQ
X-MailFrom: deborah.brouwer@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GZNLXTKZSSTMQZ6EXCMOWDJGLPF353LQ/>
Archived-At: <https://lore.freedesktop.org/aiituaFg3i4Qpb-a@um790/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jun 08, 2026 at 02:29:00PM -0400, Lyude Paul wrote:
> Most of this patch series has already been pushed upstream, this is just
> the second half of the patch series that has not been pushed yet + some
> additional changes which were required to implement changes requested by
> the mailing list. This patch series is originally from Asahi, previously
> posted by Daniel Almeida.
> 
> The previous version of the patch series can be found here:
> 
> 	https://patchwork.freedesktop.org/series/164580/
> 
> Branch with patches applied available here:
> 
> 	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem
> 
> This patch series applies on top of drm-rust-next
> 
> Patch-series wide changes since V15:
> * Fix some major rebasing errors I somehow didn't notice :(
> * Drop the dependency on LazyInit, use the trick that Alice suggested
>   instead.
> * Fix dependency ordering so that Tyr can get the vmap stuff first
>   without the other bits.
> Patch-series wide changes since V16:
> * Fix ordering one more time (SetOnce::reset() doesn't need to come
>   before adding vmap functions)
> * Rebase against the latest DeviceContext changes from me that got
>   pushed.
> 
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()
> 
>  rust/kernel/drm/gem/shmem.rs | 524 ++++++++++++++++++++++++++++++++++-
>  rust/kernel/faux.rs          |  16 +-
>  2 files changed, 524 insertions(+), 16 deletions(-)
> 
> 
> base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
> -- 
> 2.54.0
> 
Thanks, it's working nicely with Tyr. To make this work with [1] I did
have to make a few changes to the KunitDriver and tests, but that
is a separate issue.

[1] [PATCH v2 0/7] rust: drm: Higher-Ranked Lifetime private data
https://lore.kernel.org/rust-for-linux/20260603011711.2077361-1-dakr@kernel.org/

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

