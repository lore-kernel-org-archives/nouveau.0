Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83965CD98F2
	for <nouveau@archiver.kernel.org>; Fri, 19 Jun 2026 14:38:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 594E010F644;
	Fri, 19 Jun 2026 14:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="nJvCA8Lw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8CAD146BAD;
	Fri, 19 Jun 2026 14:24:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781879051;
 b=v5qRw1WFoH72bycd4ojLWiiGK/zr5mDTIG6s8iBg9ASD3+4hx9LFS7g9U74gAvEkssgLu
 AKSuAk5msJPhF6gRptO6bTxz3S+Ib26s0ca+EcMoy9XpvZSCB/jrK+Bt5nIkV+KoISYzeVW
 Kat6WTIiQ/i7WjQmdxD2FmOHIF+U75tXM1rG1Bp8/ZWmwsuWWQGgyhqKumNY4Eusi6vlv+o
 omxc4hz0wsp3LE2+wB5uWfhnJm0+ZSmdkAkhYi65eNFgDm76g0L3bOpnZl69HzBdSteYz/g
 7hYIV8PDBfoA4JE/EVyWSD5dV2LYPNOZyhq2vmzTwEcBlN8oQGK9WRMKGXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781879051; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hFv3GlUYs5wNN+O537Q1dHtRqP7co1Grb9v+N2l5i1U=;
 b=Ap7vQQSsqX0MzdBm+MVk+cY2p4nW71tt0OMRzIfEpDWaOzqRPD+mBlXdqhMzhWxMWG/Q3
 n17vz2UvI9Y/GMY6vChTUaNunX8orjpk5uOaqAzaAurYLxfHIYJKPmFKA1hS1OZikaUKdgO
 dzzjmAYb8hPWy/B+mZB/jlLDRFNoxLkJmHtL3+SA2oYmyrciw7RpHlM/cq037BzQAh4SdAV
 FE2Bk5zyKKueNSAUjzbjpgLZqRT++a4HS5JaPkz8ipN6tWR4XrxtDPDtqKL0JHfRZtsKfxC
 Q2TCkkgU6gi12a4Lb55oW2sVtqqLo5kbhYWx/XMNGICiOROMNNJ7aukt2how==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ursulin.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ursulin.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B13346B1A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Jun 2026 18:27:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB36010F3BA
	for <nouveau@lists.freedesktop.org>; Thu, 18 Jun 2026 18:41:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso7589675e9.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Jun 2026 11:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1781808090; x=1782412890;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFv3GlUYs5wNN+O537Q1dHtRqP7co1Grb9v+N2l5i1U=;
        b=nJvCA8LwULnFCPIMSmfuQ/dcmVk60Lq4tp1Z4O1Wkd57p76BCEb+SJbeoyfTjY3zwF
         a3YKs2IYjSqdp69f72pbnpJRpnea6LrQbuiwnxifPNu5BT9o72FuuRZUCaahkfDdojr4
         I6bY0UDiMDs0rZtwBq49Z9KfGzbG3PvEO/sQgDrOkVVMwPMrnBCjNuH7H1gUl1lASWOz
         OD3M5UizDBtspnlNI/3zhuewXmRa6riJiAuPq3EWS3FaJsGlVr0gqjchsKg748vMi6z4
         c5tOiiYKPFgkCuv1UDi8ZlGA3zJ4lECfHcjETiww6Q8O9Lt/A+LETA6aEi+w3ihC28On
         tTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781808090; x=1782412890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFv3GlUYs5wNN+O537Q1dHtRqP7co1Grb9v+N2l5i1U=;
        b=WZgFtocgazauXF0nZ1Wyji/Hk9b8H+sPVk+zMWjca4lmkA7Lmoe8Hps5yQrpTgW3wN
         DZi/D0aG1CU0R/slv7FuIcj0O7XPDH65HggXN7BfQ9KqubrUFGnIUUsjbVr9eSVKGTvt
         tWlRHlNczzbYF5PVoIcF0ozTUoiE5BaqXsFCPNPvxdk4dKGOO4vv0sbdwF4C4Fe5MYlA
         +uOjFP78oKTly5RVEv7K8aG2L2YB6Ar847SaXo2Z270NZkHyvu+eYGKBNjVZZosixNm8
         R0c8W5eMaHa2sWAbeC4Gb72r3dEDj3rfZGdIx93D2tUYEIjnj78BuoJ/O40lkp+zqnkz
         RydQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WpLGIayKrW43poQ+nv8/AqjiWBq5n0bDTFsssXqso4VJhjUlkA58+kUljcZZiolsWXRc4fQfE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv0p7hBrLxCveuXPv9GsVBVH3blEI/w3FUm+R35IS/csPyG462
	B53Z4kZY5+2NbdxC6xTcJUM7t6o7jrhxrsJ6RDqle4bgYDFK7dQDSzWyyhaBfQbkLdo=
X-Gm-Gg: AfdE7cmiN/aWXFJfBEJQ8djDhWrviWZgy2USH+cF7uz2/OaVMXQ25yoOQC2RwIEDC28
	6CADS4eE1clgiAbyNORueQ5tTDp26l+uVlN2fq4w/BbGtkpSsBLZRdzzFfqA3qp+4yA2y8LlFy5
	TAkl2ef/YcbL8jOCR+/TRTuaKbV/KreMRgfWzIAFrh/iXtYCTmb3bGER1TaHPPSgBk/+YNHnLoW
	XC5GhH6wi94i164liuLZV04tu91PQz2Ktt40i7rXzqqGB0eMivxLWXYsvKMgn/x5fnc7rnxEPS6
	OhjEyDoV1hEJ/R3DdXrsgOLFd1s1vLryxuCs06fjUvgf7r1xG5Z2hqhnNS6RNIFc/FG9q4WZ+5R
	OlQuuvkbL8Ys5vdhxXWgroQjy0J3x4EL9KhQiO/hKzINdDv8sUmGsmHdmLQfrTv4v94JbFLeQIE
	/4tpi3po7dGM2l4/LINHllXjBVla/aqv6DEQ==
X-Received: by 2002:a05:600c:1c1c:b0:492:1e36:552b with SMTP id
 5b1f17b1804b1-49240e7f307mr1905325e9.36.1781808089941;
        Thu, 18 Jun 2026 11:41:29 -0700 (PDT)
Received: from [172.16.30.123] ([37.209.163.134])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650b76e7c9sm865703f8f.21.2026.06.18.11.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 11:41:29 -0700 (PDT)
Message-ID: <1544040a-578f-41b0-9660-5a6f470f031f@ursulin.net>
Date: Thu, 18 Jun 2026 20:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: rename ttm_place::fpfn/lpfn to param1/param2
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260618133908.2761908-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260618133908.2761908-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: tursulin@ursulin.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: POI262ZXL22IBPYYAWD7RAJYUIBHJVFY
X-Message-ID-Hash: POI262ZXL22IBPYYAWD7RAJYUIBHJVFY
X-Mailman-Approved-At: Fri, 19 Jun 2026 14:24:08 +0000
CC: alexander.deucher@amd.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/POI262ZXL22IBPYYAWD7RAJYUIBHJVFY/>
Archived-At: 
 <https://lore.freedesktop.org/1544040a-578f-41b0-9660-5a6f470f031f@ursulin.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 18/06/2026 15:39, Arunpravin Paneer Selvam wrote:
> The fpfn/lpfn fields in struct ttm_place were named after page frame
> numbers, but they are really just placement parameters passed to the
> backend resource manager. Rename them to the generic param1/param2
> and document that their interpretation is backend-defined. The VRAM
> range manager continues to treat them as the first and last valid
> page frame number, so behaviour is unchanged.
>
> This decouples the API from PFN/range-specific semantics so that
> these fields can be used more flexibly in the future (e.g.,
> mask-based or segment-aware placement constraints). No functional
> change.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       | 16 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h       |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  8 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 46 +++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 24 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       | 16 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 32 +++++------
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
>   .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c  |  2 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 18 +++---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 56 +++++++++----------
>   drivers/gpu/drm/i915/intel_region_ttm.c       | 14 ++---
>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  4 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c          | 22 ++++----
>   drivers/gpu/drm/nouveau/nouveau_mem.c         |  8 +--
>   drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c                 |  4 +-
>   drivers/gpu/drm/radeon/radeon_object.c        | 28 +++++-----
>   drivers/gpu/drm/radeon/radeon_ttm.c           | 18 +++---
>   drivers/gpu/drm/radeon/radeon_uvd.c           |  8 +--
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 16 +++---
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  8 +--
>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  4 +-
>   drivers/gpu/drm/ttm/ttm_range_manager.c       | 18 +++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 30 +++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  8 +--
>   drivers/gpu/drm/xe/xe_bo.c                    | 24 ++++----
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 40 ++++++-------
>   include/drm/ttm/ttm_placement.h               | 15 +++--
>   32 files changed, 259 insertions(+), 252 deletions(-)

<snip>
>   	if (unlikely(ret)) {
> @@ -124,8 +124,8 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
>   	u32 num_pages = PFN_UP(size);
>   
>   	/* Don't evict BOs outside of the requested placement range */
> -	if (place->fpfn >= (node->start + num_pages) ||
> -	    (place->lpfn && place->lpfn <= node->start))
> +	if (place->param1 >= (node->start + num_pages) ||
> +	    (place->param2 && place->param2 <= node->start))
>   		return false;
>   
>   	return true;
> @@ -139,8 +139,8 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
>   	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
>   	u32 num_pages = PFN_UP(size);
>   
> -	if (node->start < place->fpfn ||
> -	    (place->lpfn && (node->start + num_pages) > place->lpfn))
> +	if (node->start < place->param1 ||
> +	    (place->param2 && (node->start + num_pages) > place->param2))
>   		return false;
>   

Not very readable ie. good for ease of maintenance - how about an union? 
Would also avoid having to touch all the drivers.

Something like:

union {
     struct {
         u64 fpfn;
         u64 lpfn;
     };
     u64 drvparam[2];
};

Regards,

Tvrtko
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index ab2639e42c54..2c38674be102 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -73,16 +73,23 @@
>   /**
>    * struct ttm_place
>    *
> - * @fpfn:	first valid page frame number to put the object
> - * @lpfn:	last valid page frame number to put the object
> + * @param1:	generic placement parameter, interpretation depends on the
> + *		backend resource manager. For range-based managers (e.g. the
> + *		VRAM range manager, the buddy managers in amdgpu/i915/xe and
> + *		the TTM range manager) this is the start of the allowed range,
> + *		typically expressed as a page frame number.
> + * @param2:	generic placement parameter, interpretation depends on the
> + *		backend resource manager. For range-based managers this is the
> + *		exclusive end of the allowed range (a value of 0 means
> + *		"no upper bound").
>    * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
>    * @flags:	memory domain and caching flags for the object
>    *
>    * Structure indicating a possible place to put an object.
>    */
>   struct ttm_place {
> -	uint64_t	fpfn;
> -	uint64_t	lpfn;
> +	uint64_t	param1;
> +	uint64_t	param2;
>   	uint32_t	mem_type;
>   	uint32_t	flags;
>   };
>
>
