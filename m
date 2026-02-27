Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A22FEFB43
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 12:08:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B22D410EB24;
	Fri, 27 Feb 2026 12:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mkJy6AXe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA95144CA3;
	Fri, 27 Feb 2026 11:58:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772193508;
 b=lDgx7/KDln6zkx2DFe0MxZ90Pc2/hla1LchiindNHknU+XF5+ghVbCeUMS704gCSkL2Av
 SF7Of1G++MFRquUKRmLBz37Cbs+GrwJZjpJv3UkbPqcOJvw14QW5lxImDIHY+eEr2ScwMFs
 N4ugI2vsknjAJLXk281nLlNwaL4lXlJJ5Z3QPJO/PVNXcH1Zx4nT5XCq55fpu500LF9mDuQ
 9aHn2Dh09PXpvVuMebc467vnotaEuduNBBFCD0VofUsku7WtAWM8irl2FpMzgtWMJTvpYKD
 V03Q+GGZFgIqkMjtHObQMvhB9UElag9a+uiPy3O5RZPB9jTCwey3oTaPKGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772193508; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sZp1YAogc8IAhgPXimjyALa4WX2pf+BS+BAWA6eI/Vs=;
 b=PcGo5P0aj+fBW4H/R0BWcp53AUI9UUMRA4uhuljyZefu0NBcXJb/mcqnEtrFjNZcdPHkG
 gYq9ckIrEu72IHxlXBb8/1+f4BjHOY9UKp0DjRNJXM3M/q4n3gEucWC0fUlbQyPTKGS2HbT
 k0LA3WPWU/hmVqWR4Yf2TDJYJJ98O9E51+U2/fFppwhIx2O0thy8vJquI6M/7mlhLKBOeel
 COLRM/lx+x/IBz/OE0GyRSr0A3eWgy71mK/FBlv+6/BW0xIfi5Zucre7vJsIkaYowamNHJJ
 lPheWkrPQxQ0H0FhBfKYeunLVe1cuDl2du3O1B2rCxpIoNbcBpR9qDl/hWHg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CD31641C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 11:58:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 606CD10EB15;
	Fri, 27 Feb 2026 12:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57BB860008;
	Fri, 27 Feb 2026 12:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C9C116C6;
	Fri, 27 Feb 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772194113;
	bh=qAtzFvPSOXnzfEHHpuXtEDUenZLY4fuD+gHebSXsq+o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mkJy6AXeaXTGR3B/SplKCc80A9j3T4GSxAnM/FQb3BVDZ/9cRaKn+K0MNfFxKz/Le
	 LrtgHk/QA4YaWZ0xFQkk6WEWlx05nIPIjZSUwOUhn9mE7TWheUOHKQ8IBMqSA4UM4/
	 aU3sXixuKTqPjhcewoGvs1a4aDQB54z8QVEVDAMemNhb6pSyUOF/DkBDZlF29HAwsw
	 fl6tdF9JSvAWPHo4UJ5GlMtl13TfgoufVjlda4BXGleiG6TnmaL89WmgkRE3jwOztO
	 p3srgWPCDcw5VgsHjNJtVL0PpHifRLeyRbtT1RQotg8uqPxAZpnEWZC3cyuKmm70Vo
	 Ou45+nkvmx6Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:08:21 +0100
Message-Id: <DGPQDMR88BBG.2RO77IS0XQ0HF@kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
In-Reply-To: <20260224224005.3232841-5-joelagnelf@nvidia.com>
Message-ID-Hash: QQTU5VKCKQXC6A7YFJ74SNT55RU2PCBQ
X-Message-ID-Hash: QQTU5VKCKQXC6A7YFJ74SNT55RU2PCBQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QQTU5VKCKQXC6A7YFJ74SNT55RU2PCBQ/>
Archived-At: 
 <https://lore.freedesktop.org/DGPQDMR88BBG.2RO77IS0XQ0HF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 24, 2026 at 11:40 PM CET, Joel Fernandes wrote:
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 58dbb02c5197..b8287601f464 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -97,6 +97,8 @@
>  pub mod firmware;
>  pub mod fmt;
>  pub mod fs;
> +#[cfg(CONFIG_GPU_BUDDY)]

Has to be #[cfg(CONFIG_GPU_BUDDY =3D "y")] for now.

> +pub mod gpu;
>  #[cfg(CONFIG_I2C =3D "y")]
>  pub mod i2c;
>  pub mod id_pool;
> --=20
> 2.34.1

