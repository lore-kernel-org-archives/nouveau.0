Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC26606A329
	for <nouveau@archiver.kernel.org>; Fri,  6 Nov 2026 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=beXxF0Qy
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1AA112D86;
	Fri,  6 Nov 2026 13:30:37 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5B35249134;
	Fri,  6 Nov 2026 13:11:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793970669;
 b=nODHD3j4U593sZoJ5eXnB6Q0aOFE4/eO1WxIvOgPERM47HoUU7LiNX6wsBsWBnX/rKgiT
 iD4Mvq/VRNENqsyvAPWNWIZa6qAeBPzCMTva1iz5E2B16ouNmGJRRN9IUzrdcvSIbPEuhd8
 FQfvFx2pReocnn2dthSN4XGDnyUgPq1aICXhsS+1QM7rEKJheODyVZfaXnUGbCPTXjqXm2w
 63VvmmT7pdZa5BXsh0gHhdSB3bCH1hMNcX9qCE5UeF1iRgJkZP0b7PgROQwtXK7Era4ak1z
 lSKv7rbye2u39SQzpxJpfSnN44xWdBmFUN4NGHNuviLlEmySw96y/IBV1NGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793970669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SN/6UBtRF9t23k+xh5kIB4pVCw09MPBbP88OI2a0J9Q=;
 b=oIryc9bgcyOjAaPKR2TTyZXBYTekbEnZxXSeJ6k98Hh2RFLezuwDGwVUsvmOXJMj60M43
 fSU2LZphY2DezEiHXLnO8xLWBkmhY/HGntPmukaMRxqa2QwgSsKr2w4WBW5xi7f2g02sOKh
 kFRwv6mMe59GO80S7I/BNzV//C4QdF0qqOojZvPuqKkZdO5uIZX1FYJggk8uVW2bwlZFcW5
 WcWFzoMJK4Ho0uhloLaXhx8E+99n66vK93sdL93D894BsojLAGXM3mpCI+d+b9rSW6qf3j8
 KNf4PV7KP7b+1bXdUQgITzDeG2DHP3rZhlQaP6DuNnV11VRR9UMsyy0y5AUA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4D2F0408F4
	for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2026 13:11:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9EADB112D81;
	Fri,  6 Nov 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793971829; x=1825507829;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Hg3E2tV8t/r3xvA5nyxI35xq+Jk6OiCkXu5R71On+t8=;
  b=beXxF0QyKy3tt1JpwiQAzPabxFOuyfaowtXO0t2+89vfuW4eNFggaKMT
   rtmWriqCfyBfpwkp62gKxDAzWKKofMnZNLsu7n1N1oqpmrckGB4uVZ7oy
   c8cPt2a/kUSkoIGxsRrlndadah55gs8Zh5nAwJf+JMOP0NbsdGWAD/Ncc
   S38xvCBFXClV2R8CJYtlBAs+EPtiYVt3Y9eM73bf5eNuF0aZRdEOpBLgQ
   0NKvHfop0tTbWeRfYvrEX0DCCCgrNr+Vdad5mOM+kw5zlulhVDw4ZVF2I
   tf3w8KXdBIk5c2GsZo/8qrg+cDwd5Rthu75QETyMpjc37/B46w1ewQmta
   Q==;
X-CSE-ConnectionGUID: 5drREmZfQHa6sAf314/noQ==
X-CSE-MsgGUID: YLk4uYDmTkGJnj8OnhL3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2775395"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="2775395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:30:16 -0800
X-CSE-ConnectionGUID: X3MEUOGvQgyeCvaHWnjegg==
X-CSE-MsgGUID: MyRyuK9DTWKlwEdX2DelYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="7159162"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:30:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm: Populate ELD Port_ID to identify audio endpoints
In-Reply-To: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
Date: Fri, 06 Nov 2026 15:30:06 +0200
Message-ID: <e3f0bf049faf6222781eb61e23cdaacc62eccfd7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: FSJ2UQA5GRPFXYEUQUNXJPLXIBKEKVRC
X-Message-ID-Hash: FSJ2UQA5GRPFXYEUQUNXJPLXIBKEKVRC
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
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
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FSJ2UQA5GRPFXYEUQUNXJPLXIBKEKVRC/>
Archived-At: 
 <https://lore.freedesktop.org/e3f0bf049faf6222781eb61e23cdaacc62eccfd7@intel.com/>
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

On Thu, 05 Nov 2026, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
> The ELD Port_ID field (bytes 8..15 of the baseline block) is typically
> zero on Linux today: drm_edid_to_eld() leaves it empty and no in-tree driver
> fills it in. amdgpu, radeon and nouveau pass the raw connector->eld to
> the audio component. On the amdgpu DC Azalia register path the value
> is a hardcoded constant, the same for every port.
> Only closed display drivers fill the value.
>
> Pipewire added support for "Port_ID" in merge request:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/3025
>
> As a result, when two identical monitors are connected their ELDs are
> byte-identical, and userspace (e.g. PipeWire/WirePlumber) cannot
> passively tell which HDMI/DP PCM belongs to which DRM connector.
>
> This series adds a DRM helper that fills Port_ID with a common layout,
> and uses it in i915:
>
>   bits 63:48 - PCI domain of the DRM device
>   bits 47:32 - PCI bus/device/function of the DRM device
>   bits 31:0  - DRM connector object ID
>
> The upper half follows the layout documented for the AMD Azalia sink
> info registers (dce_audio.c: "PORT_ID1 = 16bit BDF"). The aim is for
> this to become a convention other drivers can opt into. For drivers
> that copy connector->eld to the audio component (amdgpu DM, radeon,
> nouveau), adopting it would be a one-line change. Comments from the
> AMD and nouveau folks on whether the layout works for them are very
> welcome.
>
> An alternative would be to fill Port_ID directly in drm_edid_to_eld(),
> so every driver gets it without changes. I went with an opt-in helper
> to avoid changing the ELD contents seen by all drivers and existing
> userspace at once.
>
> The value is exposed to userspace via the ALSA ELD control and
> /proc/asound/cardX/eld#Y.

We might want drm_edid_to_eld() to do this automatically for everyone in
the future, but I think this is a good, cautious first step.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Kai Vehmanen (2):
>   drm/eld: Add drm_eld_set_port_id() helper
>   drm/i915/audio: Populate ELD Port_ID
>
>  drivers/gpu/drm/drm_eld.c                  | 42 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_audio.c |  2 ++
>  include/drm/drm_eld.h                      |  3 ++
>  3 files changed, 47 insertions(+)

-- 
Jani Nikula, Intel
