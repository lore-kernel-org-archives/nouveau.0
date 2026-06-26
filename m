Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A46BCDE002
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 12:31:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D86810F5BD;
	Fri, 26 Jun 2026 12:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deEkf0Wg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32C2E46D10;
	Fri, 26 Jun 2026 12:17:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782476241;
 b=skq+JLIF/6ns88AFGUnvCDWqDEndhQEIHaCDK2InF1hrBVokArx7tELTsMxbwNQs2ScCY
 QsKmfv9wvTBwuspIhymq+Lkn+4REyGAYeHghdokIy7x+u5IbkzrpbUN4sv3u6suTag9BdI/
 O1olIznO11SNGuI0Feik/AAIDt11hZ4MMWO/GG9lRg0dz0WGzMxzoKOsHCKY/HzqCDTAdoo
 4n2agnOtmxPE8SlJuTdXoS1T+XSvygo+ri+/MYBybtV5fqN0E57BFwBODFc44zTsg/YBI89
 QVDd7RTjY1CLZy26dY7NetOwJMnFOYyzRgB1d7kcuiABj5pu6DFPvsPfpckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782476241; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/sYHaDjX4rzfRvRogigX3qVwyGa9Si6ISTBLCYe3+Ro=;
 b=dARqnlIRUQXXEy8uklMKliycI3rSvhMAvOy+nVHeoBfP+a2PH4+QzbEFhhT/hklatOsSe
 D4jYX55sYFsVo9QDdZbRQbcKtdOrGSapxUXwcfu2mSpXrQO8reAZzERRFqXGUO1Ry7TCqbp
 I4J4q/G0r3HjWa7Us7VD5GSattErXwujwzeDOcqRomAqc7jnjO9ohAF1izmsq9q6xaTvfpC
 FEb1IegdLv9FIuxQNCdoPNjB1W1RnfI4XwgErAVFGJSVVTF+SQJGqFrv2pIZvX/p2ep19V8
 hXP4/XTKn/0IE29ywhdomgZaUDVdv/BXffMoYsLuf/ShZJUk9q5+aIbD5EGQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 45E5246CFC
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 12:17:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9B10E393;
	Fri, 26 Jun 2026 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782477111; x=1814013111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=of9D+QDbplk76SptbJ/9PEF9tc3vwD6lqMoVlMFoRmY=;
  b=deEkf0WgZ/zT5CPcImZmOmE+ROc7gTOfxhuCSTrqkODhpzS3RHrB2wq6
   o2J2azB9RAnTdG7zZq3JXlzXxOaNfuYveBtdhFa4MGOeFtGoYigZT+k8r
   ncUO97aAZ9/D0cxMgKEorLBianm3dwPnigT4xTVSEyXkFicN1O9QlwI0G
   VuZqOcCFGdOAxo/+3JszrEKf+eBIFvoGbgFofCMDP1LRLJhw1Quc05k7J
   4GqewgNyizU9hjDYKyM5NeNvBKjOgqq89n1vGKDc+ZzxvdRD7thLaCqdN
   7hWpnwl6oy9eHj/B0N98m8CcpJkywvQI+FRaoSgZM/l1wutcGUPw8lriL
   g==;
X-CSE-ConnectionGUID: 5JhJf2gMSga3iM83Lept1Q==
X-CSE-MsgGUID: Cnkdr7U6SXGk+j0uNLaz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93924827"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600";
   d="scan'208";a="93924827"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 05:31:51 -0700
X-CSE-ConnectionGUID: x4OkPwIWQxSYQC+zEXBj+w==
X-CSE-MsgGUID: f4x1A97GTyWq5FhmyP+BMQ==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 05:31:47 -0700
Date: Fri, 26 Jun 2026 15:31:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] Revert "nouveau/gsp: fix suspend/resume regression
 on r570 firmware"
Message-ID: <aj5xMVbxOlzb2fyS@ashevche-desk.local>
References: <20260625231252.89684-1-lyude@redhat.com>
 <20260625231252.89684-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625231252.89684-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: 2L2HKM7ELN6Q6R6BKMRKU64PC6THBBOZ
X-Message-ID-Hash: 2L2HKM7ELN6Q6R6BKMRKU64PC6THBBOZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2L2HKM7ELN6Q6R6BKMRKU64PC6THBBOZ/>
Archived-At: 
 <https://lore.freedesktop.org/aj5xMVbxOlzb2fyS@ashevche-desk.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jun 25, 2026 at 07:10:54PM -0400, Lyude Paul wrote:
> This reverts commit 8302d0afeaec0bc57d951dd085e0cffe997d4d18.
> 
> It turns out this looked like the right fix on some systems, but it's not -
> as this causes runtime PM to actually fail on many a laptop.
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

Two times Cc to stable.
I also recommend to move the rest of the Cc list below cutter '---' line.

Will be something like this:

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v6.19+
Fixes: 8302d0afeaec ("nouveau/gsp: fix suspend/resume regression on r570 firmware")
---
Cc: ...
Cc: ...
---

This will reduce the unneeded noise in the commit messages.


-- 
With Best Regards,
Andy Shevchenko


