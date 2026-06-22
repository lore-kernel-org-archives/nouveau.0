Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9761BCDB46B
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 09:53:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B626110E5DA;
	Mon, 22 Jun 2026 09:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CuHUlNTW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB10146C5F;
	Mon, 22 Jun 2026 09:39:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782121149;
 b=rhj4+fzwT3It/4SFx2KP8ZbF//y2R/dWie7Gov4s4aNArodqjI9MfqKsUld0se2TbUzlo
 Jj33OWDd4/fW4EmuPfJ3FIGuuUDo3+N8oTXkrf0d/N1A2tO8RWi9cThk+1zjU8en3kNvpQt
 V0i/HupS5too9hu83ZyT3sc6bLiRE3/Ibrb7LgKzLB4ZlNA0SLHoRmKQd7plwRF+XIwvcfx
 0XVF87tKyJSZbv/lhsnkyO0EZcnPcgpZRUx3y4X/3JamYLO9n93CfgNkA3Jlk2LD949mJyY
 /pyXfnss2vooEVo2bVxwQhgKQVx/MpvBfTCpjMVVJM3j6qyL2Lgva5asEhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782121149; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4ufS86mPo+g9g5X1KwCeExKbSyaBbrXQLI/NPNwo33E=;
 b=gnjbkUiNioJ0veY23Gg3mrXFct0S1neNQlDcuW0vuGQ+TH7cnPEynQrDL+bqcbH9e3KGv
 2pJR1ef1eMauuJ3P20FsoWJK2as2VBmf8ap2muHju7u/GcN3BvQVYV2aFyvHToaSHNkXsoL
 6VhFCa70sVq7iVMXWSW8WrrXyRIchngHTQcSMpkybhOR0QdiRSCpWRxdKf5M9K8mZxa+wap
 5WeGIiUQ4eF45F+dGhhZ2fqE9YJAfdQmIyboQBFJIqT5buX8QMiAmIrr0CwhrcA+cznMv9S
 JKUU8CrEtqEwjLnqWpz/ghL9sCJlDu/X4MggwWRmv5ENiWPqYBe27ZSNJj9A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 248C746BBE
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 09:39:05 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 008EB10E5CA;
	Mon, 22 Jun 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4ufS86mPo+g9g5X1KwCeExKbSyaBbrXQLI/NPNwo33E=; b=CuHUlNTWn1WumXnNuRyyiVi+1+
	FlvebkFEAFR0SKvByG/8Rt1cWN+V+Y7fnutDHJCTgzFPWIlSM6kRcPVbakh3Hfzn92aW9FomwQWNo
	b7Z3SbwA/DNaUxB+LZ5C2n5njlIyBID9FstvbPhx1ligkD9jhY41r5+Myb8JgO6E1r6RDZ9bhGqLq
	bgeTczPsZINwtn+V8KolP6OuGlwIspw7E3JKPwxTrOxwuPfgxX4uJH4tNmgHagvLP1rKY8fTnqRt2
	1Gvmgfqs30DoRRN+rhLTduIcfvFVTGi16oM+j4QpNv+SRDPt2c5ArbpJXehhfv6VV57PH3GRZKNxl
	2Kn274NA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wbbLG-003gX9-Kg; Mon, 22 Jun 2026 11:53:22 +0200
Message-ID: <634e53e6-4b85-485d-86ff-a1fb4e5ef5d8@igalia.com>
Date: Mon, 22 Jun 2026 10:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
 <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
 <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EN6LTO52PI5I2BFAGQUT4TFCXWTL6OMZ
X-Message-ID-Hash: EN6LTO52PI5I2BFAGQUT4TFCXWTL6OMZ
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EN6LTO52PI5I2BFAGQUT4TFCXWTL6OMZ/>
Archived-At: 
 <https://lore.freedesktop.org/634e53e6-4b85-485d-86ff-a1fb4e5ef5d8@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 22/06/2026 09:57, Philipp Stanner wrote:
> On Sun, 2026-06-21 at 17:30 +0200, Danilo Krummrich wrote:
>> (Cc: Alice, Boris, Christian, Dave, Gary)
>>
>> On Mon Jun 15, 2026 at 11:26 AM CEST, Tvrtko Ursulin wrote:
>>> @@ -176,9 +160,25 @@ nouveau_cli_work(struct work_struct *w)
>>>   	struct nouveau_cli_work *work, *wtmp;
>>>   	mutex_lock(&cli->lock);
>>>   	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
>>> -		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
>>> +		struct dma_fence *fence = work->fence;
>>> +
>>> +		if (!fence || dma_fence_is_signaled(fence)) {
>>> +			if (fence) {
> 
> btw I don't think that these two lines read more beautifully than the
> removed nouveau_cli_work_ready().
> 
>>> +				unsigned long flags;
>>> +
>>> +				/*
>>> +				 * Because fence can still be in the process of
>>> +				 * processing the callback list, and the
>>> +				 * callback references the work we are about to
>>> +				 * free, we need to sync with the callback
>>> +				 * processing before freeing the work.
>>> +				 */
>>> +				dma_fence_lock_irqsave(fence, flags);
>>> +				dma_fence_unlock_irqrestore(fence, flags);
>>
>> This does not ensure that there are no more dma_fence_ops callbacks into the
>> driver. For instance, a concurrent dma_fence_is_signaled() might read the
>> signaled flag as false before we do this lock dance and then still enter
>> ops->signaled().
> 
> The issue Dave addressed was a UAF within Nouveau itself, where the
> driver put() its own fence while its own callbacks were still
> executing.
> 
> Tvrtko's patch does not address the RCU issues you mention, nor does it
> address any other fence related issue except for adding the comment
> that should have been added back then with the fix in
> nouveau_cli_work_ready().
> 
> It's literally the same. Take the lock manually to work around the fact
> that the bit is protected inconsistently, setting is locked, reading
> just randomly races around.

FWIW for me the sandwiched sampling of the signaled status inside a lock 
was quite misleading, when the real problem is nouveau freeing a fence 
callback underneath the dma-fence APIs feet. Hence I think clearly 
splitting the steps is clearer.

Alternative could be having a dma_fence_remove_callback() variant which 
is safe to call for the nouveau use case. Then the sequence could be:

if (dma_fence_is_signaled(work->fence)) {
	dma_fence_remove_callback_safe(work->fence, work->cb);
	kfree(work);
}

(Signatures invented purely for the purpose of illustrating the logic 
flow and freeing the callback gotcha.)

And as an extra bonus the patch removed the pointless lock cycling of 
all the unsignaled fences on the list.

So in my view discussion about the semantics of the signaled status when 
observed from the outside is orthogonal. Ie. whether seeing a signaled 
fence status means fence has been signaled (what we have now), or 
whether also all listeners have been notified (what you argue for).

For the latter one could argue that it is not required to "block" all 
listeners until all have been notified. Let the first one go and carry 
one notifying the rest kind of makes sense.

Regards,

Tvrtko

>>
>> Luckily, for this specific code here in nouveau it should be enough to ensure
>> that all dma_fence_cb callbacks are finished, which this hack does achieve.
>>
>> The reason I call it hack is that it fundamentally relies on dma_fence
>> implementation details and not a specified API contract.
>>
>> The closest thing to an API contract for this is the RCU protection that was
>> recently added. So, the proper approach would be to run this work with
>> queue_rcu_work() and then call flush_rcu_work().
>>
>> In this context it is worth noting that in this case it is even more
>> complicated. Since the work struct is shared per CLI the single RCU barrier in
>> flush_rcu_work() is not enough, i.e. there is no per fence callback grace period
>> guarantee.
>>
>> To me this still seems to be a bit of a footgun (although we could probably
>> improve the nouveau code to make it a bit simpler).
>>
>> That said, the patch does make things a bit clearer, so I picked it up --
>> thanks!
> 
> I disagree that this is an improvement and am unhappy with you merging
> it. It merely moves Dave's fix from one place to another and causes
> unnecessary churn in the git log.
> 
> Adding the comment into Dave's fix until someone can address the
> (literally) fundemantal problem in dma_fence would have been my
> preferred approach.
> 
> 
> P.

