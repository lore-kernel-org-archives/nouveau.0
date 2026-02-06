Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A2EE6B69
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:34:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFE810E950;
	Fri,  6 Feb 2026 22:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LxHZZ03J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B32741B4C;
	Fri,  6 Feb 2026 22:24:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416678;
 b=HGHVrIQYRaVtL36szPz7aRLKtFBq0DEti6alPksZp9qCRjxlLzfgr8sKoILynab9cJabQ
 GrPV+QcyDpm+STgZ631oMRZpYHp8h3iZJD67EUvN3Ksg2TcX5fhk6JLQ8M7/GecP25TIr20
 xytvDiDf36UUei0eMTvraBnChwzE4/oexNqzFPY/eXp7u3DzgcaLJ8fCS16t10bf+1mliUn
 l6Wk7WaD0AhbHzG6uxUhWWF5wcqTGfULPVf0a4l7JOlr7p9K1xwtxmhQY8fyYvtsK/s5hUt
 ke7A5hy6ZFgpJTAffuW8R8UG5swxI1jneeP9+FTTFow/WL//9JFP7MWvd6YA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tc02K9ea6k3a52rZLvnILRHeI4xxmaVSZwRgjd+aJI4=;
 b=vcQWAAbol1OGvvOX5khhoaa4XSNj1kGH7Z8Y19Y2O+SjSAXxcakp3937xfJi1hQ7EwOz4
 deYBO2gKrnyQuF1Sv+wHIlnVMKeQ+9fbbBhfoe/tbXmyS/at4GKRrLLEbdP46eUxrB8E2gy
 zJZwHnV6S//RLVO5Dw/qwunij5wdVgbqXFnD6cSfFBqr6yXd2o4AcxMJEq2jah8x/68FXNi
 9QHB9WCpJdtPuVcKTabZgYN+NwsoAtiFX+XgEapd8LftOM4OBUAwEeY24vsR7nRtGQL4kFQ
 4JqRfD/IL22yrBhZzvph796vG4g3AK4COBEz2VgcXZfjnxkRIdxIlhfHd+dQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 334E24055F
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:24:36 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E802A10E18F;
	Fri,  6 Feb 2026 22:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770417234; cv=none;
	d=zohomail.com; s=zohoarc;
	b=RiExs3bv4Y8H0GNaO34C2uPapynSVMRbvsT5doKr4cOkDCxxL3Hjgim05gX+l6zfycGBZ2ExaPDbNl/o2DN0HNRn4pT/1/vErz3mGPkwjoyc1Is8t6VBysJ9jFz2LGbzGO4aK6GJjcSmGg3OTZb2FINL6mSpNg9jeqewzdXz6lM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770417234;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=tc02K9ea6k3a52rZLvnILRHeI4xxmaVSZwRgjd+aJI4=;
	b=JT+j+YUNy2cWcpE6v/9YDklaQqixjWMof+qoB8V9LQThjMKDcV7e6TVmKIWAWCCiNhUIHWYcm+amncZP+Ad4FrHbGYf4fd6TDjZ8ULczWdJeGqdae29BpL+YtcayHWGETrbT5j8hjAwLY5u09LCs97H4K+VXC9A8wkwiQvC29Go=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770417234;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=tc02K9ea6k3a52rZLvnILRHeI4xxmaVSZwRgjd+aJI4=;
	b=LxHZZ03JDNpDc+8PFnHHYRltxbF/8YH5RjJUuPQHRAC/7Sf1UXgxB2yT7gQd/t+e
	oVa+fMJpJ/Uvp4FX6oa9pKZ5mgQBrNSwAil+Mlu0bTHqCuvOW4lgTGYDEvoAs5fMd5d
	FISZyzqUUxMOdGD7sAsyHylnFw5C4xWLXRRutqqM=
Received: by mx.zohomail.com with SMTPS id 1770417231622597.8188882201408;
	Fri, 6 Feb 2026 14:33:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <983b7db3-b0e6-45d6-866e-f001b64abde1@nvidia.com>
Date: Fri, 6 Feb 2026 19:33:27 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A87E3FC-6A04-4A92-9230-4782D75FC05F@collabora.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <73B64D35-6574-4776-962D-865465C40226@collabora.com>
 <7ed85eca-2a5e-4e8f-8356-e7fbbf7d3a8f@nvidia.com>
 <E846F3BB-DE64-4E6B-ACA3-00F965038478@collabora.com>
 <983b7db3-b0e6-45d6-866e-f001b64abde1@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: VGPHNWDFHZVD4YQC54OEJMFYAF5B7LSW
X-Message-ID-Hash: VGPHNWDFHZVD4YQC54OEJMFYAF5B7LSW
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VGPHNWDFHZVD4YQC54OEJMFYAF5B7LSW/>
Archived-At: 
 <https://lore.freedesktop.org/4A87E3FC-6A04-4A92-9230-4782D75FC05F@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

>>=20
>>=20
>> Yeah, but my point being: is there a reason why the underlying list =
has to
>> remain read-only? Is this a safety requirement or an invariant that =
is established
>> by the code above?
> I'm not fully sure if it's an invariant or a safety requirement, but =
anyone
> creating a C list head on the rust side must guarantee that it is not =
modified.
> Since rust has no visibility on the C side, I believe it is a Rust =
invariant
> here that the existence of CListHead assumes that the list cannot be =
modified
> once Rust has access over it.  That is up to the creator (user) of the =
CListHead
> to guarantee. In the DRM buddy case, once the list is allocated and =
accessible
> from Rust, C code will not modify it while the Rust object exists.
>=20
> Does that make sense, or is there a better way to document this?
>=20
> --
> Joel Fernandes


In which case, I recommend moving this to a safety requirement when
creating the list.

I assume the purpose of not modifying the list on the C side is to avoid
corrupting the list in Rust somehow?

=E2=80=94 Daniel=
