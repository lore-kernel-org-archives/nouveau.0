Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15622C43458
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 11:53:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A0DF610EC3B;
	Tue, 30 Jun 2026 11:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N95sYqlI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B661546DBB;
	Tue, 30 Jun 2026 11:39:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782819540;
 b=qca47HI4qS9NqvhMaH8YChlcyG/Ko7uGVSEBxJitC0AE0gGgj0/+6WwdAUDksrmL0rHsn
 oVaER7VW0OwpY40koFo/oG1m01dcCAceLxoymdqvfxrWKjbN/kiTGXw5qLJpD/IdgNMHNrm
 wSaGzyBnSEfIDWzRgYZSitu9+xoPiXi9aL25qTLj3CFlYCc9Kq0Y2gFGvw+7t9mhtl6cq4t
 J1fmqejkyKpJEHVWzrZKlhFL6Sjzfbpfhq2nbAxL3s5TPRR7U+Q0gaS0ONh3yO8fTdla0NO
 TrqueTcm3XxZrE4XDZN7OAfJtekEvj12xk/SBrgQIe6o2jSLTGHuyQhdQ31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782819540; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=63J7Uoz7jP9v7t204eNCkRzNHmQu7ytCZ1bZqxVbUoQ=;
 b=DDvRSsXVaV5PEFD/adYP5z40C9JoOvv0eQAbrMTUlt5FHLbYkoTUja25M3zVV1st/9o9b
 RUDTsLkqhBrk0oE4awJObM7PE4DgM5xh5OO5CWvwuR85gcqmTs6RRpNZPG4cllDLk9QqB1R
 J2x+y0Me61KGL16xZiyf1mDTeqs2AQe0LU9bRcvGPHodsAT1dax1e66n/MbI255Crzv2QrI
 WZKUeDiQ81dG+0nlnby2qbYHlT3LqM81KIlM+LcjIBdGfVEVYKFth4BChwLXkcw/s4pN+1T
 GIrI7q4SUNU4CXCFAL9t2nDYVETTOE4yTrxYTy6C/4RkLMlKQgGZ2R1uLlmA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 29E4B400BB
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 11:38:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C547210EBFB;
	Tue, 30 Jun 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782820420; x=1814356420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HHeUzys9SZo4sXJXwBYEOYegZzAOleiFoxqxV4KVsUA=;
  b=N95sYqlIcdWsKyi8Wwj9FSbmqjGRWu1HNJyPFWjEsQM9KZ6EwxOVMLnr
   oE6S2x2tU11XtAjhgQa/9PyqyLQGgR6jG48Ub3QRGNIqZLrkHDdqa/s2y
   17pMKdk0SOFuimdxL8vrYve5mfXqup0jKunjDAdUFJKpvyRgTmU2osO20
   3SJRViL0oeb0fNne6zkP65PIs5l42vI91Al0kllIkUvL6BZHf7L1+k7tc
   wtk/BzYvl3c5iL2D5giZPC1Br450LDOQcxHTrCOxiOn5O/EDgy9XgWPYP
   5cyn2IPLgCA19xASErdGsVNNdHKyZOu7+2WLlwQfDdc4rK4A/ceqk/J34
   w==;
X-CSE-ConnectionGUID: pzQmlIuMTfCfWIJ7vNtjVQ==
X-CSE-MsgGUID: kYdo7RkkRXSmrJHBuO1XOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109080369"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="109080369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:53:39 -0700
X-CSE-ConnectionGUID: UseMqb4hTouQba8inFEEaA==
X-CSE-MsgGUID: OQAo9beZS6SkUijWaWBaZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="250556196"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.96])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:53:36 -0700
Date: Tue, 30 Jun 2026 14:53:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 1/4] Revert "nouveau/gsp: fix suspend/resume
 regression on r570 firmware"
Message-ID: <akOuPQ37-zxIJWWH@ashevche-desk.local>
References: <20260629224350.2870201-1-lyude@redhat.com>
 <20260629224350.2870201-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629224350.2870201-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: YPBNVD5EPRHNPMDCQ6J44KBNSTU24SDG
X-Message-ID-Hash: YPBNVD5EPRHNPMDCQ6J44KBNSTU24SDG
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YPBNVD5EPRHNPMDCQ6J44KBNSTU24SDG/>
Archived-At: 
 <https://lore.freedesktop.org/akOuPQ37-zxIJWWH@ashevche-desk.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jun 29, 2026 at 06:42:33PM -0400, Lyude Paul wrote:
> This reverts commit 8302d0afeaec0bc57d951dd085e0cffe997d4d18.
> 
> It turns out this looked like the right fix on some systems, but it's not -
> as this causes runtime PM to actually fail on many a laptop.
> 
> [I have set the fixes to an older commit then the one that is reverted
> here, because when applied with the other patches in this series, this
> appears to /fully/ fix runtime PM in addition to the regression]

No need to have this in the commit message, move it to the comment block...

> Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")

I'm not sure, actually, that this is a correct approach. You can't revert
something that never appeared (in time range between 53dac0623853 and
8302d0afeaec). Have you consulted with the stable kernel process documentation
and/or respective maintainers?

> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---

...somewhere here.

>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 8 ++++----
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 2 +-

-- 
With Best Regards,
Andy Shevchenko


