Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF19BC44506
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 16:52:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D38510E3AB;
	Sat, 11 Jul 2026 16:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GD5EgXpQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AB36F470C0;
	Sat, 11 Jul 2026 16:37:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783787868;
 b=ecRZS7YNvz9ySnkNMjL73vpPIH5dEKaXWX4lRcV2bLiECgxU78hWIyfgd7AyUEXH9P7Oe
 jK94OoNXl4I5+7yZzP+GrhlfmTb1wHC+61+BXkL9TP9LBzS8UpD5oivOFZCzPiOpqNwEjjd
 BBxzWXc9jXiWMmsTCBzbMdTaeyk8KNwFuf9LTS5oS3XlMvo1asvmrLTMRzcfoyknO8IFaog
 wf+rsY8mmLLVD2WhksW6sER/3LCgYJ1CXId/vTeutbkwjqVwvsqx47Z9oVNqByI1+sK7Hcd
 /7af8MeUOlGpYrnjSbjSoO/cNq8CiFCAXMW2b1OlXznKsdIvSc+Dfk7U9IPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783787868; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5+Xf1bMSkXIMJTYDDjXYIpGx0jZ6tuDdRsUChLmc1jA=;
 b=ywjp/uZMtIu2w2M4IVuw8Mvueed6P4ZhFeYtG5DzT0eUB8kkFLPidv/IOU6hH6uc9y9oK
 S2JnmgUSL46jW+udDdFpXME+lIIe7EaOkxRHx+olQ7SUTZUZV5OMujiFSuNfUJ5mC70kadF
 8VF0wb9HKnXG2gRhjD4dQ4hGSR5ggBI5eDZgJdZ0m7DrHuLtWFj9QDEbxlXB7cCllK3uXLD
 1LxJxRYyEbTiXeR0BnJRPaEVAubMJwp2LeD52wwCDXD9rU7sBa97xIUEglcvRnOSa5DQpZS
 n3EA4q1Po/2SgACJ3EwBusBMSqlLVSMw+UD8hi8GvpQlU7AaSXw49wL1qprA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BAFB646FCD
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 16:37:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 37D6110E08B;
	Sat, 11 Jul 2026 16:52:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2F3560052;
	Sat, 11 Jul 2026 16:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36CE1F000E9;
	Sat, 11 Jul 2026 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788770;
	bh=5+Xf1bMSkXIMJTYDDjXYIpGx0jZ6tuDdRsUChLmc1jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GD5EgXpQxjlS4BgytXhuu0DKNfOXI95UIBmT8u8vTWLN8KV7KhFG3Zmjlk9IZStJ0
	 KR/rJOljXFdanDu2Ju/DptezzsTHKy80EcuHZM39Fei1b18GfZiY34ebY3hxctopz9
	 gvnFSjPShteSKooY0iw+x0xgR3Cf925KQiGVWg1A4rsZHwFxfm3bgQE5xX0JwdPBlB
	 +Tg/A3vkLuFYGTa7kkL8I1wMAy+xlY3+uuAHgvr+ArjH3xFFNogvxDp8/tF7Nnmmoy
	 dKpnRq6aW4iMGj9i3sLe5ohAdOH0LwKPvhoh09eZddiNuSwIe2yzxsxY57f7rVk8Lk
	 0S/jqug0BXp3A==
Date: Sat, 11 Jul 2026 17:52:24 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 11/13] mm/mlock: convert mlock code to use vma_flags_t
Message-ID: <alJ0K9JlFBP7KC2u@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
 <DJTO4SXFAKEV.1GVVCX3LZ6R0M@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTO4SXFAKEV.1GVVCX3LZ6R0M@nvidia.com>
Message-ID-Hash: VSLF33QBANV6PYSLNFWQNIFF3KUKY54J
X-Message-ID-Hash: VSLF33QBANV6PYSLNFWQNIFF3KUKY54J
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VSLF33QBANV6PYSLNFWQNIFF3KUKY54J/>
Archived-At: <https://lore.freedesktop.org/alJ0K9JlFBP7KC2u@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 08, 2026 at 10:01:22PM -0400, Zi Yan wrote:
> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> > Replace use of the legacy vm_flags_t flags with vma_flags_t values
> > throughout the mlock logic.
> >
> > Additionally update comments to reflect the changes to be consistent.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  mm/mlock.c | 86 +++++++++++++++++++++++++++++-------------------------
> >  1 file changed, 46 insertions(+), 40 deletions(-)
> >
>
> LGTM. What confused me when I was reading the code is VMA_LOCKED_MASK
> and VMA_LOCKED_BIT, since both share the same prefix VMA_LOCKED. Before
> looking at the definition of VMA_LOCKED_MASK, I was wondering when to
> use _BIT or _MASK. But it is just a naming thing.

Yeah, indeed, not great naming there. Was a pre-existing though, and previously
was VM_LOCKED_MASK (also not great :)

The whole VMA_LOCKED_BIT and VMA_LOCK_ON_FAULT_BIT thing is a bit weird anyway,
since you set both and then just use the latter to know not to fault in in
GUP... anyway, can revisit that one later...! :)

>
> Anyway,
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo
