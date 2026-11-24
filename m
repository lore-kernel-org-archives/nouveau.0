Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636C606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ArQqb01A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=dDI9CewA
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B01B410F083;
	Tue, 24 Nov 2026 19:37:38 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A3796403AC;
	Tue, 24 Nov 2026 19:37:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795549048;
 b=wOvz8Dc57/+sZhaOvoO3LBtHAGLGQfppT43t5RrBZePPXM/IHKiSzSQEc+cVazPZMr3X6
 Xk+r4evVyHbvruGl8x+KLHJHN1R+Iaylf2gfiZQd0kxla0fMjkI3sjGmjl9oaLZ+fUMHDIh
 0g0TCfFg3tGxDPrQLNSqCqyhwrG0PkX6xl7QdZ93LToEn0HQj3nGcPzrhn9SMuKfGvTSR6I
 x7uc2+ckP6IuNzG5S+ceIBAN5ubwSoEmGi4Lg2yuCHBaHFrP51wesmFCpFVVq5s5rcjDl0n
 2qwl48nHoBmS6KlswF6uiaqJO15J5Cqw2ZK0jJ91WRhKO97YD8CuGAylQM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795549048; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
 b=MO7b/xagG1WTEQ5xrsbkJASVG3Ku4Cl17i7xy6f4n0mYAdPhvtaPyz/ZXbrS8tWQa4Yne
 n4YHxP8cIDfwhj5jnelPBOaUOKU254mREWfd54TD+6zycaH5MF754kMgmqXRUQsh6tvZcB+
 sj9ScHzYzC8Ms4Ov6vyTx3pCucOwuvqvoIJOHGRrfRBuokQajlBBRDIej6hiG7EOSMLVHNG
 9vkROf9QQ0w/l+B3BQMoH5HA7sTrPQssjJFhIgqQt1q1Q/m5yXhri38lxA6qkm2T+v2z2Oc
 ouA2KOUSwOzUOvwgqLvSQDb31Uka7I7hRHOtFulS7SZcosBfyrhWlKjpUpKw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=columbia.edu;
 arc=none;
 dmarc=fail header.from=columbia.edu policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=columbia.edu;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A3A5740218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 19:37:25 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7341E10E270
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 19:37:15 +0000 (UTC)
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOJYISP2923112
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 14:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=OMjg
	nMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=; b=ArQqb01Alvqy+ezQ3O+b
	wFGaLKLkRPslDfTTnR/1n3YHEnzFvpSAXsSLtAema3OMBGvQTr8MjsfnQdizF1DR
	Y35c9K1YbdbrokVp6lJBFIYVrUHqLLS3WYYBtEDDKg/6m1bODWncA+LZwiNP1MH8
	Z3bx2LUxG6sfpmxDdUI+/kyZI7guQlRgIUWOBYQ6reZ57nqjYw3JFREOmJXGhsy0
	5UyyJqrfI8VjX2MlX1xqtk46jQix4pqRNZv16i1aL2PIz3aAJytU8fQlN33iF7Uo
	xruvXaD2EFNKvtzNiOaeLj7AUiUNlwagsbKMIv+l5TRcoparlTssaELubPi31AEG
	DQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j5fa7h01k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 14:37:14 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-536778a8137so87210761cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Nov 2026 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795549034; x=1796153834;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
        b=dDI9CewADpfltMyOctEQPXef6qPnURtuo0OcT6SbxH3+FlE/qJUYzqIk1vx6CB7hPF
         m6heUBxPsiywc1A4mOJnWGJwRRXEqaqBogcevklS8h/hpO3VLwG7q3GE941ZMYkFoo9i
         XahTHRfSjvaBgI6h8sX5v34XHSjDDnj0zvhERWBJ0HHcphspAyPUoVsNvhy9yTd6ETuN
         RM7j+08t2tuHma+g4qDjVAmbDUS1peebrC/jMUMIUPcW8QYTTw2zc8RAMZREcvdTfTd5
         IuyZ8DVXX3Zm6RdVgJIsaAuaftrJbgRWsBdsmotXmbtpQZc14BWHCN7sfRk56hHDtw2E
         w4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549034; x=1796153834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
        b=mdQ/f+kyblJGo9FIoRNXO6NUmAWzPkIZ+w+gWKMA7gV8sWrewbvxufjTYPT/H/NEFO
         RNlpD9FxeA3DcG1wPY1jPr931K1+fgkRvtOb0O3E+Lw78uhh5OwZdkUKf+hOHxEFerqz
         hfSndlcv2R5uAtVMgfuXQxS6GFDNadL5Ni0GKLyWCHPC2e3vWVzaPvhqT9Ai8zh4TD1q
         bMKYKoHSHCiqDdfihjCvsA8/jQq2/bX2AVX6LWgEXKcD2dsa07urz3iHBc2ZVoRBQ2Np
         AU7aasAOGoTEaZTVA8jvbknpUMu7YWVjYzNKg8LgCAmzweY5+cyz1BXJmfl+VYwvDogA
         YDhQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGjHrGt6FvUfEq7H/pAV7rW2uQPkjqRKSBJIzUmMuy+tt8rQ/rzEYMU5t3jNlEgCj8pRrdvtzhE@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Ddtj/Z+8cAO9AEi1NpfXQ0AO4K77HWKtESai6lcIy5m/qR/gn
	GtbxPDmkhMlNLQP5+MYmXjHg86H/P4z75z5XX0v+W8VRNLhDGXh1UY3yFduxofYrTrj5VBVvDPo
	QC712NCkLapUmaGeX+9CmvpVPORodL87kYwcEryUqhu6Cscdro7DszlZHU3GuOsc=
X-Gm-Gg: AZFdTZdPkOGuPJjCHgj6OYuNz++c/HKrycK4yxsCWgl4qRbxyjuTijKTO3d1y4G4rqk
	BXdIjFLJjTrAG+GXSQxItKkwEhgUAhg82fY5S2HZSbVwxOHHk2HLe2vJrs9kjp2MYYbVpPm3Gp1
	4KCejMFhdZSJOhhuXp4uDDw42F0KMxZ00Ict5sRWRy+SrlhaKrAIPhvEhYXJzsWWHIZTpukUqOC
	u3t47Jak+BhwMqUvAHnHiUW1S2ZZ+Ee6jDnZsmG9dzf2ZVAqM+JcCBwA3mHBYCvyfYwTv8b70MS
	CttwDq/pmWbEez1GwT3aCPxaNmeuhXto0b5kZLe6CF+7PD928OkaagO9bLD7t5nOkthtrHqy5Th
	hscTsNo8DqQRLQEPTyTcxjzkckXC4/7pnhBqgZi5HJP+2PuzX5gUL0wsTuJDivFjgDg==
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id
 d75a77b69052e-55d76a5af8dmr288718291cf.49.1795549033813;
        Tue, 24 Nov 2026 11:37:13 -0800 (PST)
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id
 d75a77b69052e-55d76a5af8dmr288717631cf.49.1795549033344;
        Tue, 24 Nov 2026 11:37:13 -0800 (PST)
Received: from [10.206.101.158] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9213515f467sm140631006d6.41.2026.11.24.11.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:37:12 -0800 (PST)
Message-ID: <3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu>
Date: Tue, 24 Nov 2026 14:37:11 -0500
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
X-Proofpoint-GUID: kP7Bx5rIQrk524xe9ryTnY-Gk4UGibG2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX9VVub6UDb7uH
 Isdf5Rv+ThPWmexpNXSyTHbigBFiJtFQpwNraxRpEAV2PgdxEahxEXAbu31tTf0fUqQdTHN21ZW
 KAjqPqawiLHN/sj4Y0kKcBwEN7xq5zWS01S4aeT8Tz0T42E3u7qt
X-Proofpoint-ORIG-GUID: kP7Bx5rIQrk524xe9ryTnY-Gk4UGibG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX9+WP1roP6Dua
 unwqst0UAdxUOM6lv2/WlYfZFZzThb3KSrkjEJq41jihkhU6JAo3YjAbOaMlIpLdWq6tDgZuf6N
 Tgtqg68CX1N6jJUJB2Ihrmy7UOjdpZBskpcXht4Yo47U32HtOwt22ngWS2JPCNh/7WUj8ouqjQH
 x8N95NU+ZQGg8/f81u4R3O2sYqEYgUJouY7Rh/gqvxM0US2+sbmArjPftsdKQieeSe4jwg4hkOB
 0rsn9BTueMUMPDHFlJot3QDXtIVkmCs8W9NXRflAqqG33KKZBEXtbtKey/qL+AwlC48C9Y9lc9r
 raMIbGaeb8BKfoAExmk/pYo1U7hNVeqpwsMHQ0M+HlEBL6hKaKPSr1Cc7PpR1FC3+ku2w0h65ks
 Oh9449R2DcvXtW+wnhplorWYSUNO4Os6jOrvT4idTmIRTn3Pg2iar0qeNyLtH+KDbo1LYk5393N
 0G9Y1ErCE7Yovu2jESg==
X-Authority-Analysis: v=2.4 cv=NdZzRGD4 c=1 sm=1 tr=0 ts=6b05e76a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=10 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240076
Message-ID-Hash: GDT3MDXZXPAKQYV4KOLQJDZOFMD6T4DD
X-Message-ID-Hash: GDT3MDXZXPAKQYV4KOLQJDZOFMD6T4DD
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Breno Leitao <leitao@debian.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GDT3MDXZXPAKQYV4KOLQJDZOFMD6T4DD/>
Archived-At: 
 <https://lore.freedesktop.org/3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu/>
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
...
> 
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

@Andrew, could you pick up the rest of these (everything but 4 and 8)?
I'd like to send the next batch of uffd fixes I have on top of these.

Thanks,
Tal

