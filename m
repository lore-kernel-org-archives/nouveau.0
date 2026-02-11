Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9BBEA813E
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 09:19:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFAEC10E346;
	Wed, 11 Feb 2026 09:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aVn6Hz7e";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ECE9E41CAA;
	Wed, 11 Feb 2026 09:09:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770800990;
 b=BBNJb/7CRGa+4aoFtmF+8SKOgsK+RV6m6mmQ+bR50wuVityloQ87vko8QKNrcCnBh5Zvs
 F7Kl0HZwMmV6g7Bbr/9fiKHMKGc7QCoFHYbOxBoSkXkRuH7ilQveTFVEHtR3BeLmkhV20Bp
 jiv/+RM4Hwkzpf7ex1eztU1+lkMLZH5KNWJ+obM+efcc6BE0ZsB4GSfyWus9GgK7reXe2Zm
 TEoLYHDG/c2/UixJfwfc+pMPdwKgBFBxkSzZfG/8SASrb2webO6v9CglLSAZNbKq/oUjDFD
 yR0atCJ9TB0dNaaMtxzys0dQ/KuFjfpVKXn7O5uP1B9J/VxjOcozdS2RKUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770800990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=78vTmn6thDBzfMtB97lbGjUwbhyWjHfpO01rDAwelEE=;
 b=tIiEPV0I6ecsYPm9rrnNf7ApUUUbs15sTjgccfbqxyrZpeY75gmzdxO2CbtjL9hL9jkXm
 tT3tvbCCp56s4JU2OtYyhW97Jth2pSACO4V72XNCI+Ae/aH78CiFieqVprPeWKHgXkRNx40
 fvLqk/ZhWa4q6KLtyez9kHgtOxGc5/0WnOipiCDYJsH9ZBecajxYjza4nGRPnCmMaqpNpUS
 f+uM0+wuZ8V5CbgNbgdmEpHWzztnTILEFMq+Q3DyjZheOLNCUHuTozIv45BK6dES2mQouvL
 Phrx7OXps21uBCVId8YbhArtPemX0L4Bst2UgtOfhcvZXn+mcdpvj0KgX35g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BBA34053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 09:09:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A59110E29E;
	Wed, 11 Feb 2026 09:19:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB1214367A;
	Wed, 11 Feb 2026 09:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC37CC4CEF7;
	Wed, 11 Feb 2026 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770801560;
	bh=78vTmn6thDBzfMtB97lbGjUwbhyWjHfpO01rDAwelEE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=aVn6Hz7exp0YJcrbUnRdD+gd17f1RCAA1sl62249pmqhZS29AgnCdsbpjMH8vQ6gs
	 cSQv5HLMWxo2QDS1hKjJFEG/YQ3uBYw43zlB4S1skWSy39hiqhsDcP+QPulot0nfxO
	 N8j7Uh02sfUFF5Jhx0zgR69nlFtP2B/SzwZCUn2oP0aJmSZAl8Ua0YFXABPQFIKkDM
	 A5yL2AFL3lts4OTxoYgANVJoQuhUr1/6YkJ2GPgK/rEbSvM6fi6j8ESdROE7LSLGad
	 OUlqfK9D+aK85lrsm9/ouuaH1cbTAOZNYb2LkVWX8e2xjyzD6r3ZBk4ldQggiNdhql
	 8+jd/QPt2oy9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:19:09 +0100
Message-Id: <DGC0RDIBDEYB.195QJ6S6GF9WL@kernel.org>
Subject: Re: [PATCH -next v9 0/3] rust: Add CList and GPU buddy allocator
 bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-1-joelagnelf@nvidia.com>
Message-ID-Hash: RSFEUNCEGUU24O4TVJOOYGAJPPCQ7PFB
X-Message-ID-Hash: RSFEUNCEGUU24O4TVJOOYGAJPPCQ7PFB
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RSFEUNCEGUU24O4TVJOOYGAJPPCQ7PFB/>
Archived-At: 
 <https://lore.freedesktop.org/DGC0RDIBDEYB.195QJ6S6GF9WL@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
> Link to v8: https://lore.kernel.org/all/20260209214246.2783990-1-joelagne=
lf@nvidia.com/
> Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagne=
lf@nvidia.com/

I already asked about this in [1], can you please add a changlog to your se=
ries?

[1] https://lore.kernel.org/all/DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org/
