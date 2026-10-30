Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B4606A33E
	for <nouveau@archiver.kernel.org>; Fri, 30 Oct 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+dfijMb
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D574A112762;
	Fri, 30 Oct 2026 11:15:37 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BCFAE48C08;
	Fri, 30 Oct 2026 10:56:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793357785;
 b=OQ2vca9HZpt/fEv4n2NNT5ZBClIaoIapNeSDMly0SvAdGGv2t1pwDIknatDmEi3/IWvf3
 UdPR8QpSheyXaWbah/VWLvH/HM3PpXeTRV6xnPTNQ/lYXTxWVuVA1jadL/PnhE04kx6tmzE
 hrF0iGHzhLvLzbmkOysGDCmdbRpr+w9fszi6Ows9rLJAaydIKydJvTHmCJvB24HOijSpQx5
 2sX5H8epXTOHFDOnJDVQ4hLmudZgJnz9SSmD/SOKkf11r3gZeCazdcJufJQHXvoIArenOB/
 lv36WnzJ4rMAl0tqSk8M8Hc5V72emSvbXt+YN9/ZblE2YljduPrnvJuNEPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793357785; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=H7/oio+Hg9GSpr6abNQasYJWCkT67LW3pbPlx6tFe8E=;
 b=C82z7Y53X9OjiuQUVwbS4Tbx9cJqXlroFYmze/f2f50XEJGmb0157KL/epg2Ju2fMvVnL
 hHMMR6RIZDlDRO91eNZ1YtYJ3HSdCV8dn4Q/XwmKagte2V301q9Nc/KVEBZNesC9mBqjcqp
 w/Wimr0eLlerQBxPbkjTsFQMGUmj7vxbvlSXGX9aVAidqkHaBroLrlbefNI8B+p72LJEuvg
 aq3XFRu3RTwh8toLwMcVSdooj79w9s/N7S2Xos5S3NfR8EsIKxnz+++Qm6Xt5MDZZU10YG0
 bnh3DU6GbNQC7aaXyefAVOR4EF/4/+VKpTCLYGkKVAXXQ73AqfF8zMJxE0HA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 01B104711B
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 10:56:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD3112752;
	Fri, 30 Oct 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793358928; x=1824894928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g1ONnB+NbjvqgDLM112cAGMnNcTmZ7rBKsZD6MbICpk=;
  b=O+dfijMbNWrVktolYv5LWvq6pMZV2+svLkpAWrjgaYdDZViBJSEjBuIz
   S7e/IAoQlt3vZwDtCSnP0YWZ6zFy6QVM9Sc0NwTAJBAN6RcKMpdRGxXw5
   dVeFuJW6UA3k6zal9Cg4SBeQhGm8SfP6CeAEJvlhqjw4vaQEE2eIlCy/K
   D0o9KvLPyRgP5qR8+AsO/zuo+xmr73QrEhrv8pQSXBohcKcTXs4jNJLmm
   iRWUHMR5iYdvbULa1FFnuSxLCJ5JeGSLXPCf3MZ9IayU5UbQwJ7n17Kv/
   dSBCvTYb+BfkkjDPcdg/bA1QPdnGPnroVjjvEWGHOTzs4gfh/89anmNVQ
   w==;
X-CSE-ConnectionGUID: XsRh6euLS8izAfdY3ic/xw==
X-CSE-MsgGUID: N6ShC4TmSFqfT+PZgjqdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2151547"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400";
   d="scan'208";a="2151547"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:15:28 -0700
X-CSE-ConnectionGUID: yb71Tav0Ss+85cfPI2AKuQ==
X-CSE-MsgGUID: JVPkhtUUTAGAt9DyjE3lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400";
   d="scan'208";a="7202602"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:15:23 -0700
Date: Fri, 30 Oct 2026 13:15:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: Re: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Message-ID: <auR8R7G5S8hv5R0e@intel.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Message-ID-Hash: BVWKQTUVPSO76HS6YSN4WS3BDE5KNXBK
X-Message-ID-Hash: BVWKQTUVPSO76HS6YSN4WS3BDE5KNXBK
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BVWKQTUVPSO76HS6YSN4WS3BDE5KNXBK/>
Archived-At: <https://lore.freedesktop.org/auR8R7G5S8hv5R0e@intel.com/>
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

On Thu, Oct 29, 2026 at 11:18:22AM +0100, Dmytro Malovanyi wrote:
> DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
> downstream device with DPCD Revision of 1.2 or higher must enable
> Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
> DP_ENHANCED_FRAME_CAP bit does not need to be checked.
> 
> Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
> sets it in the base receiver caps, but clears it in the extended
> receiver caps at 0x2200, which are the ones we use:
> 
>   base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
>   extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81
> 
> Through a USB4 dock (CalDigit Element 5) the link trains without
> enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
> the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
> does not change it. Connected directly to the laptop the same sink
> syncs without enhanced framing, at RBR, HBR and HBR2.
> 
> Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
> changes behaviour for every driver using the helper, but only for sinks
> which already violate the spec by not setting the bit.
> 
> Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
> framing (0x101: 84) and the sink syncs (0x205: 03).
> 
> Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
> ---
>  include/drm/display/drm_dp_helper.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 5b05a7fbe..4f20f60db 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  static inline bool
>  drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> +	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */

DP_ENHANCED_FRAME_CAP is also mandatory so I think this needs
a bit more detailed explanation.

> +	if (dpcd[DP_DPCD_REV] >= 0x12)
> +		return true;
> +
>  	return dpcd[DP_DPCD_REV] >= 0x11 &&
>  		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
>  }
> -- 
> 2.50.1 (Apple Git-155)

-- 
Ville Syrjälä
Intel
