Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84A0C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 05:46:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C87610E2F9;
	Sat, 11 Jul 2026 05:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QgCET+Tx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3222470A9;
	Sat, 11 Jul 2026 05:31:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783747867;
 b=PjCpGP24iw5Axh195oCOml01IKVerabhpgDi1yVEZFoYq+xBcYnZS8chWTUwruYG5wmg7
 zFGmb/puEJzCUNCTPBgq3pF7zny4txf9ZlPcHtSvYf8AEWk/USwz57R6cvQcty8R/L090zp
 utSQ2xCSnAGkKA1+m9oaZ9I9K0J0TFhcNU9YpU4KjVoH5KPQ+euutS7BP4UEf6fmur7oZDh
 0K1/Fd1t0GGkrQX47h1MlL3rQxrP043vHh5i48UZUlxmsyjE0yEK6c9c1S9sT4Qk2sU9rfS
 emSywE6HqdwPLhkahtJE6KhbB4hCT/edDvW1jGGzFeiAIyNqbcuoKJBZ6eoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783747867; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EaiPorL9ahIoJjJNitVwjgM9ztVnjvN7foqXLiq04lM=;
 b=YA5BhpKdJH1f3NA9JtJpbPVuoXQwXFoK4zaCUvUvOw8qAA/l3ERy8UNKwBMF2DfaMLNol
 L+PcJLoezDod3sE4W/5r2HsjmmQQBMGUerdMcwewUGSXf3eeb2dN/p7om2u+8OcdIuJqliW
 i87bYkcrOR9n0kJsa/no/SffidVOXgXzMvbB5i6+umgRlv/DIArPEeL4gB4/9yVP5u9AQH/
 8XBPxN4MYvuWhZq4Bn5WoBPhKLD5yAokF6gNMhXVh8T5pcht2GCst4t03jfXm/h2PCZKQpB
 4+hm39v/MJvo86fly4vbEvQ+4fUe8FnugfHFzzSSZpo8Eg51uyyCIYxe3gPA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CCA0146FE8
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 05:31:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C07DB10E2B3;
	Sat, 11 Jul 2026 05:46:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D02D60051;
	Sat, 11 Jul 2026 05:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB7E1F000E9;
	Sat, 11 Jul 2026 05:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783748768;
	bh=EaiPorL9ahIoJjJNitVwjgM9ztVnjvN7foqXLiq04lM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QgCET+Tx8Bz0jrdks+rAbU8mUQHeVPcVhmNjnY9QEy3j0IQt8dtIhIBSKEh+5N9As
	 WQNaEldSNdp9DDaqnyfla/F2QwjYqb48w5VbRYV51VDzIlmiP+A0SWtLpP3PLpBuAV
	 qLAHT72ptNutim6kRtqCLNoKDrjqrESrQiMjB/7M=
Date: Fri, 10 Jul 2026 22:46:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-Id: <20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org>
In-Reply-To: <alG1JwgUK44dCiN4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371881034.900500.5214601525971121683.stgit@skinsburskii>
	<20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
	<alG1JwgUK44dCiN4@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q5HIHCJ7VVEF56U3QLNLEXJIKWCTK2RR
X-Message-ID-Hash: Q5HIHCJ7VVEF56U3QLNLEXJIKWCTK2RR
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org, david@kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, longli@microsoft.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q5HIHCJ7VVEF56U3QLNLEXJIKWCTK2RR/>
Archived-At: 
 <https://lore.freedesktop.org/20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 20:14:47 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> > > +	mutex_lock(&region->mreg_mutex);
> > > +
> > > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > > +		mutex_unlock(&region->mreg_mutex);
> > > +		cond_resched();
> > > +		goto again;
> > > +	}
> > > +
> > 
> > If the calling process has realtime scheduling policy and either a)
> > we're uniprocessor or b) this process and the holder of
> > interval_sub->invalidate_seq are both pinned to the same CPU then
> > cond_resched() won't do anything, and this might be an infinite loop?
> 
> Yes, looks like it might.
> What can be done to prevent this?

Well the best way is remove the polling loop and use a proper sleep/wakeup
mechanism - mutex_lock()/prepare_to_wait()/etc.

If the polling loop is to be retained then maybe msleep(1) or
usleep_range()?
