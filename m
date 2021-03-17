Return-Path: <SRS0=i17k=IP=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C2EC433DB
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 22:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3859164F07
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 22:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3859164F07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582586E059;
	Wed, 17 Mar 2021 22:50:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87BD6E85B
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3SkIvrvGnfA1vi67+lIfL+OOck8PsP8VzhqkptCAC4=;
 b=FPY/zXT8FqNy/1BQ8NicH+l1+qtcx9GQ6jGxkt0ORByVfH/qpi85fo/XBZIl38eE14qLiB
 Vt8B7x6iFH0eiWB6O6R7Yji5M4renFr7c10cSh9Papj4zqXuugN50tYW/p0RtghvQGz2eV
 cJ4TC0n02vn4KkFRSHqSv8XM2WBG9fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-bsCoo2_vOd6ygXwWEQlX7w-1; Wed, 17 Mar 2021 18:50:10 -0400
X-MC-Unique: bsCoo2_vOd6ygXwWEQlX7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C3C107B7C6;
 Wed, 17 Mar 2021 22:50:09 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2311610F0;
 Wed, 17 Mar 2021 22:50:08 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:48 -0400
Message-Id: <20210317224949.448284-7-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 6/7] lib/igt_aux: Print name of debug var in
 igt_debug_wait_for_keypress()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1217f5e8..0ab51124 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -997,7 +997,7 @@ void igt_debug_wait_for_keypress(const char *var)
 	    !strstr(igt_interactive_debug, "all"))
 		return;
 
-	igt_info("Press any key to continue ...\n");
+	igt_info("Hit interactive debug var %s, press any key to continue...\n", var);
 
 	tcgetattr ( STDIN_FILENO, &oldt );
 	newt = oldt;
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
