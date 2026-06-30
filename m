Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57022C43327
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 07:39:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0720010EB63;
	Tue, 30 Jun 2026 07:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fDaf4ZqW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 734F84498D;
	Tue, 30 Jun 2026 07:24:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782804278;
 b=lG2S8KRDncHOBcuCp2SnSd+PJxjVF7RrVkaNgGxkdQgVduw8U8whBXBEjB6GGwo/gWyW2
 C409vnhFQkicvAErPYTBg8k7JuiBVp5ZNJHu0gfD857U4EKyjr6TK+JYmJKuM1RbGgDvtMQ
 1+ePfM+OePV9mAdMHw4GeewsgJkXqQ3y6F/PHnVXMZ+uX3eLFQQvhRaui6pjK/nhlRFPgkc
 kmrAZmHDTDbTcGk8NI5J1CVa6j2sRN/raArBHXtJ52ONXsCjvaQtqVSEa9VWeZFPuN1HFvG
 PLCIECqpwvQ/kQ8+PcWVZEF98CT93G+49p2hLOcCMUwSuWd/o/NSE86XjziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782804278; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QFTirDmiRXM2E2UxDPivyHpH5WU8vmAPSC3LpjlrT8o=;
 b=sh8ofNM/OeEmgyjI2MGp5foau2Hc/6pZctiNuV2ANETOYY2hzbQFlBdwGglybaFZKLpN+
 JJoPJIIf1eQg5DboS0Z/usbUX/tvfyEKEk4VtpDGPgkE0zZZl+rK0TPz5AAMUiAusoMUHQX
 6KCLOC0XaD+Hg3YkBhQFS8lwgd2O+lH+0PzDWUwsJfjLmglGEHYogm2/S/ER8prVs9GXv89
 +0xcM6vlWUpoyiHiDX6B9G9ABy3sSAJyQPdI1S1mU3EVKnyefbsxFZMMX/7N1b7iqg5D/8M
 9lykqGLjoQB7Mt+IWdJ+PCEzEzVFbEvo4SofeUFrm+h0llQ9D9HE34R7Czpw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 360D9400BB
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 07:24:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7EECD10EB3C;
	Tue, 30 Jun 2026 07:39:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3547140B7E;
	Tue, 30 Jun 2026 07:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F3C1F00A3D;
	Tue, 30 Jun 2026 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805156;
	bh=QFTirDmiRXM2E2UxDPivyHpH5WU8vmAPSC3LpjlrT8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fDaf4ZqW3PD9fY8acsrJCsXc7pOEzc4lLsW2jgJhfYGl7NXG5KcVo4Pxek2Uz+Nla
	 tOcu2NuZHwmic0JpBPUEEgMmuaTGNKExmRCbT0ES7+8QhHL9YqeimbRUf62O0HtMfs
	 LYny1udM2eWLdF0sRgHD+bBsvogcyV+srg+CrLasOfuUZDDcJr8dZlygrFZBfDoggP
	 p2mllhEamdnPs77YGrH3WGaXXIkqv4Xgyt7g+R7YVqHEf/NFyfi55aJUF3SRsQX/b0
	 NUbVhpaMaUvlKWWtDdlDlkLmrVKracrOVgHvCwNbE5g49j/+vG6Xvy5Wxh+acQ6BjY
	 MYjz8K0OvlQ3A==
Date: Tue, 30 Jun 2026 08:38:51 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 01/13] mm: introduce vma_flags_can_grow() and
 vma_can_grow()
Message-ID: <akNucoP3eaDN2_Vz@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
 <DJLTDCPWMXDL.4ICZ77A1LPZZ@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJLTDCPWMXDL.4ICZ77A1LPZZ@nvidia.com>
Message-ID-Hash: NFWUB2OVBRDYQAJJFXTI2HTQC7MI23EF
X-Message-ID-Hash: NFWUB2OVBRDYQAJJFXTI2HTQC7MI23EF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NFWUB2OVBRDYQAJJFXTI2HTQC7MI23EF/>
Archived-At: <https://lore.freedesktop.org/akNucoP3eaDN2_Vz@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jun 29, 2026 at 04:26:18PM -0400, Zi Yan wrote:
> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> > These test whether the VMA has stack sematics, i.e. is able to grow upwards
> > or downwards depending on the architecture.
> >
> > In order to account for arches which do not support upward-growing stacks,
> > introduce VMA_GROWSUP whose definition depends on the architecture
> > supporting it, and use vma_flags_test_single_mask() in vma_flags_can_grow()
> > to account for this.
> >
> > Update the VMA userland tests to reflect the changes
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  include/linux/mm.h              | 21 ++++++++++++++++++---
> >  tools/testing/vma/include/dup.h |  4 ++++
> >  2 files changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 868b2334bff3..cf7df1569052 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -472,6 +472,7 @@ enum {
> >  #define VM_SAO		INIT_VM_FLAG(SAO)
> >  #elif defined(CONFIG_PARISC)
> >  #define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
> > +#define VMA_GROWSUP	mk_vma_flags(VMA_GROWSUP_BIT)
> >  #elif defined(CONFIG_SPARC64)
> >  #define VM_SPARC_ADI	INIT_VM_FLAG(SPARC_ADI)
> >  #define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
> > @@ -483,6 +484,7 @@ enum {
> >  #endif
> >  #ifndef VM_GROWSUP
> >  #define VM_GROWSUP	VM_NONE
> > +#define VMA_GROWSUP	EMPTY_VMA_FLAGS
> >  #endif
> >  #ifdef CONFIG_ARM64_MTE
> >  #define VM_MTE		INIT_VM_FLAG(MTE)
> > @@ -1563,11 +1565,24 @@ static inline bool vma_is_initial_stack(const struct vm_area_struct *vma)
> >  		vma->vm_end >= vma->vm_mm->start_stack;
> >  }
> >
> > -static inline bool vma_is_temporary_stack(const struct vm_area_struct *vma)
> > +static inline bool vma_flags_can_grow(const vma_flags_t *flags)
> >  {
> > -	int maybe_stack = vma->vm_flags & (VM_GROWSDOWN | VM_GROWSUP);
> > +	if (vma_flags_test_single_mask(flags, VMA_GROWSUP))
> > +		return true;
> > +	if (vma_flags_test(flags, VMA_GROWSDOWN_BIT))
> > +		return true;
> > +
> > +	return false;
> > +}
> >
> > -	if (!maybe_stack)
> > +static inline bool vma_can_grow(const struct vm_area_struct *vma)
> > +{
> > +	return vma_flags_can_grow(&vma->flags);
>
> Would it save vma_flags_can_grow() if we do below?
>
> return vma_test(vma, VMA_GROWSDOWN_BIT) || vma_test_single_mask(vma, VMA_GROWSUP);
>
> I find these two functions when I am reading mm.h.

Yeah but we require vma_flags_can_grow() for code in mmap.c, the majority of
checks of this have only vma_flags_t to work with not a VMA :)

>
> > +}
> > +
> > +static inline bool vma_is_temporary_stack(const struct vm_area_struct *vma)
> > +{
> > +	if (!vma_can_grow(vma))
> >  		return false;
> >
> >  	if ((vma->vm_flags & VM_STACK_INCOMPLETE_SETUP) ==
> > diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
> > index 5d7d0afd7765..6f5bcd7fbcd8 100644
> > --- a/tools/testing/vma/include/dup.h
> > +++ b/tools/testing/vma/include/dup.h
> > @@ -245,8 +245,10 @@ enum {
> >  #define VM_STACK	INIT_VM_FLAG(STACK)
> >  #ifdef CONFIG_STACK_GROWS_UP
> >  #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
> > +#define VMA_STACK_EARLY mk_vma_flags(VMA_STACK_EARLY_BIT)
> >  #else
> >  #define VM_STACK_EARLY	VM_NONE
> > +#define VMA_STACK_EARLY EMPTY_VMA_FLAGS
> >  #endif
> >  #ifdef CONFIG_ARCH_HAS_PKEYS
> >  #define VM_PKEY_SHIFT ((__force int)VMA_HIGH_ARCH_0_BIT)
> > @@ -315,6 +317,8 @@ enum {
> >
> >  /* Bits set in the VMA until the stack is in its final location */
> >  #define VM_STACK_INCOMPLETE_SETUP (VM_RAND_READ | VM_SEQ_READ | VM_STACK_EARLY)
> > +#define VMA_STACK_INCOMPLETE_SETUP append_vma_flags(		\
> > +	VMA_STACK_EARLY, VMA_RAND_READ_BIT, VMA_SEQ_READ_BIT)
> >
> >  #define TASK_EXEC_BIT ((current->personality & READ_IMPLIES_EXEC) ? \
> >  		       VM_EXEC_BIT : VM_READ_BIT)
>
> Why are VMA_STACK_EARLY and VMA_STACK_INCOMPLETE_SETUP added here but
> not in mm.h?

Yeah urgh oops my bad. It doesn't really break anything but I'll fix it if a
respin is needed...

>
>
> --
> Best Regards,
> Yan, Zi
>

Thanks, Lorenzo
