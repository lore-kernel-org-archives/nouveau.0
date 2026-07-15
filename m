Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD2C44501
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 16:03:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E30310EBDA;
	Wed, 15 Jul 2026 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTe0PVEt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7567246EB9;
	Wed, 15 Jul 2026 15:48:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784130486;
 b=eAN3hROx2AKoLijQyX8zuGyiEzPFWLJRzaf96iOhKDpi6qQxzwxwWsNUPHT/8oG0xauFA
 WHkWe5JGIHYbsNstKPE4heWiJIk2/pugs4CqqfIk8keaaYNIm4iqjKboqL2sf8LkeaYOxLf
 WRiyE0ozSjPizgp+dcMXOffA3P2X1CFh6BcoRK/lQCIXpnCTLkJMrpU2TBYoH2X3g10llu3
 C3JoyDRpxsXPLVhcw+nhgFjY+i441/1DMy0LDz+u0imafjqGEX6KI26c2sYWTwKPs1JDPDE
 jXBHhamAHH02qIkkYIjv4KOKY5Y2v8xNnYLmGfJDcfYVPCBL2xsvxvKIfEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784130486; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=f4C6n0w9mDrtHRCnStTGRTvpeLhmwUbbHGkqcxBvTik=;
 b=SQvDgGe6eyMf70R1ArfKxuULKa0saPfykFDR4plNNUeB86xW1GKbnoqN8WHxc+uvenDDt
 uyD1MCs8rc06ahrg6Q+nYJsT+QGiiUs4t6l/hEyEnUxu7DiVH5PXj9R4ryxGJ48T+anQkiZ
 dtTMTNTs5klTNzGRFYQUYJr3HqJWZGxKXJH/0eDRXH5SV6iiYie/MUAlIh/f6OCCp4uCtgH
 py9teAFaNsWHPMODUxJTu1v77xabyfQcthdhvOI8cI8tvQDHxYxlAh/C9OMb74Gu5ZZ5T/U
 fWXKEJNO4SKbFpfgtuVuvDbOvEHT5I1TBlw+qjvq+9+dY7DRKMTty0LOq39A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5F61246CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 15:48:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B70FC10E8ED;
	Wed, 15 Jul 2026 16:03:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A387432B5;
	Wed, 15 Jul 2026 16:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DD31F00AC4;
	Wed, 15 Jul 2026 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784131398;
	bh=f4C6n0w9mDrtHRCnStTGRTvpeLhmwUbbHGkqcxBvTik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTe0PVEtIUgNNd0HJimWRQQVEEPMbL5+bzLWuypuzi9NIZDNIO6kUqirtSxlAWLFk
	 PrBLqf5Yq1l3QU6VH4iviptT0e9bRWpUM/uEXAasgR77pKC9z+vQd3N/ZT12gq+TOA
	 iSjdO6i4rRi3jSv2zcy+p4iHl9QURtzFzqcQgPTQEhJK2/xGqbUIZZT2Vi6+Rct4P3
	 d+GhP1nj6V3srM5djsFI26cexSh0CwKsIKZqFVpU6Sr6h376esJkNnOtKiwg2jmpGj
	 k+k3ZxxMJZcOYT4zJ80nQ91avqazBAS8yWXPX8UPGPMQCt3fqQNPTCHC8TVxaX0t6I
	 khlJo9zamFdrw==
Date: Wed, 15 Jul 2026 17:02:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alet21wLwM6P_Km2@lucifer>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alecaJ1FUso39D9k@skinsburskii>
Message-ID-Hash: JPZTX3ITTC4WY6ET7IZEAUNKN5PS4XBK
X-Message-ID-Hash: JPZTX3ITTC4WY6ET7IZEAUNKN5PS4XBK
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "David Hildenbrand (Arm)" <david@kernel.org>, akhilesh@ee.iitb.ac.in,
 akpm@linux-foundation.org, corbet@lwn.net, dakr@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JPZTX3ITTC4WY6ET7IZEAUNKN5PS4XBK/>
Archived-At: <https://lore.freedesktop.org/alet21wLwM6P_Km2@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

To avoid confusion: obviously please don't merge this series Andrew.

On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:
> On Wed, Jul 15, 2026 at 02:41:43PM +0200, David Hildenbrand (Arm) wrote:
> > On 7/15/26 00:21, Stanislav Kinsburskii wrote:
> > > This small fixup series applies on top of:
> > >
> > >   [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings
> > >
> > > The first patch updates the HMM documentation example to make the
> > > mmu_interval_read_retry() state explicit: callers should use the notifier and
> > > notifier_seq stored in the same hmm_range that was passed to
> > > hmm_range_fault_unlocked_timeout().
> > >
> > > The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
> > > timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
> > > HMM retry budget. These callers no longer keep an absolute deadline around
> > > their outer driver retry loops or pass a computed remaining time into HMM.
> > >
> > > This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
> > > HMM succeeds and the driver later observes an invalidation through
> > > mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
> > > retry budget.
> > >
> > > Changes in v2:
> > >   - Kept the nouveau outer absolute timeout around the
> > >     mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
> > >     bounds HMM’s internal retries, while nouveau faults are handled from a GPU
> > >     fault worker, so userspace fatal signals cannot break an endless stream of
> > >     invalidations there.
> > >   - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
> > >     timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
> > >     never 0, which would mean retry indefinitely.
> > >   - Updated the nouveau fixup commit message to explain the worker-thread
> > >     timeout issue and the time_after_eq() boundary behavior.
> > >   - Fixed the amdxdna fixup commit message. It now describes
> > >     aie2_populate_range() correctly instead of carrying stale nouveau prose,
> > >     and notes that command submission still keeps its broader timeout while HMM
> > >     gets a fresh relative retry budget.
> > >
> > >
> > > ---
> > >
> > > Stanislav Kinsburskii (4):
> > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> >
> > Why a fixup series instead of properly resending the full thing?
> >
>
> The goal was to get a Sashiko review, and v8 has already been applied to
> both `mm-new` and `linux-next`.

Please don't do this, this is completely impossible to track for review :)

mm review is currently very difficult based on volumes, it'll become impossible
to manage if people sound fragments of series.

Please just resend the whole thing at this point.

>
> You can find more details here:
>
>   https://sashiko.dev/#/message/alaWmUEeIBeSkmO0%40skinsburskii
>
> Thanks, Stanislav
>
> > --
> > Cheers,
> >
> > David

Thanks, Lorenzo
