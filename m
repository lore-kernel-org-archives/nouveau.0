Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32AA1062899
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 13:05:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1128310E8F2;
	Wed, 11 Mar 2026 13:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EvkrumX3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 61F684507B;
	Wed, 11 Mar 2026 12:55:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773233722;
 b=u+Y0X5zauZgw5F+oI5ZlrSphRQPJYXHSTEYTd9eWsbXiP3iEDPpGvBU+107Oe+Pkcv9hB
 o7fGtqFBC3YFlSU3MfWcRZH/xUvNLlzAVfKvGbnK0YIpL/eP622dBnWUXa4k55rWtrVKVNi
 /K4vGhuX8ODLxOegX2eoFQXP99W3dxn3tPo9Ep6Ghzil8C562EFGEnWTdtodTt9XizNeNVq
 flUuEgEw1PsFtYqhZ2Qwzwy1CqFbrzkLQ3Z0g6Wonp3W6zDF1xyju5Ocb/jVYIgi9od1cK9
 gT0FrqnYGHzVY20manCRcfctKv17YHwYWMMXw266LEGOQ+nDvWyee7cQ+sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773233722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hhI5bssw0YYfyiZmDV2UQjJyuYrrdYRCdkcII67aj10=;
 b=e+8jHXG0lgCS4k+SEHeyoYZIjTXxmTHseUf3x7/dtNr1iUthJKWxhUikKx+MsOyMsVuK8
 +bwElfbEVIARImJNias/3/7T0kcvFE5n+46GfbsynGyG5czm7rQZYrINTe+pd4gGWj3jU3V
 gQh1txPijoSu9R41s9uYqRAWWdC1Dx5cg9SIf5KpzuPBrmtWVHUALRvaRq03XyJJqQnq4A/
 tUnE0HDFKVZLu/btu/N79LS8reRXov2BmZ+octcGBlGTAES9HcQ9XBjYLM0FX0OOkI20EEf
 5Wa4jzb4lr3OSJxq7UaHP3gYqi3oAJJQpt+QLmNFfnrPMwWg0QHWNhDj7Qqw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 19A9042BB3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 12:55:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9330310E8E6;
	Wed, 11 Mar 2026 13:05:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 549D6440AA;
	Wed, 11 Mar 2026 13:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5913C19425;
	Wed, 11 Mar 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234355;
	bh=nbZBUsdJcvcRYXPC15YGXFPTjlIlWJ4Gu6T6ZsV2KtY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EvkrumX33ovdE3XY7rAl0LGIpmzKFuCtSoK0XC5sVrCq4wBOqxNrlndO6w4HOHGO8
	 jLWVOwwUXQWzAOnsw9Yt1RLYHA5IDzWMh+XHqnPu5u4CK0XoWNA9UWNjOc0QfnNyYQ
	 YRukM9Bo8TdJyktArOzBJGJqhPdquElra7adPC3ikoYJn28YKwy4MeoI0Oq1YeMhVj
	 eHWodu0AL8oBTCYm24/VU2jD9wgz99jcS6CUCHRYa7Bq3VHTtCczcnYM25CEMYfFGf
	 6ptXM6KcayHRoi+OCyzuU/ThLqoMNZwGGpS4Oeq5HiYsxH37sFdObnEfdIvzLEHVSx
	 PES6/OYo8y29A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:05:52 +0100
Message-Id: <DGZZ47IBKTHD.3BB0V807G3V37@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
 <DGZYZOXZE7XU.YV5O6SOIR6KS@garyguo.net>
In-Reply-To: <DGZYZOXZE7XU.YV5O6SOIR6KS@garyguo.net>
Message-ID-Hash: VSQMPDFFEQZBIGOA3NVKYX6AUFZCQSWV
X-Message-ID-Hash: VSQMPDFFEQZBIGOA3NVKYX6AUFZCQSWV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: acourbot@nvidia.com, aliceryhl@google.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VSQMPDFFEQZBIGOA3NVKYX6AUFZCQSWV/>
Archived-At: 
 <https://lore.freedesktop.org/DGZZ47IBKTHD.3BB0V807G3V37@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 11, 2026 at 1:59 PM CET, Gary Guo wrote:
> On Tue Mar 10, 2026 at 10:58 AM GMT, Danilo Krummrich wrote:
>> On Tue Mar 10, 2026 at 3:01 AM CET, Gary Guo wrote:
>>>> +// TODO: Revert to private once `IoView` projections replace the `gsp=
_mem` module.
>>>> +pub(in crate::gsp) struct Msgq {
>>>
>>> These could all be `(in super)`?
>>
>> Yes, or just pub(super). However, that's not the case for the functions =
in the
>> gsp_mem module, they could be pub(in super::super) though. But I think I=
 prefer
>> pub(in crate::gsp) for those.
>>
>>>> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMe=
m>) -> u32 {
>>>> +        // PANIC: A `dma::CoherentAllocation` always contains at leas=
t one element.
>>>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr)=
 % MSGQ_NUM_PAGES) }().unwrap()
>>>
>>> I wonder if I should add a panicking variant of index projection for th=
is case.
>>> Perhaps of syntax `[index]!`.
>>>
>>> We could also make the existing `[index]` becoming a panicking one inst=
ead of
>>> `build_error!` one. It is more consistent with Rust index operator that=
 way.
>>
>> I thought the same, as something like this `[n]?.ptes[i]` looks a bit od=
d.
>>
>> However, I think we ideally want both variants (I like your `[i]!` propo=
sal
>> above), since generally users should have the choice (as they also have =
with a
>> slice through get()). For instance, the index could come from userspace.=
 Sure,
>> you can always validate the index in advance, but having a fallible vari=
ant is a
>> bit nicer.
>
> I'm not proposing removal of the fallible variant, just that we can make =
the
> infallible one use panicking instead of `build_error!`.

SGTM.
