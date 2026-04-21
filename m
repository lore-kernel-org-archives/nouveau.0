Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BCDF8FA94
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 15:32:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F70C10ED12;
	Tue, 21 Apr 2026 15:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="cTC+6LX4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 444B745AAC;
	Tue, 21 Apr 2026 15:20:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776784830;
 b=eTgS6QyTXp3GMA/OAwapv3ZCO3CGuBVDulYpMVVmNNmGP3Zwr5/hEEL0cR91CZtBV958o
 E0CE5L/n8zSskstXaos1y2nEvetTy5xigoiB/MDUWNOnSSffF1P+WHEJBUnlBDv7lR8O/rF
 dy5DneNeakjJrb+i7dygjhA7dKSf6HvMLO5ojB0vKjBp1mfE20knXPbZM48nUX3hu0QuCJO
 vVriuVjKrPW2fnnOkxOf5Ful8UFCiwnMirTlb/lyG6Jw1ADguSBV816y4M6ayZKg/I+XcAi
 Ky44wkkK7YxO2Qv0oPJ+DaWXuVBgbY/pzYTBaJY5SR7jCAuvB7n6zGzW7b5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776784830; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gtUu2+HHMoqhkHAJuzGX7yUs2OZwRdwzYeonihj9Dbg=;
 b=Ai9HH7C9L8BPNp9/fGNupBbTX0/sNtjTQehVyyNsOk/4MWTUrbB2FQ+/BAj1ZdpiVYnZT
 ijN1GA7EKuVysMQJphL58NbkO1D5VQyPt3kUnGXFfsr1nFqrPjFitjf5g4fZq5CjgmW6CZ7
 P1mefSKzX6ttBMG8eiNkNIr8XJflsDl7qQWhr7asm2g/Z0RAVAQRhLgTGYEpfr46yVurbeT
 Ww+8izAdYOlEh3qG8jrzQzEXH94/5nttvztA776p7i+JAWUzOvTa7Ov9MHW3wShcKaYuNJx
 KGIT2nax+gyHwO4iPPNa5kA02UW5gJ7IBRGKVrL6Gse633ONlpiWn1vRNJLg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=arm.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=arm.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4F7BC45AA5
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 15:20:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025310E20B
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 15:32:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF92263D
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 08:32:28 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3405A3FAF5
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776785554; bh=fhBy7ZTDUwKSbf3HhFiViEZekUwSlWT1MQ0rYA5c8Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTC+6LX4iLQbeK+lKhuGIHu1y92gdCX2NBm4Nsa6XvN8o7X6Z23lW4L0uk0/bTIB3
	 dvLNcrXhDmHwN36ts35VkUux+wBNlxL5mpp/uqfpckUa8AXaDimFA6YyxPaJq4fPsl
	 95Ii2Xj4p39y+BkvoX6WKcO3OmESxpjGTeLKFx5A=
Date: Tue, 21 Apr 2026 16:32:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
Message-ID: <aeeYhWsRqXqfnzge@e142607>
References: <20260421084701.24227-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
Message-ID-Hash: 4JVXB2FTX6QC3ZKWH2HPFXXTIT32PQ6I
X-Message-ID-Hash: 4JVXB2FTX6QC3ZKWH2HPFXXTIT32PQ6I
X-MailFrom: liviu.dudau@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org, boris.brezillon@collabora.com, steven.price@arm.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4JVXB2FTX6QC3ZKWH2HPFXXTIT32PQ6I/>
Archived-At: <https://lore.freedesktop.org/aeeYhWsRqXqfnzge@e142607/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 21, 2026 at 10:47:01AM +0200, Laura Nao wrote:
> The DRIVER_GEM_GPUVA feature flag is currently only used to control two
> behaviors within the DRM core:
> - calling  drm_gem_gpuva_init() during
>   GEM object initialization
> - creating the "gpuvas" debugfs entry
> 
> drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is cheap
> to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
> referenced by GPU-VA capable drivers, so clearing the feature bit does
> not cause any unrelated drivers to get the "gpuvas" debugfs node. The
> flag doesn't have any relevant purpose (e.g. gating ioctl handlers or MM
> logic) and doesn't provide any practical benefit.
> 
> Remove the flag definition and drop it from all drivers that use it,
> call drm_gem_gpuva_init() unconditionally and clear the driver features
> bit in DRM_DEBUGFS_GPUVA_INFO.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c             | 3 +--
>  drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c         | 2 --
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-

For panthor changes:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  include/drm/drm_debugfs.h             | 2 +-
>  include/drm/drm_drv.h                 | 6 ------
>  include/drm/drm_gem.h                 | 3 ---
>  9 files changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0377a5fd402d..cb703d0072aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  	if (!obj->resv)
>  		obj->resv = &obj->_resv;
>  
> -	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> -		drm_gem_gpuva_init(obj);
> +	drm_gem_gpuva_init(obj);
>  
>  	drm_vma_node_reset(&obj->vma_node);
>  	INIT_LIST_HEAD(&obj->lru_node);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index 268900464ab6..80033d4cb66a 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
>  DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
>  
>  static struct drm_driver pvr_drm_driver = {
> -	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER |
> +	.driver_features = DRIVER_GEM | DRIVER_RENDER |
>  			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>  	.open = pvr_drm_driver_open,
>  	.postclose = pvr_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 195f40e331e5..ee38c18715f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -825,7 +825,6 @@ static const struct file_operations fops = {
>  
>  #define DRIVER_FEATURES_GPU ( \
>  		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
>  		DRIVER_RENDER | \
>  		DRIVER_SYNCOBJ | \
>  		DRIVER_SYNCOBJ_TIMELINE | \
> @@ -833,7 +832,6 @@ static const struct file_operations fops = {
>  
>  #define DRIVER_FEATURES_KMS ( \
>  		DRIVER_GEM | \
> -		DRIVER_GEM_GPUVA | \
>  		DRIVER_ATOMIC | \
>  		DRIVER_MODESET | \
>  		0 )
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..0f5f662e5429 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1364,7 +1364,6 @@ static struct drm_driver
>  driver_stub = {
>  	.driver_features = DRIVER_GEM |
>  			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
> -			   DRIVER_GEM_GPUVA |
>  			   DRIVER_MODESET |
>  			   DRIVER_RENDER,
>  	.open = nouveau_drm_open,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 87d27c3c1456..1a1d40a744db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> -			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +			   DRIVER_SYNCOBJ_TIMELINE,
>  	.open = panthor_open,
>  	.postclose = panthor_postclose,
>  	.show_fdinfo = panthor_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ffea4a453c01..b3acc202df76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,7 +393,7 @@ static struct drm_driver driver = {
>  	.driver_features =
>  	    DRIVER_GEM |
>  	    DRIVER_RENDER | DRIVER_SYNCOBJ |
> -	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = xe_file_open,
>  	.postclose = xe_file_close,
>  
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index ea8cba94208a..eb93512b0f23 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -48,7 +48,7 @@
>   * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info() from
>   * their @show callback.
>   */
> -#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_GPUVA, data}
> +#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
>  
>  /**
>   * struct drm_info_list - debugfs info list entry
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..e09559495c5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -107,12 +107,6 @@ enum drm_driver_feature {
>  	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
>  	 */
>  	DRIVER_COMPUTE_ACCEL            = BIT(7),
> -	/**
> -	 * @DRIVER_GEM_GPUVA:
> -	 *
> -	 * Driver supports user defined GPU VA bindings for GEM objects.
> -	 */
> -	DRIVER_GEM_GPUVA		= BIT(8),
>  	/**
>  	 * @DRIVER_CURSOR_HOTSPOT:
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..996aa418dce9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>   *
>   * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
>   *
> - * Calling this function is only necessary for drivers intending to support the
> - * &drm_driver_feature DRIVER_GEM_GPUVA.
> - *
>   * See also drm_gem_gpuva_set_lock().
>   */
>  static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> -- 
> 2.39.5
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
