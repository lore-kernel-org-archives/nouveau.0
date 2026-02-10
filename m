Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C041DEB26F1
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 17:15:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADED10E5E4;
	Tue, 10 Feb 2026 17:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DMMK2B2O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE44B41E85;
	Tue, 10 Feb 2026 17:06:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770743183;
 b=gLAzFap4M733SkSm7Y6MYWOg3AbKQ3GA8a+lZl3EZi8OtEzdNxa9ScCNcapz7Ah3jKcew
 TWJ6oAxdVsuglzudHMfyDZtjpgueuyLwJ4ttgvcdOhGm7lsT9HNfQd3PJPulmbuq0fPs0iJ
 fLlOLLkslu3Skye+5Chwf38S8nmqQFaedK4eJHByqhAx2QTyK3uH/cvTmC/RdL6LicLjWsV
 x8ojX9ev7UfgeupcQLP5c7wBB5/DHofcXEOaKRrpRSV2dikrG32Z1NEz9Ng3hRgZHWO09Hk
 0DYtVsXMR2lwSPmQBInn0yuiaSlGClwVv8BzFhAO1ocUMwf6klCaQiTiMhtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770743183; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zSELdI3ZMpySApTCSKxcbm8f2Q19XBDVxgpRrF5SUPU=;
 b=Si0TdgBBQx3KVeFf6dZ/oxK5CYbEhYobLtUdAt/T/bw1BTFb0Fm8qrY2pxXgCjuQhfwWs
 6K5y8pBUQ/JHsFgvT535q9DxyrkPF3q80rWBBoHiC0Kt+fDf6sDYv+w//UsTYF8347NAjZT
 c3BbeZ5Z+D10orXdpHlMzBJXjekbzb9B7MyK9zIcoSIxKDyFPctBn/gCC1bB3zaqV0VDcxj
 XcphOAEUHPPtSfsj+2W4Ix+tPBkD2APHv6Dh3peNVFHulOPNcXWJYaBgQlIByADXVNQWu2r
 4CObOeiENVfDQphhy5iIa6C2ARnpD75L+eZktfZoDs0HMn0vFe3iSuX52lww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 49BF441BC7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 17:06:21 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D010E174;
	Tue, 10 Feb 2026 17:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770743748; cv=none;
	d=zohomail.com; s=zohoarc;
	b=oB4nalvkcbhXErv16Lon26JqfcLOZ5ehE97TOB//5CRQ3KQtK0gQCoM42op5oq+gLlSjwDBUmkO8pgKldPM+KPUazv4ZAVR2TB5YZInJt8Rnxr2fwQlEgte1ahbPcycxtYkD4PR6d8H2HnqQRJvXlrurz3tFolD4jJmpgzSAwqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770743748;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=zSELdI3ZMpySApTCSKxcbm8f2Q19XBDVxgpRrF5SUPU=;
	b=lDDpkILviLfO+RLG7wytd2BjFYFLeiuci2TEOH/2pk2pOyFTPMilgR1FS2MBbpKYfkbEyEEV890F6CTVbl/egUpxFA+rnMvERInW6TCtKqvsvZj4WvvGs7DFv/tfdnZQdjjo71L2AOZ1s+VEF+7t7wiM1a0D9EkHkwT+X6hpXJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770743748;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=zSELdI3ZMpySApTCSKxcbm8f2Q19XBDVxgpRrF5SUPU=;
	b=DMMK2B2OWuhve9GdZRwnlRvNGEokHlylADfDk1zNEwhM+ss8D6Ge67KI9oVqOICN
	wiro7iMOSJBJT2R2jeDorMK/X0Z+qLvebFA+S3Sb1Ro/xlrL4MCLiynLXfm3tK5Nlxo
	3D3NLhWWc58CgZSSqIbuqZmPojmqV4B0Tca3b5UU=
Received: by mx.zohomail.com with SMTPS id 1770743746604450.9668358133772;
	Tue, 10 Feb 2026 09:15:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with C
 linked lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260209214246.2783990-2-joelagnelf@nvidia.com>
Date: Tue, 10 Feb 2026 14:15:23 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <7DC3EF8A-B660-44CC-90DD-1461B7C2DBF0@collabora.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-2-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: 3K4T4L54ZEBT37ME7GCCNSYPC6XUYCU7
X-Message-ID-Hash: 3K4T4L54ZEBT37ME7GCCNSYPC6XUYCU7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3K4T4L54ZEBT37ME7GCCNSYPC6XUYCU7/>
Archived-At: 
 <https://lore.freedesktop.org/7DC3EF8A-B660-44CC-90DD-1461B7C2DBF0@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Joel,

> On 9 Feb 2026, at 18:42, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>=20
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>=20
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>=20
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>=20


Sorry for not replying to your question on v7, I=E2=80=99ve been a bit =
sick recently.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

