Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71566606A32E
	for <nouveau@archiver.kernel.org>; Mon,  2 Nov 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJmWxti1
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB5010EEC8;
	Mon,  2 Nov 2026 14:03:04 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 53BAF48C79;
	Mon,  2 Nov 2026 13:43:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793627025;
 b=q3FJa6xYGcPQlv4ZRngcB35TA7BqMHM7PxgLEl2/ubtZodj7HqMDmARpAC9fzEIE+1seP
 IajhAU3320bdaoH5KZtWyvvrtXBBMvj+LNeWDx8mstN/CTEj+OPwCWFI6HKCoR/QvGyAuKC
 URzIabnUUP4bri7y2mw6p93+5uMpDB+aG6B32Z5tQkYNa71HTvjmXX6FSwxt1V9O80YTwMk
 8SLqZ9NW3g9/vm+6HsYTNb/ca1I5reoH1y+mbrlCeCzs/mRgcIDIKmppY7SjF1vCkVF+Fpg
 xvOJK0+1qaIfao/3ICPVrS9ekel4+VkQjKNiSnoqKqfF1yzeZhH8sARTxJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793627025; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
 b=yLuaqCL2T/sjbgGIks6r8vUVGI8GCuc6Y3NMqixJvObbRmPmsSLkbO1+2xD3P6Zuf12T9
 Qd/6CN2NhSNon6XQSZLDYLxSzltrCg+pkQHSfUdwTlSAsEiKIdiDOoMYbvSC/cSTzD9gLF6
 NQiR/G6F9nEAe5krNK3KYR0SvD4961BfADWVuW5cUh1KdUXIaXCshn02lrQoPr6+l/yj/ci
 atmySIxTwzWFN+FAEagjiTOzqHBSIZiU/RJ1v5Cm46s/ot4kS1219iTnU7hQgQm51OEuLO2
 JIgFiVqhQxAOF6y8/uqzSEmzymGhsNvcQLErNiQ2w1AYwvtgknGKcTYH5mjA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 58DB44347D
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 12:43:36 +0000 (UTC)
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com
 [74.125.227.136])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6CA10EDCE
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 13:02:50 +0000 (UTC)
Received: by mail-pj2-f8.google.com with SMTP id
 d9443c01a7336-2e538951d07so29853255ad.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 02 Nov 2026 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624569; x=1794229369;
 darn=lists.freedesktop.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=EJmWxti1MnTBeFxvoONDSBdVcyErLp2iFNosSyu+bnTO1cn/XvXFqf8tr1CHCfgDk4
         n+hPK4RjwLARLsHIDIMS2dJzVGfmq6ARZZPKrAN06akaOxD3UsfPSc573SovsybzJJpa
         BZr1+7hI/T8XDlXnQ8lXzArNdoNMDlzsG87XsMjAzWgNj3Imy1FdRzwThqcpDW8Evqxb
         DEkdsbfh3Pok3v+6Z9Z1C0dqQBhGVnGDweh2HXZ2rGAsiXqw/KwmL5EOFVq3qUy+IHYM
         S+a6gxfonjtP4oSKdL6VRphY68/rrXbnneRFqsJ460OCwpqvgy8xe7WHP5wUifDltQBl
         GzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624569; x=1794229369;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=md+ydsZsGJdsxVPOW3xAXt9X/MLpHdOF2G9kTg2rV6CKI2oMO5Qym8CCAaWClQbQ6z
         nL39xPagSXw3Gr5Lht6LCTNcuOqntEMKPHXWldzBD9JNrA53sQnLb/e7IXCd8vks9jaG
         3gitQ+CS+Yz2HyJ+f0/gzPVkAACz+qnbeupw1Pux5C3jFrnd7f1M8vR4lL+SOU4I5eQW
         R4xEEJjluLItWZzOPcWM9GEp05ORk3ku7E7G2n6TUXufruh+TzahjVl/3qR0PcavaA/R
         kk9wBrMIceZvg/1jT5rGPlsX8jtwltIYsJcMcJItF5ECEZltJHshCnXNPCAUi9Puglu+
         cEwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzaYVxY8Wp+d7iIIAIkfNi2vlPDXVjpwoWXP17FLvdJBzFzwXLAZOBbHU19mh+Df5cn/hSgiLOk@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9n3fJHsc+0Jy8Jj2Tt5/n1VxuZtpitZJwpCucplC1ZXEjVJkDB
	50jNtyAZEYAuYqQSZ3ysGrNiHd/N7G7Ni/scGaIxkGLEoq+mDefwXb9F
X-Gm-Gg: AYBFou0o01ejil+sVZMp0hHZ3puHama/qQ4IgV12z/6xOcXMXIxoIuz4ZLXrrnURwp9
	14HsiwqvqxctM/TuNkuyA/8+2ktm99Vt9Tx4bYyM5vEy0ka8MQhK6Swj2fpIemhvz+YOioPAYBE
	6ejjhI96RUKYQQkYZRpE7xoAtRbZvsnnalSnXyl+IPESkI07I3EPZ+/kR0HK7/JjeVD+I0o4/FC
	5t95GbbuDSVsZjtMosUQu8krVjyLu9u7L8KDdh4Uq2j+/ozK1AOUdPUDg+ZxEE93Lsyf07Zbp57
	qJGbwUvN8IP0T0YaDoApitYWOh5etJm0m3TMkTYZzLZQxAd152QdCdl9YoggmWtkA6Nm+dVjtcs
	ZFwi+XkwSyC+4DeHafKJDYSf24PNiUVhheNG4ADo11DIWOFSeh6QgyKtqvl6e87QzbVaJcMrpG/
	tU1XELR2f/XAdk3NhJCqVyt82XtoDDixEK8tVwEjcIpefVnKRJ/6jPrMdoJESCsnnnnheJYDBcV
	mAF24OmKnYIeg3F/lkWxEvP7KXOGnhmNKvpsAxfyPkyjsxY1a6twU7waYbZqip9b/sLnyhz7vw7
	7V/7sUpoFs29EqO2HGen5fPRvsuWqVnciy+KbOSIP84T0wGkG6kEmNQWrFQM7MOBwjAwmpE3VCR
	3pBORwZki2Mpf3ywtR8h13kjUUJBaN/2nQKg0JiknfBC99rG2cGJ+pbA=
X-Received: by 2002:a17:902:db01:b0:2e9:8b2f:3561 with SMTP id
 d9443c01a7336-2eb3650034amr96629035ad.54.1793624569079;
        Mon, 02 Nov 2026 05:02:49 -0800 (PST)
Received: from [10.131.7.109] (n106-71-19-159.sun21.vic.optusnet.com.au.
 [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eb3922f5dasm27542985ad.25.2026.11.02.05.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:02:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 02 Nov 2026 23:23:28 +1100
Message-Id: <179362220860.2958105.9509793190720553695.b4-reply@b4>
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
In-Reply-To: <179352350180.2.12918668886938034091.b4-reply@b4>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
 <179352350180.2.12918668886938034091.b4-reply@b4>
X-Mailer: b4 0.16.0
X-MailFrom: jm5905938@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 6KYNSFADBXGECN6HYFCVXM66LVMJU3C2
X-Message-ID-Hash: 6KYNSFADBXGECN6HYFCVXM66LVMJU3C2
X-Mailman-Approved-At: Mon, 02 Nov 2026 13:43:42 +0000
CC: amd-gfx@lists.freedesktop.org, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 dri-devel@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Honglei Huang <honghuan@amd.com>, Jann Horn <jannh@google.com>,
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <nico.pache@linux.dev>,
 nouveau@lists.freedesktop.org, Pedro Falcato <pfalcato@suse.de>,
 Philip Yang <Philip.Yang@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Simona Vetter <simona@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 Sunil Khatri <sunil.khatri@amd.com>, Suren Baghdasaryan <surenb@google.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Zi Yan <ziy@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6KYNSFADBXGECN6HYFCVXM66LVMJU3C2/>
Archived-At: 
 <https://lore.freedesktop.org/179362220860.2958105.9509793190720553695.b4-reply@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

On Sun, 01 Nov 2026 19:58:21 +1100 Aveline Noir wrote:

> Oh, I missed that. I'll try to fix it.

While working on this, I found that the fix reaches well beyond
mm/hmm.c and would likely need rework in several subsystems, so I'd
like to hear your views before going further. v1 shouldn't be applied
as is.

amdkfd holds svms->lock and prange->migrate_mutex across
hmm_range_fault(), and svm_migrate_to_ram() needs both, so it can't
migrate the page for the validating task. Migrating under those locks
can deadlock, since do_swap_page() waits for the device page lock, which
a concurrent CPU fault can hold while waiting for svms->lock. From
reading the code, amdkfd also maps such read-only pages writable today,
as it takes GPU write permission from the VMA rather than from
HMM_PFN_WRITE, so GPU writes after fork() would be visible to the child.
I haven't been able to confirm this on hardware.

One option I tried is an opt-in HMM flag that returns -EDEADLK and the
page address instead of faulting, so amdkfd can drop its locks, fault
the page and validate again. It works with test_hmm, but the amdkfd
side grew to about 550 lines across the GPU fault handler, the restore
worker and svm_range_set_attr(), and is only compile-tested. Read-only
entries also come from NUMA hinting scans and mprotect(), so pages that
aren't shared would be moved out of VRAM too, and Xe and nouveau would
see their pages migrated in the same cases.

Would you prefer an opt-in interface like this, a change to the amdkfd
locking so that migrate_to_ram() can run during validation, or
something else? I can post the amdkfd part as an RFC if that helps.

I also found a few smaller related issues, and I'll send fixes for them
separately.

Thanks,
Aveline Noir
