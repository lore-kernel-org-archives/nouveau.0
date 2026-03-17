Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017E1FD8763
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 13:31:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2110E400;
	Tue, 17 Mar 2026 13:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.b="oKrYnzvP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5CCF4451E9;
	Tue, 17 Mar 2026 13:20:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773753643;
 b=AAegGHEbVkGT4uOIcQT4bEq2e1oOmVODsSPyd8/l+7r5VPPiiFECRm5S7/A9z1BvzYay0
 QMw2IyI4nVbcVCXK12VmtqCnAkpQF44vHvevL2QsVsuU3uhhTWfMiCkpBMkQuscaQjF67sF
 87EBEB8loTRnZoq9X2xL92Orfe8whbXdsztVMoI9C27yHvUJj7GkojFmhCSZwFXK0HAvlN6
 LxBrOfTuI97p5cW0fvNDd6IAoxEo92Kqt9NLVNHln/M6wiryOThDX2HAi3siT5ntzgPKp30
 fU2iLlhO5p/hxAeqOj3L2kGhajjhaKCOZtddxw9lz4BjAnSfNrInypqA7B2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773753643; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u7IdwnJ3XiFoiOXl999DFyH8w2jD/NzCNP0tJJ7SrWA=;
 b=sGXpHsscr/AxiV61rYQRpt7k8Nv3Cz1uQ4njXlXRfUvtlVeutFUhI+MTXMig5nip9ss1l
 0uC9JgBc2SJbP8qodoK8wEI5Ckp9rJOJHkmJL5cUM7Ty/hwhDWIbp009+ItHdXrEYIh3VlP
 GXNrePLLt1YYE5It7zW7FCXMVHUQCbCnr1/6V3NCv2TORNvqfQTnFKyqbRqxM0J/hqG87MV
 4XrC7x0h9W0e+oQKyeOvhztlKBbMdlQ60fcClD5mMg2jSER9rKBGEoW1emXFlOzF/IRYvfx
 2dBe77Ms4I3btFzYo8109uYb1t1zVFLkluIt1XiGMhmdbIKsT3+10ccvAQCA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=free.fr;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=free.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=free.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=free.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A0F2451E3
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 13:20:40 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 755FE10E056;
	Tue, 17 Mar 2026 13:31:28 +0000 (UTC)
Received: from [192.168.0.32] (unknown [85.156.96.35])
	(Authenticated sender: martin.peres@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id F19A913F88F;
	Tue, 17 Mar 2026 14:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1773754286;
	bh=0pLkDuEPyGkbW23Epy9YpMe2BQ53axealeBhtQc1huA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oKrYnzvPEcaY8OmrqJOuaMMzh4EY+K2LMdV3p5egUigKeqArsuc8l6gxUHUZI8r5E
	 3H8p1/Xpg1WhX4ljaI+Y3rexbgfcXkKLr+hTfW8mRU/+g+HXTnrkcBv6aoC8Zji4mp
	 V8lHd1e7JlnVy2oClEuu+c23fpiPd6SfqtEXR1BxGpc54TGsTf/E4ubhfoO9ZxSyL8
	 0gyH8D6ia0HzWAB/wZX3x55Q7gFPSEghvwUC4qgcVzxT4P+RjbnZFmVUIbezH60+eW
	 RrzyJvjZ7RunpU8JpA+xXzm28tUkZp0HtV6skt7TpoZLT9h9QlIK09PRSNEKp1oVQz
	 tbbUh5PP0cSpw==
Message-ID: <778d1150-e990-44d3-8797-0b38bc5c7c7a@free.fr>
Date: Tue, 17 Mar 2026 15:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-drm: rename nova to nova-drm
To: Alexandre Courbot <acourbot@nvidia.com>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>
References: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
 <20260317092304.424377-1-yphbchou0911@gmail.com>
 <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
Content-Language: en-US
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UBBUBFXEZ6ZN22NPOLJDNDZEDKE76R5I
X-Message-ID-Hash: UBBUBFXEZ6ZN22NPOLJDNDZEDKE76R5I
X-MailFrom: martin.peres@free.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: aliceryhl@google.com, chia7712@gmail.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, jserv@ccns.ncku.edu.tw,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UBBUBFXEZ6ZN22NPOLJDNDZEDKE76R5I/>
Archived-At: 
 <https://lore.freedesktop.org/778d1150-e990-44d3-8797-0b38bc5c7c7a@free.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/17/26 15:20, Alexandre Courbot wrote:
> On Tue Mar 17, 2026 at 6:23 PM JST, Cheng-Yang Chou wrote:
>> Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
>> drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
>> to nova_drm.rs (matching the object name nova_drm.o) to follow the
>> kebab-case naming convention already used by the auxiliary device name.
>>
>> Update MAINTAINERS, Kconfig, and Makefile references accordingly.
>> Update the Kconfig help text to reflect the new module name nova-drm.
>>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1228
>> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>> Changes in v3:
>> - Rename subject line (John Hubbard)
>>
>>   MAINTAINERS                                            | 6 +++---
>>   drivers/gpu/drm/Kconfig                                | 2 +-
>>   drivers/gpu/drm/Makefile                               | 2 +-
>>   drivers/gpu/drm/{nova => nova-drm}/Kconfig             | 2 +-
>>   drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
>>   drivers/gpu/drm/{nova => nova-drm}/driver.rs           | 0
>>   drivers/gpu/drm/{nova => nova-drm}/file.rs             | 0
>>   drivers/gpu/drm/{nova => nova-drm}/gem.rs              | 0
> 
> That `drm/nova-drm` reads a bit awkwardly to me and feels unnecessary.
> Even `tegra-drm` is in `drm/tegra`.

Same opinion here.

Cheers,
Martin (an old nouveau dev)
