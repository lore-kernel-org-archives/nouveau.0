Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FE3EF06E2
	for <nouveau@archiver.kernel.org>; Sun,  8 Feb 2026 14:03:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0110E2F9;
	Sun,  8 Feb 2026 14:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTbVnctT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F18BE41C6A;
	Sun,  8 Feb 2026 13:54:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770558849;
 b=W7Xv86nlO/hpYblIvS4/ytZYqd/dWCjwaudRir8EcoBguIMeufb81rCuIfD4dEduJ9Ks7
 BGz5nsgK0TKYFaN91a8bN5UFKpghLNEd4eTvLkr+3E8wsTC/rVupGIINnEgHI/3G+7nFl/1
 7eDqEAR9nFQABJFVfhwb71MhfEJ8WmVqJVNMCUfxrBTbJue1roQbZEODxyXL0T9D2tXiy8q
 TuI/PjX+7wmDi6tOvr+TF065FQdBH1MffpEbID6+khZcJb0u47wPanbmlKhwu2tLBi/3IgL
 2xyVam0ybByvhlrBuO9GXy8rzaInkh1S1kGz6+nxyKGdkwYeuO77Bs0t9eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770558849; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=okKQNiRQQ0uRuZI05QV0b7nrgKnGp2+YPs2zappNZRA=;
 b=MipimItq0+j/E2O8wpea66LEs0HuVPPn5YZ6cKVVqN2UobeMUAbE0besn1lYPmzc/yKRj
 cRgLOxd/8HAzei4NgxsVxuW4+0X8F9rLLXoxILrh35sSzRRldUK/98hHF5jP7Q7gcIk96+E
 qXBGTksm+v0ejtUFe1ncYf0jQVhzKEvj5BxoM5DcXIXhoaFUJ7yYKWbHjFx/YyK3w4Xz/9R
 Neyg/VI+S+gu/JtAjA7jf2fWzOqViHwPGDFl6iSns8Ee/yTj1w9opQ3hWtd18pXp4A6l1cJ
 O5goFz8/iiy3Xbdhyisa62n9zefJcH8a+I0oAoYZLwjjPDboBitfeN9dAYdg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 84C5440492
	for <nouveau@lists.freedesktop.org>; Sun,  8 Feb 2026 13:54:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5D10E08F;
	Sun,  8 Feb 2026 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770559412; x=1802095412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cV940Lik96QcjKIDy0bcMBd1EZPtXN52moCKpfFr3Mg=;
  b=MTbVnctTOJmFc1W9GK6YqE1ruBnfrlpt3Sf4Fx50MDApAHKk52ivXDhl
   TEZQr/UeOYc/CICYcU3rDi+io68QnZJHxN8tTxhpIZADAldfWFlnb66oa
   xfymOlXxhsyg7ZEMzqM7RbTP4RrJexpLLeZ6r7YpExWwB7n+UQ0hWGcDy
   ci5QoBP7nZLrjAgqR50xnVok0OF84DEHcrqgwYB85cBZ4Ae2TgVKd0Evy
   jyTGu7J4LKto0KA5J0NA+GNRFZ6Qg8BNczwJ/AneWIT8PElFtiB4fnLyF
   awrjJtcAFkz11dw3fg0yofzJ7Yp0f24U84rtLOacblaU3UtxJ13PnwMqZ
   Q==;
X-CSE-ConnectionGUID: P1zkiIydRvC95mO5EY2Z6A==
X-CSE-MsgGUID: KFtc7grdTGK9G3izS+Hneg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75538400"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800";
   d="scan'208";a="75538400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 06:03:32 -0800
X-CSE-ConnectionGUID: iB4UQchvTG6wMT0qRLv3Iw==
X-CSE-MsgGUID: hV6ev9T3RyuR+52n17C61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800";
   d="scan'208";a="234279671"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 06:03:29 -0800
Date: Sun, 8 Feb 2026 16:03:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
Message-ID: <aYiXr8f2hO6cU3uj@smile.fi.intel.com>
References: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: PKGNXQMUTOVRLCAGYVAE4ZKEB4JL3D24
X-Message-ID-Hash: PKGNXQMUTOVRLCAGYVAE4ZKEB4JL3D24
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PKGNXQMUTOVRLCAGYVAE4ZKEB4JL3D24/>
Archived-At: 
 <https://lore.freedesktop.org/aYiXr8f2hO6cU3uj@smile.fi.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 20, 2026 at 04:20:49PM +0100, Andy Shevchenko wrote:
> Now we have a helper so there's no need to open-code.

Anybody to comment on this?

-- 
With Best Regards,
Andy Shevchenko


