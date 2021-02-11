Return-Path: <SRS0=uz8r=HN=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FB9C433E6
	for <nouveau@archiver.kernel.org>; Thu, 11 Feb 2021 03:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89FE64EBC
	for <nouveau@archiver.kernel.org>; Thu, 11 Feb 2021 03:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89FE64EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C8E89CBE;
	Thu, 11 Feb 2021 03:56:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEA689B3C;
 Thu, 11 Feb 2021 03:56:55 +0000 (UTC)
IronPort-SDR: hSZYg/T0qrLI+0ESjE4NWTvo0vM669sg4eOx+/rPDOSRTrtvSfrgmL+7Q2+tY3v5jyNy17T4/P
 wFevwSHE8m+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="181415725"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="181415725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:56:54 -0800
IronPort-SDR: p5y/8oyWQyEJYLwp2trAZV5GK8sDdKqojTmNFm0oGeN3iHjKo9fGhWUnH2beBupiCG68KiamqE
 5pzNBywEWxEg==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="397075297"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:56:52 -0800
Date: Wed, 10 Feb 2021 22:56:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20210211035650.GH82362@intel.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-6-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208233902.1289693-6-lyude@redhat.com>
Subject: Re: [Nouveau] [RFC v4 05/11] drm/i915/dpcd_bl: Cleanup
 intel_dp_aux_vesa_enable_backlight() a bit
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 06:38:55PM -0500, Lyude Paul wrote:
> Get rid of the extraneous switch case in here, and just open code
> edp_backlight_mode as we only ever use it once.
> 
> v4:
> * Check that backlight mode is DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD, not
>   DP_EDP_BACKLIGHT_CONTROL_MODE_MASK - imirkin
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c37ccc8538cb..57218faed4a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -382,7 +382,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_panel *panel = &connector->panel;
> -	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
> +	u8 dpcd_buf, new_dpcd_buf;
>  	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
>  
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
> @@ -393,12 +393,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	new_dpcd_buf = dpcd_buf;
> -	edp_backlight_mode = dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>  
> -	switch (edp_backlight_mode) {
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PWM:
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET:
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
> +	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
>  		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>  		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
>  
> @@ -406,13 +402,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  				       pwmgen_bit_count) != 1)
>  			drm_dbg_kms(&i915->drm,
>  				    "Failed to write aux pwmgen bit count\n");
> -
> -		break;
> -
> -	/* Do nothing when it is already DPCD mode */
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD:
> -	default:
> -		break;
>  	}
>  
>  	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
