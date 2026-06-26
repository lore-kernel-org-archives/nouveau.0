Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B91CDE011
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 12:32:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 873C610F5C2;
	Fri, 26 Jun 2026 12:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NorX4JAl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 77AAD46D13;
	Fri, 26 Jun 2026 12:18:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782476297;
 b=s3+wYjhA8vtaFBuT4qvGOTNAhwp/D1dRdiWH2l1dTPyXAcabZANYb/3yj2SKxSrniO2YG
 8rl7z9Yo2Y9n2Yf02Gkoivc9L6+kGnm9b86EY81Fel04YEY0MnEUyJc6IbZCPLBwW0gg1vN
 0cvJ6aPJimNJQ1oZkUpxH54n6FKRZv//9epWFuAuKR8gSrREnG8fJcH1N2BCdUilRcFh1P1
 n8AW6hRlYZOGcf2TDpWAERsvZ66Pl8LWgvGCUFgnB64unaUZNPRQdYkpY08cb+TKklunnRx
 PRkE+TxshiScVylqd8n966i+YBvW2Sb9FsCoDs+wehP0JcBKTP7gY4rvovpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782476297; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6rMlCCGQjVyln2FsMKQdyKIW3YUuSRmY4GIHVM2qkQU=;
 b=n42A0hGFl4fnpkz2yC1eydhanphB5E/GDt2NYB7lMQ9h8fEsg2vqR0mynN14lO069D8Hz
 taDKDWH3hqDIsRpiKrZIDaWja9qk/Itc58wgjLEfxDolIgyd8Cxid+O690Qr+elKO3kYW/6
 xYBChFUIoiN7/xFAgBOz3i41IfGq1AItuB988RVUDIODYxUZDN7jtn5VGtSn44QF93MsKXt
 gflDOq4HyQwy7iaSZzO8zhyDmy0SnojCPkTI2i1sakO22xXYZR52nVnaH4NOaDcoIsLSoL7
 zT8W8VBoC3RzBuSZB+mVb0oKdNq4F1SYnTCSv0W169JIwX6wsuwU350OEOKw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E6A8046CFC
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 12:18:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B954310F5BB;
	Fri, 26 Jun 2026 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782477168; x=1814013168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KcZgACwtmX+SVYeSnRzH9eljl4Ne8+uOz5GEYaGLwJY=;
  b=NorX4JAlF7OboufltQJA7Eo5Dg1SuKScBbrs9aA5IzMIndlQ5vhgdkPV
   Qe+yBVVmV88k/4s8JfNZEuXr3BDQrsyQz6pOwMQf67cLxROiar9x4y58r
   JiBRCdbgVuGD/6ee8+rDu4GJ30gdlOHWv4tvr7wLHe7/5VEuxxHks3NVf
   APU/cY5jMHPna1qsuK6eo12Pi4/So/YJ6myYI0FoBKm/bhFwRUFgSBUL6
   LKnuKwmaY1j0AIjdyuTO4Jt8NRJY3Ci9aDudX3DSH/s1h2PvvkQvSGjOV
   BxnDU7oE35f7oZ0zrlqLuDHaAHkPKA3s3C6BPSAB8JLJn2PWPdzlS4BoR
   w==;
X-CSE-ConnectionGUID: uxwk+f9aRBaUQ1kVAgJFIQ==
X-CSE-MsgGUID: 4Q4XsduLRoKcWHKtHJQ19A==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94417422"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600";
   d="scan'208";a="94417422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 05:32:47 -0700
X-CSE-ConnectionGUID: d63zfJFfQVeB/pl+AWWgSQ==
X-CSE-MsgGUID: H6vs7KUrSeahz+oWRGy/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600";
   d="scan'208";a="247948579"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 05:32:43 -0700
Date: Fri, 26 Jun 2026 15:32:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/gsp/r570: Never enter Gcoff state
Message-ID: <aj5xaeHusBhWhDK1@ashevche-desk.local>
References: <20260625231252.89684-1-lyude@redhat.com>
 <20260625231252.89684-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625231252.89684-3-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: L6LT3DKTFYJ6XWJ2KXPQ5LETS7LOQMI7
X-Message-ID-Hash: L6LT3DKTFYJ6XWJ2KXPQ5LETS7LOQMI7
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Kees Cook <kees@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L6LT3DKTFYJ6XWJ2KXPQ5LETS7LOQMI7/>
Archived-At: 
 <https://lore.freedesktop.org/aj5xaeHusBhWhDK1@ashevche-desk.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jun 25, 2026 at 07:10:55PM -0400, Lyude Paul wrote:
> It turns out that the only reason our previous fixes looked like they
> worked for this was because we would occasionally set the Gcoff state to 0
> in the normal S3 path, which fixed suspend/resume on desktops - but not on
> machines using runtime suspend.
> 
> The proper fix is to just never set this flag. Our current guess for the
> reasoning behind this is that Gcoff likely coincides with GC6, and not
> literally power off.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 8302d0afeaec ("nouveau/gsp: fix suspend/resume regression on r570 firmware")
> Cc: <stable@vger.kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mel Henning <mhenning@darkrefraction.com>
> Cc: <stable@vger.kernel.org> # v6.19+
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Same comment here.

-- 
With Best Regards,
Andy Shevchenko


