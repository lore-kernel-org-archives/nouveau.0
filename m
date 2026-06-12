Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF2ECD8CA8
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 17:30:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8510F600;
	Fri, 12 Jun 2026 17:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MRPN57Xw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 950AF46AB1;
	Fri, 12 Jun 2026 17:16:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781284562;
 b=M3gIBBQKRHvcZRya8jqhODxZdgIgnNecLzkTAPpEWK8BJVaEiOX/c04GL5E0Otl9XFyvO
 hgKn3wS68XLk1y2crG0n6xdnoctwep3LnQnjYlk7oTaASvsxCxCcNb1ne34lx+ziRg4ZiEs
 PXFPXf+pTGenw3qXCDWpZPS/8oJWPnQE9TLUO74ZJZNOTeshdKtJTPAqYVi9HbKQaxk+v2z
 xFjdsQ2msLmEf1lp1BXxnBMt5TG2+p1d9oW8QdFYTOR/DA2cVjOWQ2Aiait9+/tK1xOpUvu
 QN3veqA2ebAUshhOk925wkVaIwKk/Wi1yrH/nCpR4owwlWClx6Ud4H5z7QOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781284562; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EC9PNED+qzKYvQ6SG2+BThbNalrGmHsztVrJ0GJAMt8=;
 b=SlOHzIoEl/qNrSiAsYJD8FHE7MsRJDkb/fi53ns/NmfaJckCkDnrDaupEc2CeK8fDsfWE
 QqswS5ppopk/s1YLmjn4N0WpHyWDO1R+XJ3llMDaMY7Muyp9Ov5Xm8bHnK4IP/GpJS1p3d/
 YjXtZfV3TOuOVw6NdGd1tqwf6a9+67PvkMi4CMD0GylbALLXqgAnNSCAzsN7Ex4/hNsRxtG
 8XEyIaWT9Uu9E5tTccNZFB1Z7BPlnDPWzrjEDa5yu0RMU/OR9hTX22CCzhCxZHe7Qr4RgAB
 wQkL3LapR50cgXLIndtb3oF8SMIV1Lf4i7/SgWMy4OyhF2w2mkAxw95typFA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9EF43460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 17:15:58 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7917A10F5E0;
	Fri, 12 Jun 2026 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EC9PNED+qzKYvQ6SG2+BThbNalrGmHsztVrJ0GJAMt8=; b=MRPN57XwN0B09UE7Rg8SarsHLX
	XVF/C9kj2VrNtXZt9u18fkip9c94xz5G+ufhXdplczMe3vC8wUC+9jDj1kYF5bf2MRXG/DpDPVMvg
	JTnusGdh6BwFLhhGueqyAgYG/c0r8E6jr6meBt9MRvaKLZ2XQw638IMDtDh/Bo7cuO12cm0Rgk5CL
	UhEQHlFgHmXg6+HsQHTGp9QvTXo1TzQSDw/mornAs3P/zAQWBqp3hmzAknwXir6zWMnKnqXX/izNJ
	M3n3eae7pFBRpLb6NnlQfHdoojApzjhe/rcdIE7skU3e0ehkTYr6Gze6CiYlS/KihRTx+UlKIEf1G
	McHj3d0Q==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wY5he-00GhxI-IO; Fri, 12 Jun 2026 19:29:58 +0200
Message-ID: <5893be40-3704-44cc-b7c8-9b51fb4c7a92@igalia.com>
Date: Fri, 12 Jun 2026 18:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Simplify nouveau_cli_work
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <6f929f2e1c55f7945b41593eea44f28d3b93abf7.camel@mailbox.org>
 <e6e016bc-cddf-43f4-830d-cf047183a9bf@igalia.com>
Content-Language: en-GB
In-Reply-To: <e6e016bc-cddf-43f4-830d-cf047183a9bf@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3GTWBTPWSKNABDBGLHVSHZBF6LPYG66D
X-Message-ID-Hash: 3GTWBTPWSKNABDBGLHVSHZBF6LPYG66D
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3GTWBTPWSKNABDBGLHVSHZBF6LPYG66D/>
Archived-At: 
 <https://lore.freedesktop.org/5893be40-3704-44cc-b7c8-9b51fb4c7a92@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 12/06/2026 18:18, Tvrtko Ursulin wrote:
> 
> On 12/06/2026 18:14, Philipp Stanner wrote:
>> On Fri, 2026-06-12 at 17:54 +0100, Tvrtko Ursulin wrote:
>>> I don't claim this fixes anything but the code certainly was a bit
>>> roundabout and this at least cleans it up.
>>>
>>> The only semantic difference is releasing the fence reference after
>>> the work callback is called. Which kind of make sense anyway.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: nouveau@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 19 ++-----------------
>>>   1 file changed, 2 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/ 
>>> nouveau/nouveau_drm.c
>>> index 42a81166f3a9..7de174537fc7 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> @@ -153,22 +153,6 @@ nouveau_name(struct drm_device *dev)
>>>           return nouveau_platform_name(to_platform_device(dev->dev));
>>>   }
>>> -static inline bool
>>> -nouveau_cli_work_ready(struct dma_fence *fence)
>>> -{
>>> -    unsigned long flags;
>>> -    bool ret = true;
>>> -
>>> -    dma_fence_lock_irqsave(fence, flags);
>>> -    if (!dma_fence_is_signaled_locked(fence))
>>> -        ret = false;
>>> -    dma_fence_unlock_irqrestore(fence, flags);
>>> -
>>> -    if (ret == true)
>>> -        dma_fence_put(fence);
>>> -    return ret;
>>> -}
>>> -
>>>   static void
>>>   nouveau_cli_work(struct work_struct *w)
>>>   {
>>> @@ -176,9 +160,10 @@ nouveau_cli_work(struct work_struct *w)
>>>       struct nouveau_cli_work *work, *wtmp;
>>>       mutex_lock(&cli->lock);
>>>       list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
>>> -        if (!work->fence || nouveau_cli_work_ready(work->fence)) {
>>> +        if (!work->fence || dma_fence_is_signaled(work->fence)) {
>>>               list_del(&work->head);
>>>               work->func(work);
>>> +            dma_fence_put(work->fence);
>>
>> Dave had addressed a UAF with that patch.
>>
>> So if this would fix it, then the claim would be that work->func(work)
>> was the user of that fence, and not some other party elsewhere.
>>
>> I don't know whether that's the case.
> 
> Me neither. I say in the commit I don't claim to fix anything. But it is 
> more logical and avoids the silly games with ret and all.
> 
> What I missed though is that work->func(work) frees the work.
> 
> So patch needs to cache the fence... v2 incoming..

Ah sorry and I forgot the lock cycling hack we discussed.. ie. the whole 
point of the race. Nevermind then, confusing.

Regards,

Tvrtko

