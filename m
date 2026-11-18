Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B060A2619
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhY5kEms
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D6CDD10FDC6;
	Wed, 18 Nov 2026 15:19:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6515049529;
	Wed, 18 Nov 2026 15:00:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795014003;
 b=gW/VC+bVuZUy1/v9XCIE8QIsJmePV1IBx9W0Xv6Yx7HvpXbL6Fsk7p4iNlCd1YhehIA7n
 E8MLdL6oU8jQbJH8k7/+aGbmBEuXW0FZ7aIVevd7ghmVN4Jj9kIu7EWJwCEzUO/CGQmF0zX
 5yGMi1OWxFq/BldTbFbGropc4b+C/9fR9oLR51Ek61zrIQV2ZOUUFQcLZZwJFTA3QCF2jOq
 uCinaQLrUWw66h8O04y+U6MtKMmHh8aG5uhecHArPHGMGFnUYAUfcMl5oEAtk5kdqT6tD3/
 s19SDe+l2/P5dR/RR+hSGyCklvOBZ9aTzbzZBviyt/x0PspPXqTaleOJLhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795014003; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LeU/DxXcV0ry5yYe0LgqD+dUS+pwnrp+dk5INqwKWBw=;
 b=ugzwBqmgoMVLRhBTO6myIdcP2CI6Ld72X4mguYUWzteng5mJgNCKAGyBh1bndu/dW9rjR
 4Jl6bCoD7D/RnKPi1WZPw2QJvon6II9zisyKPnwqMf1dulZ29fIhHVYBX7bKfIpT+jQGD2M
 ueNtPvl2SHbm5r3BPS9lOWa8yIoHFvnlv8ivMxlF3nXM8+lMHM45xS3GFWXhSlx2uCa/GrJ
 BC1prz/Nocm0BHeV8+TJ+UCPINcz3WV2mc/Nrntd9DHw7RNdGJNPQ4j3VXW594XZ/b4XodX
 RnTkjqiy6d1+D7VcByqh3SvsUjO5x6rdwhH2+sH58W4pO1SDoOsWj2X5whIg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AC931494A2
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 15:00:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B841F10FDC2;
	Wed, 18 Nov 2026 15:19:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1489962353;
	Wed, 18 Nov 2026 15:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AF61F000C4;
	Wed, 18 Nov 2026 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015188;
	bh=LeU/DxXcV0ry5yYe0LgqD+dUS+pwnrp+dk5INqwKWBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WhY5kEmsWtbqCPSBFQ2nQaxXboUG96EQPOcrbrxf3sO4BB8Tm19kr7KE+iG4TB6T7
	 PIfvCftf6yhI0z/gSSuVSWelQ+KcojCemjhXmawQHN4M8lm9G59rJWiePg41ZCfjrN
	 PTiXDg0szsr0RvvEzTrfcZRDRdJB+saYvIzHKu+1KiMaphpaZRxL/B8C17nK4lXIND
	 5W5iL5YyG94DwOrXeT6A6n1Sje0lSSyR5xqPs+kpFEYkwTWmDT12f9kXD3kAkufpQI
	 6gnmw6UhyvmYKom5DY7ECNpupaFbP0vtsHy/hz2LwtgAFS8e/x4LMVKaqoN8FbGJ3G
	 dYN3/OHJyRueA==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Andrei Vagin <avagin@gmail.com>, Muhammad Usama Anjum <usama.anjum@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
Subject: Re: (subset) [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
Message-Id: <179501517242.13206.4721668826806594112.b4-ty@b4>
Date: Wed, 18 Nov 2026 16:19:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
Message-ID-Hash: GVYAG3YSKUAEGTHOQ4HSFTYCNSS5EGW4
X-Message-ID-Hash: GVYAG3YSKUAEGTHOQ4HSFTYCNSS5EGW4
X-MailFrom: david@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Breno Leitao <leitao@debian.org>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GVYAG3YSKUAEGTHOQ4HSFTYCNSS5EGW4/>
Archived-At: 
 <https://lore.freedesktop.org/179501517242.13206.4721668826806594112.b4-ty@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 23:28:40 -0500, Tal Zussman wrote:
> This is a first batch of userfaultfd fixes, with more to come.
> 
> These were found by a mix of regular old LLM review and by having an LLM
> write a TLA+ model of uffd interactions with PTE bits and other state
> and seeing what issues fell out.
> 
> Most of these fix places where mm code loses uffd-wp or RWP protection
> while moving or migrating an entry. Userspace then either misses writes
> and accesses, or gets pages reported that nobody touched.
> There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
> file through a private mapping.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: migrate-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[4/9] mm/migrate: warn on a writable migration entry with the uffd bit set
      https://git.kernel.org/mm/core/c/ec53fccd

-- 
Cheers,

David

