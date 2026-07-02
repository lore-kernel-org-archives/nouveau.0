Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28994C43602
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 11:42:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0453710F30C;
	Thu,  2 Jul 2026 11:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ElylzNP2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A2BB346E42;
	Thu,  2 Jul 2026 11:27:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782991643;
 b=fjXz0CKrJFcOMjBVTmBblkGMtwJDNsdGV6FgsSKRnijCHLwi33vR7dPG16D6n6iucFZ0k
 RV7Gf4lY0SnOhykFOTYlUlKla73ZEHcSSmJdysVbYsEObBW6a7xC9iTP5sM5E/LrvXMJe9a
 /Q8uzwbqPi75dot/IsvS2+49+tnQsNB/cLvyiW0Kib65EWxWSkqMpH4jFATS94xTvbL1IlF
 XdxWucosUsvv3yBRnoaAMq0KsuggSFPYhPKk/qzZ6+CqHVBdRX0+C3i+brbwP8eHhr0M5lQ
 AaJXYH8cxQeLAZVO7/c5SeEFY/IAlobAqBzZPSMrZSpgW/Qlll4ChizUey5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782991643; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vPHtV6pxZdlKjLiAMh+TI96h/MjbfgTMGiJB5aRI1Dw=;
 b=032AkWbtLsQc8DtuBcuHZy67QDzuxRE1tgNB0/pyNrfrYMQMlPqz7kzWRhkiwnq1eohr6
 J37opOww5y4+1m8SHJdH9fW+mWLWpdBmbZQtr6oF/c9b2MWSwxElc/ZjXspFFlswtsWAYeg
 hh6YUFTJ2bUWxgnrmzWk8B4ADasxFCO5mH3QkJP0GMx71+gcIwPzSt3QwYmlLkHP5kTTZh3
 8VMM813suN2BKtsVMXg14pY8eMHHtnqc2ksZ8VEgfjBaVgwufPXSm+PIjSMaxHm4nNA0F04
 LrqI6QM13d/D+HA1El27E6GVoEbSEtvtCSFhBxDKx0FxWB4cgA2qSrbTJ9fg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 82A134004E
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 11:27:20 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 80FB610F30B;
	Thu,  2 Jul 2026 11:42:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782992513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPHtV6pxZdlKjLiAMh+TI96h/MjbfgTMGiJB5aRI1Dw=;
	b=ElylzNP2HZvUF6FtGgLgsW4vT0OTcdy2XorLGs6M4jbsXqc3kVIN25VDlrp06Kwp+MnkF0
	7eCUNpZQUAu53ooUNOnYLe8bcSqU2lbFmJuaAoucdQs+qEK4yKsjIpHuYOtBIHp/EvNPEl
	ujU0zKbwsKGW+OA8vv+O0JU4vozY/FA=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 04/13] mm: update generic_get_unmapped_area[_topdown]() to
 use vma_flags_t
Date: Thu,  2 Jul 2026 19:41:35 +0800
Message-Id: <20260702114135.4189-1-lance.yang@linux.dev>
In-Reply-To: 
 <cef55b19f86c110952f13829aefa4859db3a70ed.1782760670.git.ljs@kernel.org>
References: 
 <cef55b19f86c110952f13829aefa4859db3a70ed.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: N7YQVFFB5K2GLIR4BXNVXW6VZ7DLWEHE
X-Message-ID-Hash: N7YQVFFB5K2GLIR4BXNVXW6VZ7DLWEHE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N7YQVFFB5K2GLIR4BXNVXW6VZ7DLWEHE/>
Archived-At: 
 <https://lore.freedesktop.org/20260702114135.4189-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:27PM +0100, Lorenzo Stoakes wrote:
>As part of the changes converting VMA flags from a system word size to a
>bitmap, extend this change to generic_get_unmapped_area() and
>generic_get_unmapped_area_topdown(), which also allows us to convert
>stack_guard_placement() as well.
>
>We retain arch_get_unmapped_area() and arch_get_unmapped_area_topdown()
>as-is for now, using legacy_to_vma_flags() as necessary to do so.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nothing jumped out at me ;) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
