Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D94C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 12:51:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38ED610F360;
	Thu,  2 Jul 2026 12:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="F4ZVf9Bv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD5DA46E55;
	Thu,  2 Jul 2026 12:36:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782995806;
 b=SxUOn9Uj3F8xwAO7zSAgjq5gHNcAm6W5bc3lAhh4EjKZnCyKhNzP8/hHjcTnzOpc+E189
 ya1Ycz+DeLl3D8lLy6/1eRA8EeE4NIWGKlBty6k9iuIXm/Z3BU5VAtnxHsRdUgezdZuy6Md
 lT3VicxZ17DN6w1lXcKx0yGOYV0ru3PrHBtRd9oBLPT/u6N1+JKeaqPwiUye0Uv/e+0Dbpj
 mM6mrq10A52urOdgIwD49zSm+1klPCdcdej76fKywvWGXcZ5v4ywPWaG6saeb6amP+PnbV+
 9IOt2v2qWz4PFewxJY1N5azdOdQRVSNvw+GdItFq5VSyzP3nuAZBjiCALf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782995806; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KCmq1hZLLl7GOyWtL6cRPjjbHfWJ5jvpchLdwXolxL8=;
 b=S3/homEUKcHSwzlBhpqAVLTrtToBk/Q5wqjd/2I3dp9CfDdVUyXu2FtuOToUf7cgCLIVS
 nVhypYCuMUnfP9fL1GGcy1Nq+VHHM48bbciw1OWV0k5fGNqybcwTAX5+oDW2KHQjumpgwVz
 61IIvzF44+ewggWj2cmfGyKJSvIBCqoo06TXG3C0EHS9Es/XHgMfBZs08ejUEW+AGYBWaO5
 tj9SDiijYAV2LVuzQHB7wVoWYydydX/VQjw0haY/4kt0cQNJWM8VnO79LB8/nmBaz7LaAYE
 Q9lSYZts+TF45pho42W+TA5UZpQL47ybB7PokzN/CEnkDDmQL3uCIJAi1lqg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D6F6546E3B
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 12:36:43 +0000 (UTC)
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F03CF10F356
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 12:51:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782996675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCmq1hZLLl7GOyWtL6cRPjjbHfWJ5jvpchLdwXolxL8=;
	b=F4ZVf9BvB+hLAf9gQChbe4sRNb4sLCrUWRBNFM0pPt8IAzUbVhXxDEH/DvD8axflIDk2vm
	3zmwuSmbnQ/BvpRKYzyKP8V+Wt7x4/jYspjeo/Nuwy87WFjjbKm5Us6Gqkc64N1S5Bi0bl
	Qu3WpSOCEMC/DqM+tZU+hrTjGqJDt6Q=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 09/13] mm/vma: update create_init_stack_vma() to use
 vma_flags_t
Date: Thu,  2 Jul 2026 20:50:52 +0800
Message-Id: <20260702125052.19248-1-lance.yang@linux.dev>
In-Reply-To: 
 <34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org>
References: 
 <34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: FIIDFBXE5ZH4FC4RAPLDAZYZL2HRNH3H
X-Message-ID-Hash: FIIDFBXE5ZH4FC4RAPLDAZYZL2HRNH3H
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FIIDFBXE5ZH4FC4RAPLDAZYZL2HRNH3H/>
Archived-At: 
 <https://lore.freedesktop.org/20260702125052.19248-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:32PM +0100, Lorenzo Stoakes wrote:
>Replace use of the legacy vm_flags_t flags with vma_flags_t values in
>create_init_stack_vma().
>
>As part of this change we add VMA_STACK_EARLY and VMA_STACK_INCOMPLETE
>vma_flags_t defines, and slightly rework create_init_stack_vma() for
>clarity.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nothing looks off to me ;) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
