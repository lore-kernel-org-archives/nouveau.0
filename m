Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D87606A336
	for <nouveau@archiver.kernel.org>; Fri, 20 Nov 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jf1HkVpa
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C268112C43;
	Fri, 20 Nov 2026 17:43:15 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 62AEA40110;
	Fri, 20 Nov 2026 17:43:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795196590;
 b=ILeJdSENCWjY7O9AzvGz+QsS7WMVewrxS8cV8dnjVfqLOVdYnQ6Hs4/P1YdIS7pQGDpR1
 br9OyUOG/7ma6bdVzaVaPixTe02s8RPzVShaFOD1NA0UZXBDP2V0yadUpsU39bATFxguH4L
 ius34LTSPoS9ffXMLVhMpSBCHmqlXYXho0f2xLpnPowfY12p2HEku86euMBLimnnIQzk/A9
 abYQWdqVYcee9luIh7j4k1/iQDB+Nmvn+T/NTD4gNc7ga6V2tZ1ernjBjqBI5rnBsWaeSCu
 CFDzzPVdnyJEyQEwSHBOIKRsm3s1bpKueH9wKc6uF95j3LuRwuOqcagnuDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795196590; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Kc83LIrS3XsLHegWkV/NNuRNvjhaDksVGoSv2kOvNLg=;
 b=qEJtLwFOw5rU0xrQtg8r8gcklSBqXLeC40yWhvaUog1Q+0FYT0fJtq9cuYpM5xqlZr6CH
 0JbRfrkCh9E3DYtQpmrLAd3ZqBRIPHGopvFA8dXxJfG+zXvFsYmxi17G6qZR0AfMkqsAjdO
 NuYYBUETwESCoud2CwXkkK17a4iTAaL1w+czep/ZdUFe2JAReBUkJFXLp63R83oDCbA5E6y
 CN5oqcInNIcXVNyGOh4KDJZ2mVLvwZ8/RampFv1tNoncDqv2e+Qu2MB24+iACIMOrg7dn+L
 E82lr9HOlX+Srm/apvRB6osgzopisoftVsR6xdUZ6o7TXolw0g+MFjS77zCQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0949840006
	for <nouveau@lists.freedesktop.org>; Fri, 20 Nov 2026 17:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C524A112AF3;
	Fri, 20 Nov 2026 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795196583; x=1826732583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZesNmmTH+elezFnRnzpxUtzX4X1KPesleeR9OkrS3+I=;
  b=Jf1HkVpabE+pZtWeBrWu9FWRC+QnbSS0gdMJXtP2ee/4UOaPUU1PIxX/
   FDkTfhgK7CVnr6lMRF3JS0R4yA3gr+5OWb+aWaEnhgHYKpNIAFPo1AQCR
   zKdwVYTCbjgWGV0L+Nf9QkJGpqH7Svnf9TO4IGImnnyI6TFTFcN4KQtSN
   vDEeTKPK7WCa3WuftIX/s3MssgvlVslTZMmeBHjBUb9OVqZc+C69dLd/5
   kgbvr52ZOiAaYZam1BIYe6WbIEQJcBxVEC19yiOMBeFRLjd6QkuX4mXSC
   eIrd3A4/TGtSBPfEjJgKUZDS5SBrMFvbzG2kTSzI8UijDa/kOXBMFajZ7
   g==;
X-CSE-ConnectionGUID: PUOeN82JTSWQJ0xO8J/nKQ==
X-CSE-MsgGUID: d97TXlbqSKGgYvgyp7N+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4123446"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400";
   d="scan'208";a="4123446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:43:02 -0800
X-CSE-ConnectionGUID: 9ppcSj5TQx+v07CsGbbJag==
X-CSE-MsgGUID: yUVOLHc6TNy2a5JT+RRZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400";
   d="scan'208";a="10744643"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:42:58 -0800
Date: Fri, 20 Nov 2026 19:42:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
Message-ID: <awCGnqjGUroPBH4B@intel.com>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
 <awCEezzEIrhWv5sk@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awCEezzEIrhWv5sk@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Message-ID-Hash: FYP6GOFWFD23PU2WVWXBPRVIUQYOPCDC
X-Message-ID-Hash: FYP6GOFWFD23PU2WVWXBPRVIUQYOPCDC
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Maxime Ripard <mripard@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FYP6GOFWFD23PU2WVWXBPRVIUQYOPCDC/>
Archived-At: <https://lore.freedesktop.org/awCGnqjGUroPBH4B@intel.com/>
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

On Fri, Nov 20, 2026 at 07:33:47PM +0200, Ville Syrjälä wrote:
> On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
> > 
> > 
> > On 11/20/26 10:41, Ville Syrjälä wrote:
> > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> > >> Panel brightness is a property of a display, and thus of a DRM
> > >> connector. Add an atomic per-connector LUMINANCE range property so
> > >> compositors can manage relative panel luminance together with the rest
> > >> of the display state.
> > >>
> > >> Keep the core backend-agnostic. Drivers create the property with their
> > >> hardware range and implement connector helper callbacks to set luminance
> > >> or disable panel emission. The atomic helpers sequence those callbacks
> > >> around pipeline enable and disable, including luminance-only commits.
> > >> The panel is left lit when the pipeline enters self refresh, and the
> > >> luminance is only reprogrammed when it changes or a modeset enables the
> > >> pipeline.
> > >>
> > >> The stored property value is independent of display power. A commit made
> > >> while the connector is inactive is retained and applied on the next
> > >> enable; disabling the pipeline does not overwrite it.
> > >>
> > >> LUMINANCE values are relative, driver-defined levels rather than
> > >> absolute luminance in cd/m^2. The interface supports emissive panels as
> > >> well as panels with a separate backlight.
> > >>
> > >> Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> > >> drivers retain their legacy backlight class ABI unless the new interface
> > >> is explicitly selected, allowing the DRM UAPI and legacy compatibility
> > >> policy to remain separate.
> > >>
> > >> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > >> ---
> > >> v11:
> > >>   * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
> > >>   * Only call .set_luminance when the luminance changes or on a modeset
> > >>     that isn't a self refresh exit (Leo Li, Sashiko)
> > >>   * Fix the .set_luminance self refresh documentation
> > >> v10:
> > >>   * Add tag
> > >> ---
> > >>   drivers/gpu/drm/Kconfig                    | 14 +++++
> > >>   drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
> > >>   drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
> > >>   drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
> > >>   drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
> > >>   drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
> > >>   include/drm/drm_atomic_helper.h            |  3 +
> > >>   include/drm/drm_connector.h                | 16 +++++
> > >>   include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
> > >>   9 files changed, 255 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > >> index 61111d50b1c65..1bbe2c2d7c76f 100644
> > >> --- a/drivers/gpu/drm/Kconfig
> > >> +++ b/drivers/gpu/drm/Kconfig
> > >> @@ -33,6 +33,20 @@ endmenu
> > >>   
> > >>   if DRM
> > >>   
> > >> +config DRM_LUMINANCE
> > >> +	bool "DRM connector luminance support"
> > >> +	help
> > >> +	  Expose relative luminance as an atomic DRM connector property. Values
> > >> +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> > >> +	  Drivers provide connector helper callbacks to program their hardware;
> > >> +	  the DRM core does not depend on a particular backend.
> > >> +
> > >> +	  Drivers migrated to this interface will use it instead of registering
> > >> +	  a legacy backlight class device. Leave this disabled to preserve the
> > >> +	  de-facto userspace ABI in /sys/class/backlight.
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
> With that plan, I think you need to mark it BROKEN if it will 
> actually break current setups when some unsuspecting user flips
> it on.

Oh and this will not be turned on in our CI since we need to test
the thing people are actually using. So you won't be getting any
usable CI results with this kind of hard build time selection.

-- 
Ville Syrjälä
Intel
