Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07496EE20A6
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 15:54:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D7AD310E828;
	Fri,  6 Feb 2026 15:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FkZnrD/o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5A07341B4C;
	Fri,  6 Feb 2026 15:44:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770392679;
 b=tkwwyDD95ktulKABDCRXlSyGDQHwBPMpDZI/dNy9D632LLsfnnaSO2VI/yYb+XspNPWKY
 6oYdyuCoEsRxJIv22fiis5NJ0VpdTfu4U+NUPDzQMZmKTbG7u/TARprh3JwZX+CQxyrV0d1
 cnOJeGqJ3aW2souHeHGumwzPavL96MoPAqXorJSD8C4+5p6oE6DPxdkVus+ZrOIeei92wLn
 ZRDWCYxIppm8dusLBkmY4neJSgErTckhKN3N27Y4gcM7sO1APtvj8XDG9wd7fLW8WOONUIB
 gPFiCAqBDadckxVNjiLQ+Qqkqfs+lNRCnUD/Yq3pScPEFlnKBMIubuRoQquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770392679; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RlqkrWeNhu82PGsTtkCc8hYdwSTLRnm6BOW11+8EbiY=;
 b=HCIWr4g2Nl/mAu6u+DAoFLCEH1ff8vSXsg3WS0uGtzcPT39zcpbEndZLBOYNVkL5YAwG2
 +N71SvdqfbGrfOSr69AwlB1vD1BJ3x/Ho5IVWFjkjrnu1O0bytSnoHrlw6j2uR1uX2d9Kr5
 VbgiWjUPGIJk4o5ZrV6as6pIPlRuZDZMQ+ntQrERRXm59F6lPwJqJuQRaTJqFnlxjL98d4H
 R0qcReCdl2bIvqij1a/OsqXz2+PRg7pQMOHImHENBmHfEy/rApBcya2ENBmep/VA6H9Qks2
 rbp7MdcPbviQ2/AWtkGGMf4ENQeZYcOaKxc2lB72dcUa88z6ZETDSYcjH5zw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 96DF8402CB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 15:44:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA20810E812;
	Fri,  6 Feb 2026 15:53:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A93640654;
	Fri,  6 Feb 2026 15:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA6BC116C6;
	Fri,  6 Feb 2026 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770393238;
	bh=ze8RjpWv8yTJ+WjIu3XKMrMfT9jYoz3Ax+Xr197aMQM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FkZnrD/oa9GtTvMAdifPkms3Wa2QVBnFodZ7xitHhc1s9KkRwwcoYLF0ecmJSskB7
	 qeDNYKEQYz+l5Jcu3IxZBVpluiEeCGi5y6VjEYMLM3+KdVRzOnN7+/3BvItxTMM+Tz
	 JClwqsQv/MCqbahtuBihb6AijUCm3S7rIKYY3VIgb3140k6gtZsyyiUp7giy/FPqvQ
	 WxLb9xC9qzwJcB9LRPLhbkL3hYGTlu9jrv+9jwwpTFefk6U/jgDSGLvrlRyAaNCETU
	 erXhxJQ9whT6WQJUhkxpLOSCQygzOAyUC2J6h9/jl457b5Rcql9PmSSgT4ajwtk/oW
	 ZpzbSTyGfIvkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:53:48 +0100
Message-Id: <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
In-Reply-To: <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
Message-ID-Hash: VHYOFII2WDJH3SAHJVTHCLBADYAUJYK6
X-Message-ID-Hash: VHYOFII2WDJH3SAHJVTHCLBADYAUJYK6
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
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
 Boqun Feng <boqun.feng@gmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VHYOFII2WDJH3SAHJVTHCLBADYAUJYK6/>
Archived-At: 
 <https://lore.freedesktop.org/DG800TDA6OXQ.275PMMS19F1EX@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>> index 22dd29cd50b5..2c3dec070645 100644
>> --- a/drivers/gpu/Kconfig
>> +++ b/drivers/gpu/Kconfig
>> @@ -1,7 +1,14 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> =20
>> +config RUST_CLIST
>> +	bool
>> +	depends on RUST
>> +	help
>> +	  Rust abstraction for interfacing with C linked lists.
>
> I am not sure if we need extra config entry. This is fully generic so sho=
uldn't
> generate any code unless there is an user.

I also don't think we need a Kconfig for this.

In any case, it shouln't be in drivers/gpu/Kconfig.

>> +
>>  config GPU_BUDDY
>>  	bool
>> +	select RUST_CLIST if RUST

If we will have a Kconfig for this, this belongs in the GPU buddy patch.

>>  	help
>>  	  A page based buddy allocator for GPU memory.
