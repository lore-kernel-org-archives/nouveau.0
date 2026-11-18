Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B12606A325
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 04:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=XcKb/MaK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=bt94kWjZ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ABE4810E540;
	Wed, 18 Nov 2026 04:29:25 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 357F6494F0;
	Wed, 18 Nov 2026 04:09:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794974972;
 b=vU6grtEbYGEGIu0LuCeZrxmaFujuocVWUik8epNQRkeSdGwFpiJEA1AaB3rNG1KtngIAf
 T6NNP/KdUIZwUfe8dxAQo8AZOFTWu5d5D5ji9ygmntvNTLqGUBL6Ht1QzJrc0+2wi/kh0nY
 Dqb45rgWgIVN56XlFqh6oLs/oNHHdQBkWyaMoNoxL8XRHd3E5V75UctTHJpa5MNTcAp9caU
 QHldscRs0APJEFLcJz1TsKqOlRxX2JLByR8dkMIFy0vZLQ3CijawJYo2I4ZfdD3MGTyp13d
 ECarDaMCsRpPAkT42q/CovKe1JMeNSJfzY+A7BR7R/faBVI0Oni/rjDcIcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794974972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rqAEWub6b+VNUKauWaWsmC6HlMEYDyZPR4KLlxu12zc=;
 b=T3EhyDva57/IBw9b+4o7YdVb8Qa/z466aJL5pxdItgXzOXANLySpIqWblxI0BK2TK0b2H
 5ErF2WQeequ3r7eB+0avKf8xfzO6XWbDG683kkauO+LiIIG3HkO0+NwgL0XLrqtWe/yNPqt
 4L80+Qk8zn/QsxleJ33wTtKgYr6fJw0NlNyPQHYRT4fFVUufkv9pOHpvesz22Iy7RnRFUru
 TGVeSdFco9mPZMekNj6xyv/WlSSrN5Ztw9kmYTwyISPwKOnMsdf4uoOsVEMvRXkzXRH8Gar
 DqsbGRdP39iUWJhj9mRE+3XUQOSRcMfbrUT6M79WHkeoPO5wAFynZOZm0uMw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=columbia.edu;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=columbia.edu;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 077FC4801A
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 04:09:28 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 084B710E0A6
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 04:29:10 +0000 (UTC)
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AI1XRde2951591
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 23:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=rqAEWub6b+VNUKauWaWsmC6HlM
	EYDyZPR4KLlxu12zc=; b=XcKb/MaK0eyLn/5OAfV8yBM2KRS2M6b5kR5SMr6EFm
	CWnmQAF2vdwVgdMUDq9LQ0B1kytwzgnyCHTWOs93YThc0KuTvsQ7CyIyQ6JAqsTV
	Vo6jACRz1trjeOQMhdWiAi67KSg8HHnKjoHZxfXLgexeC7XX/nXfNR5TghfdcWs9
	82JWEd7BocL6iqzZD8yUP0rTVLepl/bIT6esC2voCKjI4lBaTYN6n5inDvO5NPKj
	On7x8D2GIiZH7BRMNehP59V5pbtScQPMsHQW9s4RMZ2FMmTPuhdw5wwBdi3nvERz
	AUrzScQCknu8WiqXoILhp7DXNRWCD+iuhydQEqmBaQaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu5sfae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 23:29:09 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9493e89d4f9so102997885a.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976149; x=1795580949;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rqAEWub6b+VNUKauWaWsmC6HlMEYDyZPR4KLlxu12zc=;
        b=bt94kWjZxnotzbRyoghWeLkVTY91qUBQ/U2mMoMNxq/BzAwnMCjpqvf3INguSkaIO/
         wqXTikFt97xjHh3xWI/idRSeYzIUgzxzzz4T5azJAm5v20vs0eAVuuyR1oDKvHTQ3IHu
         tdvmWvUBniQqneAW6qPaT+Injh2E9TM2OLu9op3nmPa7pgb0dvErwybVQKzA3EwYQSaB
         iLguOjUeO+AYlR07jX4PJVCBT2jg4EaOO/M5G1AVTTgibCFfxW7pFqtELA5KhxSO/8FQ
         eRgRp+IBdf+XJfFqCj/z+BeOIsy5zGybJKDED82cfAkWdTMp4NQVr3lcKvohHSg1GTvn
         n40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976149; x=1795580949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rqAEWub6b+VNUKauWaWsmC6HlMEYDyZPR4KLlxu12zc=;
        b=oiK4xnFzQa+V57nuY98nuw2BfnBP/gbw52K5R0GB9ADwBZrPYHu4yezRe2QO6t6PfR
         v8boYM2XGJwqGl+DeF8GNgv7mc+EO/R73Jar72PEssSuJHYZcWLurjJrPMl9fKS1Z6Pb
         VbJYvFyP/t6y9XzuOuTic8Kj/QcV136wTnCNgZyXy/nMDaWsqyHJVV20LrCFiHTezg1k
         w5AUVR9N91ilj+iPcdc91ju83t37cJ/ALMxUE1tVsbHVAeGePZVY7q8b0Sj4XSqdKrrs
         8p8H5U2qwYgJFQvCR14LPIt+uRfbhbiD1+YfiMr+eaBnn8ld/HASptWLvXpUZ/D+Yt2a
         DnYA==
X-Forwarded-Encrypted: i=1;
 AL+hErE48qAmEdk9bZSEo7Xx8xpRk1SJx72UTS1SicGGuFiMk0da40JRDHO1a1edQqkHtW5z3kZyqZ6n@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/gmsNmwl1HojKZa+SChURe+/nPYudSGOrlpp5T1bCXj5h+fnmu
	az0F68nLP5CsMZ4n54FCH2zCILL8biqh08a33MADTRxU/P9qrQJRgaO/brQBdA9EZKoPiTScM6B
	pi62uAiHca/BViK7aSxsDDMoMeKoMfC3u1RdRFdOMxs/twZvFLRVDAvuwUbvqQNA=
X-Gm-Gg: AYBFou1U/7vnLo6ZVVgX4MVOhE4YCKuV/zdMAyNJvg+6j47oqqyb8wBYM95jFGGQeK1
	SryxlC8pwL4S6p1bE5Ohk4rxy4cq23mqUdIcpCZjfxr8EqRpLT2rr2USgAPzVo/ku6TL9FdS27I
	+jDhEIlSb90DMUBjlQh3RgEeWxjFvUZnKx4VgkMY+Pj8/rqNRrACOI3gSR7eidvrdDX6tUUZVxo
	6nJ0txCmAcETvZgWPqhjDhH3s2DBE1K+BAA2ImA3wAtiXv3BwwFl6Ckt9b52HbBBLRbCQSkvZis
	G5XvzVUejQ1Bu/ILtSEZhvSvEyKATbZjCpmfhp1YExkAzVGMTT9F7ukSR7/BHOcSHsL3Zgrb+1E
	njgE1B7vZEh72PA8D1MMVYH4wu0zs1xoXnI+KrJYQVEShkcdfhkPfwbBQ4aKcp9C00O3hxH3F9o
	m+XTs=
X-Received: by 2002:a05:620a:462c:b0:949:6655:1dc6 with SMTP id
 af79cd13be357-949995581e2mr304664685a.1.1794976149056;
        Tue, 17 Nov 2026 20:29:09 -0800 (PST)
X-Received: by 2002:a05:620a:462c:b0:949:6655:1dc6 with SMTP id
 af79cd13be357-949995581e2mr304662385a.1.1794976148573;
        Tue, 17 Nov 2026 20:29:08 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu.
 [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:08 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
Date: Tue, 17 Nov 2026 23:28:40 -0500
Message-Id: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgp/WoC/22OQQ7CIBBFr9KwFsNAA8WV9zAuaJlajLamUKJpe
 nehujDq8mX+f39m4nF06MmumMmI0Xk39AnEpiBNZ/oTUmcTE864BGCSTm1rqQ8mIG3dHT21HAC
 Qm9qWFUm124jrIbUOxxf7qT5jE7InJzrnwzA+1s0IOffWA/zqI1BGGVMgrJCVVnLfDJfpWjuzR
 TuRvBD5p+PPi5EnRym0Mgy0LJX+cizL8gQt+SI3CQEAAA==
X-Change-ID: 20261106-uffd-state-fixes-d2111e2abd48
To: Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=5552;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=bXJ7iH6e45hLHohGwDiKQ9KsP+1zcP933ybsR6EgSrU=;
 b=dqh64GH8I96mPK7VNluwWf3s4AmFQRkzSpniRlUIwEYtg3kFz4EHguoBj2QLxVBG1mkCZeBug
 0LRNUk3kmaPDIqzhQnW/BSVWhwsMA7urrdIkuDWhgi5/FPZBC9tkQ3O
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Ir6L47/g c=1 sm=1 tr=0 ts=6afd2995 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=bC-a23v3AAAA:8 a=28s7c6AVXC2H7J1PSfAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: tNPeg7DrZ1Mjoj5hgnBG7U68JeCYZeZm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXytpQeriQSHp8
 YzEbD+B7ed/XkiCK1KAJ4CgrtHC7vagLPZCsKkOTjjIxxDNb2XX2IefAFgnlAptvVgd43thEX3k
 CNnIcCfrJzlQ2d87pcfCCe52pGR0C0Jt1mog8Zk/tlCp1PYCv2Fm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX/B1LiHHbTiS0
 y84MKfGcKz9hImC8NPJPtS2bQXc+rxlm4HNiYXvNFrGb/+qNxLxBB9Pa7iG/WkFGbMVuSxPBw4o
 6ctiqYQ3ac23JbEJmRo7UBh3QhrKX3ppFByI6QAKwbRagqgAnSrbW7Tk5O2v6a5Wn9kWtOmpr/y
 Q52DljkZL2ubGmi1yefTS1FCU7O46HMJco7EOwgZmAfICcfDgJlKwaW079BE2UmtUc49rU+Imv8
 sbfaJbEYRoq2SyKswigd2ILUqHU3TNCtYyHzl3cxq7wFG+DGGKBFlV8pZYKD+UqUa5CV5IiSyL+
 Ivm820QJWlDF0sR+Uqik4BPvIVfZkjnGDVx93XMQVoUKfgeIqst/I+tEf0T4iWFKQLO7kqRUP3g
 hmv6pI75CyljyGTyxHzKe+Wp0/TmSLC5IyxkEWIa+t0BD1XEVPB9Quz/dMD7gm/SyMzNgJPwcrr
 m3EUEnA/fv/FlZAK/IQ==
X-Proofpoint-GUID: tNPeg7DrZ1Mjoj5hgnBG7U68JeCYZeZm
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=10
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=10 bulkscore=10
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017
Message-ID-Hash: KRSU4JPAQHCJRZE277ZX4ANGXFBUBX5B
X-Message-ID-Hash: KRSU4JPAQHCJRZE277ZX4ANGXFBUBX5B
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Tal Zussman <tz2294@columbia.edu>, Breno Leitao <leitao@debian.org>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KRSU4JPAQHCJRZE277ZX4ANGXFBUBX5B/>
Archived-At: 
 <https://lore.freedesktop.org/20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a first batch of userfaultfd fixes, with more to come.

These were found by a mix of regular old LLM review and by having an LLM
write a TLA+ model of uffd interactions with PTE bits and other state
and seeing what issues fell out.

Most of these fix places where mm code loses uffd-wp or RWP protection
while moving or migrating an entry. Userspace then either misses writes
and accesses, or gets pages reported that nobody touched.
There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
file through a private mapping.

Patches 1-2:   UFFDIO_ZEROPAGE and UFFDIO_MOVE fixes, cc stable
Patch 3:       PAGEMAP_SCAN write-protect vs. writable migration
               entries, cc stable
Patch 4:       warn on a writable migration entry with the uffd bit set
Patch 5:       PAGEMAP_SCAN write-protect vs. device-private THPs
Patch 6:       UFFDIO_MOVE of the huge zero page from an RWP source
Patch 7:       mremap() losing uffd state when a move fails halfway
Patch 8:       migrate_vma losing uffd state of a zero page
Patch 9:       hugetlb alignment checks in UFFDIO_REGISTER and
               UFFDIO_UNREGISTER

A few of the fixes change what userspace sees:

 - UFFDIO_ZEROPAGE on a private file mapping no longer fails with
   -EEXIST where the file already has a page, on an mm that cannot use
   the zero page (patch 1)
 - UFFDIO_MOVE returns -EEXIST for any huge destination PMD, not only
   for a present THP (patch 2)
 - UFFDIO_UNREGISTER with a misaligned hugetlb end fails before
   unregistering anything, also if that hugetlb VMA is not registered
   (patch 9)
 - UFFDIO_REGISTER and UFFDIO_UNREGISTER accept a misaligned start that
   lies in a gap before the first hugetlb VMA of the range (patch 9)
 - UFFDIO_REGISTER returns -EINVAL rather than -EPERM for a misaligned
   end in a hugetlb VMA without VM_MAYWRITE (patch 9)

Patch 6 has little user impact on its own. It is included because,
together with patch 7, it allows removing clear_uffd_wp_pmd().

Patch 7 adds spurious write faults on shmem and hugetlb after mremap():
when dropping uffd protection there, change_protection() makes writable
pages that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way and lead to the same
spurious faults. This will be fixed in change_protection() in a separate
series.

Based on mm-new.

---
Changes in v3:
- Collect tags (Thanks David!)
- Patch 1: use vma_is_cow_mapping(), per David
- Patch 4: warn on a writable migration entry with the uffd bit set, and
  make the PMD path match the PTE path, per David.
- Patch 4: Drop the Fixes: tag and the review tags due to changes
- Patch 8: add helpers and read the PMD once with pmdp_get(), per
  David
- Patch 9: move the hugetlb alignment checks into a helper and use it in
  both ioctls, per David
- Link to v2: https://patch.msgid.link/20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu

Changes in v2:
- Collect tags (Thanks Kiryl, Lorenzo, Gregory, Alistair!)
- Patch 2: say "softleaf entry" in the commit message, per Lorenzo
- Patch 3: add softleaf_is_writable() and softleaf_mkreadable() to
  leafops.h and rename the helpers to say softleaf, per Lorenzo
- Patch 3: add Reported-by and Closes for Breno's report, and cc stable
- Patch 4: explain in the commit message how PAGEMAP_SCAN set the uffd
  bit on writable migration entries, per Lorenzo
- Patch 5: use pmd_is_valid_softleaf() rather than open-coding it, per
  Lorenzo
- Patch 7: say "write faults" rather than "minor faults" in the commit
  message, per Kiryl
- Patch 7: trim the commit message, per Lorenzo and Gregory
- Patch 8: trim the commit message, per Gregory
- Patch 8: Cc the GPU driver maintainers and lists, per Gregory and
  Alistair
- Patch 9: use IS_ALIGNED() and a local variable for the VMA's ctx, and
  shorten the comment, per Lorenzo
- Drop the three guard region patches, per Lorenzo
- Link to v1: https://patch.msgid.link/20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu

---
Tal Zussman (9):
      userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
      userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
      fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
      mm/migrate: warn on a writable migration entry with the uffd bit set
      fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
      mm/huge_memory: build the moved huge zero PMD from the destination VMA
      mm/mremap: resolve uffd state when the context is dropped, not during the move
      mm/migrate_device: do not migrate a uffd-protected zero page
      mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan

 fs/proc/task_mmu.c            |  42 ++++++++++++++--
 include/linux/leafops.h       |  51 +++++++++++++++++++
 include/linux/userfaultfd_k.h |  24 +++++++++
 mm/huge_memory.c              |  38 +++-----------
 mm/hugetlb.c                  |  27 +---------
 mm/migrate.c                  |   7 ++-
 mm/migrate_device.c           |  34 ++++++++++---
 mm/mremap.c                   |  46 +----------------
 mm/userfaultfd.c              | 112 ++++++++++++++++--------------------------
 9 files changed, 195 insertions(+), 186 deletions(-)
---
base-commit: 25fee5b1762b8799dd8b72c2f6d666eb01680cc7
change-id: 20261106-uffd-state-fixes-d2111e2abd48

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

