Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7677CE8B364
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 03:02:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4610E349;
	Wed,  4 Feb 2026 03:02:24 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3F53F41B49;
	Wed,  4 Feb 2026 02:53:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770173587;
 b=ywD27NpyKlcCPI1/7nadknSijzp4+/2LqewiV4h14YkXYIBpi6Gq/KakBaHmCvyCFaL7o
 sKziLgShbvno1vIwqMlNWnG2NdhPNphTVRQeN4bkBeusTaPXoCknNwdBuhikF4ikuLHNPE5
 apAuuvYQRUvBEr2N0KOaleEZ1yDt5D/gOpVbiOlHOxxJ7exlq+FdnO4o2BFsaRX0zFgleC1
 9CRINYqhGyUTKGCuYrLbvXOraZ0OWX6K0nND/YLWytFdSZuXUqsvuNM3NjlzDXiv1uhCeHe
 2XXoFfeUu5St9sMimotq0XW0lk2A9Na2cgtbOa6ZLw8reWKoMxVjGlR1cGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770173587; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vh86iQtuuxFLt0jDHIG4uiL6fzWVxATHzARM+0gTh7U=;
 b=hALot1lB3oBrOuPqzDyeuEThr3v7wrHfbOv/hgYYvNBrD5ZZcRyQnGl5iyrD8PQfFk1kv
 /hQ2vt2AYbOC40AdRyvdATK2k5kz8H7fyF6ibdNcUg40r+PSN5buin+btUyBkfXtmEVlPfq
 gK/N9j7WXBCs7BQo1PcDwI7pj6qmhHW1g5+eRrt/iFHgMRSkTGkIkHkMOxQFwVPko4VhQf8
 +hL/aBGx5KV9YBcHFrIPYVi2rMwyCM3DQ7rbsWl42ukSQVpgKD32zk683xAvy4mtw861shM
 KE1VWLS/rKMQwNULXAAE1cM6j9/tCwZAZN58/46qpEk92ZqZUjsu8wJFkfDw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 60E4540382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 02:53:04 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 51B4410E0D1
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:02:20 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-hmUkKU6XPu-82AD9gYopog-1; Tue,
 03 Feb 2026 22:02:16 -0500
X-MC-Unique: hmUkKU6XPu-82AD9gYopog-1
X-Mimecast-MFC-AGG-ID: hmUkKU6XPu-82AD9gYopog_1770174135
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 89EA719560A3;
	Wed,  4 Feb 2026 03:02:15 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 833A730001A7;
	Wed,  4 Feb 2026 03:02:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] nouveau/vmm: fix switching between small and large PTEs
 (series v2)
Date: Wed,  4 Feb 2026 13:00:04 +1000
Message-ID: <20260204030208.2313241-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cT3QPY7HOWd_hwquZtFXXSEtjOVpmzTRxK123soWp_A_1770174135
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: O4GDN7XPTEWOR5GKFJPRSK3LYM6EDFZ2
X-Message-ID-Hash: O4GDN7XPTEWOR5GKFJPRSK3LYM6EDFZ2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O4GDN7XPTEWOR5GKFJPRSK3LYM6EDFZ2/>
Archived-At: 
 <https://lore.freedesktop.org/20260204030208.2313241-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

[This is a repost with a fix for a bug noticed in patch 2 from yesterday.]

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

