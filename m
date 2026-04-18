Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E747BF99C8E
	for <nouveau@archiver.kernel.org>; Sat, 18 Apr 2026 20:43:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC0110E374;
	Sat, 18 Apr 2026 20:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lNq7Vf0q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AED7145A4A;
	Sat, 18 Apr 2026 20:31:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776544277;
 b=Px2t8Ynb0pCLQQ0efORoTriY49iV/+Q9iQJuCtpr4zfpPzB6o413QE2axyFXl3NI5Tv88
 +YZYv89dh4nZwsRGP739MkTzEuteTVjLGU5kYIlP/ffCWcWlAVqsDBZxn0GOR3mW3Do3PqM
 s3Jd0JL6nyUXOVvHyzcQyGlRfR0MNF59hgA/rlXg4PKLsSplVTumv0nJI4GS8E/11L7TME9
 /3gg62+rZ8gvqx3VhGOVwM5L8OaFqWuDRYiKKiRzqxridUshRNdD8vHmjo8a/boksdVBP5v
 +pHORLycoWe1kudIReomkbjHt8ga0XzkTgtxYd5+Q348/2syFnRpuXeK5Ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776544277; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=veUT8DjimZT1vda6+l/Gni17sJpHTFPtGqXP9GMVK2M=;
 b=L0M9rjSAWbRca7uoUM3rQwZ+mgnsKFmRBWUP6CFoCKjijx4vz84aUb5InLkEHRP0I4Tjm
 rmtQXXxU9HNVFGd1E4YN663JqAKzg4n1DNz8VEcq1C2w8mZBIisjmFiCr3ZISs3Mf8wZWRw
 OoXjwHBkVYSOtqckuzz0uqNuDc/bOhkabiPnohwPNWTIcsCNueZiZ9jLSFJ0idXN9cC0HW2
 +Mz1S5bX0yqu1INpxVwP+/2qBkwB8z5cfak9GA2GUzq+UWFTAHml5W4Ndsq9IXmq5C7TWtt
 +NsOkplRd9erUo35FtzBd8WJaYC6T9d4LCvQAxeeaKLvPrWDvHncUcTJe7Og==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F40945A2B
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 20:31:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5F10E031;
	Sat, 18 Apr 2026 20:43:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 716DD40B0D;
	Sat, 18 Apr 2026 20:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8294BC19424;
	Sat, 18 Apr 2026 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776544994;
	bh=y/wvlviY2ep26rl/rICAKXuCCJlaF96Y446O19jE1Vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNq7Vf0qw/0F20NcL1nBMAbzhKn8MPKLaiXV99y/a/upM8s9N/gS4SDgvRVYN6wPS
	 GXawJEm1zIiRWmYOol1gXTrSDG275LTi5rffwaWVBO6Fg2PB4ZXTOp/5hc0nBC3OTq
	 4pQQ7SwUqUjMWFIY97vUQNi5j73MZCZPLslvJddv5i+qP1dbuQBawGET40JlCbYg7v
	 f/MFo2uH3Rg/JVTe6JFKsdAINUOpzfuHPT0Kyb88N09icAA6WTvknMvRIBoAgzdJ58
	 y75WgLM9YGhrMNo7CHA8euBklXIFaEPnMYwlXbESZLvgIWEdviGHQnKYgGSRJ28bO6
	 kwNnvmBL2lErQ==
Message-ID: <9e835632-0882-4fee-a66c-3cdfec5a410f@kernel.org>
Date: Sat, 18 Apr 2026 22:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
To: Timur Tabi <ttabi@nvidia.com>
References: <20260418071412.86022-1-sunliming@linux.dev>
 <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
 <abb12ec2c8d72d6a369ef7b29d0453736a07f90c.camel@nvidia.com>
 <DHWGN6Y2J9X6.3FMWWDU2NQ2LV@kernel.org>
 <f3ea592561af59cf0d677e66a70165e2d7b7edbb.camel@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <f3ea592561af59cf0d677e66a70165e2d7b7edbb.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75RW3Q7O6CQR2XOW4MP26CEU56QQTLU6
X-Message-ID-Hash: 75RW3Q7O6CQR2XOW4MP26CEU56QQTLU6
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "sunliming@linux.dev" <sunliming@linux.dev>,
 "sunliming@kylinos.cn" <sunliming@kylinos.cn>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/75RW3Q7O6CQR2XOW4MP26CEU56QQTLU6/>
Archived-At: 
 <https://lore.freedesktop.org/9e835632-0882-4fee-a66c-3cdfec5a410f@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 4/18/26 7:44 PM, Timur Tabi wrote:
> On Sat, 2026-04-18 at 19:35 +0200, Danilo Krummrich wrote:
>>> I posted a patch a couple months ago that cleans up an IS_ERR check, but it was never picked
>>> up:
>>
>> Thanks! Can you please make sure to send patches to all maintainers? If they
>> don't land in my inbox, I can't pick them up. :(
> 
> M:  Lyude Paul <lyude@redhat.com>
> M:  Danilo Krummrich <dakr@kernel.org>
> 
> Hmmmm.... I did CC Lyude, but you're right.  I should update my git-email script to catch these
> better.
> 
> While I have your attention, I do have other patches that I neglected to CC you on:
> 
>   2. [PATCH 6/6] drm/nouveau/gsp: enable FWSEC-SB on GA100
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [95%]
> 
>   3. [PATCH 2/6] drm/nouveau/bios: specify correct display fuse register for Ampere and Ada
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [95%]
> 
>   4. [PATCH 1/6] drm/nouveau: check for GA100 specifically when calculating FRTS size
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [91%]
> 
>   5. [PATCH 4/6] drm/nouveau/gsp: require GSP-RM for GA100 support
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [97%]
> 
>   6. [PATCH 3/6] drm/nouveau/bios: skip the IFR header if present
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [75%]
> 
>   7. [PATCH 5/6] drm/nouveau: parse the VBIOS on GA100
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [99%]
> 
>   8. [PATCH 0/6] drm/nouveau: fix GA100 issues
>      - by Timur Tabi @ 2026-04-07 19:21 UTC [93%]
> 
>   9. [PATCH] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
>      - by Timur Tabi @ 2026-04-07 18:53 UTC [95%]

Ok, I will take a look in the next days.

Thanks,
Danilo

>>> https://lore.freedesktop.org/nouveau/20260103000756.1002890-1-ttabi@nvidia.com/T/#u
>>>
>>> I'm quite certain that there are other similar issues in Nouveau w.r.t. IS_ERR_OR_NULL.
>>
>> Yeah, that sounds likely.
>>
>>> I think an audit of the Nouveau error paths is in order.  I suspect that Ben's big refactors
>>> over the past year have resulted in some invalid error paths.
>>
>> Are you planning to look into this?
> 
> No, but it does sound like something that Claude could figure out pretty quick.

