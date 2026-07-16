Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A67FC4450A
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48F10F246;
	Thu, 16 Jul 2026 09:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ay9RStfR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38CAD471FE;
	Thu, 16 Jul 2026 08:58:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784192281;
 b=swlTN20MgzLVygNN4kST21dYe+PimAgPILWDaZjcBFOqe5GVbmrhwOHklw/CVG/eLVkKw
 m3Xaso8E3avjtESn0E1dExqkRIg4jxzNo3A/7nVBqXotTtRWoaNuCd9VtY3h/uNgOyBbJAb
 jFUnxatDhrlhv7eJaN95uWb9VsDuQi6Mz5vXYlvS0gp2fARw3xj3pdhn371FFcHlC73h+IZ
 3RaFqA/rdq9mHETLgjn1XVJikaGZvkMXIf0JSJa5a+vFIidkhhq6gZRKJd12eHb06PafMQW
 HJ0AfTbOQRnTcTr4QaE8tJiKgprFOsVO20Mo/VykP6MpIWoaZ3Uazv1EI/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784192281; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iTgmRt/mOhfeVVtmxm9TcACq90Tyo5vsbd/jxsIv5Z8=;
 b=YCCWoyvxpE+CzhW8ROnr+3njrRHHRSYZ4ECGKkB0sUxnfT/T/yBltFDsTpsJ5k1ODAieQ
 B9PFuBL1Rha7iHNsJRxMVqdAPtblYhbCjSuDctKYxt1/CTRt6P9JJKoiGSSTd6AIDpF/iyF
 neptHCKIHJ9EWRlp4U4D7DrgUWuJSiHLNFwjofgJ36rzWm7EEZ6g7FsVAnAUqDKbAfbL8MD
 tJRN2KlpmgghqCG404ZT9FL2E9VxNonP1ujd3iptQstBe/sqUQzfay5UoPIMBf7FPY6sYfd
 wYgSz/4yMJkVO7RamvbuqfyyZ16jPVPcJbf0Zhq3jWzmhRypFsSTkwA3hmmA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6EBFA4551C
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 08:57:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 630AB10E317;
	Thu, 16 Jul 2026 09:13:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C609741404;
	Thu, 16 Jul 2026 09:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28231F000E9;
	Thu, 16 Jul 2026 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784193194;
	bh=iTgmRt/mOhfeVVtmxm9TcACq90Tyo5vsbd/jxsIv5Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ay9RStfRqzjIAkK9qMkR2z+5qf0qqqVKp9e3TmHYXeStbB17RWYaMTy3uBEQg9KdB
	 u6SzyAyck8jHQYnZRcDZF2nv4JSlVK4s+Z9AU6vm4Z8hdBsYN/pLtEuoZ1uePJ0ei+
	 CgwmpsarAdZLu5fqmEDEh1cyx1Hkj2MzKeUhBMvb3bdhVqCABV+8VgCEe6FDEOjjO5
	 qL6/bzX0PVJJW9W9nJfTJrTOKM+osmvCPL9h6+QY3ZBSJrc6TfQFtxhuA1XgcYUKNj
	 nNSh+4LtoZwZxaqnJtf/7k1p7/OJu8+sERq6XAOZ6syFQj2Cdz8ihwQ2xEfBx+fsWk
	 BBTOOeQ6E91Fw==
Date: Thu, 16 Jul 2026 10:12:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <aligdOKNwoOtD4io@lucifer>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
 <ale3ydkx1xt6ruuP@skinsburskii>
 <20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org>
 <e9d0ade4-cf87-4e8d-90ec-50ddb5249b24@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d0ade4-cf87-4e8d-90ec-50ddb5249b24@kernel.org>
Message-ID-Hash: X2D6GW5TRTP5CN6PU5EZMZSAKDQU2HBK
X-Message-ID-Hash: X2D6GW5TRTP5CN6PU5EZMZSAKDQU2HBK
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Andrew Morton <akpm@linux-foundation.org>,
 Stanislav Kinsburskii <skinsburskii@gmail.com>, akhilesh@ee.iitb.ac.in,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X2D6GW5TRTP5CN6PU5EZMZSAKDQU2HBK/>
Archived-At: <https://lore.freedesktop.org/aligdOKNwoOtD4io@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jul 16, 2026 at 10:59:56AM +0200, David Hildenbrand (Arm) wrote:
> On 7/15/26 19:14, Andrew Morton wrote:
> > On Wed, 15 Jul 2026 09:39:37 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> >
> >>>
> >>> Please don't do this, this is completely impossible to track for review :)
> >>>
> >>> mm review is currently very difficult based on volumes, it'll become impossible
> >>> to manage if people sound fragments of series.
> >>>
> >>> Please just resend the whole thing at this point.
> >>>
> >>
> >> Well, I followed the guidance provided by Andrew, and I believe he
> >> applied all of the changes, including these, to the `mm` tree.
> >>
> >> Do you still want me to send v9 under these circumstances?
> >
> > Sure, if that's what reviewers prefer.
> >
> > This is a bit unfriendly to people who have already reviewed the code.
> > Which is one of the reasons why I respond to a new version with a
> > single diff showing reviewers (and the author, and myself) what changed
> > since the previous version.
>
> As much as I dislike fixup patches, I tolerate them in reply to the existing series.
>
> But having some random fixup series is just crazy, really.
>
> --
> Cheers,
>
> David

Yes.

Stanislav - also see Jason's suggestion - if you give a base commit then sashiko
seems to work better. Maybe look at using b4 which does all of this for you
automatically?

Thanks, Lorenzo
