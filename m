Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725D4C44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 22:11:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 306AE10E6C8;
	Fri, 10 Jul 2026 22:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="isSd+YdI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2035747076;
	Fri, 10 Jul 2026 21:56:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783720611;
 b=MzjettgYbkIf3bVCmPHZfjIc2xwX0wonl499K9St2tohCcJP/XDOmD2onG2jY5bUv2s6y
 bLk+RXYOJdPPC3wxShPX67PPHKZuUW4ieYMR+phNNawgYcNuel8j/8ZeW+LG9rnTeoDnY7T
 tnphT2sKCj7T1JlGzPJtoB7ehkctUsFAn/TlGuzpkVo/i14MTbIe51bzUI24uN9ZhDHdJtV
 M8q7CJTrawWxtgOAfQ1SHGgmU2w2uRA/IOQDGpLWq+hDkpYT5aSJG7+rSuM0LSqVbyVk+9j
 vRmIbH0Z4EBkuD/MuMZDMTwPboogq3KSIqfeRbKdJbaglDenQ1DUm5V7gzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783720611; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vJbMePxYpylcp4oMY5TEvTIXxy0y15lVec2d7nGNr/0=;
 b=lQ8UTHZssV3AFC1zAe6u5hx1kuSwaRTQubxhHV0v7klZuslakMZYV/1Y0ok0ctvxGzmfu
 tCAEIUZ5j4v+XkqXOQTYyTKIM9g4oLQl4szVzNQu17XOW2PDwhQUa36N5F0o/NgTB5kX7NP
 uv3Vr9GGLssAizQY1pWWXDD638mYLhikcsQl3dB/IFK1G7gWRE4ONqt0o6pxjC7ljBUTdLM
 EO+rYea8dr122mSKtQNsX69ksBQZKdAGM4FrQv9ZCLHSX/yS5fxt8WXbA1xXDIbmzWj6MmE
 8vt+5wQJRzMOOGOpKP63TKsJDGgbxHpM/nWq34jH5STwrVysoe7q68EDeK4w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D08EC46FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:56:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9710E25C;
	Fri, 10 Jul 2026 22:11:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3C1341453;
	Fri, 10 Jul 2026 22:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABEA1F000E9;
	Fri, 10 Jul 2026 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783721512;
	bh=vJbMePxYpylcp4oMY5TEvTIXxy0y15lVec2d7nGNr/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=isSd+YdIk2oKRkj18Y+rPxVD68aDvGRkC3Gfz17Do9Znb6noKkhNVD6qZ2vomkJnV
	 Vz3mMRKNl/P1Rv/PJH445qJc6+MsAE7TmU46muPg/2k1wbFohRwIe8WbSdXx1BmEdU
	 TG5W4PVDlLUdPHejARtAkCr9JonW/gFOE5KBW7kI=
Date: Fri, 10 Jul 2026 15:11:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V6BJUGMDWMXMLSILMDDDANQE4BQ54EKX
X-Message-ID-Hash: V6BJUGMDWMXMLSILMDDDANQE4BQ54EKX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V6BJUGMDWMXMLSILMDDDANQE4BQ54EKX/>
Archived-At: 
 <https://lore.freedesktop.org/20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().

Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
spin in mm.git's mm-new branch.

Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
what base you were using.  Hopefully there's a reason for a v9 so we
can retry this.

I have a few niggles, nothing major...
