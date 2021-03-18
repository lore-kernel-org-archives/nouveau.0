Return-Path: <SRS0=o6m/=IQ=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A77CC433DB
	for <nouveau@archiver.kernel.org>; Thu, 18 Mar 2021 09:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08AB564F10
	for <nouveau@archiver.kernel.org>; Thu, 18 Mar 2021 09:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08AB564F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6A66E8B2;
	Thu, 18 Mar 2021 09:37:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4856E0EA;
 Thu, 18 Mar 2021 09:37:42 +0000 (UTC)
IronPort-SDR: dyi41tNUsGqlkCTcfwYNQ1LVSVvULUim++ceMotn+j1l0Djcr3/NXILTVq+X/X1VexDPS7qK4F
 aRhfr4i+vhHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189733152"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="189733152"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:37:41 -0700
IronPort-SDR: Et/uODvuDTaIkQKJgWNsHtMmP/cYZSDXbfVgQTbVIU/WtQPVJ+8L3AZ/xcj5CDSn0XPfJ7Pmzi
 aQHWSUukT9Qg==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="413015058"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:37:40 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lMp6e-0001sc-QR; Thu, 18 Mar 2021 11:38:16 +0200
Date: Thu, 18 Mar 2021 11:38:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFMfiP5KAIRzMG+f@platvala-desk.ger.corp.intel.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 0/7] lib: Miscellaneous
 cleanups from nouveau work
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:49:42PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> These are just a couple of small fixes that didn't seem important
> enough to stick in their own patch series, but were various issues with
> igt that I found along the way during my recent nouveau igt work.
> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> 
> Lyude Paul (7):
>   lib/drmtest: Use igt_assert_eq() for do_or_die()
>   lib/drmtest: And use do_or_die() in do_ioctl()
>   lib/drmtest: Remove i915 refs in do_ioctl*() docs
>   lib/igt_fb: Remove domain from igt_fb
>   lib/debugfs: Fix igt_crc_t docs to mention has_valid_frame
>   lib/igt_aux: Print name of debug var in igt_debug_wait_for_keypress()
>   lib/debugfs: Fix function name in igt_pipe_crc_get_for_frame() docs
> 
>  lib/drmtest.h     | 8 ++++----
>  lib/igt_aux.c     | 2 +-
>  lib/igt_debugfs.c | 2 +-
>  lib/igt_debugfs.h | 3 ++-
>  lib/igt_fb.c      | 3 ---
>  lib/igt_fb.h      | 2 --
>  6 files changed, 8 insertions(+), 12 deletions(-)
> 


One minor comment on one patch, otherwise LGTM.

Series is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
