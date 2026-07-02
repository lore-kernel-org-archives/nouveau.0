Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D4BC43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 07:35:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2810F10F1B6;
	Thu,  2 Jul 2026 07:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="UUw36nfQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C71D46E39;
	Thu,  2 Jul 2026 07:20:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782976855;
 b=0+tiSUOfyluVfdGYH012K4HTUfZeSeBJUeGUbNoQfPt2uiqrGSxT8a+O+JeZVrcdzMQtf
 dHSwK+yNmAzLLBHB7M/glNiiR3TVfWBmVDW26Y4jK1SEXENGkiVa8xW3ll5Fb/s7YU4kDUA
 UJkCLZfJkww7X/MGsZ09wGqV5G5JLAosR/wDpDVvJ0zsG8tNK8dYrTmEVvLthm1ct80eyok
 Bn/rQ7cFZNzVUZ04VHpkMH7JyNKj3Jo/s44nd7JuS7F9dQ8G5n8LueSePrXI5lggNfoHRV5
 rc0QAcbJf2C2gTc+nNW2n1hYwHApbRCzQh2Y5lfQ8Z+QHLSInP48rT104skA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782976855; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cdXAMvaGTLXZ4tRHqX+15mFjqPO5NJv7/lbzInUeZeM=;
 b=maV9ZNDrULArvCp3ZXQ7l2V5z3RI6YWdxSpm5uXwiix72buOtq/G2BJ0/HvP0m28h+hT8
 OVNfwh9Jxra+2pAFVGN0dRpfHOJDCDehMdoyo4J7v84A6pVLBWglnOdI9GslwMlWyOh9Z/a
 URYdQPui5eC8dFTIao8lsnbhWr1xucIYjkWiMb3dpW363EVPiv/RiM6yiB7ExKNjGAT2qCC
 cYRZ84LCGbUj7QKRqvmHI1ra4V+uEg1I7KA2mMbxeeMT5oQDZ56sZf2v2+hI+tELB612OxG
 J1vrzNLFqkSA1Fg0FHLYcQj7iNoqre6Ea2EV6ZDWxZLWGQ5rb7KZNnP/OTsQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B069A46E0A
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 07:20:50 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jul 2026 07:35:36 UTC
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63210F1B0;
	Thu,  2 Jul 2026 07:35:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782977290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdXAMvaGTLXZ4tRHqX+15mFjqPO5NJv7/lbzInUeZeM=;
	b=UUw36nfQUDO4ek5W5MoGxv/bQdNbTQycY1qQKAEoJymjql+ZXc8a2FUo9eNrafl6xDrEni
	1302Z8Y+Ma+0qxdUDhBISoxry5nus7uGAN8fTkB0ZcU/zUf+14Ol9iIljWhjg5Yh/mt933
	8BhSh84bNWygA1To4TaXOltx56F5hgs=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 01/13] mm: introduce vma_flags_can_grow() and
 vma_can_grow()
Date: Thu,  2 Jul 2026 15:27:50 +0800
Message-Id: <20260702072750.45641-1-lance.yang@linux.dev>
In-Reply-To: 
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
References: 
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: 5SHGNMML3XO43QZPJVZPKEFLSKLBD5SN
X-Message-ID-Hash: 5SHGNMML3XO43QZPJVZPKEFLSKLBD5SN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5SHGNMML3XO43QZPJVZPKEFLSKLBD5SN/>
Archived-At: 
 <https://lore.freedesktop.org/20260702072750.45641-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:24PM +0100, Lorenzo Stoakes wrote:
>These test whether the VMA has stack sematics, i.e. is able to grow upwards
>or downwards depending on the architecture.
>
>In order to account for arches which do not support upward-growing stacks,
>introduce VMA_GROWSUP whose definition depends on the architecture
>supporting it, and use vma_flags_test_single_mask() in vma_flags_can_grow()
>to account for this.
>
>Update the VMA userland tests to reflect the changes
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nice cleanup! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
