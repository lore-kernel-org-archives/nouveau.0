Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870B606A32C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=iYLVIb4e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2yf8L0WY
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E13010EAB1;
	Tue, 17 Nov 2026 15:33:48 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A9BC494B4;
	Tue, 17 Nov 2026 15:13:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794928436;
 b=efynv1Mz8IHS6kR+dFacCaU4M1ZZel5cLXTb71zYi7JKZp5RL4XX2Ex2I1ccGCJQYxiK1
 bUq0dhrGkWka2mmqN4mfF9ddJiaZCfyzby4o5NZwYSAOXWneNPU0Osk5xRVecNNRHgo4Q/D
 ylLM0CNzK/qjX3dkEouBOIOK6MfnpuG7bX0Oj4VyVxk8Y/qH6u5pzsnPkEqyMxYz2lD+ghP
 RNrHOu7bI93lquzgj02pZpVoTU3VHoVfFlrY76FCb25vXnW9MoOMeeQDTlRx9kA/su+LDv4
 3FXpYYArIbV/52EkRxtjrf6q1O5A7qk9zwBuEGFHrxEHN0GAnBDktMvhjrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794928436; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=shtRRPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=;
 b=z40luO3+M0bBOxo+8Izp2sLg66cuo5ajhXcerOpbIdLEp8IRYPUFHB+lmFPET9egH7Tv+
 uqJt8klBv9ugSJRXSQO0nQ09wkzYmwc80CQNziVMg87UcHZ7mDvUicLTePoq05dXusOGx4J
 Uw+6kzI1zXn7PQOhp05n/3aJvCe+SEfYWq8I6eeLAmAUjf+rdYCpdSoRDOYJJ5hSosf5U7Q
 aRFhWYLTZaRpDHsn2dyPKHN7waONU+rmLBn42Lj2RlV5Ym1bUSgFQYy6CNipVxvjswoJIO3
 gkDE/9f9voOHOfJyKpMYbWdOOeqz0l001kRYxHD8p8gJFhyZndWukKlZ8hYQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=columbia.edu;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=columbia.edu;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DC9C249405
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 22:47:08 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA0A10F4B9
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 23:06:49 +0000 (UTC)
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGLYsOT238447
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 18:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=shtR
	RPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=; b=iYLVIb4eyo24+udnvs3G
	MJgMkShakHkhAOAO9CCgFnM6i8wa3coBagtc8oRa+Lz6Z+MsbX20IDG3LJDy0vFX
	Z0Yjgn48CeEZWOfHZUatppMpD+9lfvTeu1uj/3fqHOBdXDNgGL9YK9AfIpsuUf6b
	JdLsR/VkazINFOI0UV6cZ08cE5if7g0pIqYZr6Tij0qLt8/TfT5VCHu0/nirog4e
	J04gsFT5b3xlACp4HxuRzGUOdy0q0fmWzSUnd1tqycWphXxfpPmPT2mfDAxLoHOg
	MM4XfQsJlIgAnl7FQPviBjf51Fu25cAE/NqerET3PQEQk5MvIcw/7mao9MSb59qZ
	Lw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059dkryn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 18:06:47 -0500 (EST)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91eb7d1472cso78187276d6.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 15:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794870407; x=1795475207;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shtRRPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=;
        b=2yf8L0WYBYN1i5CdFMfs6juxWDHJycWymrDEAm4SHsqdOATgbGuoNrsWZOe1k1klrE
         jO2i0n8DRIIyIXTB/j40eBB4TUpS+a2PYG3IXNIfEWZRicE/Pfu2WcDXFr9Dl4WVIQwl
         hxck0pTnsb1+kCqR/POE3av8ruxAZR4jmWkZ+ajTYe6/MA2BWbIVkRxbbEW3UiLAmHo5
         fMvoDXisG91r8o6O31pqTKOVIWCFPWwz5p+cfgAkAbdizx2/jMbB2ZFiMrr0eknulp0y
         amlSZn5pQrUbz9yxxAsWE+gaWfMZMGli+k/imxoL10+25d7QCl70ymQJBTtGDkNmfEm6
         3zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870407; x=1795475207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shtRRPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=;
        b=dXMpwYzD7svUd/fTcITXZS+RgjYBiNRUMM0GBtC5ddmC8ZWwWZLJB5HNrv6/6yULNr
         CwYvGgavkILcMghAPtMB2LOYjzCPL2xtdGfxAZL4CWMfM3X6U9M+nx9GxaZzYrzyBL4G
         QOj+jAKFdxuwHqDa0neSNY2UmPtMlaPtzqSWjrbOM740N2I+kvrAOPK54129sNtX+Ate
         KF1vWwg8Y5DdtSRyRxiKwUVPSKuk1yas765hGParNOxpIHjSmZknoihrH92WAzKWOpxB
         JgDdAWIhqHaHK3YHVGx2OsSzKiBqToy5WUsSxc3OZSkr/kjmUp1MpJJ3XWSrk3wSGlkw
         u00g==
X-Forwarded-Encrypted: i=1;
 AL+hErGryapMXxrbb9mZpTGC8Nbv+KCcj9MDM5Xwi+70XvUH7aFpB139orvtGhzaOjnHy3+Ot1BpMjdQ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+NBWfflLYwu40dYV+6HD/hVZOt8cjbe6vFJp7Fd+WYfi3tuQkE
	YBZhIMyFg5StSPpfboJ/QEUdDnFlwOTKWGMld50IdjA1OdsEMcEUr01uBDJJ3qDQOWKr0y/u4St
	6bjnwNVVFmVvi82wk8c3BivKXHmDVvliJMCll9/OzUNlp4WDiwlUzpbVIgfeEHJk=
X-Gm-Gg: AZFdTZecI71TkgcybZdp5UUiZWnId3HNHMV3LERvumWryaTRy63vZPBv5Uf8n58rtUW
	M8nJx/yDdR99uz4Cs9xf8Pk1O79jXKvLWzeIRRnRX4rxYZnn+KF4ZlXyWMYUwWlt6ZC+AhzF/Um
	M1LpVxV9ljzRB1YTvn1rdnOvbfXG81XMClapaSOJxl/TNNfOcK6tx4n9lXYOK+Nb9l2HWLGIFEJ
	Unmesv78XrBxQ1Xve9g6B1WbkpfAePuhSwnS9scfHXLEkjgCI4wtPR9COvGsYKK30C6y218Gp96
	PYiCE3dh4ohER9i3Lz8WDsi5rZWmZYXlwaPeMYdKU02LMfRyPifoQLivRHpa5u/W9hOxOAL2iMx
	UjE8i+G5J5W9SJwGpEnafSB6ruwLj5GRmJ8zASVpSmCW9QDyFHQSSIgtyWXC4tcaPnA9AYnryo6
	eu1q1wVFyBdOM7cTjI1SSMO1dn
X-Received: by 2002:a05:6214:486:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-91f241ce6admr203454416d6.27.1794870407337;
        Mon, 16 Nov 2026 15:06:47 -0800 (PST)
X-Received: by 2002:a05:6214:486:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-91f241ce6admr203453936d6.27.1794870406649;
        Mon, 16 Nov 2026 15:06:46 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23d459c6sm97731756d6.14.2026.11.16.15.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:46 -0800 (PST)
Message-ID: <71aa028f-c753-40d5-a8e4-8daef5aea3aa@columbia.edu>
Date: Mon, 16 Nov 2026 18:06:44 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
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
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
 <20261116-uffd-state-fixes-v2-8-4397a0196479@columbia.edu>
 <a384d75c-2134-407a-924f-ee511f65a2d1@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <a384d75c-2134-407a-924f-ee511f65a2d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Gi7_SzXjcT7v7f_vyd5Vvtkhc-b6RX5w
X-Authority-Analysis: v=2.4 cv=Utf2pOwB c=1 sm=1 tr=0 ts=6afb8c88 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=zEWuSTdDNGilpxNPLJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfXyoHC0hxeLmny
 vz11HvZHiec8xWBbWdHnDexS88bxYT+3qcKU4eYJmJUsGyTuBG96Ezi+PQXnA+Ecvt1ZbFpNOfp
 3T6GDtkegc/jsfVZgnfMH8rgAxBRHS9sOYZ1mHzVnBpu5KvTqLGj+EWL0CpBG6ORG2h44qewtiY
 CnX9v9QRHizPtSd2umFSu1o2+a/tr5GOeA1gVL5DYa3p0Le9o2tF0fjxvEAhq743qlCXF+ZQb+X
 +sf0vmOiI371uWVKN2HPXOPsoriWV/fdgeThlILaw/X3SfVQuPerROK75py+j8IbKiEY4imS+ms
 nhtIkw4jYgseOsM5lySrXTODnDU8o8C47vmSw3pzqiUCvQ1QVRqOjbkzRxcnQbT+ollApEJxiBq
 AbK4683oVrlvqIVzNZgFzvUefgHUgI0tk6fGq4ilKiRzG/lwO7hdFGXY/T01y+c5TbeEYMV3fNQ
 R59OHaxQbz/1GUSVmlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfX5R+XIt1MBLNT
 JWcq7n5Am6i3YSR/3+rZ3X86vPo6QgtFfWKEQxMl5X7UoAspAzJkUMBdZuXSR09QX2BqJreGz8R
 kwwxB01FCMp4vbtnf3IggPmnMYXBvFAY//UwYp1nHnhUeqc3EF7j
X-Proofpoint-ORIG-GUID: Gi7_SzXjcT7v7f_vyd5Vvtkhc-b6RX5w
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=10 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=10 suspectscore=0 lowpriorityscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160092
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: DOAZV2IKRURTZ3OBEJX4FNM5YNB3LVOQ
X-Message-ID-Hash: DOAZV2IKRURTZ3OBEJX4FNM5YNB3LVOQ
X-Mailman-Approved-At: Tue, 17 Nov 2026 15:13:54 +0000
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DOAZV2IKRURTZ3OBEJX4FNM5YNB3LVOQ/>
Archived-At: 
 <https://lore.freedesktop.org/71aa028f-c753-40d5-a8e4-8daef5aea3aa@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 3:45 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> Device migration replaces a PTE that maps the zero page with a new PTE
>> that is built only from the VMA flags, so its userfaultfd WP or RWP
>> protection is lost. The same applies to the huge zero PMD. Writes and
>> accesses to the page are then no longer reported to userfaultfd.
>> 
>> To fix it, do not migrate a uffd-protected zero page. Skip it during
>> collection, and check again under the page table lock before inserting,
>> as another thread can protect the page after it was collected.
>> 
>> The alternative would be to carry the uffd state over to the new entry,
>> but a uffd-protected zero page in a range that a driver migrates should
>> be rare.
>> 
>> Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
>> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Leon Romanovsky <leon@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  mm/migrate_device.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 9e19fadfa65c..140b99f72508 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -159,7 +159,16 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>  
>>  		folio = pmd_folio(*pmdp);
>>  		if (is_huge_zero_folio(folio)) {
>> +			/*
>> +			 * Nothing carries the uffd state of the zero page
>> +			 * over, so skip it if its uffd bit is set.
>> +			 */
>> +			bool protected = userfaultfd_protected(walk->vma) &&
>> +					 pmd_uffd(*pmdp);
> 
> Now that I read it 3 times in a row below, these needs a helper.
> 
> userfaultfd_pte_protected() ? userfaultfd_pte?
> 
> That might help you to get rid of the local variable (that should have been
> called something that includes uffd and should have been const)
> 
> 
> Maybe just add a simple helper for the pmd as well and use it below.
> 

Will do. I'll do userfaultfd_pte_protected() and userfaultfd_huge_pmd_protected()
to match the existing wp and rwp helpers.

Re: the local variable, I'll rid of it and just call spin_unlock() in
both branches, which is a little ugly.

> 
> -- 
> Cheers,
> 
> David
> 

