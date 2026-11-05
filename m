Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC2606A32E
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHbKldF5
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E40B010F051;
	Thu,  5 Nov 2026 17:09:42 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1AB29490CD;
	Thu,  5 Nov 2026 16:50:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793897416;
 b=fF+5S0+a3etsYYQrkVo0UjinTKH0gQiBcE0JsnaBzV5Crjnti4LazqgEFPhLvRJoaybUH
 4SJzPWC+18Ljg1Pebn67gaBDBezRcgb73nlUJfOjl/+KVukmE+d8oquo8hMSTEvDq/ma5y1
 Cv9PKHDGLy34F7y94CT/oymgQ/zJlVFf/MRHDyP+Ng+g6pMgbdcuTlWEmhwJ3ouOYSHNNYn
 JZ3KlU7n35eIgiVXC2S16BPwGfqHtvDkDCFs86XriWaLoR4E5HCMR9jPMdbnp67Un2IKf6u
 T8AQPZ8wW/qlkPJtwBWxfjhZpEyrTCl6xoZFCFDCMThxb4oo9bw9od0gOajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793897416; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ftXrLJ3VGDxoUJyKbJMYpPqFnmx7TbsuL9Req11yyW8=;
 b=NyL6v1l1NW/tBo2HrHVGyHhkxc9fi0AXit2lq3Ro2lzCkHU1oTknGfT91KlSLjv3Nlr2+
 DxzHJ134r42iJUgkCXqalZIPIbm3cZmrWRgU1VrGrym3HpcMUateTHcWs7VbK8EEZ4ncOSS
 igPMlQqDG4VhvkHzNqWyy8PIwYssXTDwGXQcQ5ivUET5e0eQPtmBMhORPR7uLAmi4rjBzd6
 saGyGRp7p2GbSihZFF/3DNPDePKjsqhcmqifEros82aBJk4jZcyNnsqGlET5hxmuAkEm315
 BVhQKhxPd7utXr6F8kZdB9Tia3pn+YXA7kY/MQ5GG/jet5BfOW49afyLnWRg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1629649099
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 16:50:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9E10E2D5;
	Thu,  5 Nov 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793898576; x=1825434576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z/d+aYcT75wGZnwBdM9DEcoUTmOnTK13mjsp6wxBpiU=;
  b=PHbKldF5Z6MYX2+yFw17UQAV2HgIng59OSLcMYm6RF2m4KfuDk54qwVq
   ZmiUK8Bb7Mbeuh4CXQRnT51Maoq+cWvqn1AB/zEDER1Wjhl4AqPkd3IXn
   7S83cCA3rfwpeKhDiwyGt4x4rCkWnfpsM7AcszKyulZfIKlNFuSCMKkMT
   wZvN1M2sRqVL+7P2tna4l27CfkvcaNFmvcDTtUJpx89REeOkit5E8Sn2V
   Pbv/GpLeWNQq/Jd5Qw5HZCxnwi42sAo9E/JBPVuEm2R9loo+duvV5aQRv
   wJdypFXEvW1bOaCjJAUoc+NNlWljqH3PyC0haHVHMKsdL2+GP8ooJxMze
   w==;
X-CSE-ConnectionGUID: Mz0uPQnaSX6ITqwqN+zESA==
X-CSE-MsgGUID: H/R5HKFzSu6xcUfNKb1/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2571932"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="2571932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:09:35 -0800
X-CSE-ConnectionGUID: NPSPczPMT5+IW8n9a9DqNA==
X-CSE-MsgGUID: Q31IRDsjRS2dKxEWx/ovsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="7072778"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:09:29 -0800
Date: Thu, 5 Nov 2026 19:09:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/audio: Populate ELD Port_ID
Message-ID: <auy4RTCRfprhD-5Z@intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
 <20261105160240.2850042-3-kai.vehmanen@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105160240.2850042-3-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Message-ID-Hash: JU3IBIK7KVH3DV47E2PLD5GSZ4WLBBNK
X-Message-ID-Hash: JU3IBIK7KVH3DV47E2PLD5GSZ4WLBBNK
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?B?VG9tw6HFoQ==?= Hnyk <tomashnyk@gmail.com>,
 Wim Taymans <wtaymans@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JU3IBIK7KVH3DV47E2PLD5GSZ4WLBBNK/>
Archived-At: <https://lore.freedesktop.org/auy4RTCRfprhD-5Z@intel.com/>
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

On Thu, Nov 05, 2026 at 06:02:40PM +0200, Kai Vehmanen wrote:
> i915 never fills in the ELD Port_ID field, so it is always zero, and
> the ELDs of identical monitors connected to different outputs are
> byte-identical. Userspace then cannot tell which HDMI/DP PCM belongs to
> which DRM connector without toggling the connector audio property.
> 
> Use drm_eld_set_port_id() when computing the audio config, so the value
> reaches the audio driver through every path: the audio component
> get_eld() callback, the hardware ELD buffer, SDVO and LPE audio.
> 
> The value is fixed for the lifetime of the connector, so it does not
> cause extra audio re-enables when the ELD is compared across commits,
> and state readout stays consistent because it is copied from the
> programmed ELD.
> 
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16693
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 32f8c5e55319..3277e67748ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -881,6 +881,8 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>  	mutex_unlock(&connector->eld_mutex);
>  
> +	drm_eld_set_port_id(crtc_state->eld, connector);
> +
>  	return true;
>  }
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
