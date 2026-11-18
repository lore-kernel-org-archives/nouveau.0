Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E436606A332
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nkgzzLi3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=lMYCCiqi
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 336C110FDD2;
	Wed, 18 Nov 2026 15:27:13 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD9424953A;
	Wed, 18 Nov 2026 15:07:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795014438;
 b=ijb/lde0IKvH2CocBNviwLTZflde+HV/WEXDpKFqbi6dV1l2pf7r8/CbHhN+Gv9V7vGuV
 J20BReKt8c25Y4r9y+BsFuVyL8vjxYNcG8pWfQCBebaM69XalgKGOnWWQ3ndatjUV5IZQjH
 FSsWbX8b1PKyncKJt28fEFYVlgNi7q0K+SArjYrHdVT0j7nvZ6xnu8QdZSVEjFlx9+RLlEh
 kJvItN2Oynf5TAy0AKCA1OroPmoz5XdXB+WFS0/1LDkD7S4WLK8owDGbW3uPLb0cZS7At8c
 L3YcDTs43QQ9kvccQL8ltK9Bc69ixNUKY6VtXYG+Xzxnw+2kmeOtY7YPyvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795014438; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
 b=nQZZSft/RfmgG0HBX5t4piOqp2g9h9+jI+5FVR79hxLwQQvP5wbBuee9kULR04ft3bBwk
 7DSqFtpsZno85lRxsoDVDKwaNrMWn0uwsLXx7vfGBNWutEAmaT8PTtDPDbdeClH+EzTlUeH
 Klwsg/QIpzKBD3TmMYkO0WQJELxsewZjeILCLb992m9NP+yq8cKtRUeeDyyJrIC/xzS+Iyr
 5fyElKgGMOhQJW9fJ46ZX6Yy/hpgys0VE/P+zWS9DjeNbUq5ZY+5GTCtuAmO2ubVloU5Z0P
 UBXNWeNJHweA61vozT6KYWqHDXkF+EpTCOQAEQc3bHEaWqSQIhgTyFsJaH+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E681494A2
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 15:07:15 +0000 (UTC)
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 737D310FDCE
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 15:26:59 +0000 (UTC)
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIEgU0q128719
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 10:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=y03Y
	2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=; b=nkgzzLi3h9HeG8fKyYEG
	uDh31vyXH1oYKrz4We4FN7MFzIgxKgw5bbl/1yYWvjel0KI9TY0DcA4tf8wyHfUO
	E9S3VBpfvNnGIkq1nWd7rxaJV0Lqs7OrEOCpyx0/oBVIQHwhYGWzDerPT+uUwcIw
	UNDOHrTbQpKsrdIawLbTecxwoOgThMzBSetvGLfhD1Fr+I+bJ8XjXzV/tn3a/mwj
	WnmC1oaXxkPmI1tAL5NMf/NM2XxF0DEM+oYOVbl6k3afNC9MEBBmKm7ao0MfRmEk
	9PYcQAKRmMuhT+Cw6VRw5kLAg34WlAdslNZkvKUYJ/1MhKqj8LIxnHzWfAB0TDWa
	AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu74ck9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 10:26:58 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so242388085a.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795015618; x=1795620418;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
        b=lMYCCiqirjghWlnZuylsCfzpo8ClSZuPZWEcZCkBcn7WrE9DuQ/HMiIm3eEj1BAELa
         KUe3r0ND0hvcTxL5IY42Dt2aRIEsgzVMuZG7dVtVBOdvoMv7jvdWT6VW7lAqSb/yewSl
         buLsLpq7opu0ZXaO4nRjHvMN9gfP8UaZCs/QCuvx1tVWzhrJOVAffxFhASZXDAEeW78k
         K/hkpfDlTPGgo6co6y+duIh8vrXU5M9rMTkVVFvikURr2Xh8dLygINAMYIX+jMNHUCtE
         rP+TCdzKVN4hyPYl8Bq2ua32wf/6vtErXaEGN5txhX79yOxAg40ru9BNizzlIaDeZw/5
         /xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015618; x=1795620418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
        b=AP7UJufVWT/IMocywZb4PiFyKgv+pz8JirSpTI3EvFddT3dkw/Gf2cojahaVhWbpvq
         /d9Zj01DCxx615fSA6cRq88VhPfQlnhGOGxV1SvM8JQHvGExwQOqTy8Ind5IDmJx/2e0
         3rPDHow7TBVVFx+U2J84h7GMOZFohk1S6VSEM+H9rN/gmwCyAM/sgA2FA3MOOPfgBiZT
         f+IrerfyuSdsGKr2zXW7qdjg0UGV4vHdY/c3kQ3vHXZpNqOInA/3AUxe67WGdS2alJ1t
         FnIGX6artFxFMxdQEXBnbfQ0JSDBnVJ281cIXstzCYy80r7RrmsxvGlrCMgG0RAnb3hJ
         NFQA==
X-Forwarded-Encrypted: i=1;
 AL+hErHYhFRYmEPkX/I+QFtXsrGv5fPAPLfntSLWPnRC+mCmhRQrSTsrfVnNKH7/3AomFr4ye1Cu6aHk@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9lcShSv9+ZT82qL9mX5Yf6vxmtMJ11zIOnV/zR/HlDjTIzsh88
	BYjbMQEZ5jmgXb1W0DPAiTIngJq0yBVThpLSmjfh57HreUJCfW6muR0WVJMtU5dc0V8YQDRLp1v
	K0AQFKx83JrSCN6n1c0IUotEvB+yBl0Cv2aKoOJ0wZu6Ht74cwVi6rhu39oS5sd8=
X-Gm-Gg: AYBFou0W7cT8p3Ny4GmCQc5m6c17AKQ/NSta/DEjK/2j3ufRF1OGiENhbKHUKagg5C5
	MMHZHlWeJtlMBfub7LCs+ij2ri3QlqyKdAb8JRc0aUWbGltWvLbKpZdk2LmLMacek71ax1JU+Cm
	ieDXuTTW6B/o1lTs24apQx+RCqba0ohHNMu9juVTzW++k28Z+6cHABj/KmcVwh9mWezcNAZ2oSQ
	xGtqQ6kFfh6+JG7ke0h1aP94NqTtG6mf2HCxHsAQRh8yaZL9gBFWY+ZykZXoKtqooYUMIe2WbK4
	Fwj9U5Pq2qnMuiTFGDQxPWH6515+3d0g6eDd+WH0vZJKnrIERqw0/iSHpS9igNHcG0BFY0AmSBB
	poNeNoDJuKZQkxzp68vZh014JbCil7h40hldYVP7vgXXWGC3u3MXquA/L+nT4yBv++B/J3vZEzx
	DNumj/v1vvZMyYVNLWFpGqUw==
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id
 af79cd13be357-949995f04bamr536129385a.59.1795015617497;
        Wed, 18 Nov 2026 07:26:57 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id
 af79cd13be357-949995f04bamr536117585a.59.1795015616695;
        Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu.
 [128.59.176.14])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9499b72055bsm204599485a.12.2026.11.18.07.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Message-ID: <7d31ba34-8b5f-4eb2-9864-145ea80c3412@columbia.edu>
Date: Wed, 18 Nov 2026 10:26:54 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
 <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfXyy99d1cEhULg
 afWbTURUng6gyDzbc+uSNOh27GDEAj8j0vx6Nd6pr4cTeNW/L7kFzSpVPWe7yc5UpAh84oYZgZl
 mhf91RnGe5Fv6kO3T93syoniV9PWSBX+TMzRbMG1hbSdUVIWMaUZZofqw7nsp2pAPeBvjQ4yVFp
 /10w9o/O+za5T8lpanlI+nSRf1S1PJ3gwsACb6W41QTg+BVZIpwImafhHv2PfvqZ/GbJKzmwl8a
 uR2SRndHfdpHMNHQHQpNQGK9YSRVtGZahqUGs8NlTD1I/y+jeXaShRDtSaawFd1qlNGHNUSoSzD
 KIDqrKzOj+VZ6LeXm+hF1/Rl0w2D5Tu/37Ozxlx3M/XaAajDjSpABiln1/hi7qEZOPIfhgb7oA6
 cdnApLVrsQ4C0IWd8lpqvOpLGiTjG2Y4ajWU72ygTzwYG9sGw7B1cMWUXUDNgco9Ao2Fmq4JJaU
 qFCd2+V9l2dKRVT09eA==
X-Proofpoint-GUID: mo1fh5tDOoA-xM4nu7Ig7RFCOwE2oVpy
X-Authority-Analysis: v=2.4 cv=OPayTiaB c=1 sm=1 tr=0 ts=6afdc3c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX5nBwzyVT3cHG
 cdWznpOM09QmXIb0bIsGAOrU74VC3HZO6XSBFKaLUzViV/pT6MG6p8/cCqYHDctvjp85s711fkY
 aMFvp7TEAakLw89SCSufGH+mZGSau9nZ7w61vNWvoWRAHg66juWu
X-Proofpoint-ORIG-GUID: mo1fh5tDOoA-xM4nu7Ig7RFCOwE2oVpy
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=10 malwarescore=0 bulkscore=10 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180061
Message-ID-Hash: NY2KAH5O566CS3LN2KCG7POVCCDDSMKM
X-Message-ID-Hash: NY2KAH5O566CS3LN2KCG7POVCCDDSMKM
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Breno Leitao <leitao@debian.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NY2KAH5O566CS3LN2KCG7POVCCDDSMKM/>
Archived-At: 
 <https://lore.freedesktop.org/7d31ba34-8b5f-4eb2-9864-145ea80c3412@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 05:28, Tal Zussman wrote:
...

>> Patch 6 has little user impact on its own. It is included because,
>> together with patch 7, it allows removing clear_uffd_wp_pmd().
>> 

...> 
> So, I would be picking up ...
> 
>> Tal Zussman (9):
>>       userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
>>       userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
>>       fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
>>       mm/migrate: warn on a writable migration entry with the uffd bit set
> 
> This
> 
>>       fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
>>       mm/huge_memory: build the moved huge zero PMD from the destination VMA
> 
> This
> 

So my one concern is that (as per above), the mremap patch removes 
clear_uffd_wp_pmd() after the huge_memory patch removes the other user.
Splitting them may break compilation. I would've left clear_uffd_wp_pmd()
alone but then it throws a nice ugly unused code warning :\

>>       mm/mremap: resolve uffd state when the context is dropped, not during the move
>>       mm/migrate_device: do not migrate a uffd-protected zero page
> 
> This
> 
>>       mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan
> 
> 
> After waiting a bit longer for more review. Andrew can take the rest.
> 
> 
> -- 
> Cheers,
> 
> David
> 

