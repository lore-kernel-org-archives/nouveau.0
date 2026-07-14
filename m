Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A490C44508
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 17:57:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 165B810E0B0;
	Tue, 14 Jul 2026 17:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Del5tMhz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 823E147163;
	Tue, 14 Jul 2026 17:42:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784050963;
 b=EuEdt9/VOvdrTRaoFN2h35wxeFmbstnOLKOZVOGyyvqlQwER/gr6x4VjEHTnMB3cyR5CV
 N56Sd5lLtRQTOUO6U9T8ojdSn3FWng7+bf5BpCESqylMuiz5EwtSdoC3iSNFxy2m2w5MpsV
 OOjtyTqjvlwdSExgVHfBOMQ8a8bmaLCI2tl1WmtbTGKWv4kEQobuL84M9XKoto/kEAbIR0o
 qlnEpMNuxNCXjYnjnIAGcMkLP1xm5r4c9bFv4+l99qE5PMjPtmqi3Ey9bqa1xN5Cl4pbA+Q
 Q6/L6fLj1kGikfUZpBfA73S8vXAoXtfALE3wFIG1NxD6F+lOVK28wKRwwQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784050963; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GZsCQFEgcn6EMOCDEWdLwPkfWWcQqzlkLED/YqdY1Tc=;
 b=ZCiSBdQ4MH0mX3hfSRSj4BY592+7ttpE0VWxn0IP6bNfYB5HgxsSJAFGtoPaFnMEUJ0YI
 yepTjoaMt4wuIbzvzYaUiLgR9tzefXQ4n9GFQvlSSRK/X+/q/iBzf4l8QJA4eqNAVC+AazR
 Lab0ov8sLc5vEVuZWXBll2Bpg2a9mKE8++1SE85uXLI4+5UJjB4DBLbOhr73m1fndUEzFbS
 uej7CjbEMQT9vPZ9l1QMrD5HR3N88AFVDknZqHGlr5fHpu2AiRTe1B9p4ywiKLPRtrWubJO
 kEwPjQWiu976Wa0mp6iarXdgBHDH7UlRtRGCXdqlkNZVeSXyx3zNKquyHiNA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 08ED847123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 17:42:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5EBB10E08C;
	Tue, 14 Jul 2026 17:57:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB6641943;
	Tue, 14 Jul 2026 17:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234151F000E9;
	Tue, 14 Jul 2026 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784051873;
	bh=GZsCQFEgcn6EMOCDEWdLwPkfWWcQqzlkLED/YqdY1Tc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Del5tMhzu3youmLCKHjbgtPvdsDIH+7IGGFST8BzaPmqfbbkJZKJ/z7YuaAT/X/p7
	 YChgX7fSaBbak9aPutlauCQ1Jbkj4qG9n6iEshYriEkzHWNiPFv0rwct2vUBjwBQdh
	 kaZUweQ5gxNphKPDgOzYUI91+awAsCTyJPp5rwvA=
Date: Tue, 14 Jul 2026 10:57:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260714105751.f45ec4c70702c222febdbf07@linux-foundation.org>
In-Reply-To: <alZfTxfypj39OrCE@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
	<alG2-RSitzPWClAX@skinsburskii>
	<20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
	<alVRU38lMfvmUFqJ@skinsburskii>
	<20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
	<alZfTxfypj39OrCE@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YFYHIZLFYRD6GC42ZVJXQNDOON4IO7KQ
X-Message-ID-Hash: YFYHIZLFYRD6GC42ZVJXQNDOON4IO7KQ
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YFYHIZLFYRD6GC42ZVJXQNDOON4IO7KQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260714105751.f45ec4c70702c222febdbf07@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 14 Jul 2026 09:09:51 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> On Mon, Jul 13, 2026 at 03:45:35PM -0700, Andrew Morton wrote:
> > On Mon, 13 Jul 2026 13:57:55 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > 
> > > > > I rebased this series on top of mm-new right before sending it out.
> > > > > Should I have used a different branch?
> > > > 
> > > > mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> > > > this point in the development cycle.
> > > > 
> > > 
> > > I’d like to send another revision addressing a few comments and also
> > > replace the `max/max_t` check with something simpler.
> > > 
> > > Which branch should I base it on so that Sashiko can apply it
> > > successfully?
> > 
> > mainline Linus would be safest.
> > 
> 
> Looks like linux-next/master has been updated with the v8 of the series.

That's because v8 is in mm.git's mm-unstable branch.

> I have v9 with a few small fixes, but it is too late to send it out already?

It's called "unstable" for a reason!  Material in mm-unstable is still
under review, test and the latest stages of development.  Getting
things finalized for movement into the non-rebasing mm-stable branch,
then into mainline.

So altering or replacing patchsets while they're in mm-unstable is
perfectly OK and expected.

> If it's not, then what should I base it on?

Well it's a bit tricky to replace a series when it's in mm-unstable. 
One can do a git-checkout of the commit which precedes the v8 series. 
Or base on current Linus mainline, which usually works out.

Sending little fixup patches against what's presently in mm-unstable
also works.  I'll queue each one immediately behind the patch which it
alters then squash them into their parent patch before moving the series
into mm-stable.

A third alternative is for me to drop v8 from mm-unstable, then you
wait until that has propagated onto the servers or into linux-next,
then base on that.  This approach is OK but I kinda unprefer it because
there's a bit of latency and it makes it harder for me to prepare my
"here's how v9 altered mm.git" summaries.


Which would you prefer?
