Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B719C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 11:38:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E82510F306;
	Thu,  2 Jul 2026 11:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="AkD1PO3E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3CCDC46E40;
	Thu,  2 Jul 2026 11:23:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782991395;
 b=llWwwacnC0GSs2WLlneUYL5GuLFeo99CNFXYVMgUghRv8CquYKU23p0gek2xr3Ecm+SCE
 ztAatubppTa7Vmv/t2dQw6iKXAzEk0f/1e2v1rc2SoHddm2Fa7RvPyzXbXOiSCv6gHi4Mco
 pfoyosxXS54rmL4eUhDDySqvyQ89URrEBcGLExIs/adCIljTVC5qWwtrg+sJUIe1Si7oIxL
 cQgvIXLlmjSPchqSTjUVqlEgSYtewVF4My4TWsPC7cPb42gVrgi08o1FaREydlCOiUwa+Ya
 UwaJefkQIax9wOxkfKrJ9Cy+BWnTpM74tD6jfAuyIoH3GZCCCO4fnestdIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782991395; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s4zTiOPxPEEvh+Z2LMv+6gqe9ZZvh+3yTK3Yc5UnT/U=;
 b=zS54DVRhqWEY1EXyH7TJqfaNDQTx/x7yAZowMMrYwKcdI76EuB14zoE2unSV3ZyS2D/cB
 RLTKAd9BaSkHMHnvccApfpywSJuB9YMcilIWD1zTAi8Lu3F/fGvZ66BVpofCa4ZGREZvu/0
 ZYOhYSE+TDX8cjSWDRD8jt7hmvnN4jvwVn0fDzJf8UvW/c48tiYV6SNrafqP7yWcZYKqww5
 RUXbfm9fOaIgzoaDY/lSjD3D/W08r1bGRNEPv0fgHPxyp79A0I+UQE80ER30B4018jz4SQd
 VAk6awGQxDW+z7tzN6hbPfQ13LRbuxeQ9a6C+WFZXScvAnhSX1EmOjQQwQwg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 52EAF4004E
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 11:23:11 +0000 (UTC)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 10CAC10F2FD
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 11:37:57 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782992273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4zTiOPxPEEvh+Z2LMv+6gqe9ZZvh+3yTK3Yc5UnT/U=;
	b=AkD1PO3EYh/hmuzqNyG5+F4iFU+xRbougp+bY+xotWctIjwUQvMKpAwXsjPb5kG+NxyY12
	mV0mEGNoe2Czu7JdCtguHySTk1KxuHzjRfZnXIBhIe71SSOqRiI6wOFZz62JhxqVX83KFA
	KhWu2A9hV9btjfbdFeq0dyXUttdl5PQ=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 03/13] mm: convert __get_unmapped_area() to use
 vma_flags_t
Date: Thu,  2 Jul 2026 19:37:22 +0800
Message-Id: <20260702113722.97837-1-lance.yang@linux.dev>
In-Reply-To: 
 <b1ad7c4443f5cba622e4c48c5a9ef15427001a93.1782760670.git.ljs@kernel.org>
References: 
 <b1ad7c4443f5cba622e4c48c5a9ef15427001a93.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: S53DW2WXUHUFSLMZN4S4QAJD2LS42SL7
X-Message-ID-Hash: S53DW2WXUHUFSLMZN4S4QAJD2LS42SL7
X-MailFrom: lance.yang@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akpm@linux-foundation.org, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, l.stach@pengutronix.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 peter.griffin@linaro.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org,
 dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org,
 mperttunen@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, hughd@google.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S53DW2WXUHUFSLMZN4S4QAJD2LS42SL7/>
Archived-At: 
 <https://lore.freedesktop.org/20260702113722.97837-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:26PM +0100, Lorenzo Stoakes wrote:
>Update __get_unmapped_area() to be parameterised by vma_flags_t rather than
>vm_flags_t as part of the effort to move VMA flags from a system word to a
>bitmap.
>
>We cascade the changes up to arch_get_unmapped_area_topdown() and
>arch_get_unmapped_area(), where, for now, we use vma_flags_to_legacy() in
>order to propagate the VMA flags.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nothing suspicious that I could spot :) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
