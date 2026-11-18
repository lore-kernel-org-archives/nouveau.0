Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DF960A2606
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmMB1JqZ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB710FD80;
	Wed, 18 Nov 2026 14:52:35 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E9F9449521;
	Wed, 18 Nov 2026 14:32:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795012360;
 b=x/UInR+xAqLkQ+erMgv3wnlURz5HCMnvsh76yNlRyYIaCbQO4CCzKQn0xLjahMblMwroy
 5PrZzGDhuyT4dug9d/wYXVuCAEzhZW10hNXxNSw3hgL20uRn9cXHudFdI5939co/QMxQEbo
 jygQwmqXBTF/7wLqGZJQgTDpZHGbgasoTBIwH5JhR3h/Mh3CGzL34fRSjOHSC6eH3t1XVmP
 kqhbALBVxa9726+Mrcv7H36JrpdxY1fS9wOVHfhIGrMjts/VQXBLSRfD8/JTRFHW5Vt+S2e
 zMdzT64/cJ88awLjo0/411urlAwcDJRWUTiUONkQVjbHWm7AiX2akIT6yPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795012360; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u4fw6wH7cRG89Xgv9DmNPTYzRhO7v7keamB5liM55x0=;
 b=jqifUDE8Xqe+pKfrnY22Asg51BfKHattIsjnmsMvinEuHjXVDlYk+MDlstsVT2wf8VeB9
 +AUSO9ugMInpcSFlwUMNX1hJO8L5JQ2x4GjSdr9UZOMnZPekKHSz/8D+QEU4rtyLUqOWHhX
 ZnSnJpGfr41i9a2Z+DQ7+k7bPCj+FTcCcmd856V6ZslDI2ge059kJRyvTL7A7Jvw+4S3blx
 DLpLiEsxWAHHPbpUnQvHrjoyiOTspHgfhUKqh2JMko3xx3kjasYTWO25JVyuVwFZ8Fbomyx
 BlJzFM4X2uPmmN47qkeorZ8dv4Cp6bGNqJPt/uMmauK5fFxxqJAuPYW+XQtQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73A06494A2
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 14:32:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7365010FD56;
	Wed, 18 Nov 2026 14:52:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 968F662290;
	Wed, 18 Nov 2026 14:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35461F000C4;
	Wed, 18 Nov 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013546;
	bh=u4fw6wH7cRG89Xgv9DmNPTYzRhO7v7keamB5liM55x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dmMB1JqZH1zCDAONsrZJ5AXpbtBhioXa5f2XoqUI4Tl4ece9yzguQMNNy7LcKcbU/
	 SFXKxhz60iY7aZB/cKWhVkx2kI3mvr9wpdq5vhKxwcGSYKWzyPIkU95mFq6dr4X2C5
	 8tVA+8eO+zY1sJU/8a3biSSof6aItdm5RnJ++Q3LbsjRB+MXCn4VBH0ycBgldRitLK
	 TGKrEbeTSrAOAqVWJtDMKtfqbC7gQt794hyCBK6KLy4pjGdTSqKxfTn6assRS7ijQh
	 IeipmuUfsmYzdar26x9qGw0mPzJfuqLKDdQ7mu2oIcFU5WCAbmwqAccEBhhK5qzqky
	 CIG+yJLR4jpPQ==
Date: Wed, 18 Nov 2026 16:52:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Subject: Re: [PATCH v3 8/9] mm/migrate_device: do not migrate a
 uffd-protected zero page
Message-ID: <av27miMZrEyB5egZ@kernel.org>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
 <20261117-uffd-state-fixes-v3-8-b617009d1a4a@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117-uffd-state-fixes-v3-8-b617009d1a4a@columbia.edu>
Message-ID-Hash: 7KUPWV526TDRHUBSEMBGGSUBEGK5STS3
X-Message-ID-Hash: 7KUPWV526TDRHUBSEMBGGSUBEGK5STS3
X-MailFrom: rppt@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Andrei Vagin <avagin@gmail.com>, Muhammad Usama Anjum <usama.anjum@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7KUPWV526TDRHUBSEMBGGSUBEGK5STS3/>
Archived-At: <https://lore.freedesktop.org/av27miMZrEyB5egZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:28:48PM -0500, Tal Zussman wrote:
> Device migration replaces a PTE that maps the zero page with a new PTE
> that is built only from the VMA flags, so its userfaultfd WP or RWP
> protection is lost. The same applies to the huge zero PMD. Writes and
> accesses to the page are then no longer reported to userfaultfd.
> 
> To fix it, do not migrate a uffd-protected zero page. Skip it during
> collection, and check again under the page table lock before inserting,
> as another thread can protect the page after it was collected.
> 
> The alternative would be to carry the uffd state over to the new entry,
> but a uffd-protected zero page in a range that a driver migrates should
> be rare.
> 
> While at it, read the PMD once with pmdp_get() in
> migrate_vma_collect_huge_pmd().
> 
> Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/userfaultfd_k.h | 24 ++++++++++++++++++++++++
>  mm/migrate_device.c           | 34 ++++++++++++++++++++++++++--------
>  2 files changed, 50 insertions(+), 8 deletions(-)

-- 
Sincerely yours,
Mike.
