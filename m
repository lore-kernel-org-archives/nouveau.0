Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6401606E54A
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oFdNvn2F
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8651110EAAD;
	Thu,  5 Nov 2026 16:03:10 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B15F64908F;
	Thu,  5 Nov 2026 15:43:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793893424;
 b=OauRquWgHdeXWp6Ip2vJ8KiqFv0VP+9SAiQQkvrQMqKFQG9U4nXuxP7SHR5am5gIp4Bbm
 Tp4Joq8dX7q9R/g3dCXVyARjt2fUZkMn4/42TMipFjdFOxLkP47u0INSXV2sJ9R9komwv1Z
 yX2dgco1xjpkW1TSzWv31MGkjLt3WPC08NeaUu+2pDvL3Z88LJWuAxoUqOjtfXWzNbC2LEx
 4/KeL+Naa45uIn0jj9J8prdyhrx+xTt2J0tzzA60WdNI7vZLzWq3W7nR643YuTHXbfhrYGM
 a97wuRsDiMRwZb3IvLfTmFHfFGl5YWy2djYxjjtWvYMRRvDeeRht68veO7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793893424; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6AQzQankNQ4p5GSyZwTNeT9GWERJykoa+vt/ARzgYpU=;
 b=tfwerpv822Cb7WIHvB3atcA+ML2HGJx7lt6BmzY0XTxmzIYpSsCXU0Z9RMJlYjfb+r3K2
 aM6uhkVdFBjxoXQLp304nl2juI/zabCyK7Eqmozg0U9y5zAkzeH6dYNmRtWM5RzoDR8JXZQ
 AztzMSoVW9vfjNAmnNSUhHkhhjgxpdN8wh6EE3I4K1k0JJxihfQYmrL5/TVSJqfvmKr/Qv3
 U74UfmfIF4E2kjM7SIbdF+LFC22Y8wDZdtpCzUHGcPSs/R688Ie3l8RNhG4bU2BdV99qu8y
 GnyOHwax5k3TM3I59r77dqau+1YaBZkhq0fO9NCFfw/B4I3DcaOU8BTziKbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E842149076
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 15:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F86D10E3F9;
	Thu,  5 Nov 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894582; x=1825430582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3Z0O4+5RumCUzr/1oec2XjDDWA1Q7OPMsIXT7MmiACE=;
  b=oFdNvn2F/3DtNkkCxYgaResKnpXEuAxTpJ902UPQEdQgWAoF3O2ZRDoI
   RFbwVqb2WMyZ0mEvqeO1JLFgrl4SKa571eFttfjlAwKOFAXzrMrjLevVs
   6Npk2EWZCG6rNr3rNpDvh14uqHhOMJGJ1r1D/XnY6MMzkLIUmErUo9dst
   Ch11mCAcepvWRZeAVKnqoD8otq9N+s6YKlOChBQnV8JRRJJPHsUgW+s09
   Z2PBI/qQh/ZALEqUJXN146XaNc64dTs7ybTMquWWF6YjrMNb0UTg/3EPE
   06NBuq0TChTF/i7opaB3sa3eKbHyarhXZk3iwxZ8TtxDtTpDeTJXqLgFp
   g==;
X-CSE-ConnectionGUID: xz+5VrO7QsKaPEbooPW8mg==
X-CSE-MsgGUID: iR7FQLGXSPaE9XWPn9F8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2706042"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="2706042"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:03:01 -0800
X-CSE-ConnectionGUID: TdoOQ5CpQm6EKMIBns42tQ==
X-CSE-MsgGUID: 56Suo9wMTtyvaYRpTIniFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="8795674"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 kvehmane-desk1.ger.corp.intel.com) ([10.245.244.200])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:02:54 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: Populate ELD Port_ID to identify audio endpoints
Date: Thu,  5 Nov 2026 18:02:38 +0200
Message-ID: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B752QROBMDWFCRADNNSSDDZD4CLADWFU
X-Message-ID-Hash: B752QROBMDWFCRADNNSSDDZD4CLADWFU
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Hnyk?= <tomashnyk@gmail.com>,
 Wim Taymans <wtaymans@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B752QROBMDWFCRADNNSSDDZD4CLADWFU/>
Archived-At: 
 <https://lore.freedesktop.org/20261105160240.2850042-1-kai.vehmanen@linux.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ELD Port_ID field (bytes 8..15 of the baseline block) is typically
zero on Linux today: drm_edid_to_eld() leaves it empty and no in-tree driver
fills it in. amdgpu, radeon and nouveau pass the raw connector->eld to
the audio component. On the amdgpu DC Azalia register path the value
is a hardcoded constant, the same for every port.
Only closed display drivers fill the value.

Pipewire added support for "Port_ID" in merge request:
https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/3025

As a result, when two identical monitors are connected their ELDs are
byte-identical, and userspace (e.g. PipeWire/WirePlumber) cannot
passively tell which HDMI/DP PCM belongs to which DRM connector.

This series adds a DRM helper that fills Port_ID with a common layout,
and uses it in i915:

  bits 63:48 - PCI domain of the DRM device
  bits 47:32 - PCI bus/device/function of the DRM device
  bits 31:0  - DRM connector object ID

The upper half follows the layout documented for the AMD Azalia sink
info registers (dce_audio.c: "PORT_ID1 = 16bit BDF"). The aim is for
this to become a convention other drivers can opt into. For drivers
that copy connector->eld to the audio component (amdgpu DM, radeon,
nouveau), adopting it would be a one-line change. Comments from the
AMD and nouveau folks on whether the layout works for them are very
welcome.

An alternative would be to fill Port_ID directly in drm_edid_to_eld(),
so every driver gets it without changes. I went with an opt-in helper
to avoid changing the ELD contents seen by all drivers and existing
userspace at once.

The value is exposed to userspace via the ALSA ELD control and
/proc/asound/cardX/eld#Y.

Kai Vehmanen (2):
  drm/eld: Add drm_eld_set_port_id() helper
  drm/i915/audio: Populate ELD Port_ID

 drivers/gpu/drm/drm_eld.c                  | 42 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_audio.c |  2 ++
 include/drm/drm_eld.h                      |  3 ++
 3 files changed, 47 insertions(+)

-- 
2.43.0

