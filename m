Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED45C44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 16:04:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7957610EC63;
	Wed, 15 Jul 2026 16:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DJzFvsXq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EBAE646EC5;
	Wed, 15 Jul 2026 15:48:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784130525;
 b=s5iyNnpAQvTqtCoU9tsm3lndKJSV1EpDR89/GOjFmsf6DI86RHVZYfYKAGViH1OgENzsy
 sj/0gEHJkGE6wLlCc0ueUEidbnJ3cxevZHZPEHYF++jfcmfauTW6fD7lD97y4spzBPszo+V
 JqJj7VSchG8MsSKkYkh7Gk7zSdg53QONZRHChL5ay1NFIv8ZmZ9TDSJrTMzKsi+N1V/oU5s
 T7heHzhiKyGuSoknzyyV9Xvs31jacO7QHJkLN6Hywadl9kXEoc17/luVOxNNCXYrBQtSHjD
 W0u399vyE1V37QSiufIUHN4Jfy99zO2cF0nYDDkUsvoziJQ3dKcE7fZ9MNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784130525; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=md/jEk0jwM/1EpvL4aXiOB03sTXekaC75/GjnFjny7s=;
 b=kvuSF17eH6JOe9F1FwtzCBr1dH+L6K8b3sxtbaizGnbuGg2xdVz36AMdstM3j27BU2LCy
 5tBJ+WQj+iQ3d7cZ7sn5eeE/u/gZwQr4aEjTGbqr9O9+9mhJ2WUtp/wCt9GQaQxAvB0dDeg
 jNb/V/6647ld4tnXqf9OXDJBMQsT9XoOXW9W+d+UvsIVGc2y8/LuF+BZOTE9FnuoF/CXXxn
 o40yX9CWUDPeUH4c364sbF58/vuyDWM392QgKREsOFR+tCk4mtKTaWNF5MzUk5D32MN2IUI
 spYt5y4bcHhF8SHPgQ1oD/2jbXsQbYITFnhCzIOFQpejRfwL1Kn9gkSf+tLA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 59FFC46CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 15:48:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD46910EB4F;
	Wed, 15 Jul 2026 16:03:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E22156001D;
	Wed, 15 Jul 2026 16:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C614E1F000E9;
	Wed, 15 Jul 2026 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784131437;
	bh=md/jEk0jwM/1EpvL4aXiOB03sTXekaC75/GjnFjny7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DJzFvsXqDbNcfu5SjVj50xj+C83jpeSUODs9GeJaJ6gN6jvCtPFRttyMbHY4U+Li+
	 XdaKxNow5RNCa9sobV54MKYxfWym3ZKF+pVy5bCA1nPBwMWoN0+8ffR2s65W6xICWb
	 dp3cxeJv/n8gDCn6/lgnfESgr+OkJoBnSotjDJZzt2hTNu9ShV49YS98ZJlKxu2IBp
	 9104JoS/X0nPf4K7pd161nDup10h5wtw4W+BR6/zykBWFLSM4qUPdl266itlS5fw1R
	 kvJ1hxkiTXfaRNtFHQvYfUm8jrb94jP3iV7ELRPHU4cfCVd6mVtStHTJ1ArR5GuQuK
	 bsCtqAfKsCYPw==
Date: Wed, 15 Jul 2026 17:03:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alevUbqdUmNkOef_@lucifer>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <20260715150210.GA3846105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715150210.GA3846105@ziepe.ca>
Message-ID-Hash: BVMLABZC5SY66X6ETXE5MOS252TZOGLI
X-Message-ID-Hash: BVMLABZC5SY66X6ETXE5MOS252TZOGLI
X-MailFrom: ljs@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Stanislav Kinsburskii <skinsburskii@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, akhilesh@ee.iitb.ac.in,
 akpm@linux-foundation.org, corbet@lwn.net, dakr@kernel.org, kees@kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BVMLABZC5SY66X6ETXE5MOS252TZOGLI/>
Archived-At: <https://lore.freedesktop.org/alevUbqdUmNkOef_@lucifer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 15, 2026 at 12:02:10PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:
>
> > > > Stanislav Kinsburskii (4):
> > > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> > >
> > > Why a fixup series instead of properly resending the full thing?
> > >
> >
> > The goal was to get a Sashiko review, and v8 has already been applied to
> > both `mm-new` and `linux-next`.
>
> I think if you send the whole thing with a base-commit tag that
> specifies a real base commit in linux-next sashiko should work
>
> Jason

Oh so just use b4 then :)
