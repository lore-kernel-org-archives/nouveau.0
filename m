Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C67606A31A
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCEgCh/B
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21B28112247;
	Thu, 29 Oct 2026 11:58:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C5AB48BEC;
	Thu, 29 Oct 2026 11:39:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793273983;
 b=BjAS0QCyUpq8n086EU3Fu9WtIodVw/+cKHGR3PWlepT2FDAVQI5+ORLVKEBWrycVX779I
 sVgl0nFebzNvOUX/te3g0hrP1zPdtw65AKOzLhcVvdZCwSdEXowPkLBuIuFPFbOjPVONcsY
 wapsso6eEmkRfnKI9PssICo71GMQxBOqDuYKFGDureWQikvHt1PJUbShwBeUbwQgBD0bOq4
 DEnF7hZ7jEUlhwBwvDCShLDG7U57ARJaqZwjj+hvqj8VkO73Xrv96REOvrArkX57f8dq8Mc
 nna3aRyFxAbn0Vsb4EKm23rdvVJ/TWJs7L/k459oBaDnLmjN8CeaWz2jTU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793273983; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bFtWXG8m5JKsyn/qeOedunaPNpqgZZez15iz91neCTQ=;
 b=F2z4ebqFg7kzANa9o63QMP9Lq3k2rdF853UUON1IFjcnRhpSkidzPo/6Ninh7w0Jy7vjN
 Jd1Fn92DvU3JvOrRFoydlqHxcvFH3JwV31eAHiwdKTiS5v6csfEVJWAH8OmgEXT/9/X72n4
 127rWD8Ust+Thzsqd+fxnfcRIWvhy+jQAz/rzQFF1v101phWUcC7sAFL5ALvnIKERwz35lN
 WGsb29eQY6TxXDSySMwhrfgiMTEmuOEaqCd8NbEtDeSZ13ZSX5X0f2X/rap+rK19LyVg2jM
 IJQvyRKkggu1scRaa4UXcEJZalaidR9XyiKp2Xuw8M/oKrdDbdgM9f6j47eQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 367A246BCB
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 11:39:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC14010E371;
	Thu, 29 Oct 2026 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275125; x=1824811125;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=i2ey7uKnBTF2PqloNxgHfVH5I2ULdNgzLR4UomlVJVE=;
  b=hCEgCh/BTa/Qzgmp+4HLQioOq5WHwB5VWc3hQ0aXHp3L7kbbr10u6jYH
   GnH9fCIp3T3nNhuncYyXqjaITEMpHcRldCDGwLzI1V6fJPW/fJgBNMzuv
   6IxniOigI2OVzv96VJG40Tgs5qtI7cUSnvlmHSAsGcddQS651DnimrYYR
   s/dJdfVXpMzQpCNB3MmgtZBbwmCyDg107BZXI6i/a7Pv75ifGWeui+jve
   daZ7Lck+LldP8LBtktbd4WqK99HhxJYhgrbQL/2t4+nDknQAUkxhgN2jJ
   E4wFxDWL7bs+hUce2OMBxvGLr3n1Ry/S/iYpo1FBDAeMHaDmMaIj9BUux
   A==;
X-CSE-ConnectionGUID: LOlbkZToT5OwpntOzmfSPg==
X-CSE-MsgGUID: 7O3/ujWPRf+XIOFU3/2d0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908641"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="1908641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:58:44 -0700
X-CSE-ConnectionGUID: c3VOsTDBQBC2683iNWsTgg==
X-CSE-MsgGUID: NQ3qXX8fTMilynHkhUiSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="5462784"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:58:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Use
 drm_dp_enhanced_frame_cap()
In-Reply-To: <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 13:58:36 +0200
Message-ID: <3d8c0987e3f9e4e099372475b2e0584963b6b71d@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 77FVKSY4Z2B7OH7ICGJEOMRSBPYBUIHJ
X-Message-ID-Hash: 77FVKSY4Z2B7OH7ICGJEOMRSBPYBUIHJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/77FVKSY4Z2B7OH7ICGJEOMRSBPYBUIHJ/>
Archived-At: 
 <https://lore.freedesktop.org/3d8c0987e3f9e4e099372475b2e0584963b6b71d@intel.com/>
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
> Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
> enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f47717bd1..8cab9a3e6 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1375,7 +1375,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
>  	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
>  	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>  
> -	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
> +	if (drm_dp_enhanced_frame_cap(dpcd))
>  		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;

I note that the driver should probably also switch to
drm_dp_read_dpcd_caps(), but that's beyond the patch at hand.

>  
>  	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");

-- 
Jani Nikula, Intel
