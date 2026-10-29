Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A087606A31C
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RcQFyetm
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9D7112237;
	Thu, 29 Oct 2026 12:01:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 81D2C48BEF;
	Thu, 29 Oct 2026 11:42:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793274129;
 b=AU5PzyW7a5WGpjxjYBo3JD6eLtot9pFmuXVyT6+wEI+5GFcDMH6qDE/Oap2Ux83kt2+U/
 qo/o+2nVjmX5ytnpERvZEJjGlE6kmervCXALp9vj9xXPRmq5KQytQIy4Bc+5gvB7ARX97/S
 Glon1qp5DO1ZIP6LPz7uh8EhmbKcUl1pV0nMmZx2gcQDZ/Sh2uiv3nuMqtFbYdCxUv16j74
 QJvl01n2+YVFabjPT1sefx4GYCXNi8fS//k/n1KSTyhNqwL5001sH0xnDGb3aauZu8j66HF
 93yyS4djIcdkQ5kUy17sMg5oLIcU7kNq2PMzzpYP41GQX/PGXW7HEie9w77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793274129; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6ox96XF7TR2O7kzILwg61Yy6ZNx/dN3lPRd2O0EFb20=;
 b=JQE2KwFkHTxsJXqhGJbs7Ej7NHDu6g/OO2xdcIxK6glvOLt0Jv/b4xJ976QUOtqYN4Tag
 rlWTHbEPzLQ+CwkgdRwPm038wHGWkKv9tMKrzL0Eg9QFyXdwpkvqDxnOJunDGDXC53QYTq0
 ybvfcEaFHR88qI60r8dPmz2rslc+g2864PqrGl6iETOXwZFaFpp9OdIL9iVXx1PD7khP4kQ
 Fr9uBPzW3L0ktReU3c9ob+lmLPHfTBtOJsQ9DZqwOL0d1PSyWT0ec8WFMFVSfyueGvbcENp
 W6mJHFWzVyPvh4kk1OOlSM1S96mykuRsi9yea630/KHnKx4AVlvPXtkmxY4g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2C83346BCB
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 11:42:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D334811223B;
	Thu, 29 Oct 2026 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275271; x=1824811271;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Sg99qBSYPrQ/dvhBMnxG7AV2h/mgImJ/LtHy20Vj8R4=;
  b=RcQFyetmjjAuZ89X/lZqjlnO/9AfaO3FSpcw2YzFyWJ3v+fZLwfAjuId
   ysqEcSa2pAmhB8R0eS7fPPUPRyVUHggR1dmLbE6ZrnVtbIUNt1NDd1EQK
   aDGvkYoclQuYFNzIadIvLhf3TyogorTItrpBgY584srh1yzdxM0UP1qXC
   ARVHOTh9WHs1IrVtKQ0TBK8ERr7LBuCXz2aNjliyqJQqCAy+P7163p7xD
   jyr1CljPoOpba31KQBbNXnyjhiTPHSdr6QBB5OmtjPa9D4/qJOTQ+1RGg
   RTJP4dCgxVXuYKfmoYTPjr9T3gx9aXx+UU7SpJUjpd/gFJCALvnCornWY
   w==;
X-CSE-ConnectionGUID: Qyr9sgxSSrO5MhtEJKZ4UQ==
X-CSE-MsgGUID: tezwPZDjRL+CEGYxyG10Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908944"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="1908944"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:01:10 -0700
X-CSE-ConnectionGUID: 5EX7hURQSrqLzZCP6wxP0w==
X-CSE-MsgGUID: c117/tVSTQiEeJx+aVTUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="6889781"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:01:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: Use
 drm_dp_enhanced_frame_cap()
In-Reply-To: <20261029101826.72773-4-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-4-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 14:01:00 +0200
Message-ID: <77d3b5f1643531134754303befe9ee2c3c13d5f6@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: QBTSAAYS6UK5MWUDB4GGEYGAELSYLR6Z
X-Message-ID-Hash: QBTSAAYS6UK5MWUDB4GGEYGAELSYLR6Z
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QBTSAAYS6UK5MWUDB4GGEYGAELSYLR6Z/>
Archived-At: 
 <https://lore.freedesktop.org/77d3b5f1643531134754303befe9ee2c3c13d5f6@intel.com/>
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

Here too the driver should probably use drm_dp_read_dpcd_caps(), but
again beyond the patch.

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index e136ac71e..d798a3db7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1651,7 +1651,7 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
>  	link->rate = drm_dp_bw_code_to_link_rate(it6505->dpcd[1]);
>  	link->num_lanes = it6505->dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>  
> -	if (it6505->dpcd[2] & DP_ENHANCED_FRAME_CAP)
> +	if (drm_dp_enhanced_frame_cap(it6505->dpcd))
>  		link->capabilities = DP_ENHANCED_FRAME_CAP;
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "DPCD Rev.: %d.%d",

-- 
Jani Nikula, Intel
