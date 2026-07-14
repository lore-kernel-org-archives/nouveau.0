Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C14C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0264010EE6B;
	Tue, 14 Jul 2026 22:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZNRhfez";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B11D471C8;
	Tue, 14 Jul 2026 22:06:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784066780;
 b=is0wmCsI3vvGDNzZtODWBDLxXZE/3koAKK3PVF6yLegKSS/iO5nmzOfs63cH8+tWvWhGj
 RjaP46n3MAErfIy8hIOJLg2EzIeUBSH1RIlbl20XHGPpkMUyzunjHq4ZL5daux4YbIjAxtG
 YyTqWffk7kwoT2vyGIvs+zZglehF1CjwACVWjEvRBoknBpO8pW204kzH9sUXiIHOmpj/AfI
 3fYhahOyS5co4tyjogGBX/EMDg5N6DRJRlPH2/dPXyAhPWfi6OflBwk8BG2cyCBg3vKcOLr
 AcOOrWjpIinoPeWvgJsaUuxRJhEvEBUP858/PNMr163y58q/C5a8wt8bkwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784066780; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
 b=FjWwYOvtQ19mO5c8/dsBmbVzE5JmczZCQX6q3Qskfgvmsptac2WPh5E1dahJvPZNN/Xh3
 zu+gnsTEpjhzix0DdZbnJmeq1hdnfO+XjYbrRcrzMNPNrKFwIktW5GbopM5iBEv4jsblx/n
 g4kUdWHCcrTrBcODuBC9gbDiFaSNCiRoNJYnaTOZQbHP96WmLDCWdmCZDwuujFoaYu2vvmq
 LUGqI0i4m7aVS7WjWomz6N0Bwhz5kKLlC1slo17kB0AqrAke2qXO9hzgTEAbj6u7FaVuFBH
 zDGWAioVyVAmm5gFYg2URnSdmHMdaJBxiCkN/9EEtyG75YS5SLT0z/8UM/RQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6DD6447123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:06:17 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 307D810E0DF
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so1415530a91.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067691; x=1784672491;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=WZNRhfezjIs7dGxGhDzDMMQt0opXCLE1Q3/l9D9SXmcJqONaKuorTUZv+DYgToVMxa
         MxbAsds3Bs5+MLUi5J1Ef02WFEkZmA3UBXhGOoOCbce++8TrC3fHqhia0iXblJMwUd24
         L7DHrn1m/VUVQQAqhrcGl2N/4zTzIHyO7KbGD/0dDK+3+oZHAOpVq6kq0ndTzcWOyP6w
         pgBBUGY/rvp+3E9tSsx40N4Y8Wqqa1ZzjpNBcEt/VpOxCSFSYVHhJDL+gv1x5dI7pdZG
         FfsG8fc7V3cV5jyUVLWBQseh9aKCfwYTD7C8UvL7qfsPIoiil9HwPY1+U1hPj4HcGFx5
         86GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067691; x=1784672491;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=DcK7OCKoXbpPvB9WOnYKgvUBHYBIFTlTESUeenZ9INtY16+MecriQNYQQl1aazcRuJ
         YqpYHxsa82KV4QHyNfpIdEJ8Io6ky6XPCasj4WTePbHb4IcoqvLxYIK3+CW1fv5fRMYv
         E8tdNK0A4Zpcoxbk8BUP1569sAH0sHum3ip4FHJlRDaCGTKgu8ugFi+hk1Jqo6GN3qod
         N8GeikrzwImRwIlj/hUYLo1/3QRwpfaNnDIpbRE994O/tjZOjhq/aBce+zP0gltf0LJs
         6zKTw792TC+GTkHZ42rjhoUnVAbP0mOgLFcUAjbh4tcJkciBSshwWGEcTKwQKt+Xn5fp
         uGkA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprP9+rA5Ff6dZXyEU6wSzV2Qyfq/1XQEb6g37AzRAa+B7bvLP12yApRZDM15Nr/NjxVlVvqRAI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzosR+HctZNEA2RrtOUdj1wQ3sW2RXXXsdn+4hFotjC5OEZ6Q76
	0RB6FpmnTf1higmrT9aES9ya+TjY3fVhGge9rTFdLFImW4Au5NASWov7
X-Gm-Gg: AfdE7cmUL5DT5D/xzybGYbwIqtMpfnRe8/slwKAr04TnDOdtZPe2oQnOnjYMwiLiUbH
	G7ssGFJ0Q7pNdcrwgRjJ1Vno7iZKV1YB6Z2rMj/yvr0HHbr6zviFvI4ZsfjaejReAx6Bu8LXKUA
	05Bt5rTa86HwSSKfim/bGWu3uynSzTBr3IDMFZWzetylCx62JZOR7FreZaFqkoYWMe4YY7aXoIg
	iu35hnBjsa/lYT3CIiNAeeYzmhnr2ZdcBTyOLagv+bGea2ppQhx9w182do+zZbKPjxpAwzPORU3
	mIWbQvnzim05v8TQN4HRfnZr6/LtAMEGHurzMK4CIibDlTQDQgnbw191Nxq4wD/O+CY16D7uOmZ
	CJxnZxFRV/x8f3DwlTi9rr1+aSNREFPAgB3AHT76lCm6/8M5mCNyRuiLKPWvle7UpU9vqmprRk0
	rP5NFkAJgXFabWgkZTZxkIVsBokgd7o9IgMpMIWT3BsWSLD1t32HzYq9TLIiU=
X-Received: by 2002:a17:90b:3d4b:b0:381:1f51:1ff0 with SMTP id
 98e67ed59e1d1-38dc782ab85mr13404006a91.2.1784067690606;
        Tue, 14 Jul 2026 15:21:30 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e172b6d08sm2132074a91.2.2026.07.14.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:30 -0700 (PDT)
Subject: [PATCH v2 1/4] fixup! mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
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
Date: Tue, 14 Jul 2026 15:21:28 -0700
Message-ID: <178406768885.1106335.9955379956617151440.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O5NZ6K3URE2GXXUMTUPRYKNS4FXLZW52
X-Message-ID-Hash: O5NZ6K3URE2GXXUMTUPRYKNS4FXLZW52
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O5NZ6K3URE2GXXUMTUPRYKNS4FXLZW52/>
Archived-At: 
 <https://lore.freedesktop.org/178406768885.1106335.9955379956617151440.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The hmm_range_fault_unlocked_timeout() example checks for a concurrent
mmu_interval_notifier invalidation after the HMM fault has succeeded.
The sequence number used for that check is stored in range->notifier_seq
by hmm_range_fault_unlocked_timeout(), so the retry check should use the
same notifier stored in range as well.

Update the example to pass range.notifier to mmu_interval_read_retry(),
and spell out that the retry check uses the notifier and sequence number
stored in range by the HMM fault helper. This makes the relationship
between the HMM walk and the later invalidation check explicit.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/mm/hmm.rst |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 5c88d2cf0818..fc1b8dc19825 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -206,7 +206,7 @@ The usage pattern is::
           goto out_put;
 
       take_lock(driver->update);
-      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
+      if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
           release_lock(driver->update);
           goto again;
       }
@@ -225,7 +225,8 @@ The usage pattern is::
 The driver->update lock is the same lock that the driver takes inside its
 invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
-update.
+update. The retry check must use the same notifier and sequence number stored
+in ``range`` by ``hmm_range_fault_unlocked_timeout()``.
 
 Holding the mmap lock across HMM faults
 =======================================


