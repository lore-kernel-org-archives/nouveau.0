Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A998ED6CFA7
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 21:41:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2494010EADA;
	Thu, 22 Jan 2026 21:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nbhvWI6F";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7D463404B5;
	Thu, 22 Jan 2026 21:32:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769117552;
 b=YZvaNLShHKkRG2b6rNF8v7Hzpxmq0wTZP+UikX3JxxWIPBkskYLncQSj30vxMYUTNTPpC
 D94QBMHunI1DjwFS66tktUgbPA9ii+bArMU/24OKIEk0X01/8Tny80c84a+Jgw8iZKx6BPn
 O8B8tCDmtqAWzpMV7WqfZVN/WnmQqEKJ0VpZT2XG6ySTCyc9Tv40xa6HJh+E5Gl/GzzWs4W
 axZlGTmRdGPEu0Pp7SYQh3NI3J53TjU6liMC1trycXEoNY3Y4YZhc0+ttqaKzTIgakglVkp
 gqFDHoBUkAwO5/X08IzsWTwet7JSDLBWzNdGh1LmTfn+FAUDYP8FUaVYKiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769117552; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OpYFVQ+VNJG8H/bYcBfO1oxUpkQ5dAYJneF97kYBjLE=;
 b=u7YaoIBuRms3jNoBM0bNYCyJTQeQjd6sPbAudt3amAcoD1L6P5RdbHOophJ2tXVcIHQkp
 JmoTQ9pFuEPTA7daeKTmWMbevmQ/gkmBAS3TGAzur+t+wnz6ehTZIpUGbAJGY47yxz8HY5s
 AX0lfQ2R18mCPgHURqHvgSsqSN6B0Iu67BJ0kOHl3lAPuj5ieCHO0334ueIWcC2G9D0TuJP
 uP/OLUzFQ7gNEc+XK25CN0Sy/p2Tm6oYmFzOuW+7ivo+uoP9EuO90VzRUbjfisU+JQIlR0e
 wsGU80tX7RxqSP0i+XMvgZOU3T9z033gmR+ixI81s6pw0mR1SeMpWc8Vy/iA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CC7134003B
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 21:32:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCC2E10EACE;
	Thu, 22 Jan 2026 21:41:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD66160018;
	Thu, 22 Jan 2026 21:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482E1C116C6;
	Thu, 22 Jan 2026 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769118076;
	bh=o3gdWNkDSd9Vm/DMgr4/ykIAOvt43+NsJA/Imw15e/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nbhvWI6FsmrV2v6DkoSqN8213V2yIRhOd6eP75LypoUaN54UBoDiDxVp1akq7FG3f
	 CVLIelPV0CkF4x7Juc3HDczRCXMl0AOZY4EUYaiK0pNhQfi7cbwzUhOkV6AnNppJ9U
	 SqiE6hXL+nm2nlnc5o4hmp73evXdLpeOeMX2qi64=
Date: Thu, 22 Jan 2026 13:41:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260122134114.a04ddf4c34a4b926d057032f@linux-foundation.org>
In-Reply-To: <626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
References: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
	<aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
	<4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
	<20260119142019.GG1134360@nvidia.com>
	<96926697-070C-45DE-AD26-559652625859@nvidia.com>
	<20260119203551.GQ1134360@nvidia.com>
	<ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
	<EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
	<20260120135340.GA1134360@nvidia.com>
	<F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
	<aXHPkQfwhMHU/oP6@lstrano-desk.jf.intel.com>
	<9077ab5b-f2c8-4c8d-8441-631e7c2cf384@suse.cz>
	<626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P3I3WJW2KK5EDWJN5Z77LJ6DK4QZJY2K
X-Message-ID-Hash: P3I3WJW2KK5EDWJN5Z77LJ6DK4QZJY2K
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Vlastimil Babka <vbabka@suse.cz>, Matthew Brost <matthew.brost@intel.com>,
 Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Alistair Popple <apopple@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P3I3WJW2KK5EDWJN5Z77LJ6DK4QZJY2K/>
Archived-At: 
 <https://lore.freedesktop.org/20260122134114.a04ddf4c34a4b926d057032f@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 22 Jan 2026 20:10:44 +1100 Balbir Singh <balbirs@nvidia.com> wrote:

> >> - Intel has demonstrated that this works and is still getting blocked.
> >>
> >> - This entire thread is about a fixes patch for large device pages.
> >>   Changing prep_compound_page is completely out of scope for a fixes
> >>   patch, and honestly so is most of the rest of what’s being proposed.
> > 
> > FWIW I'm ok if this lands as a fix patch, and perceived the discussion to be
> > about how refactor things more properly afterwards, going forward.
> > 
> 
> I've said the same thing and I concur, we can use the patch as-is and
> change this to set the relevant identified fields after 6.19

So the plan is to add this patch to 6.19-rc and take another look at
patches [2-5] during next -rc cycle?

I think the plan is to take Matthew's work via the DRM tree?  But if people
want me to patchbunny this fix then please lmk.

I presently have

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Balbir Singh <balbirs@nvidia.com>

If people wish to add to this then please do so.

I'll restore this patch into mm.git's hotfix branch (and hence
linux-next) because testing.
