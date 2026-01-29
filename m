Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700E8D46C16
	for <nouveau@archiver.kernel.org>; Thu, 29 Jan 2026 00:09:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0AC10E78C;
	Thu, 29 Jan 2026 00:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MiZ6emPL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D5B2A40B8C;
	Thu, 29 Jan 2026 00:00:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769644834;
 b=PZrfJEdlb29pFDbYaxHx/HGm+Dm0eXsgb92+Ilw/w1u+ug4pNCxVqbY/1cG0d/cVSkySU
 105ErlwOLy7Bx5b7rqwfUO9le2em6zYyEf9GGuZ6Ytf+uu0nVOXpwrGxiMXmdtM3R+5lRVN
 iIpZ/yiuxmzAPFXTm3FI1RRyxS3qUsrAnXRZRvF66/w79B4CWQQeSU9+pv7LSo1AampHgRL
 0I5M0DliM5pG6cVxakUtiE3SfxjyjLuO8jafChWTyfP5YaH7sUvMA/Uaa8TbJtQohjIOjVV
 R5asGbhoFZqypNFxoX2+SjlHmfwoKlzGIbNOhcFl5WFXaNevlPvoxF65LSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769644834; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O26J1s5Vkn3ZIo+TJ6RWrG8FREowg2fIx+LLm20XLlc=;
 b=cczG44FJkitZUHeL55qS8Pv1nMMlvXCqGR2T+OganKT+powecSThEGSwKx+pa6hVD9RYU
 hHPvL/yalCRW+k/jUlC2/F1PKlSBl5lsRPIEIYoyQDEjXBD/pg1+8P9RnZHr3GLaBsYUZbo
 DdmOhDrSqAYHwazcrS0/F6+QRRR6gCDP00t+3OPyAXRgScghWL5dKDLRy7BHzCShdsCVwbr
 o+FMOictL9FsWQo5zlXn5GwipsZ9zLE4DeblKIXn4pur+qi/5fn8eegp42oVljiO0F6nkz+
 8p4IHPt995fNaAAcNvZqt08rc/cTQwkPkOTZYvDpAWRKM8elNEmK4A5dsAXA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AF3D340AA6
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 00:00:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F07510E784;
	Thu, 29 Jan 2026 00:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99B7660129;
	Thu, 29 Jan 2026 00:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AE7C4CEF1;
	Thu, 29 Jan 2026 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769645373;
	bh=O26J1s5Vkn3ZIo+TJ6RWrG8FREowg2fIx+LLm20XLlc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MiZ6emPLI4n4iPSzBekNe5PYTVj6/dtsvhIpoaH8HVTNacNpr5N11qMhOOzH6WvoC
	 mdxC668GPIMV+mh+0SkWD1Upaj4BzT/Rn/bb6atngiHS10mS6+GdJqDs7kQXFTG6gA
	 I4dIrO1oVqwrCuaim/H0pu13JUkY48WWq4LtEVrlnMaEjJAGJvQ7cmVwhPtdC1UVl9
	 Yo2wTPBFucEzH2mQhmW/XYcGvb7nIwFYwmO48VeuVdKAnMJXZu69F5NwV/t46XfASw
	 obCD4lJPX1ZbOh11nn8mNDisVchE2weyFU+DRMkfVrw7qiS4KxTC0geSJ5W6NNRhb4
	 yJw+y76hgNsSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:09:21 +0100
Message-Id: <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
 <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
In-Reply-To: <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
Message-ID-Hash: 3Q724JKCLNT5RSBVY5EEP65DGR7BHZZ7
X-Message-ID-Hash: 3Q724JKCLNT5RSBVY5EEP65DGR7BHZZ7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3Q724JKCLNT5RSBVY5EEP65DGR7BHZZ7/>
Archived-At: 
 <https://lore.freedesktop.org/DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 28, 2026 at 4:27 PM CET, Joel Fernandes wrote:
> I will go over these concerns, just to clarify - do you mean forbidding=
=20
> *any* lock or do you mean only forbidding non-atomic locks? I believe we=
=20
> can avoid non-atomic locks completely - actually I just wrote a patch=20
> before I read this email to do just. If we are to forbid any locking at=
=20
> all, that might require some careful redesign to handle the above race=20
> afaics.

It's not about the locks themselves, sleeping locks are fine too. It's abou=
t
holding locks that are held elsewhere when doing memory allocations that ca=
n
call back into MMU notifiers or the shrinker.

I.e. if in the fence signalling critical path you wait for a mutex that is =
held
elsewhere while allocating memory and the memory allocation calls back into=
 the
shrinker, you may end up waiting for your own DMA fence to be signaled, whi=
ch
causes a deadlock.
