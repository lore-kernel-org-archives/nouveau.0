Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365F3CD8CA8
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 17:19:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 149A810F5F0;
	Fri, 12 Jun 2026 17:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SxMRnvNI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8ED3446AA3;
	Fri, 12 Jun 2026 17:04:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781283897;
 b=MXFQupnDtDKrgMafIzhKp2jeVjSSuQU0ScQVlwL+hIiRbWN7GNhYSoj7dLGfaEdMgRU7+
 xngJUKx3pWlTpDnSDlyiXk38aydftpkZ1h+O+jxPM1rba5m0l1uUCX6UPuxS3WEFPaQiXOw
 cULkG4tjHYAUQ5AircIQcm+SWd/fykGg1oS0RaqeJKOGsf03HZ8i8FmUxGCixqs+JbKrDS3
 KCd3pEnZI25tCaD9KtcP0MqnaPWqIQ0tw/GIhiQAV7D2azFln8cCBe18psmzal+12kyQ4Eu
 5E+ejbHgFqGYhIQenPMU0muK8nPlwCXP8cFHtiGcqU2xel+eLuhxwyaZZEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781283897; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YUUTaHVRoPtS1HtgR3Iw4hFLtlpzPkDp4HslgQlS3ng=;
 b=KYSZh+3eQ1tybLLenCSy//Y0Y0xj5yWJFh+X6ktIZw/5RLwh/fHMVtxgq/MWOx6gK1xK0
 FYPeLFBIXMwvONZU3b+PWV7MuZvEkRzQSzHWJQNXv97jE8x9Wm9x9MAo2tAmiK3qXqV46FV
 kbR53yTinwNHO/4ZAJgTGLt2YSHCdQ6SOVZlxyKo+Wvmd9wK/QtkE8DtU5UfFTaRhMngw6V
 iii8cOcKj+9izOYPHZtdyrU9lByj/pBAf/aX9H0lMIiJtoULf/sMV/wek+K6WYgYAx8rebs
 Reo9IKj/6qVx6T+9mYE1XRQUCpxQAFPnTxC+/pamEtv4POwkLjfrmHZD2vvA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 41A04460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 17:04:53 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8916E10F5DF;
	Fri, 12 Jun 2026 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YUUTaHVRoPtS1HtgR3Iw4hFLtlpzPkDp4HslgQlS3ng=; b=SxMRnvNI921FmkddfLNMjHNeAm
	6ReigP5W2YwGQo+yXPGE1gNon8BB8a1KGm/MjeRQPcYfXF+uP0bT1jOGKKmX7AKnTpDzxy/q6gO0s
	C22dvKPQaWLaD4wtFzQPliezHutSd6K+nS7BuovPtjg4bNxQS5oTMDS2FkYt53g88KxZso/8/L/0Q
	Q2hLFucX4qlVMIOHnb0pF0nIz9TuI7A4d+5czlID5GV/hH92lLN064PintaFAgzur2LuJgy0XtSqt
	xjdIKFj8I6SzPac7bpQsmK3e6G2RVL3ZXdCMNp4dP1QSWadmfR2TVZvHmTclH/RIepLUsVBxKFePn
	yF4IuN4A==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wY5Wu-00Ghg9-NS; Fri, 12 Jun 2026 19:18:52 +0200
Message-ID: <e6e016bc-cddf-43f4-830d-cf047183a9bf@igalia.com>
Date: Fri, 12 Jun 2026 18:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Simplify nouveau_cli_work
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <6f929f2e1c55f7945b41593eea44f28d3b93abf7.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <6f929f2e1c55f7945b41593eea44f28d3b93abf7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V4UBWANACPKQYN74H23GN2H72NYJQ2NM
X-Message-ID-Hash: V4UBWANACPKQYN74H23GN2H72NYJQ2NM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V4UBWANACPKQYN74H23GN2H72NYJQ2NM/>
Archived-At: 
 <https://lore.freedesktop.org/e6e016bc-cddf-43f4-830d-cf047183a9bf@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 12/06/2026 18:14, Philipp Stanner wrote:
> On Fri, 2026-06-12 at 17:54 +0100, Tvrtko Ursulin wrote:
>> I don't claim this fixes anything but the code certainly was a bit
>> roundabout and this at least cleans it up.
>>
>> The only semantic difference is releasing the fence reference after
>> the work callback is called. Which kind of make sense anyway.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: nouveau@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 19 ++-----------------
>>   1 file changed, 2 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 42a81166f3a9..7de174537fc7 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -153,22 +153,6 @@ nouveau_name(struct drm_device *dev)
>>   		return nouveau_platform_name(to_platform_device(dev->dev));
>>   }
>>   
>> -static inline bool
>> -nouveau_cli_work_ready(struct dma_fence *fence)
>> -{
>> -	unsigned long flags;
>> -	bool ret = true;
>> -
>> -	dma_fence_lock_irqsave(fence, flags);
>> -	if (!dma_fence_is_signaled_locked(fence))
>> -		ret = false;
>> -	dma_fence_unlock_irqrestore(fence, flags);
>> -
>> -	if (ret == true)
>> -		dma_fence_put(fence);
>> -	return ret;
>> -}
>> -
>>   static void
>>   nouveau_cli_work(struct work_struct *w)
>>   {
>> @@ -176,9 +160,10 @@ nouveau_cli_work(struct work_struct *w)
>>   	struct nouveau_cli_work *work, *wtmp;
>>   	mutex_lock(&cli->lock);
>>   	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
>> -		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
>> +		if (!work->fence || dma_fence_is_signaled(work->fence)) {
>>   			list_del(&work->head);
>>   			work->func(work);
>> +			dma_fence_put(work->fence);
> 
> Dave had addressed a UAF with that patch.
> 
> So if this would fix it, then the claim would be that work->func(work)
> was the user of that fence, and not some other party elsewhere.
> 
> I don't know whether that's the case.

Me neither. I say in the commit I don't claim to fix anything. But it is 
more logical and avoids the silly games with ret and all.

What I missed though is that work->func(work) frees the work.

So patch needs to cache the fence... v2 incoming..

Regards,

Tvrtko

> 
> 
> P.
> 
>>   		}
>>   	}
>>   	mutex_unlock(&cli->lock);

