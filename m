Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC87606A327
	for <nouveau@archiver.kernel.org>; Sat, 14 Nov 2026 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=JUQcF7Gc
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3110F05E;
	Sat, 14 Nov 2026 16:35:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 33EFD49324;
	Sat, 14 Nov 2026 16:16:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794672961;
 b=CrfN2oPUNhx1M8dM8wtSXL8bI8gl1KZMbq0RXteUZWvx/aozZD4c/0dsHUY/Q/nJPu8zy
 HXjvg81yoIprl+R1OVmbUIklgEjt23naTht9pg7U4eb07k3UPt/Wgde5NBvRcIoz+LWaGwZ
 c9AGFtDLEWv3kiLuB0zAyRszhgk1Y2KuPCUNfP/BIOy8on1R1kPVHozANMDxxXgfOCe4JrQ
 lTnayJ1TbSPtjEOKBfcCXKoWOCV+cBL7lDo1xRw7kdqjriYj2bZiAJa8Qs0hSJkOuWhVUps
 07QUUYPv1vREoRX3uVuJqH/g86hxjNZy66rZ6w/uI8O7HagHn7JD/BTEqCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794672961; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
 b=A1tCFH/9lmNvElW5j15sFyzPjviqKGONm9wrOTb+Ge5Fr/u7VWQ5sL8pb1i/0rS6Nb0Lq
 3/QVt1rqCsMh+8cIR/4EuX3zu8hTWV94Z9fAKKt9vByglie/MYhv9//CQkE8haKDbJYl1+C
 fqUaKrGwjUK82cHRW2l4ctGuqyENKIjZFOZLOps3iskl6kDSRrZdI5U+xAXyi5kUdTVs8x6
 YI5Gooo9vjvJ0l1jPRIdfjJkmR+y/gEXnkZVTyDtmOH11c7j5zcnW3gY41wvdFqVL6ZBY+X
 gsKle2/qFmReKQIpBJy8oUrR+e9Z6c5U1RDY+05eZIeBJmfg0o1PfQU7vxmg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gourry.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gourry.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 534C84930A
	for <nouveau@lists.freedesktop.org>; Fri, 13 Nov 2026 19:35:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E1E0210E832
	for <nouveau@lists.freedesktop.org>; Fri, 13 Nov 2026 19:54:40 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-93f20c3aaa5so296941185a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 13 Nov 2026 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794599679; x=1795204479;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
        b=JUQcF7GcaorDL3mIi2wu4G7mtzkHbWJiBBDPcfdCDM8GpubtUhRVnyPAJV71Sn+llV
         cQrwNQFzBbCKA13zRbHj97Fqd3oyWU3KJ/BznZQFeJn1DS31piwBme7gk6uiTp0jGhR0
         5BwJYciyewa7g1ZZSYGA8hVXjCnutNxU00mkoBEKvFD6Wo3KKF1EpcURTlMhcnXnu0xW
         hF4VBiksSPc3R33DGwyupCZu4fwOmIBS1X8lMpEifi4BrJekhoQ5PIuX1Khh75CYCRwr
         bSdUV1cs22oh1b5Wmgy+5A8WaJQrKdkMIOc/3y/vnlvL6Wr+xlZZIC5qIKqNfsps/v7R
         4rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599679; x=1795204479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM+AY411aupxDfXW3rYEXZkT1F3AQsoQqb9ny080FQ8=;
        b=QSfIRoDgHuGGPN9gNNlb5ciQlXTb2/A45ul6LNuoB7Tuq1j3M3H4T7fZyBRKw4U61H
         rCV/Mc9RIiPe5kegt09Upw6o7dyNyDWQz7FPcbweXwn3RmiUlXbELrmUrQxM1Oji3J4d
         BHrO5+WjWKYNBe51q5oo87wunpsH5PoRS0J7YfVunKyXp7TXCMtgc7ibvRWYUC5iZLuU
         u8kDibrLlydcEc5xprFMr6qx40mMCI4CjUy54A54qf6akCmVEkyYzMnD/rgolwy80XHV
         JYFcFMj34qwN1Oxui/YXKtJMdB6IzR0ufBpnDUIyf8it3iPAfWA18sYUb9DhN95Jvb38
         +mvg==
X-Gm-Message-State: APuU4Z9ge7g6d65zMOMEJIC/slmqyS5hwNiS5gXZEMXStWrwk4g6LJ6O
	VttWVq0dhHk+wQ2OtcjgyofgSNrIBxrPKO/OXUUoe/MmD72rMlBQWVk8noRkm2fMrEMDTSkHrLY
	NgW4e
X-Gm-Gg: AYBFou1ayqywSglvhoLAA+z+yHQ2gsHFptJLWZSFIVSIKuU+ql0iMEft6DXVMzF650W
	r41qU3bqzrzbXPNJfdjedjeR8Byy81lL3c3kvN/u0pR2bbqwNtUdkHbhI47EVaCcvJJ0QYAYdJb
	v2l1DcRFyTlUE1NZBRLD6yXsmNT1Xn26jPS5mFtQypPa/WIA1fxyItW/pQK0Uprgj/ZfX8BMYKL
	oTXVArhWUl2rNo+1P2+/pV531LfzkGszFeckD6KSMOiCqg4Bru92zpolszVklyFvap6QlbEeu2R
	kNVOTt3gclNF+I7kV5P97L5oKgU5iO4UYFkRWDfwXc9gAb3AnXUpPHUAsz4A/LNpVvilNzjACHo
	sTLFEwde3mHMvK30efLYl6Pg8b1NqEHA+TVtqZmB6MToK0IUpBFrtWgbgQqNvtaC0FRqOIHrsTc
	DzIXZ2kORSg+8nbi/4rLc4DbDSfB0q5800fu+Vem9Yk7yJFfVwVXUxet824ga3PYzSqSow+pKYv
	OfRlJThUw080Nl1+mMSQ72+MpmGkgn+/Xeiy0ph5duZ7EQd6DPYe4zkWguhUJj+ek8jDn0V0c9f
	r0DPBioPCfVRZ3arjQEBwZ5ZPpPE4lZZJQxTo+PtZUJv/ydqu+6j5DklNCkK1yClQyVRJ7mNwPR
	sRFD4u+O1fyjQvrQ=
X-Received: by 2002:a05:620a:414c:b0:947:84e7:f617 with SMTP id
 af79cd13be357-9494bbcc0f7mr614745985a.64.1794599679506;
        Fri, 13 Nov 2026 11:54:39 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F
 (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9494c870ad4sm252867985a.26.2026.11.13.11.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:54:39 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/dmem: free migration arrays on early fault
 returns
Date: Fri, 13 Nov 2026 14:54:36 -0500
Message-ID: <20261113195436.2659094-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: gourry@gourry.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: MNA3GNO62UE2I3WN5B22LIY4CAPBWSLM
X-Message-ID-Hash: MNA3GNO62UE2I3WN5B22LIY4CAPBWSLM
X-Mailman-Approved-At: Sat, 14 Nov 2026 16:15:58 +0000
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, akpm@linux-foundation.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MNA3GNO62UE2I3WN5B22LIY4CAPBWSLM/>
Archived-At: 
 <https://lore.freedesktop.org/20261113195436.2659094-1-gourry@gourry.net/>
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

nouveau_dmem_migrate_to_ram() leaks its source and destination PFN
arrays when migrate_vma_setup() fails or collects no migratable pages.

The arrays used to be local variables, but THP support changed them to
kcalloc() allocations without updating these returns.

Route both exits through the existing array cleanup. Preserve
VM_FAULT_SIGBUS for a setup error and zero for an empty migration.

Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU memory migration")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e74d7bb975a8..4cfc7b16d445 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -233,10 +233,12 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	 * than just one page on CPU fault. When such fault happens it is very
 	 * likely that more surrounding page will CPU fault too.
 	 */
-	if (migrate_vma_setup(&args) < 0)
-		return VM_FAULT_SIGBUS;
+	if (migrate_vma_setup(&args) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto err;
+	}
 	if (!args.cpages)
-		return 0;
+		goto err;
 
 	if (order)
 		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
-- 
2.56.0

