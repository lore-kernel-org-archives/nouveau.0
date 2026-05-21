Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B93CD5BB1
	for <nouveau@archiver.kernel.org>; Thu, 21 May 2026 14:00:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B66710F339;
	Thu, 21 May 2026 14:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meqkAUtt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F084C4612F;
	Thu, 21 May 2026 13:47:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779371250;
 b=dWXAwybKKYnhRl28kyLFR65QbgU75LGyu29IHJj9k+CJsozw/lKbmNsZpWNF9TSf5zpVT
 lHx/ud2xl9b0h9evZwskrL24tl0FEdNxQutiwsCbTfcOe4UA0va4Ul7LtbA2puQdQHdSZfQ
 GpqyLPA3cW9XYDpRkTfQH6zYwjp0UermApRkk5ZbuYj2LNbaSXMmQT795ulXthjRtawwf+D
 qvaM3CF4LWUpb4Up/zEFd1h5uM72c0ToM3JXasap389moQwrVodtHOeFrunOXPS8pv74p/z
 s7kHmAatuxTBVq1NybfzH9v5Q6ki7A/YeUlrcVH4oeGxlvX0FgkIXbCggGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779371250; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7W7z/aEG2Bd0BWXf3AGlrxIzLw4FKaLGVxpzrAA2Muk=;
 b=ePth7KhACvrfByzdNJoZEF2ZnL525mkwKpeMyk7sV4psg8l2VlDvN0QZThNNcnzfhj6mo
 N+AZx3AUe0vIZSaCsCyzicYguV+UpjpD0BYd5T3NGYJwmuWB+hlJoT0E7lmnGp01e4zP60+
 uZfBZXp7HBg6Vf27kUZutXOI+ugAJtzIND687IHSXwcWYJjAiCRp781BAktu6epmkkq4LjX
 6Lqm2EY0T7CYvllLZ9r6N5gjJbVxV6MxRO8Or+F3W6nODo1WEw7UUGruExo4GlhFOyVnK8x
 KDdxa6QSQCduaFd/CsCmAbYVcQBxwfAIrfavD0/1gnNb6lPJl1i/6N0qECxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B171146054
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 13:47:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB1AA10F329;
	Thu, 21 May 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779372041; x=1810908041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P2vvrMS0cA0nf8csD85gV4H/e4rsZnFQUK3vI4r1K10=;
  b=meqkAUtt0WEXZ9RzLOLb3/gHkGxsuAPYQ/UpaP4EKvMjxptcLhaEmXBL
   H+mJCDFFyyDGzFCLYJiqTOXTYpubEHU5+kEh8Uaw6I9EBd6sVnqarRtrs
   z1zezlr1hxGKjF66oJjICqVQxd7tFtZkWkqOpkH7AbbIchY6TY6QrtPGw
   i+/cNOyAjEDLCQutg352LPZM2ohAGqqj2BoTpwBXigT2dZNM34yBE+qk8
   jvR+5/024nf0mWU17obC+RlH2wQm+/X9jFBjY4X6VnRzTK1zamCy/+XUj
   5wk75B2K/agCpcZCnd5IbacEqEldbm4p4n4UvPzNzQPxfGXGg6bqxIlaw
   A==;
X-CSE-ConnectionGUID: T6GCb/l3SuKstObSGgT9eA==
X-CSE-MsgGUID: rhuFUTw2SLqg99xFJ0Xl+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79437169"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000";
   d="scan'208";a="79437169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:00:40 -0700
X-CSE-ConnectionGUID: LWLwqBgwSTWMNBmcK6XsTw==
X-CSE-MsgGUID: YwRXeLaPQYOODzDoC1fScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000";
   d="scan'208";a="239682785"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.42])
 ([10.245.244.42])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:00:33 -0700
Message-ID: <9aa73abb-0eb1-4320-a179-40f7d2458dd9@linux.intel.com>
Date: Thu, 21 May 2026 17:00:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
To: Thierry Reding <thierry.reding@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-6-a6de5da7216b@nvidia.com> <ag67FStKnQcvNOrP@orome>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ag67FStKnQcvNOrP@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6V5CK3KU2BZQ45T7HOZMT6RGY44TRJRN
X-Message-ID-Hash: 6V5CK3KU2BZQ45T7HOZMT6RGY44TRJRN
X-MailFrom: mathias.nyman@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6V5CK3KU2BZQ45T7HOZMT6RGY44TRJRN/>
Archived-At: 
 <https://lore.freedesktop.org/9aa73abb-0eb1-4320-a179-40f7d2458dd9@linux.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 5/21/26 10:59, Thierry Reding wrote:
> On Wed, May 06, 2026 at 03:41:57PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Currently the kernel relies on a global variable to reference the PMC
>> context. Use an explicit lookup for the PMC and pass that to the public
>> PMC APIs.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
> 
> Mathias, Greg,
> 
> can you ack this so I can pick it up into the Tegra tree for simple
> dependency resolution?

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

