Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB3606A31C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IpXx2n9+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XBHTkLel
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B42BC10EB93;
	Tue, 17 Nov 2026 15:34:03 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 514CC494C5;
	Tue, 17 Nov 2026 15:14:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794928440;
 b=wtMfk4QYAjqAMvfwLnnTIk2PrN8XwjCz1zlkTp26D/X9hZ9roV7BMGnYqAdjIz5dUCA8E
 I7IdyHQDrHXfCISpNj2IQboUfBcz1GwCD8kfKprBWR7+i74p4G0eGppZCH1odChBtIhIvJP
 DZfk/OSSoP24l5mNXy1LENVU1ishcy4wwnURjbW81AAQhpljjizZ/tlJ08ef3YIio3p6eMt
 e7/Yau9dk4MqhqWPWwRX+tzlTB47Y8g03ibZUy0geZPb9tRNDQsc2YMVVFgihdfv7CvOncQ
 Y/bhkW+pEvbTjQMwqyPPjJy4TgW5ZAuCKr+NrAYFF0BJf20IR6dOKu640Tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794928440; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
 b=U0sOdXl7zH5XPO3tB+/TuAjRbVSnV9REPsS71l1Mc/PJ7624U0TVI1awX9z63p63qjL5F
 ElQy7tbsQIrt30JW/jvHv8wnjHJ5bdoLEisQajr6gw/RpVvj2xMAJpJR76UU69zfx5Mihe9
 2wrinnwJWZ1T60XSkCBcEMB8E1zBhctc5nibZdabJiaflU38SPKuATox1fAmg9ZSIGFJ/CL
 jSEaqjUSmJEa6ShY6B72hAHPKLyWFOpzxZ6u9qUDUGPvWFVHDwlykPwGSopTT3r/xTKHHwB
 Oz7FAFwZwV0lzvOitVVDWmUg+yTQK3VUsRXkZ89g/D8n4h+gX/ie9RQ4Xy9g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 281AD49468
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 20:25:38 +0000 (UTC)
X-Greylist: delayed 2453 seconds by postgrey-1.36 at gabe;
 Mon, 16 Nov 2026 20:45:18 UTC
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C39D10E42E
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 20:45:18 +0000 (UTC)
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJXJ5E3631379
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=x1GSlTdxCDOcwaCkl039quhS7j
	O/y0dxq7PSFe5uI1Y=; b=IpXx2n9+RamcocPRGOPd8XPboIKjiztrAkZU6DcuMR
	owrO1L9jYZPfd7Bix1u2o6xBqkvtiLeQSkquPaLF4IvEnS52FWTuHflsrx6FB9/p
	/B9pEuUxFFNQmGfo8VUZUjGlIsXMKi7dBRHWAdp+W2JfP1C5b+6ic5mq0PCMhvqr
	4E+5fohvAFveb7oCnY0baP2Zj2hHvARpdMapPW47/6QRXbCKyU17S9hVOf1jPaKE
	Eb+KHBWE58OnqIkTxmTlfbP/A9yuNf0uG0wB1tQUjv5iZi7SlNyV3zJ6lB6lyAJB
	NDxqTJoECbwU0nuSRrbFAXkldL6eVYJIxY8e7Knd+nDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059at5jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:24 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5364f562140so4012791cf.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859464; x=1795464264;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
        b=XBHTkLelJ1sfyO4qmJMLWfW1uwXZac/Yf9hSH9S4C/ZlUd6GJMbAQVM3TutGVZUw03
         ASGVq7juM8ueh+yBEncOwVjniYY5TXQ40wNKSQ+jzMlNY/qt2VLfg+wZGc7YkEXQCazf
         kX7Ab8txMPsV//uCNgfgZjnIV38YkvlOko/PQrDMAoG9n6FM3sSf3Tv1WCFy4DInNdXv
         kP/PTnR45ebHkQUGHvMLgcR0l3/xbTsYzgyBu+eMJFLEHl/odA7mBPBP6QPQEXMWzeMr
         re49LqkE2cYQzN3uiRZa8S6bz73YSXIAvIE0rSnrCTQlcTzhYkR3ASJlcB72iPyoR9EH
         XvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859464; x=1795464264;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
        b=z5edv9O6Q1DyXQ2Yc0sJu3/biI9wXd2MDWEnqg7FTCj40uWIz6Um4GjFhMhlO5BMYx
         P7Y8ddQTV5yTXw5Oq5vFb0ndBUhcuu9OskECplGtHfw1detqRN4lOcTORP+2GRADN4fv
         A+VYib2QABVEDVsboXGI5Znv5Aj4M/shBoPMES+FVCmv5efk1DCHpXZTqAe13T2il5Ko
         a0M4JxIt7k6VCYqAG0DQSK5yvL5ebSD5T/42MYEO4lMA8QkOglJmLB0xb0AfsjoLWYF6
         BkzPreF0ewcLlngmLfR5irwDIj6C+54eLzJdjWJktn1D9OxAXDStShRIpSgVRc13NqpU
         vBzw==
X-Forwarded-Encrypted: i=1;
 AL+hErFEna+OFcmRH+RsjbYLHSSHsGJeS4eWIZfPX1kGH1xttIfjHwNQRW4BvuC15k639aWOoSr+c3eV@lists.freedesktop.org
X-Gm-Message-State: APuU4Z93aaU75HBNJ5GGIK5KeG2PUSvT931cUSnhi4vB/NwUnjm4skcG
	qTNeP+OyTTeLcsdwDlYOxu+fT0ve19XNzyqcuhPxSODnGFLBe8durWgAMwTGu0Spdt7CaCXvbOU
	B9hn+2o09Rb6vpJrrKPI46TNCUJmbZ/5jAs4zWKCMkC9HMqw1ancat7kORnyjY1QM/xcpO2k=
X-Gm-Gg: AYBFou3U6cuduo9UJnZ0VgLqXr11AiVWGs7+9F9083fV5CrKfgbixQnmlP8YCYUVZgl
	eveVwaWlLtjJnQ8lYEuBYsMFnqEdb0fUycct2oI03hauNq6vUGyuNJi0qJWoaAe6FGVruSU93Eo
	XWKGA2dDMM6ZAmBbwGvrjKqqKmWM+PTRWPk58vXoeUCDKjYdUKILPUlPz/G0+1KyNCe9rjOITY0
	c9XA5jg+urPOxzZ5MP5cv6ylE3TrQ2rrspHk5qBcdUgQPAgUA+vSCPbKJET5/zJNn3ScK3Dm7Rc
	eot5vPpmnrVmUfx8EtEYJiNDQkA6R7gmF+83RZ8q0st8306m6S4vJO5f9ZfvWjycz8GA4RMOI1z
	/1FUOKkZ7Dm9H0sWHSn7KAkHF/5F8iYrn+fqN0rVmuTHpKsM35aLcV1c5lFJK7lpUZpncJ4tgOH
	gvo4PDTe5rf9VjgOrUkJyy
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id
 d75a77b69052e-55d49300e66mr9489281cf.4.1794859463682;
        Mon, 16 Nov 2026 12:04:23 -0800 (PST)
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id
 d75a77b69052e-55d49300e66mr9488661cf.4.1794859463022;
        Mon, 16 Nov 2026 12:04:23 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:22 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/9] userfaultfd: assorted fixes (part 1)
Date: Mon, 16 Nov 2026 15:02:42 -0500
Message-Id: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJh+2oC/2WNzQ6CMBCEX4X07JpuMQU9+R6GQ6GLrFFq+kM0h
 He3oDePX2bmm1kE8kxBnIpZeJo4sBszqF0husGMVwK2mYWSSiNKDanvLYRoIkHPLwpgFSKSMq0
 91CLPnp62IK8uzZdDam/UxdWzNgYO0fn39jnh2vvpEf/1E4IEKSssbanrY6XPnbunR8tmTzaJZ
 lmWD8zFP/bFAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=4488;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Q9vtBat7EPzKier5uhGvIcHrOmBQit4JDniJ4SvUP3U=;
 b=PuIj7+LRsMk4tLVOsesIjArbol6E2+mE6zXf9UwUvZaWh2Se6zEfg4r4N9uXEER+0YOQl25l8
 ZbFg9uq1kztBgkEFbRdYqBvvGW1Tl6vFNKqc30ZQz4B5pydamoG5nJC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 28XS8z04ohof0pK7ONCjEAk44ubxrlZu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX+MNYkjq5frCB
 xAroIQnG6Cc1kzgZfrcYpxNCLMGSE+c/+oYzD43aZ7g0bzrNkHK9CGWuWAPwSOTooO3q6JmBTab
 xxecifJ/l3FBeHICz6MYIxd87xOD4fZ7hLsHPgPRSm8e+wMNo7EX
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6afb61c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=bC-a23v3AAAA:8 a=zAoRp05x23iGVPMylqYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX1ch5OmMZEOzY
 hHPRF1Lrv9g8ek8Fd2F0Ooldz2AIVDE4uENixiLsOOIvuRo9OigTCLTOOGVQ8PJtjnJMdemj5Yc
 Fe8XQMfwpPqMdnJCSiRqn3X6iEuLBAejjGyRw94JXFoBEkXK9Lj+dFUMtemcmf1bp2D5cn7qBcx
 aEXYVxWYs+CIjbMwVxOA3OJOFQ89vVbQGKL5GXh1vFamy6pO6XdqnuQX8Gi+J0XM+VHfze6ah22
 3kuK/YOnPonrVguJqJnLZsVPafvUi1koy16Zf5SUjlQ7q2SY+KfeQh0OJXEkQMBjXLZw9NV4B0g
 PKyG1SATei9Qm7VIbjvn673Oj5SoYhYHX1EDl7CU6QSxx0dtZ9Asc3O+GcVhMn5LTz0yufDuim8
 MxGjTYpPKL39i6Dcq73aiv1Y9vubktz8NPm76oMn0m1Y6rtIfLrW67QOpcoj4G+3CbNYFPux3Tn
 cphGkVJ/UzDpGObFYHw==
X-Proofpoint-GUID: 28XS8z04ohof0pK7ONCjEAk44ubxrlZu
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=10
 phishscore=0 priorityscore=1501 bulkscore=10 lowpriorityscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 34Z7LVITNGZYXKLFM36M5Q6ZNYMW5YE3
X-Message-ID-Hash: 34Z7LVITNGZYXKLFM36M5Q6ZNYMW5YE3
X-Mailman-Approved-At: Tue, 17 Nov 2026 15:13:57 +0000
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/34Z7LVITNGZYXKLFM36M5Q6ZNYMW5YE3/>
Archived-At: 
 <https://lore.freedesktop.org/20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu/>
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
Patches 3-5:   PAGEMAP_SCAN write-protect vs. migration and
               device-private entries, patch 3 cc stable
Patch 6:       UFFDIO_MOVE of the huge zero page from an RWP source
Patch 7:       mremap() losing uffd state when a move fails halfway
Patch 8:       migrate_vma losing uffd state of a zero page
Patch 9:       UFFDIO_UNREGISTER with a misaligned hugetlb end

A few of the fixes change what userspace sees:

 - UFFDIO_ZEROPAGE on a private file mapping no longer fails with
   -EEXIST where the file already has a page, on an mm that cannot use
   the zero page (patch 1)
 - UFFDIO_MOVE returns -EEXIST for any huge destination PMD, not only
   for a present THP (patch 2)
 - UFFDIO_UNREGISTER with a misaligned hugetlb end fails before
   unregistering anything (patch 9)

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
      mm/migrate: keep the uffd bit when restoring a writable migration entry
      fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
      mm/huge_memory: build the moved huge zero PMD from the destination VMA
      mm/mremap: resolve uffd state when the context is dropped, not during the move
      mm/migrate_device: do not migrate a uffd-protected zero page
      mm/userfaultfd: check hugetlb end alignment in UFFDIO_UNREGISTER pre-scan

 fs/proc/task_mmu.c      | 42 +++++++++++++++++++++++++++---
 include/linux/leafops.h | 51 ++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 31 +++-------------------
 mm/hugetlb.c            | 27 +------------------
 mm/migrate.c            |  2 +-
 mm/migrate_device.c     | 23 +++++++++++++++--
 mm/mremap.c             | 46 +--------------------------------
 mm/userfaultfd.c        | 69 ++++++++++++++++++++++++-------------------------
 8 files changed, 150 insertions(+), 141 deletions(-)
---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261106-uffd-state-fixes-d2111e2abd48

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

