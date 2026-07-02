Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F148C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 15:09:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA67010F44F;
	Thu,  2 Jul 2026 15:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Dkh9RWL9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2ECC546E3B;
	Thu,  2 Jul 2026 14:54:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783004073;
 b=rNeBWwkmBK/broOMZDYGk2c/yiJ41Y4msuU1G6n8xUSeD/b+tJ2oK0tAhaMuYS6sPVWGw
 CNy+w9kjOaANTGfP0zWY9ieyLFbWuyzj8mA4vJrxh5x9i3ie5UvdDG2o06Nrw14t8pFU24V
 MEVrgfEl4uXvOZ/saoZi5HiKkgnH4Ysv2GRkxipoKQEyr+sZ5BDirjLqZKcTyAQ+EpLUhqk
 k6iPGFlWrcm4qDVO4uZrvAvSpXRGax5GYt8hvWKMnyGhlUN9miD5GzIbiEpDCbaxygvsgfK
 tahQzD0Ie+bFCPaIqrGfEmQHmTgrsOmgKS6ld7mXiIJZlVSjPAth/PfUpNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783004073; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GVgi/IDW6MB0ICHH5yTujujreeH5t5fHN661xjkq/74=;
 b=ASCUhZ8Jac9TqIhPskpOYEl0qpXLOeYlzsUsnxR41GLV1nsy7OoaxnwY5Fnfv0Xd0w6OL
 1CTYW20jOtz6xfSBrUu8JK2Db/CqUg2E6/M4R+AHqj+9iipOx8zzJDvMZtglS/8ww5V0U9G
 H5qp7eb+zvn0W6Hm9E2RqQHV8UbKT54VvGbEar9XcOEEWXnCH5wWHPixB1iasGDq8p35IYa
 w7/by6Ot05yW2plIb7P/4Qy1ZDkfVLMvfruRMA1P0oYgArCCXAEwAI7GyYMJus2Tt+KgAu1
 9dAHntDv5rY+hhHY3zeaAZK2krNZ6XFVyXVWOppC7dvtoU7l8mO6rmt3o83A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 406DF4004C
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 14:54:28 +0000 (UTC)
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAB710F434
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 15:09:14 +0000 (UTC)
Message-ID: <cf5a92d3-2c7e-41e6-afed-f2a4c9d1a774@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783004941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVgi/IDW6MB0ICHH5yTujujreeH5t5fHN661xjkq/74=;
	b=Dkh9RWL9rMIQE6Ur1L+lFP9fWBIPUF1EBlETBXiV1FwoU/+0F4n7u3+DtwQotZKTkFazHu
	oHVZr/Vs+FAfYKVbUxY57cWOfPctKhbPm5r74IEfkBs57Xoqgu/OIspBSvCnXq9uEYouaN
	h+ygMrTbcJpYGV90L9aTDp+5SWenOgM=
Date: Thu, 2 Jul 2026 23:08:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
To: Lorenzo Stoakes <ljs@kernel.org>
References: 
 <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
 <20260702111531.64883-1-lance.yang@linux.dev> <akZwsS-_cywsXSjL@lucifer>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <akZwsS-_cywsXSjL@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: L6AED6Q2SJNGIDRLGOPD6VWAIVSCUFNY
X-Message-ID-Hash: L6AED6Q2SJNGIDRLGOPD6VWAIVSCUFNY
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
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, hughd@google.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, kees@kernel.org, perex@perex.cz,
 tiwai@suse.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L6AED6Q2SJNGIDRLGOPD6VWAIVSCUFNY/>
Archived-At: 
 <https://lore.freedesktop.org/cf5a92d3-2c7e-41e6-afed-f2a4c9d1a774@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2026/7/2 22:16, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 07:15:31PM +0800, Lance Yang wrote:
[...]
>>
>> [...]
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 46174e706bbe..547352183214 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>> [...]
>>> @@ -488,23 +496,27 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>>> 		 * Check to see if we are violating any seals and update VMA
>>> 		 * flags if necessary to avoid future seal violations.
>>> 		 */
>>> -		err = memfd_check_seals_mmap(file, &vm_flags);
>>> +		err = memfd_check_seals_mmap(file, &vma_flags);
>>> 		if (err)
>>> 			return (unsigned long)err;
>>> 	} else {
>>> 		switch (flags & MAP_TYPE) {
>>> 		case MAP_SHARED:
>>> -			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
>>> +			if (vma_flags_can_grow(&vma_flags))
>>> 				return -EINVAL;
>>> 			/*
>>> 			 * Ignore pgoff.
>>> 			 */
>>> 			pgoff = 0;
>>> -			vm_flags |= VM_SHARED | VM_MAYSHARE;
>>> +			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
>>> 			break;
>>> -		case MAP_DROPPABLE:
>>> -			if (VM_DROPPABLE == VM_NONE)
>>> +		case MAP_DROPPABLE: {
>>> +			vma_flags_t droppable = VMA_DROPPABLE;
>>> +
>>> +			if (vma_flags_empty(&droppable))
>>> 				return -EOPNOTSUPP;
>>> +			vma_flags_set_mask(&vma_flags, droppable);
>>> +
>>> 			/*
>>> 			 * A locked or stack area makes no sense to be droppable.
>>> 			 *
>>> @@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>>> 			 */
>>> 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
>>> 			        return -EINVAL;
>>> -			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
>>> +			if (vma_flags_can_grow(&vma_flags))
>>> 			        return -EINVAL;
>>>
>>> -			vm_flags |= VM_DROPPABLE;
>>
>> Old code checked VM_GROWSDOWN|VM_GROWSUP before seting VM_DROPPABLE. New
>> code flips that around. Hmm, shouldn't master, just made me look twice ;)
>>
>> Maybe keep old order?
> 
> I guess I feared that defining droppable above then referencing it below would
> be less clear?
> 
> Can move if you feel strongly about it, and sorry for making the move at the
> same time as the general vm_flags_t -> vma_flags_t refactor as it does make that
> less clear...

No need to churn just for me. Thanks :)
