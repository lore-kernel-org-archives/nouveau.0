Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E3606A325
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 04:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=W0M1fBkG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=vxeoH+kx
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C052210E593;
	Wed, 18 Nov 2026 04:29:35 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 96FD84801A;
	Wed, 18 Nov 2026 04:09:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794974981;
 b=JDwrA9sGbXudiQsYwbiPZmWGKG9bMcQm4iuJ1VxJTYFzAQxNKlWzZ6UqwBuGATKAIl/yJ
 FC+krjrj1tToC1W0dYp6QHjmSmHGJgScczAv+BTJiWivqJ8mSArQFBdqA+c2qWNieh0hazt
 OidG3Hqkeqrz0AJjXciZWT75rTJrQWX6BWfSlPUpHENY8C53rSEralouYKzT54iNF4vO0dz
 oPiH8kJv+b6ee2jGX1Q5p+W5ya7QQZtjRNRuCjL8psbO0PrePcv22hzJA4jXmGfeaX0tOSR
 Qu3apstKa6bolwb2D1rk8qMKCw3dPgfJLRVX4RfnT94BGoD1qESCiVB+y/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794974981; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
 b=Ixn9xU20bgl8IVODhf+0kYKTd00yyO8IWKMbRR2cMVByjXiyVzj4Mm9bGdtG2ggWQ0rr/
 +zDJjA/sJMYyYhrxWdEqWnPCYSK7vG5fNH/A4m54u/slaNodwHpTMTYbtuTwa0BGwt3kOxI
 AJC/ha1iqGLcv067NCyMTASVTFWCkmQLfGx/oBog7CCN9+hCVavGdf+gltczO1NptPIYrPo
 GfUOz+aMHMWd3H3A+zwRPYdMOb2uX7GYrIYp5OhyCsQLl+acBSfjPOIdYywj3OHl7LUnGSt
 /SqhMW6tmASb8Z3S3l4p/2mdN04NhUhPiQNO447DaFovoEXMwzIhqXJGwZKg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 07F674801A
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 04:09:39 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD8210E155
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 04:29:22 +0000 (UTC)
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AI1XbDa3627329
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 23:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=oNP9
	a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=; b=W0M1fBkGR74M9DrJBxNr
	Sy35Rs/B5YmTpzC+TrBM7+r6DY5gyJ7+eaqRnl+tm7543UEpFfUWSpIg4M8KQoXs
	WHOvGW/GBRG6FqJbriLuUUbINLHSwlNj+D/i2tfYh8ZXxHlLFIYloWEk1f1bLd0a
	3sbrZWmN3lwWupdLp6+FOl4iGD90mujCP23YEsk71gxz828lxX3044MrZ14bhkzr
	HpcKOyeUxEkP95yVz4+/TikS4sprev/fsSKvY9f5cZ1eI1U9GPWhay2176YStBXA
	NLf61FGInRcqnbvaesSIvLfD8l+R9I5QC4AZOrRFIq7MzmIQWrXXf8vwNBtbUrN2
	Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu79gem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 23:29:20 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e92aad34aso116459085a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 20:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976160; x=1795580960;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
        b=vxeoH+kx1tW8kfQUzcwv7EvMbL7qh2Jss3qsmnJPIT8IQ/9SpYH3cxnZlz4YwGGPf2
         c2Tx7LlCHfz3dsMBBravujeXUqaLppG0K9Ey47OtlQSo15HEuI6HuMWCPO7OZb4aMGnb
         Y8fmQW/K9E4qVCkKHPnTEKPDZI1hvSkpCsLM0gwz7mnxnL8Aqml0y77H4kxYTXBBtnRL
         YozF5VCRylnaJNi+aABXa/GIBjJzr7Xy6Iyd63TXuWN9sO4OZl2PebLUgIpJRwjJBQox
         hwHwz4wNIkYzCRbDjQC/H9oYH1zH3FrR88mfl2t04SUbx3FNG3Lve6wutQK2tEoi8tUG
         jqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976160; x=1795580960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
        b=I2Vh334+i+A06+bj7bdgNdl9rdVbaKWRws9wLxEC/hAA0oRW7jbtu3dl6H7SY5hCsF
         OyiMKnfYIRWQ/d9/n5BDfjNZ2rPyTupnANEgUIM0m/boJQl0pDR7SHyQ2F9wgA9P7t4P
         /YNdqSS0gaB9BAn1kxV4dIzAFJ64oXFITAtTzi1SmegLHHEmJBJkKtV1hj0HRpAZJIrB
         sChbAc67D5eNuWa89FH5klA+M/ANnrbSmeFEQbfSJTqob8VxUElVDlKKiMG+SpDu/F8q
         lQFWlBqPFa4HXWKH3eXbJXmjQsyB48jcHQYcRNf030EZdcPHD5AmOZ9/qCp2VFiCFM1h
         OQIg==
X-Forwarded-Encrypted: i=1;
 AL+hErEJI0LJ53KFzTZUFNJGICApxKToXirx+jzO0Z/jiFC4Nn52cDnmsBx5QjdxDBrJ3Owh6Sib2jwZ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+NrjtVWMk+DnffBn70/BdOnNugQvm1U6Sua0lp9dgm1QvDDQaF
	1hRBI5BlwOfqDwfuRzISaZxz5UBaabGJ86hFBVRjcYzgEwFFSVB3M4nmuRhsb24UFVDFwxCMxj7
	nsCWrEf4rvmJVy3qc+u2glMBWpv3k9SoCys1p0hwQCaOwW8ZBvLbPJsTnaDmK6cM=
X-Gm-Gg: AYBFou3vD2RYIQFBIIXI8kGRtzk5PIZl9tBn3xsfE4oR+P0N+w5rqdxOlzWMpxTs8rj
	DX667Pa8K/RSTjOaHII+YNa7PXvO6FouFI38yfzyfraa1B8EyR4tFekBA8YWwIDjf8wr7i3VYGg
	4dXb/wk9At1WckGjNfpQdPnDCVWZq7ieMkj+SMtl9MNS43mwtOfF37FpXs4wKynLP/RiaaC5Fmg
	mS6M6fJdyz+k54k21eTEqJ36PnapyOUZhJ1STJwF2vh1EG8xgTYYuCiVprvE99X2qXbxEPIM1oU
	6mjGfMtrVDTqk1cdOzkUJCXRxb13ajBUFbrIlKHbFJ6EZzvDp5zYu5n44SoCRR5o7uUt9HPqJCQ
	ECdpwsOWaJKKjhFPvpByCRgCuPw4Rc+L+aAkkd2Menf9rgbV8AFWWXvLfMS0gqwUirGqUpnjVSs
	qsv1ZEO5YaO7FRRfQfBw==
X-Received: by 2002:a05:620a:6c8a:b0:93f:1f22:96a4 with SMTP id
 af79cd13be357-94999574eacmr293092285a.29.1794976160336;
        Tue, 17 Nov 2026 20:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:6c8a:b0:93f:1f22:96a4 with SMTP id
 af79cd13be357-94999574eacmr293089285a.29.1794976159730;
        Tue, 17 Nov 2026 20:29:19 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu.
 [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:19 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:48 -0500
Subject: [PATCH v3 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-uffd-state-fixes-v3-8-b617009d1a4a@columbia.edu>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
In-Reply-To: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=5760;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yLBeSaScpfcnWP3GTIZB32bGuoptmvLUEbtIcAlGdHM=;
 b=My0spsbuiHMwD39tEUzhalSGpyI1KepnMNGVOGi0pW44BxpyK1b2D+HcpBD6q4XsiHcZ7YUx1
 8Nb13C9ol+0DOkyotphEWf/Xp7KcNWOmkctH3ozT4GAn41fre1wcM22
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=LvgHWXdc c=1 sm=1 tr=0 ts=6afd29a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=cMyuK6MtPHKtACrh3PYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fBpnT75pJ4LjDztRioIietBi-GX2nGQE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX4l7QjXpL5SOW
 DmvgyE/iu/DlnAzBuGygMqsGUW1962P5qJ+UcmTM6oVgeQgzrdVVCs9jiHXa3J5SL7B2ynSx+++
 sHNBMGB5IwCJyuYzvyw4UYCyFYxVt6mci9vMUpyq+t1jXLi7ZeIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX7BK118aFjQP8
 yrQfqXmLixp65dpht+IEcFz4uT0NzBz+quMWIQrCjrcyJ82W6u4sHMuAnaWz+u6lZLW8aNriw1K
 0e6Mi9SAAmN8aeSq5AuDbGyBlyAbjGeYkHfEzhZ2Gw6cOjt4MvSzgCQdM8FV+TZupI3fL64Xdqu
 smMSS0Zh7GiKi+B6eFZRtewZqq3uf8beUEx688IiUZ8tp7E3OgdReP0r36OrZq+Pm9/PurO4hxe
 LXriY8/BgCHJFWzMKhnh3DmfCug3QUSlzRa24rtmOKkkQSwQOaOhP1p3pU3rm63ufxvSmghVYBn
 4h/YksdyKKtuPLkDzFL8ydXPXRAYSiGnUAn0MV6eRGqoDAa37pAjwwtiudQo90GlKnAocOVeTB7
 Rzkj/F7ja2/4ord4Wsc5mFUpPQid8zNsy6WsIcVYhAhjDk41yUdRw1goQ9vl6kc2AWPCvX/9Jjt
 rIz2yGVot6fjk83Y6Sg==
X-Proofpoint-GUID: fBpnT75pJ4LjDztRioIietBi-GX2nGQE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 malwarescore=0 phishscore=0 lowpriorityscore=10
 priorityscore=1501 adultscore=0 bulkscore=10 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017
Message-ID-Hash: ZYLLXYSLX2PAP5MTOZSIDDQLFXEHKUVI
X-Message-ID-Hash: ZYLLXYSLX2PAP5MTOZSIDDQLFXEHKUVI
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Tal Zussman <tz2294@columbia.edu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZYLLXYSLX2PAP5MTOZSIDDQLFXEHKUVI/>
Archived-At: 
 <https://lore.freedesktop.org/20261117-uffd-state-fixes-v3-8-b617009d1a4a@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device migration replaces a PTE that maps the zero page with a new PTE
that is built only from the VMA flags, so its userfaultfd WP or RWP
protection is lost. The same applies to the huge zero PMD. Writes and
accesses to the page are then no longer reported to userfaultfd.

To fix it, do not migrate a uffd-protected zero page. Skip it during
collection, and check again under the page table lock before inserting,
as another thread can protect the page after it was collected.

The alternative would be to carry the uffd state over to the new entry,
but a uffd-protected zero page in a range that a driver migrates should
be rare.

While at it, read the PMD once with pmdp_get() in
migrate_vma_collect_huge_pmd().

Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/userfaultfd_k.h | 24 ++++++++++++++++++++++++
 mm/migrate_device.c           | 34 ++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 5768a3902c7c..54850cdabf5e 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -246,6 +246,18 @@ static inline bool userfaultfd_huge_pmd_rwp(struct vm_area_struct *vma,
 	return userfaultfd_rwp(vma) && pmd_uffd(pmd);
 }
 
+static inline bool userfaultfd_pte_protected(struct vm_area_struct *vma,
+					     pte_t pte)
+{
+	return userfaultfd_protected(vma) && pte_uffd(pte);
+}
+
+static inline bool userfaultfd_huge_pmd_protected(struct vm_area_struct *vma,
+						  pmd_t pmd)
+{
+	return userfaultfd_protected(vma) && pmd_uffd(pmd);
+}
+
 static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 {
 	return vma_test_any_mask(vma, __VMA_UFFD_FLAGS);
@@ -390,6 +402,18 @@ static inline bool userfaultfd_huge_pmd_rwp(struct vm_area_struct *vma,
 	return false;
 }
 
+static inline bool userfaultfd_pte_protected(struct vm_area_struct *vma,
+					     pte_t pte)
+{
+	return false;
+}
+
+static inline bool userfaultfd_huge_pmd_protected(struct vm_area_struct *vma,
+						  pmd_t pmd)
+{
+	return false;
+}
+
 static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 {
 	return false;
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9e19fadfa65c..60985e9bec8b 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -142,30 +142,38 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
 	spinlock_t *ptl;
+	pmd_t pmd;
 	int ret;
 	unsigned long write = 0;
 
 	ptl = pmd_lock(mm, pmdp);
-	if (pmd_none(*pmdp)) {
+	pmd = pmdp_get(pmdp);
+	if (pmd_none(pmd)) {
 		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
 	}
 
-	if (pmd_trans_huge(*pmdp)) {
+	if (pmd_trans_huge(pmd)) {
 		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
 			return migrate_vma_collect_skip(start, end, walk);
 		}
 
-		folio = pmd_folio(*pmdp);
+		folio = pmd_folio(pmd);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
+			/*
+			 * Nothing carries the uffd state of the zero page
+			 * over, so skip it if its uffd bit is set.
+			 */
+			if (userfaultfd_huge_pmd_protected(walk->vma, pmd))
+				return migrate_vma_collect_skip(start, end, walk);
 			return migrate_vma_collect_hole(start, end, -1, walk);
 		}
-		if (pmd_write(*pmdp))
+		if (pmd_write(pmd))
 			write = MIGRATE_PFN_WRITE;
-	} else if (!pmd_present(*pmdp)) {
-		const softleaf_t entry = softleaf_from_pmd(*pmdp);
+	} else if (!pmd_present(pmd)) {
+		const softleaf_t entry = softleaf_from_pmd(pmd);
 
 		if (!softleaf_is_device_private(entry) ||
 		    !(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE)) {
@@ -337,6 +345,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn) &&
 			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
+				/* See migrate_vma_collect_huge_pmd(). */
+				if (userfaultfd_pte_protected(vma, pte))
+					goto next;
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
@@ -871,10 +882,14 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	if (userfaultfd_missing(vma))
 		goto unlock_abort;
 
-	if (is_huge_zero_pmd(*pmdp))
+	if (is_huge_zero_pmd(*pmdp)) {
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_huge_pmd_protected(vma, *pmdp))
+			goto unlock_abort;
 		flush = true;
-	else if (!pmd_none(*pmdp))
+	} else if (!pmd_none(*pmdp)) {
 		goto unlock_abort;
+	}
 
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
@@ -1074,6 +1089,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (!is_zero_pfn(pfn))
 			goto unlock_abort;
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_pte_protected(vma, orig_pte))
+			goto unlock_abort;
 		flush = true;
 	} else if (!pte_none(orig_pte))
 		goto unlock_abort;

-- 
2.39.5

