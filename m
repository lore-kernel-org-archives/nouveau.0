Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F845606A321
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ugOr/v4c
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E247A10F89C;
	Tue, 24 Nov 2026 22:27:20 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D5B27403BA;
	Tue, 24 Nov 2026 22:27:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795559235;
 b=nR29iGOkKaGcWuUXABOwp9r1KBUzdIz4ZySx1uG2wA2qQ02tak+PwDUcvqhRUtMgN281p
 JJpFY5FgnW8Hl59mKluIWTInytXiofKXr9Zi/Z8JUZEFjV1DJN7hb6QIHs6Kh94Q0G8rvyD
 d7Wd6Cfdvh9rSYWWmo3aVWn+vfnOlkeRsfcOK1ILy5jHfVEUbIk/gFHK80VTOiO6mVzOMCq
 6T+jjwjQvbqA5G6pVWvFTaqYW2R6Q5UBDN0JKeciHQlauJRrjBMALjK2WOcPSf/x5HWXsGr
 IVTAIW2/dsw6LIPoQNsBNUc3helWPm6OZGgCm46WW+3xI5blVNsJJMfxM5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795559235; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dtMZbHm3lkM6o/yW+HmQOChZENqEt7jGlIYiYyXmUrc=;
 b=v7TdKdv59q2xeEvIY1OBGxFyhjffOssmKOitk4SGwTk4YvUPIGc8GrYPp9oUrRG59osrR
 +ZE1CQspOS+Zx+3kf44zB84bmXx1EKU5plwhCpMu43R0bh9g041GNGFtTx51BaguPpRVV8v
 dQ9bVYggCy+IkYsc6dnmXZj+T8bFpwaPegCDNd2ZV/B37SwgbEW5hoUfJb+g5IGpPZ0WPrn
 BDdug8Jel+ljKOO5Kgh0Lvaf7eeiZU6LqAF7AlkjgUY//HlTGOBfDxDAulmkXodpIqNpEDQ
 yJHoSMljzegcegaj3fW8EsgCOw7z1hbmcJUe5NpQLfGXoMD1YHxHe+80dfoA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none;
 dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7EE2C402F9
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 22:27:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 60BF310EFED;
	Tue, 24 Nov 2026 22:27:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 910B540E04;
	Tue, 24 Nov 2026 22:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5741F000ED;
	Tue, 24 Nov 2026 22:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795559226;
	bh=dtMZbHm3lkM6o/yW+HmQOChZENqEt7jGlIYiYyXmUrc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ugOr/v4ceQqckoPQJ/g4UCaTyO+koHIT2A4RUIfXBsU1JVNTjLPiYJiVbIG3PBhXs
	 cQ9UXFCWsh7ke9FpqJnH2bUu4Jume8Vz7EZPuKtb9E8g8EMBIGl7EyVWY/I16PMPbn
	 B5BPEJXFGwvq3OGEHbKmuOIcSyHevi31Sq/46n4I=
Date: Tue, 24 Nov 2026 14:27:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tal Zussman <tz2294@columbia.edu>
Subject: Re: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
Message-Id: <20261124142703.8b6e07eabcd510e9b99b03a4@linux-foundation.org>
In-Reply-To: <3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
	<4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
	<3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MCG2EO2GHGFT7VQCA5VCHVMRLUGE2BU5
X-Message-ID-Hash: MCG2EO2GHGFT7VQCA5VCHVMRLUGE2BU5
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: "David Hildenbrand (Arm)" <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
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
 =?UTF-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Breno Leitao <leitao@debian.org>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MCG2EO2GHGFT7VQCA5VCHVMRLUGE2BU5/>
Archived-At: 
 <https://lore.freedesktop.org/20261124142703.8b6e07eabcd510e9b99b03a4@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 14:37:11 -0500 Tal Zussman <tz2294@columbia.edu> wrote:

> 
> 
> On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
> ...
> > 
> > So, I would be picking up ...
> > 
> >> Tal Zussman (9):
> >>       userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
> >>       userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
> >>       fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
> >>       mm/migrate: warn on a writable migration entry with the uffd bit set
> > 
> > This

1

> >>       fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
> >>       mm/huge_memory: build the moved huge zero PMD from the destination VMA
> > 
> > This

2

> >>       mm/mremap: resolve uffd state when the context is dropped, not during the move
> >>       mm/migrate_device: do not migrate a uffd-protected zero page
> > 
> > This

3

> >>       mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan
> > 
> > 
> > After waiting a bit longer for more review. Andrew can take the rest.
> > 
> > 
> 
> @Andrew, could you pick up the rest of these (everything but 4 and 8)?

9-3 != 9-2

np, I grabbed 1,2,3,5,6,7,9 (whatever isn't in other-peoples-trees) and
massaged the cover letter a bit.

