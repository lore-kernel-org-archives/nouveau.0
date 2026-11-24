Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99F606A321
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kXqo+9DR
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0410F675;
	Tue, 24 Nov 2026 14:17:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7C8A7403B8;
	Tue, 24 Nov 2026 14:17:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795529841;
 b=HIZIsofxuRy6szc5FkFplbX7/9VUblJrqC6b3gQyLVMMedwWZSd4T8wTs5W/h1BL5LMKG
 CjBCgGzcHjYgzaGVQsZywMZESpv/sjU+dyHWL5PDRV/DwvDnrC9i3UID1fxJiHk8/RWrLFC
 lMtwKn1azh/4/vKdnvd5IpBr7uoAppbYKKzcIC7ZqNu5dsm3BLyss7hPd0V5bdtDn+8+3a7
 a0bAzsGGgETB4VFx4YBJPFtzyPMQsfl8XbBSO6Lv37utVbQv1BKK4hO40tz1jS3Mhl02xNl
 IYx6R//KqBY48ra615Noy2djP0zcLV5DFwc/1Nxp5upzb4Fc4G0ShPtH/RTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795529841; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FKlt33JJFFfMucq+OJkCuDuJ/+/09WWDq0lxZ46juB8=;
 b=CtPj6xTFvwd7Ny1cDrKGvypWz/+8xSLl5yahoO3JNhtXz3YmTTDJxyGGFynUbYHPEKJrF
 Jxhm5XGwHNEdgAger5qibbQ4L5HxOyPIqgGv1nvOgppd0Jxpe1ucuvUf1PD+kDEnEGtWutF
 hV2/7Jx1ImXixwMRlBIZ8O5G/4GEP95Xkpv1qyvWppmliNNr7b/0Fl3odSAXQHPgrpemmQn
 zbnGXJF7lZhKb5P/giUgA4LEQOevEzHugz5Gny4TyIyv6W3Yrw9sbEFgUfFiusx7esgtfHM
 TCBm3wFwIIIKlD2VVPCureqP7tfk7sfthfQt+TU8wJtBtl6cZzoTwV5cMc0g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=163.com;
 arc=none;
 dmarc=pass header.from=163.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=163.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=163.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 721E940218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 14:17:17 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 73DF810F65D;
	Tue, 24 Nov 2026 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FK
	lt33JJFFfMucq+OJkCuDuJ/+/09WWDq0lxZ46juB8=; b=kXqo+9DRZw6jA1Uric
	u17JtrVVUau4ek4e2EUhtMf5aezugqZV0xQ2NaHsHBbvN6i2CILCucUTzsh5lc/w
	bKBk2OXA1kO88lNVzhymjP5Y8UEulhUh1xyCpFqSEnKztV6Is3v0EzgKLd1R3QxB
	xkIX01Sp/kBIdZLBQovyuwIQg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wDXH6a6mwVrmD+JJg--.26188S2;
	Tue, 24 Nov 2026 22:14:18 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3] PCI: Disable spurious s2idle wake from the NVMe root
 port on ThinkPad P1 Gen 9
Date: Tue, 24 Nov 2026 22:14:15 +0800
Message-ID: <20261124141415.3464263-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116202943.GA204660@bhelgaas>
References: <20261116202943.GA204660@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXH6a6mwVrmD+JJg--.26188S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyUZr15WryfuryxJrWUArb_yoWxCFb_Xa
	15tay7uw18Zr1qkF4rGr4vvrsrtFZrWryF9rW8Kr4Yyr1kGr4DG3y3C34SvFWrJrW5XF13
	tr4Ik3yfWw1rujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb0Jm5UUUUU==
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3xox32sFm7rpzAAA3B
Message-ID-Hash: IXPRPQC5PVJJZUGW7ESPKR2HQ64VE4QO
X-Message-ID-Hash: IXPRPQC5PVJJZUGW7ESPKR2HQ64VE4QO
X-MailFrom: rh_king@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ryan Brue <ryanbrue.dev@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IXPRPQC5PVJJZUGW7ESPKR2HQ64VE4QO/>
Archived-At: 
 <https://lore.freedesktop.org/20261124141415.3464263-1-rh_king@163.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bjorn,

Please drop this patch -- I'd like to withdraw it.

Further testing shows the problem depends on the configuration of
M.2 Slot 2.  On some models this slot is used for the WWAN card,
and a recent BIOS update has already fixed the s2idle abort on those.
On other models M.2 Slot 2 is still an NVMe slot, and installing an
SSD there still triggers the spurious wake (GPE 0x6F) and aborts
s2idle.

We have reported this to the firmware team and asked them to fix it in
the BIOS, so I don't think a DMI-matching kernel quirk is the right
place to handle this.  If the BIOS cannot fix it, I'll resubmit the
patch with more testings.

Thanks a lot for your review.

Best regards,
Kean

