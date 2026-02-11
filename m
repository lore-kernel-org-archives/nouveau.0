Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A28EA813E
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 09:21:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 554B810E35C;
	Wed, 11 Feb 2026 09:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvQ3ewTX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 526A841E84;
	Wed, 11 Feb 2026 09:12:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770801126;
 b=Q/pLpiKwBo8gqUWuV76Mx1H4JB7y8U2zDdNLTjkb6dx9uVIfu1JIfRc8CFA05WoCfeTX8
 /SuAeRvNwV8sYKRN4JgRBPzpPowON/M60qc0DFFn3xLfxZa6YFsnFy0nCHAl17fO3NqB6Tc
 aeLbuO5ywAMP3qcQ5SKVwq6xEIo7SqUKMlmX27c/ngbL7/ZLhly8+RuKoHo0UpTpKCMdKn+
 +6/MCOXMAd1hr6ng1XdvIPVrYQhULsI61JUXYoyUbuefsIzMq9DwqPwXif1tonb04EjgyEn
 0gFz8gZjPucOXE0cPL47hWIE7OxUF7GTSAuPfzMhtUZDsL1dv/z20Vb/ZQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770801126; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=crwR2eDxkz2YAnZv5/hDCKYY/YHdcyT6VTZ9JVUYOL0=;
 b=B160zapPhSguDc3ILJjvRKAXh/26QRb99pLkI5MAemk9hJZJ3Grw8tM5a7ldiFZ1C5Dbh
 jPEQCloK/MOodcO2JVDku6ZY03hbUs83PBYnsDMKwybdGLfYRyDS1XBC0ts7KmFXDV6p0N0
 /eGMilawjzjGkLMv6YLUMTwD3wrffsfoorLMqKwuG/lkkXtVQhYl3PLsdjXUXFKhpTmV03C
 G5/bYlgP6IEb+GxL68jJHkvQTiY1VrLz4f/Tp9q8U21yERXaQMV052UVgWWwpn3FyW1ex20
 QuFCQrQzzTkcplg2sjyHitEQB3P/kfAvFiWZv37d8fP2/PZ/+FTEGaAqjVRA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E0548403C3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 09:12:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96E5310E2C4;
	Wed, 11 Feb 2026 09:21:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F00EB600CB;
	Wed, 11 Feb 2026 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F38C4CEF7;
	Wed, 11 Feb 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770801694;
	bh=bbT8L9yuhCkcKZIt2AwaX5L7rkxzlrBrldrxjRCY6Qc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=WvQ3ewTXZ2lQSqYQAAxvDxZIXx23sQMjCI9kZmySTxXf08I7vSWq2wMpO6JUEUGPl
	 84R832HYeYTEN0Sk2sDTMYgyZkGhgpKuuL7Gt2uee/ViV4W3er/rKoAd6jcx/tqQ19
	 OiCiuHd9MlBlEh9GPY3AlGmbqCZfyIWufwYIkkLGn7LojPEaoyHXlkqjdE3pLOOABq
	 cEOz7Oqh37c+3cpcftV6Nhv8NFmzgTs1tkvuXcpbqOFtPCbG7YslH9I9XRCg0Rs5Bs
	 AN7w3KKk1aPoNzeTaCrUukzHvsI39VzMEwYkAqejXLvG4xov+ipmcO0xKsgvmnwAFG
	 aTpMU/ppeRiXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:21:23 +0100
Message-Id: <DGC0T35RJU05.2TLS17F5B30B3@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH -next v9 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-4-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-4-joelagnelf@nvidia.com>
Message-ID-Hash: AUZAF7GCWXBE6JHRGPMMFVLK7EQ57RBH
X-Message-ID-Hash: AUZAF7GCWXBE6JHRGPMMFVLK7EQ57RBH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AUZAF7GCWXBE6JHRGPMMFVLK7EQ57RBH/>
Archived-At: 
 <https://lore.freedesktop.org/DGC0T35RJU05.2TLS17F5B30B3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
> nova-core will use the GPU buddy allocator for physical VRAM management.
> Enable it in Kconfig.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 527920f9c4d3..6513007bf66f 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -3,8 +3,9 @@ config NOVA_CORE
>  	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
> -	select RUST_FW_LOADER_ABSTRACTIONS

I think moving this should be a separate patch.

>  	select AUXILIARY_BUS
> +	select GPU_BUDDY
> +	select RUST_FW_LOADER_ABSTRACTIONS
>  	default n
>  	help
>  	  Choose this if you want to build the Nova Core driver for Nvidia
> --=20
> 2.34.1

