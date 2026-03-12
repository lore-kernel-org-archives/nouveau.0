Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D335106ACD2
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 17:45:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1850810EAA7;
	Thu, 12 Mar 2026 17:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bR29QyOj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8D0F450D7;
	Thu, 12 Mar 2026 17:35:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773336916;
 b=M6bd6Hkew2wMZ6YE4rFG8DUL7KPXOwnyIDyL0fVE3yDCJaejiZSc+/eoOa3ar5JeibNAw
 Fu5nJNsONtYzVTwu/JIUfdBg6puQITeEhYH2oAnLS546PR/m9g1KOCGzRuGdYIbtkczkJDU
 yAPePeJ4JexuKCaSbeMNwh48kl7p/E0BdfUy9wEyy7t1DTx5yxPVv8k3Fs6VCD19qIrr8Go
 c/VDQ3cWGDKMBdK8FowWTH9x7uNVxH9c55sGNFGaO6Uv+BvF+sfq6LBJcOVjqExdTTfEBHX
 pklzu2XYtpClezyRjHk7RkcvFvuKtO08T9DZ9Raui8RhcGVEPl51Ot3ZAqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773336916; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yN4wu+E2tZaY1vV0MhRLhor3CVnYD3xQetgTXhuCJmI=;
 b=VrhGEjmQ2yACYUnfZn23GNc0XBNdgDFbvBA5AueARVpmQHnW7Fvpu2NglOmUunEyJ1v0y
 oyq2IyiYFQeJ/DPhgtgI0HOst1kP0oumAAB4zNduC0WZ1FZiPHfGJIa6HSW21B9jHXEcI5d
 eGILGNevwxofnzAhZiAouuZZDrV1K5aP6rX3Jp09z+WfJqfIlWaPrnYLMTm2hu/PC2o8XRK
 xy9e7xxogVgP2nlWO9X/xnPhDPo7isBtLIg51U5+/kz78Wso/ogXVvUbwfqeoBHyK/SQTCr
 g9fyPjhAuEU3Rfh45YxfAH02NUKG6Tr9klpp+p/lHkp049y27kbykE04cATA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 83AE040696
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 17:35:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 842C710EA81;
	Thu, 12 Mar 2026 17:45:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C77DA61336;
	Thu, 12 Mar 2026 17:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BA7C4CEF7;
	Thu, 12 Mar 2026 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337550;
	bh=924fPqP8+L+UqzjLyzy+niPgmDpAM2woHTsOuNDY1wU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=bR29QyOjk+UQadnDYTttijofj7pT/M32zA2gtbabtCX+vIMEwUUszq0eNQdEp4Pyz
	 5vL0TxE5fOYixb4Zg93Gijky+sEBxiknpT46Qv9W33ZgQ7nOwG3I7rNhWd2se22G2l
	 x9I1fDthxQD5G85C2RrNXF1+KU7pt2Te8Ty8FsaTDLY3d6b5vKdFn8F2fX/fQBBBUv
	 vg7D28qzxs9Ed2pzkzABGwT0MsyBtj+VcLicjBbY8pwIgiNeQEPkNcmkiCTh2H2Knn
	 RDPf/o+mJ+QXHCz0AxSkSVf5L88/s3c9fB9hemAwoFC0DNI9WEVd7iIJY7vnleEXMD
	 gX9z26K4hmQmQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 18:45:38 +0100
Message-Id: <DH0ZOYNAP1CN.1NL9E28UC2C95@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v12.1 1/1] rust: gpu: Add GPU buddy allocator bindings
References: <20260308180407.3988286-1-joelagnelf@nvidia.com>
 <20260309135338.3919996-1-joelagnelf@nvidia.com>
 <20260309135338.3919996-2-joelagnelf@nvidia.com>
In-Reply-To: <20260309135338.3919996-2-joelagnelf@nvidia.com>
Message-ID-Hash: TDOPOLDO4E4YREMRXZPARQYJIYYJZG4E
X-Message-ID-Hash: TDOPOLDO4E4YREMRXZPARQYJIYYJZG4E
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TDOPOLDO4E4YREMRXZPARQYJIYYJZG4E/>
Archived-At: 
 <https://lore.freedesktop.org/DH0ZOYNAP1CN.1NL9E28UC2C95@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 2:53 PM CET, Joel Fernandes wrote:
> Add safe Rust abstractions over the Linux kernel's GPU buddy
> allocator for physical memory management. The GPU buddy allocator
> implements a binary buddy system useful for GPU physical memory
> allocation. nova-core will use it for physical memory allocation.
>
> Christian Koenig mentioned he'd like to step down from reviewer role for
> GPU buddy so updated accordingly. Arun/Matthew agree on the modified entr=
y.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  MAINTAINERS                     |   6 +-
>  rust/bindings/bindings_helper.h |  11 +
>  rust/helpers/gpu.c              |  23 ++
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/gpu/buddy.rs        | 611 ++++++++++++++++++++++++++++++++
>  rust/kernel/gpu/mod.rs          |   5 +
>  rust/kernel/lib.rs              |   2 +
>  7 files changed, 658 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/gpu.c
>  create mode 100644 rust/kernel/gpu/buddy.rs
>  create mode 100644 rust/kernel/gpu/mod.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4c66f8261ff2..b2600dd05fc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8513,7 +8513,9 @@ T:	git https://gitlab.freedesktop.org/drm/rust/kern=
el.git
>  F:	drivers/gpu/drm/nova/
>  F:	drivers/gpu/drm/tyr/
>  F:	drivers/gpu/nova-core/
> +F:	rust/helpers/gpu.c
>  F:	rust/kernel/drm/
> +F:	rust/kernel/gpu/
> =20
>  DRM DRIVERS FOR ALLWINNER A10
>  M:	Chen-Yu Tsai <wens@kernel.org>
> @@ -8926,7 +8928,7 @@ F:	include/drm/ttm/
>  GPU BUDDY ALLOCATOR
>  M:	Matthew Auld <matthew.auld@intel.com>
>  M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
> -R:	Christian Koenig <christian.koenig@amd.com>

This should really be a separate patch as it is unrelated to the addition o=
f the
Rust GPU buddy code.

> +R:	Joel Fernandes <joelagnelf@nvidia.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> @@ -8935,6 +8937,8 @@ F:	drivers/gpu/buddy.c
>  F:	drivers/gpu/tests/gpu_buddy_test.c
>  F:	include/linux/gpu_buddy.h
>  F:	include/drm/drm_buddy.h
> +F:	rust/helpers/gpu.c
> +F:	rust/kernel/gpu/
