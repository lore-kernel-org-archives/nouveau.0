Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72757606A31A
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 11:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FnvWHLMe
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF08D11225A;
	Thu, 29 Oct 2026 11:54:29 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA09448BE9;
	Thu, 29 Oct 2026 11:35:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793273719;
 b=pD5XCeFIYHhOB+4/BcN3UpfPe1CmLuOrAffNyeCDofZKvr/qwSPXxsrB2DkT+Eq/fg2v9
 PPHLClZGlYpdddrdTRlrHRRfllsEbE4GFlr9282K7dXi7KkFjRtroCkYFhyerlfknBfQ1oc
 8dAMEqdKnpDbhr8vFmaTP+iCgpqclX6HPaGpksfx6y1L35n96tiSyC4DeqBnQ80ZDk3mTB8
 acqZbO7G81JB/tpWJ5UyKyOIEsfYlJJROtzeC4oNGXCq/WCHhNNgj6/IqyLETZQsUHgdktM
 5NZPDl6m9tLgmgG/XcYQgK74dZVVK/ua33TLHio7CLyFuR68X39wy8Wrm2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793273719; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YBi8xDJGx/6F9wWTOGSs2iQ/3D1cw/PX4gpZHk4mGeQ=;
 b=Q4kZzU7MacQGxUfAT2xOByYFFRvTTR4AzWrhwcuK9nsRkA90uS/Z4wL5NL4N1pQt53jMy
 m6eeLJsXQ83biR4A9LkDLoArmcd6NSj2nfDPGN00RUs2/ojPi2ObXht1VHk8FN1czZ7HImP
 YqYAHCVE3CHBRTVq2wXT6+PMciprTmd4YC7PFGV4QagLnvB3+fLCuqCeQi3o96hEzO22eiO
 tFjJ51DN610yLUljtelIVuMID2Dns//FB5zHP8oqkDNIMu8YSPcrUZSPTJDwmOIkbaQ4PKl
 IWk/23WYeTUdT7P8VsoEIMYDh3vD9/TXMdkBKgxNSXJjOot5FulSv6q8233g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3101646CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 11:35:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2E112220;
	Thu, 29 Oct 2026 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793274861; x=1824810861;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JWrFGNTUYl9evw/cUDq4OqTIxZXe9cF0vyFHTZm8iS8=;
  b=FnvWHLMe6zgrfKFJrVIJDXW+OQoTEyAHfNNzrXDDV0G4alV1C1goelJh
   cuQgZ1Y+0Y2BN4cZyODokJujaOIFg8GPYrQtul87Up/e4KYp7/TtbppSs
   AlcxFI6eYcHz8UQ78Q1S/zrVYDu7ggDkGg81YsyfkADUFiimH16EBd3HO
   8PfRBwnKJrBZvi25ZB9BPZhIE50gZei0oYNLBqF5t6dnWer7hNLSNiISL
   Ao//h8qx75T2Ayv3+WwtVfQYmkeCy3/gxPjKLSMJ/BCoIQVbs+zXXjp3j
   AZRsuKJFmP0sV8YfTRULiLqi6rpaHOFjSmOqnE6p/QsWKC9D90btFpu1p
   w==;
X-CSE-ConnectionGUID: L6bTj8opTVS4O2QC8sBsVg==
X-CSE-MsgGUID: ZEhw3ccDS/+fxHFloY5eig==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1898030"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="1898030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:54:21 -0700
X-CSE-ConnectionGUID: +A58QkJcTMik+42R32X5Cw==
X-CSE-MsgGUID: RDmo4aLCReW6b8SBGQAJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400";
   d="scan'208";a="5218611"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:54:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
In-Reply-To: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 13:54:09 +0200
Message-ID: <5c241fa804e1e4ea4518854a96097252f7a5317a@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: MF23A2PVRKJK5GE55OVSSM2WH4O75UVT
X-Message-ID-Hash: MF23A2PVRKJK5GE55OVSSM2WH4O75UVT
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
 Dmytro Malovanyi <dmitrymalovanyy@gmail.com>, Leo Li <sunpeng.li@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MF23A2PVRKJK5GE55OVSSM2WH4O75UVT/>
Archived-At: 
 <https://lore.freedesktop.org/5c241fa804e1e4ea4518854a96097252f7a5317a@intel.com/>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I've bounced the series to intel-gfx and intel-xe to get CI results,
though I don't really expect any regressions.

I'd appreciate acks from other driver vendors too.

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
> +	if (dpcd[DP_DPCD_REV] >= 0x12)
> +		return true;
> +
>  	return dpcd[DP_DPCD_REV] >= 0x11 &&
>  		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
>  }

-- 
Jani Nikula, Intel
