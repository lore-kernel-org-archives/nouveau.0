Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C3DEA3F30
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 10:07:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF33910E544;
	Tue, 10 Feb 2026 10:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmE+/FBO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D6C9041E87;
	Tue, 10 Feb 2026 09:58:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770717501;
 b=w8X1bRIjIk7ZnNlD8ywF1Gidr/A1hj0RXKTsqlt8VvqxoAi8M6N8YjHx0jPdZv+6uJpR6
 8amZ2rUnTJjOmaU1MY6MgUH5ap6/iONPN79DdVjROJRDox8gE4y7RyXlKCS4jqrD0cEjtxW
 vpHmRytBh47scLM2FA78n59fo4mCZr+5LIWtCR8uPkz7h4lP19Ea74KOCSc1XuYSKyS3E//
 gha2WEDgJzdGjOmByIR0EGlv2Z7suvMEd7dbTgFwNb4CD+pD9cdFhINpG41WQp/8br9rP4X
 PEO6QJjXVuwcFV0X7O2e9KmBaM+k+Lg2pRCrbZDejovFviAJ18Z/FQ+280lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770717501; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ECXH4OnMX09YjnTpZAGqjShzFoHs57XYcXZjq8Fx28w=;
 b=hZPZeOYWdqzZH5wcuIWysdLL8J5/egWnEl2sVWH7HmW1BnB9wsnGZ/CNPrb6d+ZCSNNOM
 vPPqJRoK8KkuFbZyo8vIsLg8ruEi4S+pikZVXNoeTTbPlYq9TzQlhhjMio9lRwrjO5tu7Pi
 1WRefUf9L0+uPTir6pHtRsVyXwkL6kwNKOuF0Hn+luxfPNTIEgRJtRxRKrz2r1ihrH/YW01
 p0+vxr/CdjxFseahXi5eFKMhTlIdCUIqmvQ3pgjrwytS5CEGmAUDMAuIrRuZxLYphZuEoMS
 61BRqMCozfnFlBE0aHsu7wYEjT/MHHPrc7+jBGqLcnAaaC6oOunl3rTmgo5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B67F41C69
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 09:58:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB78A10E53B;
	Tue, 10 Feb 2026 10:07:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A21F66013C;
	Tue, 10 Feb 2026 10:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E11BC19423;
	Tue, 10 Feb 2026 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770718068;
	bh=u8PznRMNHUq4nAGBxZMhRsI1nFCYrCQ3fE2qie4jbrc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AmE+/FBOXpx4l68K7mRYkO1VaqodkSC6EYBRpsvdmsAAuCtBUC0Ski789nLR1zq1E
	 TFTDJAvO/WZbEVJGb8S5jNstC+zYelojWUA/Vz701gpxjENKDqf79Whnceiw8FNbBY
	 ut8jot+h95U+T6RJ5kCKlxvUFRclDycYQjjaBjTHT6bLOEcE9HUbcuS+BZFG44DJnu
	 CVAHmq30G99r6V870J6tOn4+Jg52OrlgRgVX3eznZ31pPxPm5cEPxdXhux6nTT538r
	 +/0qFbG/tLyPxoR1S45Ir7yxIN7ouU4u22nUuj5eODPtQ6D7izQW76OuKa/9AuTQs9
	 71HQcI6dvN+Lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:07:37 +0100
Message-Id: <DGB75XMWML8M.DFZY5L52EBQF@kernel.org>
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with
 C linked lists
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-2-joelagnelf@nvidia.com>
In-Reply-To: <20260209214246.2783990-2-joelagnelf@nvidia.com>
Message-ID-Hash: XCE74XWPRXIV4KX65BSFA2DV5NS4JDGV
X-Message-ID-Hash: XCE74XWPRXIV4KX65BSFA2DV5NS4JDGV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XCE74XWPRXIV4KX65BSFA2DV5NS4JDGV/>
Archived-At: 
 <https://lore.freedesktop.org/DGB75XMWML8M.DFZY5L52EBQF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
>  rust/kernel/clist.rs   | 320 +++++++++++++++++++++++++++++++++++++++++

I think we should move this under rust/kernel/ffi/ to make it obvious that =
this
is FFI infrastructure.

> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..8aa72b5d54be
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.

Here and in the struct documentation, I'd suggest to clearly point out the
use-cases, i.e. that this infrastructure is for FFI use-cases only and shou=
ld
not be used otherwise in drivers, etc.
