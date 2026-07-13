Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56645C44508
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 22:45:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD8BA10EB68;
	Mon, 13 Jul 2026 22:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DjnhDYqH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01C2B47103;
	Mon, 13 Jul 2026 22:30:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783981830;
 b=Is5UpRXFExbvHR/TY2yZwgTP+tM0wJHlGAERZeDVhuOubnGrn1uzCmvKtW7Ro7GCvZ3V0
 W9uOD/z5u9xypuL+HFP4uGHt7iW9dVkZYozZpxOK0HKTMUj2+E0xxuYicPWT9PKBi8rkBDV
 vPVPJqJGpsbvr8+cqzTeHpmg2OVz/42jX9XJRwlMJeBroGGyuy04kgWB4/qAl1gtBKcm12M
 sjcSv2wNFJg/YEG0DwYRnYR6TlTnnmWSs3577So06zD15vVKxHszTTcEjXt3EKIK2kzT2YF
 1LUr4dP2Y3fIM6AifHSliTmQF4IFOPu7lK0MEsIqGNmhO543xYrnvyM9ZscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783981830; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=adnYTFi3hoT5aFMOesERJpy3+zRYVUFF+RkxLaSOV5A=;
 b=lv/hWPbWu9T2jbxGH+NoOx7Sh7iMhmrz9L3FDutJhvNXBLcV8vctNwqTAGCvT6LPiwxpG
 plAW0ddNb1hDuODtNzK0mgxQLTcttw/Bnw+mbXwHP7LJdxgKMCmz6lPNcEj8p9P2MSXJaKo
 CF5O8e+GDTCVSSQCbehfkcy1i/zrd2Mbpnp+fFSlsdMFFxHBaeRhuafjRdKOEeoh5OOE0Zx
 Gtfh6ggYN94V2215SHezh6yDg+QgJfmstL7ThL7jn8v0MnVlX99QNsvgydwiB0HS48x/tPP
 XkiHJ3PDYHRYnBEyT/KB77B6u7dM1w1RcmN0IPe8bc9FRZAppDSSpyTP/Enw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F0DCA46DD6
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 22:30:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5CE10EB5C;
	Mon, 13 Jul 2026 22:45:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D40B60120;
	Mon, 13 Jul 2026 22:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21771F000E9;
	Mon, 13 Jul 2026 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783982737;
	bh=adnYTFi3hoT5aFMOesERJpy3+zRYVUFF+RkxLaSOV5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DjnhDYqH05eQ/7HFowjW8Rg67YLnpNK8S5WnhB/Caim8Ni6IKziN7IvqqsTpwVRXT
	 PMtPLLU/mEWJPiMd3fD7JuVerRhg9R6QFlBw+PJJKVNUtuSM691nugGB6JmjFy2ka6
	 croIvxMU+tK89yt+R7GdUBAIMoJ1m8j6C4g4WY/c=
Date: Mon, 13 Jul 2026 15:45:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
In-Reply-To: <alVRU38lMfvmUFqJ@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
	<alG2-RSitzPWClAX@skinsburskii>
	<20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
	<alVRU38lMfvmUFqJ@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ME62PQMLD23KY6KPH3N32Y4YTJW7Z4Q3
X-Message-ID-Hash: ME62PQMLD23KY6KPH3N32Y4YTJW7Z4Q3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ME62PQMLD23KY6KPH3N32Y4YTJW7Z4Q3/>
Archived-At: 
 <https://lore.freedesktop.org/20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 13 Jul 2026 13:57:55 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> > > I rebased this series on top of mm-new right before sending it out.
> > > Should I have used a different branch?
> > 
> > mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> > this point in the development cycle.
> > 
> 
> I’d like to send another revision addressing a few comments and also
> replace the `max/max_t` check with something simpler.
> 
> Which branch should I base it on so that Sashiko can apply it
> successfully?

mainline Linus would be safest.

> Or would it be better to send fixups against `mm-new`?

That should work as well, but it doesn't give us a Sashiko scan of the
whole patchset.
