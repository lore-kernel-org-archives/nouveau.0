Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A4EB26EB
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 23:23:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29BAA10E120;
	Tue, 10 Feb 2026 23:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="musa8IHI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FD8D41E85;
	Tue, 10 Feb 2026 23:14:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770765252;
 b=OLMJiARZSsGz01rwxyE8dHnErhtUKSUpeJ8bxtg9hdBHZ0qK9BH9kxSdywTP2dHMgbMHf
 CLKHrpwg15s38TkfL/h97rd9YoiBIKgQPfLSH0bQGtDQQ9cQM3oRC8EG/xLyGAFjk3emyAz
 zvwC+/qBlrL1ZoOMFIZdGNhaW2Sms6jv6t1ul41HJOsI3KFpCR+zWC8ioFn12apVmlsaHbE
 Aawg2fmTlt56lk1b9L57JyLtNt+4mBC759gmCVWOl5eNwS7ED9vHciPQ4j1NkmNl7krcnQ6
 E8iiBuMCiHEZbI8AJNd7ZBUwHy9kHESkqla+JidNfYZHDoY7BnWg2viskFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770765252; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L1fq07Y3NKppqtD6zZWKB1XndQpou8/CZgny44UWbJA=;
 b=D7pOxdk7WRZ8jDp+VRwxt8/Uc0OVh5yEzoCVyfiduMIpuGUz/CS2snKlTNOQeZ0qJhYrS
 sH9fti5wF2z5EtPlXVn0GNZWwgDjHHep/ICSGA85zFxhI6/utx4X+krmWsngWf4jecIbot9
 lQcF1hFzcIn0fmpc31xf/Jh2yjTVjSq2h3lCfPLxcOoqyAGOmybolco4p1BkjBA5PbkOwdo
 e5tzyHvQT/2N6ECoiU8gVNtBVZKRez+1uY5rCxxo2XXa4JJyyfJkin3gB1cG85wRwHI8cPO
 /fjBsZn49dWjc8b8n3f7jbOHd9S56Q7K/fTg88UUw/AuTCpy7A5nAvbDnk9A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 09530402B7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 23:14:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DEC8110E071;
	Tue, 10 Feb 2026 23:23:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53DCE4422F;
	Tue, 10 Feb 2026 23:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA313C116C6;
	Tue, 10 Feb 2026 23:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770765821;
	bh=L1fq07Y3NKppqtD6zZWKB1XndQpou8/CZgny44UWbJA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=musa8IHInY2ptvn6f+2I9wNr4wSkcaMoi7tvWgvJrjRwuZ6duvL7P4LlZUeDC9xjP
	 C2ldQlogVe2wSrKgujCQC+ksYog5kpHxCjeduamvLTuu/KU3Rht60NlIaStHsfvdCY
	 Gm0k+aUYae7mBczwDzXqJ8EeK6RUVSfHcNTcuX9+Qk0hCxVg/3Z20t62mtnggegdcR
	 TqCnwNZzMukiMcOpSGHnbhH7PpTdrgb7sTaHzd4iXW7SlfZ2UrOcF8pnzUQ7okXkdK
	 Oomu3KUgLkXYmMozRo51bf9glQ6iujODmsvzgDD4YTgN2rtAipVv1y+ciM1+2ZFEHn
	 ZHKOq3zn3H6Og==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 00:23:29 +0100
Message-Id: <DGBO3AS8VHIZ.1UNQTIMO8BGAG@kernel.org>
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator
 bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org>
 <1770754015.1979311.8126@nvidia.com> <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
 <a7140f1d-b4de-412d-88a5-90e76d2200e3@nvidia.com>
In-Reply-To: <a7140f1d-b4de-412d-88a5-90e76d2200e3@nvidia.com>
Message-ID-Hash: SMTBNO2NWSMQXH7WQVH2UPRLUSW6PXMU
X-Message-ID-Hash: SMTBNO2NWSMQXH7WQVH2UPRLUSW6PXMU
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SMTBNO2NWSMQXH7WQVH2UPRLUSW6PXMU/>
Archived-At: 
 <https://lore.freedesktop.org/DGBO3AS8VHIZ.1UNQTIMO8BGAG@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 11:06 PM CET, Joel Fernandes wrote:
> I wasn't implying to give reason to go for more allocations, it is about =
a
> reference to the same allocation that may be required to be shared from m=
ultiple
> objects for whatever reason. But again, currently we don't have a use cas=
e for that.

Sure, I just mentioned it since returning an Arc instead of an impl PinInit
removes the option for drivers to embed additional driver specific data int=
o the
same allocation, i.e. it might set the wrong incentive.
