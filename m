Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B692FC44508
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 14:54:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA5CB10ED8D;
	Tue, 14 Jul 2026 14:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b48cJk93";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9DF6F4713E;
	Tue, 14 Jul 2026 14:39:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784039940;
 b=pYVIxS1gfvvV7jDBFUrLzpLTcs3dQcla5+fDdnVW4WUDBCgdaWQ9m2F6kv3PW4PnX2wL4
 emysYCTCpC8s59rhCeXu+hcocJ0LB6jjqXog/DOnXVnyFdlGcQ1Y7iGuSqURIWbNLcQclBz
 1mdTxD2+G9MxqfhtOEY2h/jD3vCy//LS04PyJsDZELHgqa6dTTh+kg3P6RyZs64j1OwJ0/1
 yu6XiixOthiIBNJfB6/xDjJGc57QMYU7+sqKLqyID9wBmlQ4doWFrRnevC5pAU0gEM6IECz
 IEV3GOKSp3iHAGHQ65az+ix/O0aaCBIw9qVYty6mSnAMwRG9bw6NHlVYzgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784039940; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dxhqIlF4Nmwz7Dc6V0zHplATkq8zPUSt2q/Zds9EZa8=;
 b=eykWIQLAeZiul0+pjI1UdlXIbap4dD7js+041Ur8XNQ8skUHdKl4xiI2upZNxX2Tmp+NU
 fgalykI/5ThGEIjXyaq5S1wstlNpSL4lSGhuum9WpSYTosTcDsDZ8FoLhEzLBulkujdz9ec
 rsoKKjLSyjCCqVz/v/LIJG7aLH2mY7UXw74zEfM2qGKhQmVEZQOtCVlGRKYprLZeV926SFv
 3g6YyhSPbA28fYfqDuspWhmYgVZio6/cZ+erwgD83q92cc7rIzd41xojZIqaSL0auKspdpa
 iziV8CntLus4VGBkSZd+bHq5cWeu9rp/nqmz/KCvJcCo6/300iU3N4Zj4N/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4DA3246812
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 02:10:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58010E1CC;
	Tue, 14 Jul 2026 02:25:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC9B660103;
	Tue, 14 Jul 2026 02:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DE31F000E9;
	Tue, 14 Jul 2026 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783995922;
	bh=dxhqIlF4Nmwz7Dc6V0zHplATkq8zPUSt2q/Zds9EZa8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b48cJk93FtKmn41eVdolAVE/uzQX6EHo01Pnkn0OgnY1vIvJtpHyTyl3C+S0onbuL
	 GGMGjmfE2JKefejiLP1J3PzT6MIi/Ch6j4XkBShkTRk15H8PEW9ZSYVvQQ/3WhTIGU
	 P9nMjGwkFSOLhnsQCjHUwc7HZ389d5X722tVvR6w=
Date: Mon, 13 Jul 2026 19:25:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [PATCH v2 00/13] mm: convert more vm_flags_t users to
 vma_flags_t
Message-Id: <20260713192519.58113fa69c169d3f5f82e453@linux-foundation.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: AHNQDRLIM2ZIOELAJNBT6X5AHSN37B7E
X-Message-ID-Hash: AHNQDRLIM2ZIOELAJNBT6X5AHSN37B7E
X-Mailman-Approved-At: Tue, 14 Jul 2026 14:38:59 +0000
CC: David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Zi Yan <ziy@nvidia.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AHNQDRLIM2ZIOELAJNBT6X5AHSN37B7E/>
Archived-At: 
 <https://lore.freedesktop.org/20260713192519.58113fa69c169d3f5f82e453@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 11 Jul 2026 19:44:57 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> This series makes further progress in converting usage of the deprecated
> vm_flags_t type to its replacement, vma_flags_t.
> 
> It focuses on mm, though updates some users of mm APIs also.
> 
> It updates:
> 
> * The core do_mmap() code path for VMA mapping.
> * Unmapped area logic.
> * The usage of mm->def_vma_flags.
> * VMA page protection bit logic.
> * General usage of VMA flags in core mm code, mlock, mprotect, mremap.

Added to mm-new, thanks.

And oh my, what a lot of pre-existing issues:
	https://sashiko.dev/#/patchset/20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org


