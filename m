Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82B60A5BC3
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MR+cqIhP
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9374010FE84;
	Wed, 18 Nov 2026 16:51:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 091F149546;
	Wed, 18 Nov 2026 16:31:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795019498;
 b=pGO5gSYRvAXo2nasLyjpSkzLE7SzOCA7N6JmYlIyHmjLnFvXEi9+vUbrHMiKogpClRf7F
 dvOT8uRD1K7ljB7lAPjxdYSYDWld+4c4bUeq0V82EC0M8ZW70Nr/EKYeWJtGEKTkstvIUHz
 UfzQFIXPq0F3uSovQTIr16N+hXZIsg25/3ZFfUq34zv7VjC/yvjc/6C5u9mXx/x8nUAn/MC
 yo28fjlZpB/2Aaa0sXINRILF3PPuUTns8y0R0RHd8a36Faf92z8zBFO8ijB0NspBX08C5+7
 GjBdCY3hqfnJz1OOBXUsReuD/kRyqgKg70eevtxmOSKISsC77OuFMtCi2GiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795019498; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/cUldU1e2XAI/ZxV0Ch4uDE5FUyxfirjC3SAjGA4JrA=;
 b=pMenB7TibD2DrzFoBjlW+5rRL3QU6koKJrPZvAVQGHiyQ94Xxp065LCPK2oDlBSXgu4Me
 3cNmqexTQoRE4DQRXWvPhjlwoVJdqcNiVF4GRFIHzIli+bDXCLmTdAq/zubG+p2+dQHTlOz
 3TILCxPb/yLMUWRmv0MyMQrijJBNqSG/OwaYS+7+DRqDfM+LTWX0LofHgCgzKFPJlNMdx64
 a5JA8pjn7xQHXHNedOWGSMUd32f3G9Z/HAOKBSGPNTXZ7N90pbkNiOemKq40YuTXx5FQW59
 6IVbydh2EZOz1on7pf32ZjfLIcT1t+jLYnr0OjEooDkbkydeXvXSZhKbEjng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 32D004668B;
	Wed, 18 Nov 2026 16:31:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE96810FE75;
	Wed, 18 Nov 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795020684; x=1826556684;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=ajDnh0zw+64dcFPrEUfvS5sWfWZYQWJZbcQwO+AcVNs=;
  b=MR+cqIhPvcv9ENCgwgQp+w136q5E5ZrF8Gr2k1oHAStv3nmORyTsYhIx
   dmB4ZhZA3RiHYKpQT9jX+b9oATSksOCgpupoAqcVsB6qiO987bQJCdp2+
   RvFFOvAEPIQYhayUD6l7g0YziH62AmA1xbRHANVmNBNhDrsm/sT62LZ+1
   los1cgShguo+tNWVMW5YTqnOFCf+4MI3IP5FktQFdubs9TNg5rw1x2kLt
   aT7NzqI44nrUxjFq72/wodsiZN9iPoQtNnoJphJCdqCJTFjpYQLcPxwr0
   +ppilDS7nihsZEZvDQnpPZxEFDxvsIXNunqPfO47sNuWDzZSwx77IZqCQ
   Q==;
X-CSE-ConnectionGUID: ufF2x8MjSTe8MVsBRvojhg==
X-CSE-MsgGUID: hTuyctwxQIOM9eJRzdtD/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3699708"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400";
   d="scan'208";a="3699708"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:50:31 -0800
X-CSE-ConnectionGUID: k/DCmaX/Qp2q9S20vakyDw==
X-CSE-MsgGUID: YVFQiz1BSVmcIhLrCJbvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400";
   d="scan'208";a="9985477"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:50:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
In-Reply-To: <av2rKJQ0AKU9CFZI@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
 <av2rKJQ0AKU9CFZI@monoceros>
Date: Wed, 18 Nov 2026 18:50:19 +0200
Message-ID: <8ebe3b7219ffd963a498cccbcfe6cefc92717f0c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FA6J4J2HXQLLZNP7YP44MOFSAKQABBMG
X-Message-ID-Hash: FA6J4J2HXQLLZNP7YP44MOFSAKQABBMG
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <k@chaosmail.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imagination@lists.freedesktop.org, linux-mips@vger.kernel.org,
 lima@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FA6J4J2HXQLLZNP7YP44MOFSAKQABBMG/>
Archived-At: 
 <https://lore.freedesktop.org/8ebe3b7219ffd963a498cccbcfe6cefc92717f0c@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> w=
rote:
> Hello Jani,
>
> On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
>> > [...]
>> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
>> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
>> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
>> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>>=20
>> How do you expect a patch of this size be merged?
>
> Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
> branch and offered to rebase to 7.4-rc1. When trying to apply this
> series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
> and 5x content); these are all not so hard to resolve (and even dropping
> the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
> for me.)
>
>> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i9=
15_pci.c
>> > index 84a7dc6ab5db..faceb3de4fa3 100644
>> > --- a/drivers/gpu/drm/i915/i915_pci.c
>> > +++ b/drivers/gpu/drm/i915/i915_pci.c
>> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
>> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
>> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
>> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
>> > -	{}
>> > +	{ }
>>=20
>> Personally, I would *always* use {} instead of { }, and would rather not
>> change.
>>=20
>> Across the tree, {} is slightly more common than { }. IMO changing them
>> is pointless churn.
>
> It depends on how you count. My statistic looks as follows (on top of
> next-20261117):
>
> 	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/de=
vice_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | u=
niq -c
> 	      2 	}
> 	      2 {
> 	      6 {  }
> 	   2598 { }
> 	   1262 {}
>
> So over all *_device_id { } is more common by a factor of > 2. This
> series fixes one {  } and reduces the number of {} by 37. For only
> pci_device_id it's:
>
> 	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if =
m/pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | =
sort | uniq -c
> 	    159 { }
> 	     32 {}
>
> Without the context of an array initializer there are many empty
> code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
> {} in Rust code, which IMHO have to be considered off-topic for this
> statistic.

I realize my phrasing was careless.

My point was not so much about one being more common than the other, but
rather that there are *thousands* of instances of both, specifically as
C compound literals with empty initializer list. I think it's pointless
to convert one to other, regardless of whether you're adding or removing
a space.

I mentioned my preference, because if I were to go on a style fixing
spree, I'd go the other direction. But I think that too would be
pointless.

I suggest to just accept either.


BR,
Jani.


--=20
Jani Nikula, Intel
