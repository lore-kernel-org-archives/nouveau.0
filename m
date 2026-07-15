Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA5EC44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 14:42:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9669610E4A0;
	Wed, 15 Jul 2026 14:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMG0c0HX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 271AA46D2C;
	Wed, 15 Jul 2026 14:27:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784125659;
 b=cbWGyfyEPKW3yiwp4DepxUbs7IBpRtgCPnrEkO7jYsP1NqpcSFypzJ8iVTY68ymAPQpaQ
 INqDJ+mB+HcvnMnrDGjby20ALj3xL64aUhLcFuDaeL/zwfprw10MHeq984pz8uZurBOZqye
 c4KpI4lY5XBYXxM+E2Vr0P0OUxsrx8cdSXvI2KWBd28ExB29sVOEyZMTGO2PliLhITUyvvA
 YQOSvF417y5RTUKemad6gLPC1xVZNxgWe64fPIxdvlPnwMaiFq2/OLV5u/oFQ4P0Au3DgWa
 vVp0gHo0pNF42jS3/NenjE507qBtrkpX8I12fm0S276ylOFh9gCEP65UM1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784125659; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YFdvFy4JZmcJMIT1d11E7kO8Wgq6KQpSjvMclrKV/Fk=;
 b=mNvrJcRbjPClicfVTvDWAK52uOhEgCQ6Hlg5ZErj2MH5JKejQI/mIHXfgcbWznOwUV8Dp
 mYkQRGxzqY/ZcSBXDLBmeNYyTru1GO3aJZ0cdlhaw505Q7qc7DXnX+nZSnhFPkyzGkSRpC2
 GplZTkW6MdjJ3+uh9G9cDVLXQer7D0eJ5WsojpBBhLP17bVW8y6Rb+T5PnwpKhHcqXw2sOQ
 lseqP3BiVFSg9UgurqM4B/QNWkiH2ukNa9DCxnqIZNQw77oG/SIu3V2NKd7pmNEjaKHhgea
 BLGhJGg+/LYM0I8zm9wFvDDBVqHJx3OLnvtIJjkjFdTV6QDEWgNBBo8YOOBw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0874F402D1
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 14:27:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44A3910E2BE
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 14:42:52 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so4834953a91.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784126572; x=1784731372;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFdvFy4JZmcJMIT1d11E7kO8Wgq6KQpSjvMclrKV/Fk=;
        b=aMG0c0HXaHDF3+UpuSbMgTebk/ETEZDMSeJLciYua9HHa7eVxqHHfW03HyZ3o55cLn
         Ru/AqnHsjhcUSQ/A3kUgsqKglh7Fus4l7t0j9giwuJhu/8z+XqKBGcckcvRv2ASVmlZp
         MT9yRcVAf3jcMsOGyFcdGKx9Rf4QC4+vKwTFHR3RQ6D+K5PTMGFAx3OeW5+e3QIpVe3S
         YcM2dw21IpiG1e+2sGiRS/VYKMtdRA4hz5eB3g1iMQlfceEWT1PJQJKRBiT5a4vnUI44
         0VLIkLy2K1IyD4O5XAeSXujq1cQCt78ko16MbJSQYGXNXFDjatOVyjB+E4rMFC0kgKBO
         JiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126572; x=1784731372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YFdvFy4JZmcJMIT1d11E7kO8Wgq6KQpSjvMclrKV/Fk=;
        b=GsKgQ85O/ChXkac5kaF913oSIb5Qr9pRxH6HMzQ9RgJ5Mb32DXcTGYvR+6bqpG9CEP
         +/RI3iLe3j38v5jdzuvRew9ohjNcave1tw1gjysRpGkaLI2xxO0d8UgI75MAHl7soykm
         0KQyrq4CBH2RiJTbxl3XBSXGAQFa7N360gQakh+euStaWIIvdL9Bvo0wGhhTSbrOi31d
         Yw+mX1J2N8rjNuUuWOYMcMfRpR3JgMuvbEssxVNTiqEprXOYwZiE3SGiCbmzdw5NTu1g
         UTSE9NexZdCxnsb+xC2cTBjEpMn8IfgyC0MrtMYWAXuLsCuX5JsLCyfmO9vH1qBJHXj4
         L6kA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2IZhmvAavbjstqODLDFGnLzB1Mow3w2t1ehCtPUFNdiZcA9nmmIAS6ERLhYj4gfsr0Wzg2eGb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKr1Hx2R/peHk7/hzIT1ZNshJR2P9FoIF+UYqdBNH3Rx1vEnCY
	0O2GDU4sU4sbBcE0hcA7ZyDXYODla/YNNgljg4/jjIyTgNdSw5WiCqCz
X-Gm-Gg: AfdE7ckTfkVx0R/TiwOABpWrY2yfX4lEv7MhwCr2W4qfhiS8dV/W9wAVg9hmChgPbJg
	1FNUBbzNSp7qo1pGJ+KrcSRJjFi7ynF897rT268QhsdektGzAmeLwOLYp5i0jvumvNzBCwf/zx/
	Ie2D7yecHaW9wL2auqRHfacLsqTQClsOhMSQMAV+igLonT0svLQ03hUz2fInWMB2pn0a3oinmPu
	6E/6T/4ba+2UM/QaRnVZ3VEMWBv/cliLQEjhYN/aaOlgBGz+Llc4drs1MBiMJ2uDb7Cuvu9jgMj
	tIxGFzqNwF6GtAq9s+3yvTAlIWNFSDv/PPzoIqqfo9qyUmyIwfNq5EIkYy9cmHnQ9fvcM4MAXnJ
	NrQ9IF4VJK1I2ueRXgE9RD6UdCRG8FtlbkoMWsXPdmtDMbuROgZK6V9QuSqQFMKtSZad5m3fSTe
	oe+tm2mnMkvixiEPoZ0omfVryxzokuvDrIu6eF0RZweOosUiQRJKElF+g=
X-Received: by 2002:a17:90b:2890:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-38e29ff97b1mr2563808a91.9.1784126571549;
        Wed, 15 Jul 2026 07:42:51 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e172b6da2sm3320825a91.4.2026.07.15.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:42:51 -0700 (PDT)
Date: Wed, 15 Jul 2026 07:42:48 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alecaJ1FUso39D9k@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
Message-ID-Hash: OGTJERP3XUDDUMO6HKPQWX6PR4OAOMT2
X-Message-ID-Hash: OGTJERP3XUDDUMO6HKPQWX6PR4OAOMT2
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, jgg@ziepe.ca, kees@kernel.org, leon@kernel.org,
 liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OGTJERP3XUDDUMO6HKPQWX6PR4OAOMT2/>
Archived-At: <https://lore.freedesktop.org/alecaJ1FUso39D9k@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 15, 2026 at 02:41:43PM +0200, David Hildenbrand (Arm) wrote:
> On 7/15/26 00:21, Stanislav Kinsburskii wrote:
> > This small fixup series applies on top of:
> > 
> >   [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings
> > 
> > The first patch updates the HMM documentation example to make the
> > mmu_interval_read_retry() state explicit: callers should use the notifier and
> > notifier_seq stored in the same hmm_range that was passed to
> > hmm_range_fault_unlocked_timeout().
> > 
> > The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
> > timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
> > HMM retry budget. These callers no longer keep an absolute deadline around
> > their outer driver retry loops or pass a computed remaining time into HMM.
> > 
> > This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
> > HMM succeeds and the driver later observes an invalidation through
> > mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
> > retry budget.
> > 
> > Changes in v2:
> >   - Kept the nouveau outer absolute timeout around the
> >     mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
> >     bounds HMM’s internal retries, while nouveau faults are handled from a GPU
> >     fault worker, so userspace fatal signals cannot break an endless stream of
> >     invalidations there.
> >   - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
> >     timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
> >     never 0, which would mean retry indefinitely.
> >   - Updated the nouveau fixup commit message to explain the worker-thread
> >     timeout issue and the time_after_eq() boundary behavior.
> >   - Fixed the amdxdna fixup commit message. It now describes
> >     aie2_populate_range() correctly instead of carrying stale nouveau prose,
> >     and notes that command submission still keeps its broader timeout while HMM
> >     gets a fresh relative retry budget.
> > 
> > 
> > ---
> > 
> > Stanislav Kinsburskii (4):
> >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> 
> Why a fixup series instead of properly resending the full thing?
> 

The goal was to get a Sashiko review, and v8 has already been applied to
both `mm-new` and `linux-next`.

You can find more details here:

  https://sashiko.dev/#/message/alaWmUEeIBeSkmO0%40skinsburskii

Thanks, Stanislav

> -- 
> Cheers,
> 
> David
