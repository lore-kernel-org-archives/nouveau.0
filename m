Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1CBEA3F3A
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 10:10:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6E410E545;
	Tue, 10 Feb 2026 10:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KjaZ5ktO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4CC6041E87;
	Tue, 10 Feb 2026 10:00:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770717650;
 b=infDRh1nOy2OCfqvRpS3qFl1mSWvhL7s5vQSAWXHC9KOTDjoenB9f3c5sPZsOqkL8n9Qr
 fCxnN4YneLx8SMJWcWHGvsvFAUjmL280JUYAmLExamlreldZhkWFQZXD1E7sVqZTyIqAhdb
 6BjDrjQuyh9MX0e0fvkgBhnVR9frdUY/0gxxffuBaJKmxMvHRvkOc80jlMQGRGXCcmlFb5r
 Clyg6Zlyz7xlWt2PEw6XvugFpaR/DZIQgdf+Z8hXhfMViQboicqL3d02s9zJ5tHQqCE6oMy
 DHjmqr0nee+cUJNJFWzxgNAPDHXhaH9PAGdNFNDYoNBLmfqWlkW8s7cbtjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770717650; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3tIAdkWTkVpnMp6zRgpAyEGhOex8mV3BoxfJk6Xg8CY=;
 b=YUmEzd1uaydArpKvMjL4o6EEOzHR5nUirwWJIqf0fZk+Yp7xbCT70mrWzL3EHz3PcoJ94
 3gUlxotoXAHhHRfVPkClOC8aJ51LWax0M6i4hs73zfcvRWONo1SiDyorg3DxgZbwyVVh+zj
 bPXj4DXrsiBcP+8UlsGl8gnNTHB8LpKvnJn6RtKQyb/2jJspt130xEPwdddSjqZpbfBA3CY
 PFT1GNq2UX7BZhgp9fgQQom8Vlt6FL/kWwyadu6NthzX6AnxFSDJXNq12shgtTpe5LwCIcc
 HJVQvOqAmU3yybm3klKJSSAZtBCggMzSRArB7t/+86oy5YkVZiMVjDkUM/pw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 78D2F402B7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 10:00:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15CFB10E53C;
	Tue, 10 Feb 2026 10:10:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79A5160137;
	Tue, 10 Feb 2026 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304D5C116C6;
	Tue, 10 Feb 2026 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770718217;
	bh=Y1eJ+A7bQ+DjJKh+pu4y7cwRQw19sr4V6ovNvsHmjOE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=KjaZ5ktO2RwcnVfgIKvTFccsUCApAJjPUj4D8e0ZO3b/KLUWqSj0RGU0HG8GMGMBY
	 /ca+RG3h60JHjlJnxuB/WE1vdfh2hG+sip0oKbsljKs7Y1kANUE/VXUNJ/j44c53gz
	 EQYNofR+tf0/melgx6bEoZ2lBVdRZbX0Tewo9DNVHrwitaRRpZO4yRMIbsHqPT0/Do
	 +Zh0a0G7FJfcZeN9ZeFCiYAzzuFKjPeSW2KDjstvQ06C13LjKiZomFwgWOb1lLjoTP
	 WF0IBAEwIqOKfYua4Pmmk3M+MBi2AmUfFW9dsSgYecM4uLFTuUxaDnyfmp6iru3MSI
	 +pQkxwj3FuECg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:10:06 +0100
Message-Id: <DGB77U0C946C.3F9PUVN5XX912@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH -next v8 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-4-joelagnelf@nvidia.com>
In-Reply-To: <20260209214246.2783990-4-joelagnelf@nvidia.com>
Message-ID-Hash: JXGGGF5QQHFRH6QJMNAHKXWVLVQSAVWY
X-Message-ID-Hash: JXGGGF5QQHFRH6QJMNAHKXWVLVQSAVWY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JXGGGF5QQHFRH6QJMNAHKXWVLVQSAVWY/>
Archived-At: 
 <https://lore.freedesktop.org/DGB77U0C946C.3F9PUVN5XX912@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 527920f9c4d3..c129764daa23 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -3,6 +3,7 @@ config NOVA_CORE
>  	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
> +	select GPU_BUDDY
>  	select RUST_FW_LOADER_ABSTRACTIONS
>  	select AUXILIARY_BUS
>  	default n

NIT: Let's get the 'select' list ordered. :)
