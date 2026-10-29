Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D22606A326
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QtlXh4HB
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D46C1112255;
	Thu, 29 Oct 2026 12:04:09 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D84E348BF3;
	Thu, 29 Oct 2026 11:44:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793274299;
 b=O015AXzTDkDGb+iDDoWQEQTTWVTYFRk/XfgtVU3LWiyacvWlNj9d1JtqB5Du9zwfb58Qe
 c5relcnrQBmgPkFVcrptz0nWwuOKmPHabdzLdM4YabjTU33XBlCHVm8XwzmkP0oq029+xTx
 7aLeUXZjnN+Wid9zHO9/09ZTeN64/smNFmeVF5EwBeQWxy1tS5K1EKsXkvXOlPDhwvHGy6B
 hE/d4LpLg9nqJ2w/1jDSymgbprMDiWZRiEJ3YlGs1skeSSw2h3l3ya+nwB058fLjwKP33Sr
 9qP+MxNjH8POOmHYETcZhVB4wbYDGIxg7mXpPAqJ8+MbvYBEp/SzsmtVS/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793274299; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aoaaiqgG+MuPX1i302u4z5cKAwdcZoyJSA3p5kyjrws=;
 b=zqMT5ZWFF9dYaMaMCu2xZkvhGZo/ZYLwGEdcfSINvPfyX2qHyXFGTKYZfdcI6BHOva9Jd
 dBS+cYAbuDbKd04cmNaIwNImbVdx/iaO0QeHV4g/pE0p8CxIUCRbyKWv51DxcymJ8XqEb8P
 Xxjt4R3V5sLfqq1hVvm22uWwwGLNydPSZ9gLoTbIVSmp4N7KqXnD6IOiFPoeLj1NOdjYUFH
 tF2vgNbu88QMSGKzl9RZBMxHvtRWEBDR8DZoZuDYw6++DcptVqs+fIJfQM1UQv7XVEPzR/h
 j8JFSrxmqhssGvNAYnACIcH2AEP9wQDMgPW+qV5RY6bbvlVbftE0yn+YTCSw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4EE3846CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 11:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECDD810E113;
	Thu, 29 Oct 2026 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275443; x=1824811443;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=/oBe4m0YLZywxlXPUaO71KbtVZmDBPNp0Bo+RUOGUyA=;
  b=QtlXh4HBcZRMd6Hqk470+0P9ZUNkHdg289pJ5GghCQOXNal92q83XyUK
   abWMFXUBUDGO+yCIkw9ezuzNB0oyU3vm6APenpcBHZyf983TAW0e8Nphb
   sqSmoKUJUHGxXRfLd5ZXthaygjEaGbnC2IWG3BLIjlS5tNVCvLExVAuB/
   wxygBk2BbYZZNMcNpSdGpOPDaf2+2Uuz/kNT3xW82xGCZp0LeiqiF4GYI
   vPkXgrh874+naHdJoYnM8Nr672Qc/RYkPduuhHIkonEgOc7lzjQ6vuSaa
   sVeSFvwheoxOXvyNrJSRwHspcRQRIbKKdkJtyHOQCkt4PJ5yNnn8Shahz
   Q==;
X-CSE-ConnectionGUID: Djo5EHGrRJmsxMu+G/2z2A==
X-CSE-MsgGUID: x9sZBSNBRO6LUeEH61099Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1921908"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="1921908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:04:02 -0700
X-CSE-ConnectionGUID: o3cZccRnTY6iVlX7c2yjog==
X-CSE-MsgGUID: MwZM0ZfbRSO/mxbxVGNxYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="5252995"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:03:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
In-Reply-To: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 14:03:53 +0200
Message-ID: <ffac172bea7c82b9fddf8fa3949d62e9f62af497@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: CBI53MNK5RW3LB3QNDSNR25PSNZXN37A
X-Message-ID-Hash: CBI53MNK5RW3LB3QNDSNR25PSNZXN37A
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CBI53MNK5RW3LB3QNDSNR25PSNZXN37A/>
Archived-At: 
 <https://lore.freedesktop.org/ffac172bea7c82b9fddf8fa3949d62e9f62af497@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, Dmytro Malovanyi <dmitrymalovanyy@gmail.com> wrote:
> Use the helper instead of open coding the check, so enhanced framing is
> used for all DPCD r1.2+ sinks as the spec requires.
>
> The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
> past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
> the other drivers do. That is 15 bytes, it fits in one AUX transfer.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Ditto about drm_dp_read_dpcd_caps() usage.

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 8d0626ddf..0973598c7 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -262,7 +262,7 @@ struct cdv_intel_dp {
>  	uint32_t color_range;
>  	uint8_t link_bw;
>  	uint8_t lane_count;
> -	uint8_t dpcd[4];
> +	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
>  	struct gma_encoder *encoder;
>  	struct i2c_adapter adapter;
>  	struct i2c_algo_dp_aux_data algo;
> @@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
>  	intel_dp->link_configuration[0] = intel_dp->link_bw;
>  	intel_dp->link_configuration[1] = intel_dp->lane_count;
>  
> -	/*
> -	 * Check for DPCD version > 1.1 and enhanced framing support
> -	 */
> -	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
> -	    (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) {
> +	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
>  		intel_dp->link_configuration[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
>  		intel_dp->DP |= DP_ENHANCED_FRAMING;
>  	}

-- 
Jani Nikula, Intel
