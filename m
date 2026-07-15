Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A52C44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 17:14:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6130A10E1EE;
	Wed, 15 Jul 2026 17:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2QLj0B/E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B153146F8A;
	Wed, 15 Jul 2026 16:59:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784134762;
 b=istSmbVYh09M/A9gQ+37csr3lSfCz+34d3XtFrJVYEzPfVw+YKPqP2IZdegC2254IWNIN
 8ajCB2zcZanOrXgb9mzQ5jFumVwAWZibnbSySazwPV+PzJ+D52UvRNlyHAAWzWnR/BeuyP6
 UEmUHXhitWQMoI0czYzJO0fTx7yhjHcblAI93Z9s2haho2chhdq2RZ0rrO3rMl8xgwc/pq6
 rnT1Nr+i2RRhgqXagXjCRevdki2K8K3fEjkxP7M4CfuT0U8QPrKyHFpK6PPi7UqUFaMNtq/
 XPATRoIw1McdnT+ineWPNyG0acm2PUmiS90d4mTJEe4bh8QYDdDlHrm7Gakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784134762; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TfHHEaVjP268tDYxyafxZXD74CF9fG6Fu7sb5cedFpc=;
 b=jONWaQ7/fifFqOw9dpI7Wv08w02BwnKnBxX/hCmD+wJQafNcS2hjahsyggOJQUZKCEYd2
 3qAqlzUa3jbj244In6e2RFAdKPxC6z+MDluuRRDyPkBI38kAT+BbKXfxmgt4m5C5XFKwcIR
 KByMX0RHWg0YFX1vgwBTqjkuMs3AOyPPn4P/zA9nMwb+K8BW5oxRRysBri9FcItl1DdtyBS
 C4bYRKUQuaq4JptZavsTDVtp5A13MXndU1q1xx8jCqFf8095iMGCyZJDhXIwgB2Q+FJ1a1X
 wScSTDrynhU7Mj6I8e27P7YFmRdVwJym/I39sOBiTduatLIkPL/Ck0qbPY0A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CA98D46CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 16:59:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF0B10E182;
	Wed, 15 Jul 2026 17:14:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89B8E437DC;
	Wed, 15 Jul 2026 17:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F26D1F000E9;
	Wed, 15 Jul 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784135674;
	bh=TfHHEaVjP268tDYxyafxZXD74CF9fG6Fu7sb5cedFpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2QLj0B/EWa4lYbwGV5I4Q8S6EE2h+YoSscnlwHTueR2CgkYheQri+8JcigQG4CilI
	 gBtr1vMmIm2RnvVB9VFHABy+xQcmM99eg1Qt5ThrQfI5xX4O1/+LDp/iHJwv379AK4
	 UVN02ASUZrntaUlHn1ZMkt1GZEdVN+Y4TeFWC3h8=
Date: Wed, 15 Jul 2026 10:14:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-Id: <20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org>
In-Reply-To: <ale3ydkx1xt6ruuP@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
	<4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
	<alecaJ1FUso39D9k@skinsburskii>
	<alet21wLwM6P_Km2@lucifer>
	<ale3ydkx1xt6ruuP@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JYDEES7K35J4MSCXSDXDV374OG6ZV6KQ
X-Message-ID-Hash: JYDEES7K35J4MSCXSDXDV374OG6ZV6KQ
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, akhilesh@ee.iitb.ac.in,
 corbet@lwn.net, dakr@kernel.org, jgg@ziepe.ca, kees@kernel.org,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JYDEES7K35J4MSCXSDXDV374OG6ZV6KQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 15 Jul 2026 09:39:37 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> > > The goal was to get a Sashiko review, and v8 has already been applied to
> > > both `mm-new` and `linux-next`.
> > 
> > Please don't do this, this is completely impossible to track for review :)
> > 
> > mm review is currently very difficult based on volumes, it'll become impossible
> > to manage if people sound fragments of series.
> > 
> > Please just resend the whole thing at this point.
> > 
> 
> Well, I followed the guidance provided by Andrew, and I believe he
> applied all of the changes, including these, to the `mm` tree.
> 
> Do you still want me to send v9 under these circumstances?

Sure, if that's what reviewers prefer.

This is a bit unfriendly to people who have already reviewed the code. 
Which is one of the reasons why I respond to a new version with a
single diff showing reviewers (and the author, and myself) what changed
since the previous version.

