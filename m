Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10F5C44506
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 05:49:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 268FB10E6F0;
	Sat, 11 Jul 2026 05:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kbiBT4UI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 680BE470B1;
	Sat, 11 Jul 2026 05:34:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783748088;
 b=rpc/ETbS5jdpp1djm73u+BRTyaEQ+zqxMAgJ486GNqaJj5Z/BpWp4357X8kQT8fYJFxuy
 dUssM+JW0DUMxk6HsPJlpw9s8ilFBgbOG7v3FXkzOupflAY3jW8dnLzpHDX4qxsait0lMQL
 p3w4yVdUa/V6nJekZ5nvw02tgA1PVO4CxtZQXYyou0zbsaUvfBJC+QXT83aB5BLWLBY3yUI
 rN8dARpV4E5KHDEUICh+eyh8BoWwCn+WrtFGCjNI/PN5W9+W66+0yFUXo6AgEbFtzZldeYW
 s7WIVUG81p3tNvAYB1/wS5dXqnJqDnv7e/JRzZZwvlLoxrf5Gg2YVnfdxbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783748088; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ORvew2lmZPoxsW3E1uuEKYOedhDenWUn2ruaSYxV7Zw=;
 b=oJLE08JrrvDLpRJIPjgY4Mnfw0HNdLKxXTF5vws1D86DkFqGEj5Qx7eOAecyO92ysDSqC
 xalVGbRTwFWSDZ8AidYU5nXdZx2Y6AQ6rXp/sgA25+9bGSAM/XQX6tM0eCNnNFzPJeaeYjz
 kbJo6MG2xuXSX1fgy++MSIxGKRLtXGV4YRFF00u4D+yXpNQqg6/TnC0cWGgwvCWeHQDbJnE
 5qFoVgK8Roy1Hm85Rnt+N2CLVnoDwQPMBzvbdRv7PLjOwC8jobx+T9SxejHwi8QxQzMm2cn
 bpY8YClGmV3PaR7d/KdjJTJ1I8FxzIOOqeMFr/lBcY+KufpnPbo+vkZCSyxQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6542C46FE8
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 05:34:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFAD110E40D;
	Sat, 11 Jul 2026 05:49:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B50F042EA4;
	Sat, 11 Jul 2026 05:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C7C1F000E9;
	Sat, 11 Jul 2026 05:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783748991;
	bh=ORvew2lmZPoxsW3E1uuEKYOedhDenWUn2ruaSYxV7Zw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kbiBT4UI8EsOzp5Z6jcjE98+zJxsZeeKjK7DQ8Q28feKtSsl5P2ADzs/pTEcqC0/J
	 QY82X8hqbvOUNwXy7z96UyQ9MiH9eTOe4kxzhnxuDvLyE2M7RAXChoKV7pn9eSdotM
	 zjLpw7SDmjk5NIon4EHpDP7oKzGvYv+jnEP2DHoA=
Date: Fri, 10 Jul 2026 22:49:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
In-Reply-To: <alG2-RSitzPWClAX@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
	<alG2-RSitzPWClAX@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PJBZJUUB57IKAQP6J7ROI42VCMGZDKES
X-Message-ID-Hash: PJBZJUUB57IKAQP6J7ROI42VCMGZDKES
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PJBZJUUB57IKAQP6J7ROI42VCMGZDKES/>
Archived-At: 
 <https://lore.freedesktop.org/20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 20:22:33 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> > On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > 
> > > This series extends the HMM framework to support userfaultfd-backed memory
> > > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> > Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> > spin in mm.git's mm-new branch.
> > 
> > Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> > what base you were using.  Hopefully there's a reason for a v9 so we
> > can retry this.
> > 
> 
> I rebased this series on top of mm-new right before sending it out.
> Should I have used a different branch?

mm-new is good - Sashiko attempts that.  But it's changing rapidly at
this point in the development cycle.

