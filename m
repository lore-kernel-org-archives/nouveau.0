Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F2C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:31:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0E10E3A4;
	Fri, 11 Sep 2026 08:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FLFpvNgM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0399B40206;
	Fri, 11 Sep 2026 08:14:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789114448;
 b=rH88O8wiqvwNEKA8jIwAoSJzFao81yBu+kj1QMlzgWtp29m3MT8UffJSQLHemsytaipaM
 2X9DyITaw/EUniUDn6JEpF5VOtt59qXhu92Yj2gIjBnAnJl1196Ogb6TeIEWvbD3oL05vcz
 /eZpZ2TYvvSPkFo2jGhYvIBPT3dGUzNYL/c4tCtuEOIIGlTArhaD3R1fCOZFo+2dswob7FR
 2oxo2PRJmOvkBiqJBlq8rPHwqfD8mRIHz11miB/ZyJo288A6tHDT74FN82fEoyLxkdZ6xvq
 0+4NunaQF5pFjzsob0sOxoxnPCvnAdBae/FEfCqYf826YquuCSvu/u5Gv4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789114448; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fHvEZyGHFXSOOWopt+ZiGXvrQE2U51JO9qYHTx451cA=;
 b=d0UU6uS6E54w1uLbnC80o1PdeFiAkf8zXapu39bqB4PQAiOYY3ArVflHR8BdZJ0617eD6
 PG+6IftacphldviCO8pBkGD2xRtyqzdp+xOeTZVUf98nr97ZzwsoSH2CMQwZivyy5dxTDMF
 LuDM8z+wEy0BZFmfrXLXWTXbSKrRQAdoPOWOhknvUTJlYl4eCkH3qpUuUjBhYhi++GFcCrv
 aXogfFa7tUvM1DbHiv4pkufjTXvSf5GyuU6AjmmgsIFsRIp5/YK2zE/6FThCGG1CXNJQgW+
 4j1UnivvWCQ/fXM42W3l5Z0KKVX5p1jNfF6brGBDWqPOqrmhcJoJ9q6KEf6A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=arm.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=arm.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 94D644005A
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:14:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2A410F574
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:25:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEC1C28AC
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 01:25:05 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 631F33F7B4
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789115109; bh=pg2xKrTSSwShkOsUdLdeGDqS93TawwwTnBwMiecesqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLFpvNgMaejdBZr/dwBAjsPOdiKXOXGhkd5iL15TvjiulJdQNO8wvAVC4qjKST/n0
	 n5pRc4vgdNRgX9JLFlnchVbb56PBSBHWDMhbBZJuI49CPyqe1+ZRt4Fn0kl9mENoGC
	 9cDn0U42PEsKLZ1k52+atB4G7OCbDCAKhskeZLas=
Date: Fri, 11 Sep 2026 09:24:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/gpuvm: reject zero-length range in
 drm_gpuvm_range_valid()
Message-ID: <aqO60UtyI9WlN0fw@e142607>
References: <20260902-drm-gpuvm-zerorange-v2-v2-0-da63269c6ec4@gmail.com>
 <20260902-drm-gpuvm-zerorange-v2-v2-2-da63269c6ec4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902-drm-gpuvm-zerorange-v2-v2-2-da63269c6ec4@gmail.com>
Message-ID-Hash: D7CO2UOZ65XFQLBX77HQC6RTOKSE7ROB
X-Message-ID-Hash: D7CO2UOZ65XFQLBX77HQC6RTOKSE7ROB
X-MailFrom: liviu.dudau@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D7CO2UOZ65XFQLBX77HQC6RTOKSE7ROB/>
Archived-At: <https://lore.freedesktop.org/aqO60UtyI9WlN0fw@e142607/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Sep 02, 2026 at 08:28:43PM +0800, Zhenhao Wan wrote:
> drm_gpuvm_range_valid() is the common gate every GPUVM map/unmap path
> funnels through: drm_gpuva_insert(), __drm_gpuvm_sm_map() and
> __drm_gpuvm_sm_unmap() all reject a request unless it passes. It checks
> for overflow, the managed-range bounds and kernel-node overlap, but it
> never rejects a zero-length range. A range of 0 is page-aligned and
> addr + 0 does not overflow, so a zero-length VM_BIND request from
> userspace passes validation.
> 
> The GPUVA interval tree derives a node's last key as addr + range - 1
> (GPUVA_LAST()). With range == 0 this underflows to addr - 1, producing
> an interval whose end lies below its start (and, for addr == 0, wraps to
> U64_MAX). __drm_gpuva_insert() then issues its overlap query with that
> inverted interval, so the -EEXIST guard matches nothing and a malformed
> zero-length node is inserted, corrupting the augmented interval tree's
> subtree-last invariant and misleading the overlap checks of later
> map/unmap operations on the same VM.
> 
> Because the shared helper's own kerneldoc promises to validate "the
> range" yet silently accepts range == 0, drivers have papered over this
> individually and inconsistently: imagination and xe reject a zero range
> at/near the ioctl boundary, while nouveau and msm do not. Fix it once at
> the common gate so every current and future caller is covered.
> 
> The only in-tree user that legitimately accepts a zero range,
> xe's DRM_XE_VM_BIND_OP_UNMAP_ALL, interprets it at its ioctl layer and
> never passes range == 0 into the GPUVM core, so it is unaffected. The
> in-core lookups drm_gpuva_find_prev()/drm_gpuva_find_next() pass
> range == 1 and are likewise unaffected.
> 
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index c422c5af1f4b..b73ad6988171 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1021,7 +1021,8 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
>   * @addr: the base address
>   * @range: the range starting from the base address
>   *
> - * Checks whether the range is within the GPUVM's managed boundaries.
> + * Checks whether the range is non-zero and within the GPUVM's managed
> + * boundaries.
>   *
>   * Returns: true for a valid range, false otherwise
>   */
> @@ -1029,7 +1030,8 @@ bool
>  drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>  		      u64 addr, u64 range)
>  {
> -	return !drm_gpuvm_check_overflow(addr, range) &&
> +	return range != 0 &&
> +	       !drm_gpuvm_check_overflow(addr, range) &&
>  	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
>  	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
>  }
> 
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
