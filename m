Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53EEC4450B
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 48C1E10E6E5;
	Tue, 14 Jul 2026 20:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HMqYcdex";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 85B8C47176;
	Tue, 14 Jul 2026 19:58:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784059095;
 b=wo0XqextlzJxG800jjMUuQR8qOh41YE7MRiKO+0OoUO7u5LXeFzRuwuyKIEmOifzEYdvx
 haVnqmFdGfwIK2ZgQDBL/Rw1WdufZP+fh9Pa5+u+sns6wBpCnryHRHoTGc8Xd5AjsrZHdbV
 R/SbjmR+0W3s4Guzc/HA2v2MoSy+W9AOn4oThbq8oOVSSp882QPVWqDS4JhJr3fhNkz8UB2
 fe9fFgb5+6n8MgvJ+72kdxQKGlWhwjv2hswMBUQtxi5G7crdcAX5AISVSvPljtOKrTCIFmW
 uzu2nEVoaNjF5OnYSsxMjhtECsVqMqvN3+9o9mlNM4K3v/RIIPhN7s8oMhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784059095; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
 b=V8FnltLmytxOcmhKgnzOsjAFdQxSJe9o/BsA1YnJpXtiYx2LqVj7Ph+p2k/ZhXV10gGZl
 Ucl9jiTYP9178Hyzc8s6kHvxawVaiqFlQADq5vTi7GMvJ/G2sJkMVMnYZo/Cld3Z8LNUn/O
 FD7vf5uhgbBqmRxT6Auw0n8WVydRnmuK7mQ00OJmTQ1ZftHKWx6i+kJlTTKBDYctED2TAoI
 lh5/naM1na/KTRVp9UjmSadXYL9vXQw2Ap3dDZ/veqSeGj0J+lExbDWh8dy3Jq7dByUaYWE
 tQWPJwHxiHpwO4wXRomfZeJUCWMq8SgbyOPF0jVY+IIYMFznuIukGODp/PQg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C06D147123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:58:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5151510E0CC
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:13:26 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-848d21bbaffso3812762b3a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060006; x=1784664806;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=HMqYcdexkHdArUO1/rP8tshmydvD5MO82gSy8RRSELqnJpTOlrffDzFH6lha54J9wr
         zxDlEMswqMUikE1jn3IrTvTN0DhT60RImyxP7oQQMcliEk6y+zC1Er+X5Xq7BW15W1r1
         abF7TBnzSN6kq+gg3TVdyyx5FFri3vzAdGI3Pq26RTtOq5h5s1w6VGeXt6WFZLonbu57
         pOd66vkHQ3HKbGi8jv25FRaDMgMVVjxOSTePdocisCunpHtDf7yVeuC8lE3DQzhxYARF
         Yp9ufC4AKCYIJByyforpLQlLTPDZ/VBzQWz2Ck1BDsl/KKkeEU248JylORBPcqpodzRs
         PsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060006; x=1784664806;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgA5/ZNNqpom9Ojeo649tW4NqgfWq3ikZU/yXXQBBgI=;
        b=av6r7ty86sf671pmMy+FKTxiIiznUde2tBit/ceynWYTLJyuu1QgJLiFmoiZVrGfbP
         WNxGI7odkdAi2YMKelpWC9Tz5QPMw3RWanQsk17NULq31JOZ0EKw1w1TyryUSXX+BUIe
         Z7m9r4vhcFsCH73VzQ9w2d2yqYn2pGmLQp+xVEGJ/Nyedt/NpiVXpIUV3NhSN0tgOjwi
         jcjpYB3NqnPguDqu0RTiH0u5ki/LUAKKKxawvzd38ohQ1KICMzcLPXEax5W7r8dpgOkR
         QsTtEx+1cXbI14Cxe8YjeBcDdqv8H1uWDng/fV9edZuZfNmmBvWFKgV/4Rt0FsNbk199
         VntA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVsK1QIz9/EMSQhm65RkpgwXx4cJpeR0Tqybf7a5BGIVK/BIS/o88pXkA6zjc6W463gOcecPhI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGqyNgRIi5RITT0uOz0E1ngAtLMWtV4Nbbab98tMFTOpAKfD4i
	21iJ26BRLc/CHMrnQo7RIOQn4QYZZzN/IJsLvEqphcqiaI9Dft0OwUBw
X-Gm-Gg: AfdE7cnv/pAtvF3oWDk80SmHsO5Bqs3GV7SEMUugbV5GAdxQaQrWgb1JJRjSrq3gNcK
	n6Mi/uBMtA7esCx8y4dD/pN/7y9yjkhUe1d+SLAEr936TPkArDPJhezlYjTymQQFRsEL4/dYM3N
	s+Ea1Zx7mY+HB8579wECmJS5UN32Gh8rchWjDIOSCOlRp0lfavzfrmibXWYHlKJ6FfdKtuvmvvf
	2gd+CJ87QMevaT1rmJpZME8Gqxc6vQT4cLsFDHbDaHAJLEAW7QFqxXGSzTMlrHGITjV7co1Z7H3
	kiVVCmgbbzha6Hjd0dnwjGoClsTUvCDSyQqA1H/ifhMJvvtaMXVDxbT/hnUNYe8r/WyugVt7nIz
	iJb/ItPW+MHsE2NcKCEll+FVXRlp5QYgXUK0Gw21emFf8AZfDdykB2vuoCUFmSyMdDgmlMg8UHP
	/1AU/oMHnbk6K5UXUEjPIEmG+nMELemuofKDbUE/3b/ad7KyyegSh/Io3L1+Hgt2UnhSVq7Q==
X-Received: by 2002:a05:6a00:1f14:b0:845:e9e5:cdec with SMTP id
 d2e1a72fcca58-84a559bb7dfmr3412771b3a.62.1784060005776;
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f7dade0sm1998127b3a.46.2026.07.14.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:25 -0700 (PDT)
Subject: [PATCH 0/4] mm/hmm: Clarify notifier retry state and scope HMM
 timeouts
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Date: Tue, 14 Jul 2026 13:13:23 -0700
Message-ID: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y36FCQUF5CQBUAFRRRUKCSQP5SITHOWQ
X-Message-ID-Hash: Y36FCQUF5CQBUAFRRRUKCSQP5SITHOWQ
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y36FCQUF5CQBUAFRRRUKCSQP5SITHOWQ/>
Archived-At: 
 <https://lore.freedesktop.org/178405975214.1082778.5193079941156341151.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This small fixup series applies on top of:

  [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings

The first patch updates the HMM documentation example to make the
mmu_interval_read_retry() state explicit: callers should use the notifier and
notifier_seq stored in the same hmm_range that was passed to
hmm_range_fault_unlocked_timeout().

The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
HMM retry budget. These callers no longer keep an absolute deadline around
their outer driver retry loops or pass a computed remaining time into HMM.

This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
HMM succeeds and the driver later observes an invalidation through
mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
retry budget.

---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
 4 files changed, 23 insertions(+), 45 deletions(-)

