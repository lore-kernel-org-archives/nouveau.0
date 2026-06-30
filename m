Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD7C43602
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 11:50:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5054210EC36;
	Tue, 30 Jun 2026 11:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JicJHmBM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5DEBE46DB6;
	Tue, 30 Jun 2026 11:35:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782819356;
 b=PRMIgBze+iPOpA+0ip7CiwUW/L5FknjBGvVc6Qr3SkPrPh8eR87A5sFKsDrQUJnzyyLo9
 NTEbaeFn6zEL0P/PPAR7uzlcpPCTeBHwuFVzoOJnApgxFMyDMQIaNWd+ONRzDFmnt+kluJP
 h/q0opF1B1KDq/Zi/OoVRrdzGFELmi3Dcr7vZs+j7isXo9it13X1v3tPhCUdCU0FZjUVfcc
 JiRdk66jalq2uQhRMeveH5PrmkRu/bjtbPCmOCx02EbMdYkCVkVpfvBhQp1VHI5q0cUjgiU
 QTRMQm7UR+1SpcYW5qD84B9nXI55Is2DVotIJWc4R4UJqVVaaPog8SjZE3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782819356; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3bzASd3SqmVr/00uXiV/ELVjhgrnWqpIpKDdpWq5YOs=;
 b=qkR1pm07rW4hgiv83w/+e9bcoBI6Z63CcFXVKIIPbTdQ/iK53M1Gtg5ijSVVSRmeDs1YZ
 D5zi3PRl+gEUWKimEMl1q6ToeeO2O1/WKqLBIE4P96p7045aliZpB446bvS6izEuB05qHpt
 AzWUPVqfaBS2DopasJGb1iChSKKRVjmhMNI/PyEndf9MbP23Ta8W5xb6uQ2JF0BA9AILK3s
 U/51YnYnQEVxF6W8mRo4/pMhQg1pv0zLXiK3HmUdUYrOEriRXAvB6qqh1s/WvSuE/kpgKN2
 QRBgUy33TiZKQIxtnOzxL/hnkKyAxbuAd+sZi3ANKYRn8/p7yNsvqY9YcPUA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 945954605A
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 11:35:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5AC710E202;
	Tue, 30 Jun 2026 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782820235; x=1814356235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q62f07SbwkgKGBg+I3Ip6MjJhwO1ctHYM8PsIAqG6fA=;
  b=JicJHmBMnYyq6hD0RzPe8qk1QSqmCwgdnLCr93BTDHWeJGND0UrI2V92
   vMTMDuavJ5J3Fdl7FKRxwSbvWpsnTjQuEuuoLGCDRXFySl4tVla0a9KXU
   h7KGdde3Pwm50CfH/u6EHCZ3V6tEEgLvzQV1NjTDXde6Q5rvXMv3QEhnt
   X5PPUFzkgEMKeANgR52NDDK8lURoxtu3W0jB3A3cS45nQTEmoRQVJ3utG
   MQ23zszdoNwqVpK/mNBGIH6hrCRzvVl+ptGaarK/dzzI4PdKeTtHVxo9C
   dg4kfJLElO2vE4nsP+NNYG7MeLKSHIN5ew+7U2S5DU0LhacZuiZw9fWc6
   g==;
X-CSE-ConnectionGUID: opOP9ZhGRhi4ZlnCblWb8Q==
X-CSE-MsgGUID: yKwPrLN1RziUJE1GrHrpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83307022"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="83307022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:50:35 -0700
X-CSE-ConnectionGUID: jT0KX4JNRZy9+wdOUWGUVw==
X-CSE-MsgGUID: TLe8MUBAQRWusE0sQDirjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="248263524"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.96])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:50:31 -0700
Date: Tue, 30 Jun 2026 14:50:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 0/4] drm/nouveau/gsp/r570: Fix runtime PM
Message-ID: <akOthKT6XeaUnhH6@ashevche-desk.local>
References: <20260629224350.2870201-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629224350.2870201-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: DMCMXPKP7MGIVBINMK3XMUBDS4YWSGFZ
X-Message-ID-Hash: DMCMXPKP7MGIVBINMK3XMUBDS4YWSGFZ
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DMCMXPKP7MGIVBINMK3XMUBDS4YWSGFZ/>
Archived-At: 
 <https://lore.freedesktop.org/akOthKT6XeaUnhH6@ashevche-desk.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jun 29, 2026 at 06:42:32PM -0400, Lyude Paul wrote:
> Runtime PM has been kind of unreliable with GSP for a while. It works
> well enough to shut the GPU off and turn it back on, but more often then
> not it ends up leaving the GPU in a broken state on resume - which makes
> it impossible to really do anything else with it.
> 
> Recently however, I discovered that it's been failing much harder on
> some ampere systems. This lead me down a rabbit hole that lead me to
> figure out one of our previous fixes for runtime PM wasn't correct.
> After fixing that and combining it with some fixes we had tried in the
> past without success, I finally managed to get nouveau to handle runtime
> PM with the GSP perfectly. These are those fixes.
> 
> Tested on a Lenovo P16 G1 (100 runtime PM cycles!), and RTX4000.

This is v2, and no changelog. What's going on?

-- 
With Best Regards,
Andy Shevchenko


