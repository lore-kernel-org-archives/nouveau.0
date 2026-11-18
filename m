Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51831606A31C
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 19:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=AvcKfCxg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=A9Fjg43S
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 835A110FFE6;
	Wed, 18 Nov 2026 19:50:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B47BA4954E;
	Wed, 18 Nov 2026 19:30:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795030251;
 b=haOQoh9lJqk1+gxWAzMS0D2g8lf51vmb19eWxGjqLbiVwWXiO0IAaiB3/AL9aBHxwjrT8
 qcwayxL2lFTq5Zd6ap1oQaVDBdMrLxoBQLtrVkJNJq2Q5ymRurG6sTvGK6ekr6FC6laAEUw
 rHRr//ehoUroIzfDd0iOXRTRisUGaWg7UDueqdYgNZNN6c0krGcQGSrWy2DUI3wM38TOVMO
 8MsolzTLPc6YmWCkwjnSc/CMoWqpGnw/Ht+H9h3otO9HgURjPQbCMzoFagGKBC+uvKLPZSF
 SXeuQR2FZ4Pw8oQPKfcob1J52+xAtgfNSVa4+uQYDrscWWv0nMRvVNbVJQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795030251; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
 b=PnCX1zIMv1eDYKhLuBT78XaPXvn+JJuNUyPCEK/saVvWyoju11NdoCW14FMqG8nCpnIh8
 5F812TcoRyLfcE3dYM56iqlIhiod6LSXuTQ4+OL8aOf7ECrtPvwRseNrBS9P0HXNdvvtuSX
 3AoAKfJMkfixEZbJr0HZe5RSnFEystzxa9jIGSZ5X09nWfhlSzVoJIYy9GSQJNQFiqVg4SH
 qgn8jVBaZvTaRtppmwfDpMXO2jYX4N91xePbeClqNPAz2GPOuDxluz9cFdkr+pI6Szu+Z2k
 b4DEgeNBRwBEh85sYLB5E6rYgUu9jBJYIbFcNOr3LocPRiDNOEONT4MCrRfQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A18BC494A2
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 19:30:48 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2194910FFDA
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 19:50:33 +0000 (UTC)
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIJYks51424692
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 14:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=r7xQ
	Eq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=; b=AvcKfCxgh2FO1dLQ8zx+
	4vXb/ToMs6lkdoSyUzHR7J5mA8oTJ80Evn6C7DQAcQmCKyyCXCcVPXC1AY2BPV+D
	PrxnrOdal+rGAkWkiyrbM+AqOwlZAQ1nJhZU5MP+bzgPUyn08QXjS82Qla/J+pPH
	iCcg3Jt/KcqKZ5SUTzgJwHBANnntnyE+Pl4ScFWubQmhtGSgKuvD11x55l/MrryD
	qpYkODcKqypwoTWy8gK5UZs7YAS4kt/NOgHbNYfZYGtlH43Z2m+cRpG1dhxCVAtF
	QizC4R1HjcRvzV9dgt1KKEHn2w9dfl+PcmY3Jg7zuQba4dl/aGh85fAhkp4sBQiD
	SA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j1fv69s9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 14:50:31 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5383c05fb2fso34773701cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 11:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795031431; x=1795636231;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
        b=A9Fjg43SNTfMhZ5Hj5c6EjChITqzXkc/AUAAFjZN+2acyoSODqa9LTnNgbWqrkrckO
         oIhKebY/U7aJY5vZ8cKCNiypGAf/392064H78WTNo5fLOrRTZgYaZ51GVnj9EwfrsUTR
         Kn5WBi7rmtSVT9nZK827jrSM1K8vrzWLm+K2X+xSuUOsbwxaG+DRLHmo1taQwnvVp/Fq
         Saw2Q7cpbLVoegprpp3166D3iWSWYUKdIC2b5Tz+1NTKl6v7PiMKc4isnFS1CXfwuiGV
         crIqqCqjDrdz3ALs6tgJa2grh9crq25G6U/XisrrXasBhGIlwzrMU6Y9qFGFpoQBI2lK
         2gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031431; x=1795636231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
        b=ivGI5MNkS4UMXChNYX6i/pxgGLenernKyGeR4za5ULEZPDI7hKhJILW/C+b3fBY+Kt
         PkbWRo1UtvC15x7HQqR/tyDmhJSg/fAdwL4VtwOgPJcUnklF9yBAbVyy5DNXud2UD73c
         z5nrkGzDkQ1kN/kzjzVZN5o/f1NTJyTXIlxpUUgjcI7JAoo1x1B7xeDP8FNn2Y90dFE9
         HUGrL24gGAV1sjGlw9ewN9/ydz90mGnuflFkzOYpD5P5j4uj3vlJoNxEpIPudhR1i3xF
         wykGKg1CaWPbf3j5ocvvvAiliFm8JSPl5Ff6YWqLyTbW9TMkDWiUNW8VBKDyOpnLZXPb
         Fruw==
X-Forwarded-Encrypted: i=1;
 AL+hErFIHAmzDWzzbFrSLHXOwmpn0o6zO0sbfrat0af9vbPW6FH8j+tuwXsbNFlCgo5ZJT3vyVB6uwu4@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9pr/VLwzHY+dWP51H4quD7IYsIJvCGBgTW22Pl6D3NejL6rIDH
	036PIrrIB/w1Rq53UieHTopiBio+niNehooVuO6Q3dwzxXS8nIHqetCD59PcdrQihskdMrls46s
	8g1jAPU8tWfWc7it3lq6LllJk8fKsm1FjMdleetd3Sl8j7Ct3yOYjTNETgwEMELE=
X-Gm-Gg: AYBFou1OLPc/VLy2NdkKU0mM+DelJ9Mv10biDEdKkrdri4tbqWIzxN2qQz3W3kr9P4s
	J819yMsZVit3rpzk4wT6wAc4Wt11Gprw1bOPoEDng7XgbfzC2V+z+wEBPT+CeWkPO7XjrwIDW08
	sR1x6JoM26D4KU/JPQTwLwjwpd3VTGjH3TNl800TQBz2KbE2VtOiN7hHv9spnqVXPb+CuvAOYne
	PoIdFp8HyD1u3HzOn5IEDfCnNNx6Yvk0VPPOjVfWrkeVNtpmpcRFrk0GbNjkktOxqZaJR7mJjBf
	T6/i44n3Sm9g9qZg5y1Qbe0xYPG7gS+94bp4gilj5PoMb/JFelZdAGWhQBXctri508hLQS4IFUZ
	Z26b4UNi3fgIXHFHKVrlz48Dx3fIeZ9u+IF88WMo6ygBHYibcVux4g9mybVgOWKhKQJ18j08L8M
	p80BTvcSCez9qMFpiJh1/kSg==
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id
 d75a77b69052e-55d5a537991mr56617181cf.14.1795031431358;
        Wed, 18 Nov 2026 11:50:31 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id
 d75a77b69052e-55d5a537991mr56616931cf.14.1795031430933;
        Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu.
 [128.59.176.14])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d66c24503sm7189751cf.20.2026.11.18.11.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Message-ID: <9a6599cc-f47a-4a27-ae8e-91c8a1a523b5@columbia.edu>
Date: Wed, 18 Nov 2026 14:50:28 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
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
 <179501525761.13527.5348420494097607881.b4-ty@b4>
 <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De6COftW c=1 sm=1 tr=0 ts=6afe0187 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=b7hxIIQ5yigvctP09d0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: X6Gw8lV4SZZ_BDWXq4pr0kMFm1rWVdBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfX6ySFYDuQ3iOx
 SCbD/RE6xdFIhIxC6qJTAda555QylS36NGRqcWOSYyiF0AVUa961Lp1DcjtwyRwSMLA3xWNa0Oy
 KSxxBKoM2KBRJE9D00QaIuOfj/T6Puq9r+glOXuQGCZWUgel4g36Xf5w1N1BJm5VnRYw5hodOGM
 S3ZsWeakSeXStN0/r8/nozuwkEaJ8681KTQ/FsiKV6Hx2TdcWP3M1V7zy5Df5LA6lnzIlFPjFit
 B++D5JcIvoUgTYyceVMl/O/gKNz8YzDoUt5dMFBqi9jQfeTBTHwXI05MD3sV522VgrnmRUCh2NT
 iPRk5u5fhxq/4zedoGWHDCtgLvJJPP8n+gTgIh3X31xBWFpeK3wnC6IFk3Z9b++UNH3DI0CY2gR
 mWkxyVXxSB0zRCiP4tybAFbH+Gg+3sRPaP+psaUKpmh7wFkxUJFXVItiiX7faswGHzlYaDZm/jC
 YNKHqcPqUyqbDbteYaw==
X-Proofpoint-GUID: X6Gw8lV4SZZ_BDWXq4pr0kMFm1rWVdBv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfX9Fodder8a4tS
 cxWsYwRpSS3hT/BnsNZ8jpF52xDRV0ZN/ufjBDhkejl5oOUBiDjrk4fhk34v2aQM6t6QRf93hh+
 kvsSkOUA14IH3Sy3j+z5e/wPkr0xqgpOloZ7kqSR5v7kzl+2iB7r
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=10 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180076
Message-ID-Hash: TJV3YQG6SF2W2ZTH2ZMHGHJQ5WUZP7U4
X-Message-ID-Hash: TJV3YQG6SF2W2ZTH2ZMHGHJQ5WUZP7U4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TJV3YQG6SF2W2ZTH2ZMHGHJQ5WUZP7U4/>
Archived-At: 
 <https://lore.freedesktop.org/9a6599cc-f47a-4a27-ae8e-91c8a1a523b5@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 10:37 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 16:20, David Hildenbrand wrote:
>> On Tue, 17 Nov 2026 23:28:40 -0500, Tal Zussman wrote:
>>> This is a first batch of userfaultfd fixes, with more to come.
>>>
>>> These were found by a mix of regular old LLM review and by having an LLM
>>> write a TLA+ model of uffd interactions with PTE bits and other state
>>> and seeing what issues fell out.
>>>
>>> Most of these fix places where mm code loses uffd-wp or RWP protection
>>> while moving or migrating an entry. Userspace then either misses writes
>>> and accesses, or gets pages reported that nobody touched.
>>> There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
>>> file through a private mapping.
>>>
>>> [...]
>> 
>> Applied, thanks!
>> 
>> tree: mm/core.git
>> branch: thp-7.5.misc
>> 
>> Applied patches will appear soon in mm-next, followed by linux-next.
>> 
>> Please report any outstanding bugs that were missed during review, so we
>> can either drop the patch series or decide how to fix it up.
>> 
>> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
>> though the patches have already been applied. If possible, patch trailers
>> will be updated.
>> 
>> Note that commit hashes shown below are subject to change due to rebase,
>> trailer updates or similar. Further, this is not a guarantee that the
>> patches will go upstream. If in doubt, please check the listed branch.
>> 
>> [6/9] mm/huge_memory: build the moved huge zero PMD from the destination VMA
>>       https://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git/commit/?id=ec36bf72
> 
> 
> Aaaaaand undone. :)
> 

Thank you David!!

> -- 
> Cheers,
> 
> David
> 

