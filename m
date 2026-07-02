Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B170C43602
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 12:25:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1646010F343;
	Thu,  2 Jul 2026 12:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="b+ldrvkt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9EF0146E4E;
	Thu,  2 Jul 2026 12:11:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782994264;
 b=KipR5LdnE7zo1j33jJwByZ1VokfTRMbeIuv1VsOsiY5QXI8/5w9aXNvbGvBSZ3rIrg5TN
 rCQE+I15vNbSoZH0O4NAiynL5lbUsKxH3CVsJPAxVCz/GGaUwSkyNoav6/ABxvt9p/Hk4h4
 UIjwcPWxc0uTPcEN3NyeRt9et06RAHlmWa8XiSz5yHeIJqhyCtAofnbT3ytvoeNLgef261d
 PXqkyfVufyu6wffFZqMs9LJ+DBt4IplpUMOZciYbTZCOz0HcsXo+C5PtNwaa1Yj1YU6UwiS
 1/A5FQrWLolAFcIU7w1baJJvwHz5dmtvd23WzpCjwSAMuZXB8YobIhZlfUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782994264; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Ko6g/fNv98hSurpFrjSC8unNT/smMh3pnGqTobbcqg=;
 b=LMWPWTgs1riohqzoc9rMXettVnC8s9jSDrlIEVdPSGOq+wOM4w3zwafqgUvFVwGT4DwYw
 yE+afmJxmFjRfYsnTRGNmKcU8jAwuMU01SIrefgxacrTJRzxClnBwM7SnXorOH3M7Jl1HTk
 V3XV6VJWbEHq4TZ75WL13Bos76hpYaBvqczbuHpiS893lH3E56K0KaMBaIULs4Nuhs+Wn28
 XC2EBWj91VbMmyqlslhvHYFNn5bpvHCt0DUXe50SHVsPKiyXwBwkM8xbfWHfeRoAzp5S6NJ
 rg5gJWSplKyZBncXOrKJRj57fthEYQpNBGPXsWWRDOzJZ+1Dtrin8pyRKxuw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C84EE46DDC
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 12:11:01 +0000 (UTC)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D491F10F33E;
	Thu,  2 Jul 2026 12:25:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782995144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ko6g/fNv98hSurpFrjSC8unNT/smMh3pnGqTobbcqg=;
	b=b+ldrvkt8ZmJ+OrI3yxcQgFLnRxGCWHjhsFZZL3rVzLaxyNILjolYA01aJGr58GPqotONa
	C0qfjyiCv0Ek1cqalMJ+/t7YCyD5CeARmY/TMOXt2of2lM3qjKi0LZINpNnLjdz9QLcCqu
	OOzdaIK15Lm4UMi7JwMdKk4MKXYIZlw=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 07/13] mm/vma: rename vma_get_page_prot to
 vma_flags_to_page_prot
Date: Thu,  2 Jul 2026 20:25:15 +0800
Message-Id: <20260702122515.74271-1-lance.yang@linux.dev>
In-Reply-To: 
 <fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org>
References: 
 <fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: FL52FFXGF3I43TUZEQ63NAVULSX5Y3OM
X-Message-ID-Hash: FL52FFXGF3I43TUZEQ63NAVULSX5Y3OM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FL52FFXGF3I43TUZEQ63NAVULSX5Y3OM/>
Archived-At: 
 <https://lore.freedesktop.org/20260702122515.74271-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:30PM +0100, Lorenzo Stoakes wrote:
>Having vma_get_page_prot() refer to VMA flags and vma_set_page_prot() refer
>to a VMA is confusing.
>
>Rename vma_get_page_prot() to vma_flags_to_page_prot() to resolve this
>confusion.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

straight rename, no stale callers that I can spot ;) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
