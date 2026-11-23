Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E460A3814
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6kABS0y
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42C4C10E742;
	Mon, 23 Nov 2026 08:05:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 33DBA4039A;
	Mon, 23 Nov 2026 08:05:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795421125;
 b=XuHjxZgRVqSwxqCJ/bvMvqvtVI2vj9nw+vTeDJLvRnSPvbWBzxsRaqGBUHMh/E7tcsA1i
 sDiamIaVaw/Nsy6K2mspGclPBHDVWU5l6n6/0x5xEgQw+T7sm3U1krik/eRbcRarJEcPYBh
 fkR/2ElTHP82ECjfHWQ+tLwq3io1PCRzujR5hknhb8mwSnN1TWiFhlGJ/QXGRChcSDClQUJ
 gytWkCPgEY2Hge8SECAQlogAuxoz9HODWUKZrAh9AZ7ZqQ9KhraVsxStNxcrpsKmgr+rbwq
 4fgB88/6YaacXlVvE3AHnLSSSTUbm7V6hcyp5wPbnXCWkEv8s9JuGRCe1GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795421125; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MTO1onBKZJSzMlhNLtOC/hOwvdajGf6CYqsXB1dFCtE=;
 b=Sbt/mrzbRYF2VAW4fy9jFanq9+a9xBpNenpBciNzbq0vXGQLRZlVJ9W+JQz/DXosxrILE
 47kmHsvGk7T6xYkyTpV/uN3wk27+bRXjyNy4MXW/XnBKutD3AGLbt4CyCdkPTQBIR21A9Er
 8Z2bQ7jnVjs7a2WUGZzOBvByUGZEYA6ZwGNArYoMglU+tq2M6JsAJIVREgLTIhENJNgTBkQ
 GfwTgbXr/Hc5dUIXGp73IvpdoUpzK611sjSF3YetUeDOeHFlGPx+1NOHm7ti/g8EKunXA5b
 HMhIbKXnLBzSIhlixkyBzYYBDYz3Atj2TLuqjKGFrPPK/BWvtoowm3oRi8yw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none;
 dmarc=pass header.from=linux.intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A6B73402FE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 08:05:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 593BE10E5F1;
	Mon, 23 Nov 2026 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421117; x=1826957117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=urMfx8Tg1Mo2IdrR6dTT35HCyK8ZaZyaJndlD7atYzs=;
  b=c6kABS0ySzBMh5yakZ8lDhrSOQQiaMFLDAP2c40b/IUqhL4PCFROZP8G
   JbAEPV8Jmk5qe/Xqie6ZgQ5CkFMesdSbjNXvtYyLBATNrzBwif63JAplP
   unHJEswi1hC/mG0QuOlqcSIQNwbkwcSFv1u3NpF0q40hMpEQSg3p7XIx8
   2tLgZ54Np+MkhQgca9d0qtcLZpas4QE2Ij7yCq1MPYNSGuERu3yrwGjSU
   G0Mg0qDNm0sNg3ax4iP2vNulWcOLVPsWd52qo2Tpx9BsOQWamCyqNRDta
   g2h1uu+JyBv9oYnL4A5pQprjT2mhiV/oc3SH0bWpdPE/TMcpmRsGbGoiC
   w==;
X-CSE-ConnectionGUID: oKA89zvVQY6xKOcnzmnoaA==
X-CSE-MsgGUID: bLm3pC8NSoWyzLCPPa4Jaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4254374"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400";
   d="scan'208";a="4254374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:05:16 -0800
X-CSE-ConnectionGUID: AmTzmnSjSmmElgfOYxCyZQ==
X-CSE-MsgGUID: u2HtPnzaR+KAmRySPzE27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400";
   d="scan'208";a="11797381"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:05:08 -0800
Date: Mon, 23 Nov 2026 10:05:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
Message-ID: <awPzsMWZ7e0i6i54@intel.com>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
 <awPvoLCDeq1YFLE_@houat>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awPvoLCDeq1YFLE_@houat>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Message-ID-Hash: NYKRNARQMIMMECCHQ6QRL7GLXD3RORIH
X-Message-ID-Hash: NYKRNARQMIMMECCHQ6QRL7GLXD3RORIH
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NYKRNARQMIMMECCHQ6QRL7GLXD3RORIH/>
Archived-At: <https://lore.freedesktop.org/awPzsMWZ7e0i6i54@intel.com/>
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

On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
> On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
> > 
> > 
> > On 11/20/26 10:41, Ville Syrjälä wrote:
> > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> > > > Panel brightness is a property of a display, and thus of a DRM
> > > > connector. Add an atomic per-connector LUMINANCE range property so
> > > > compositors can manage relative panel luminance together with the rest
> > > > of the display state.
> > > > 
> > > > Keep the core backend-agnostic. Drivers create the property with their
> > > > hardware range and implement connector helper callbacks to set luminance
> > > > or disable panel emission. The atomic helpers sequence those callbacks
> > > > around pipeline enable and disable, including luminance-only commits.
> > > > The panel is left lit when the pipeline enters self refresh, and the
> > > > luminance is only reprogrammed when it changes or a modeset enables the
> > > > pipeline.
> > > > 
> > > > The stored property value is independent of display power. A commit made
> > > > while the connector is inactive is retained and applied on the next
> > > > enable; disabling the pipeline does not overwrite it.
> > > > 
> > > > LUMINANCE values are relative, driver-defined levels rather than
> > > > absolute luminance in cd/m^2. The interface supports emissive panels as
> > > > well as panels with a separate backlight.
> > > > 
> > > > Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> > > > drivers retain their legacy backlight class ABI unless the new interface
> > > > is explicitly selected, allowing the DRM UAPI and legacy compatibility
> > > > policy to remain separate.
> > > > 
> > > > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > > v11:
> > > >   * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
> > > >   * Only call .set_luminance when the luminance changes or on a modeset
> > > >     that isn't a self refresh exit (Leo Li, Sashiko)
> > > >   * Fix the .set_luminance self refresh documentation
> > > > v10:
> > > >   * Add tag
> > > > ---
> > > >   drivers/gpu/drm/Kconfig                    | 14 +++++
> > > >   drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
> > > >   drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
> > > >   drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
> > > >   drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
> > > >   drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
> > > >   include/drm/drm_atomic_helper.h            |  3 +
> > > >   include/drm/drm_connector.h                | 16 +++++
> > > >   include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
> > > >   9 files changed, 255 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index 61111d50b1c65..1bbe2c2d7c76f 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -33,6 +33,20 @@ endmenu
> > > >   if DRM
> > > > +config DRM_LUMINANCE
> > > > +	bool "DRM connector luminance support"
> > > > +	help
> > > > +	  Expose relative luminance as an atomic DRM connector property. Values
> > > > +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> > > > +	  Drivers provide connector helper callbacks to program their hardware;
> > > > +	  the DRM core does not depend on a particular backend.
> > > > +
> > > > +	  Drivers migrated to this interface will use it instead of registering
> > > > +	  a legacy backlight class device. Leave this disabled to preserve the
> > > > +	  de-facto userspace ABI in /sys/class/backlight.
> > > 
> > > I don't think this will fly if it breaks the backlight class interface.
> > > No one can actually enable this outside of some niche embedded use
> > > cases where backwards compatibility is not an issue. I think what
> > > you need is a generic backlight class implementation on top of this.
> > > 
> > 
> > The idea with this was:
> > 1) to get the series landed
> > 2) let compositors merge solutions around it.
> > 3) Then add backwards compatibility to kernel so we can flip the Kconfig
> > default.
> 
> I said this a few times already, but we keep having those discussions
> while the backlight sysfs handling is far from being the main point. You
> should *really* consider adding support for the luminance property for
> something that isn't tied to that interface (like DDC/CI for HDMI), and
> treat the sysfs API as a sysfs series.
> 
> It looks like people just have conflicting opinions on this particular
> part that isn't going to solve itself easily. You should not treat this
> sysfs discussion as a blocker for the infrastructure work.

You want to be sure backwards compatibility with the backlight
class is a solvable problem before you land *anything*. Otherwise
you might just paint yourself into a corner with no way out.

-- 
Ville Syrjälä
Intel
