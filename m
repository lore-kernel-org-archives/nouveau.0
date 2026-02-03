Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58506E83054
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 05:28:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B243710E53B;
	Tue,  3 Feb 2026 05:28:36 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D630A41B47;
	Tue,  3 Feb 2026 05:19:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770095961;
 b=i4gCb8Kn23WrQN8fbTpuZCJiC7LvZqMS0+relFws9fh9nTlGY2WNi4TzyLoRCfElkdGTZ
 EVQwk0BA1CfvQFJV/zIsKKsGZdj83SCgT5B4S/O6CgjQ6b7QHa37eJxiZg8i5D0QMeIxU8X
 p5smCo7GHS7jsW+DzZADx2HMT9m+/SarXTEe5dYhoemPNFxQTnyWKfDzM9J+phqsboDXrsk
 5ED+pRxmdf0sa7YqGBvdlRE7VdgSbM7Av7ObHkGxFxEN/Rmg4YBpm9WTUbu9Bg4HL8UYWiJ
 GWfO2IR3q0KkelM+t4JtpAIe/T7vw54PyirWWjNH75kQuvx6Uxdt/am4qqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770095961; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7cQ4tpPOAK0t6QZ4kjdd2Squ1f28wFcSZ5xoZnYKhL8=;
 b=YIm/JIJTjmsZjN8WMw5HWoIMtBt9jjM7d3fJ4CQ1UtAKh46BrFAh2azkAuD2V74qxmnqW
 gIZjYZe2Q0BD4a/JeztirpXIWaNelAkHPzaiVCv4AfpILYMuq4GbLtYmZHgBRCnNSQio+2u
 vL47caO/1xo/bSaeabQl9hWvWLu4VGs5IwbCumoO3r0kn5rGlg4SVAunDwhE9TJTljL41Wk
 87EreiX0Mz6DjagkOByXnTX7T+QleSKFK6HDpSRWjzelxCjXFu+yr9MMEwkb2p/n0gr+mNg
 41nFU38SZH/vF5e22gy5wChGDMmkmSwMEJqX+y/idageLDoTG7mHf0Ne3/xg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9AC1241830
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:19:18 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB3010E52B
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:28:32 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-ZpPcaSQWMjmLBQyi2p7OPg-1; Tue,
 03 Feb 2026 00:28:30 -0500
X-MC-Unique: ZpPcaSQWMjmLBQyi2p7OPg-1
X-Mimecast-MFC-AGG-ID: ZpPcaSQWMjmLBQyi2p7OPg_1770096509
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CBA5619560B2;
	Tue,  3 Feb 2026 05:28:29 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C28A21956053;
	Tue,  3 Feb 2026 05:28:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: nouveau/vmm: fix switching between small and large PTEs
Date: Tue,  3 Feb 2026 15:25:24 +1000
Message-ID: <20260203052823.2220053-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -LnN3KhPdYByE7u5LPFQJLn2BSGGCvnJcgSfNeqFals_1770096509
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: YR5YPZSS5AHE3NU537I5EGVH7VDY7HPT
X-Message-ID-Hash: YR5YPZSS5AHE3NU537I5EGVH7VDY7HPT
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YR5YPZSS5AHE3NU537I5EGVH7VDY7HPT/>
Archived-At: 
 <https://lore.freedesktop.org/20260203052823.2220053-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The nouveau page table has dual page tables with special states for
tracking small vs large pages at the bottom level. However the current
code isn't designed with the higher level large page support in mind.

The nouveau_uvmm/gpuvm code can cause unrefs to get delayed, so things
like ref SPT, map SPT, unmap SPT, ref LPT, map LPT, unref SPT can happen.

unrefs can end up quite delayed and it shouldn't matter as unref should
just affect reference counts.

However at least the SPT unref path was overwriting the LPT value when
all SPT were unreffed even if an LPT was referenced in between.

This series refactors the code to use a union, then increases the size
as I think even with the current code there was enough ref counts for SPTE.
The last patch adds LPTE tracking.

Dave.

