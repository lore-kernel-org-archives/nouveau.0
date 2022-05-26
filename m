Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D985C433F5
	for <nouveau@archiver.kernel.org>; Thu, 26 May 2022 20:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542B10EC2E;
	Thu, 26 May 2022 20:47:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8E210EC2A
 for <nouveau@lists.freedesktop.org>; Thu, 26 May 2022 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653598070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kkoL+N0anXvIfREutcAdVwnSsLavnD7q+RdRvz8h3vc=;
 b=fapMAOsBsjN9JqAbtZ27d2z1hTc0KB/AoDErS+4Hp4+FG+sFP9XjxAsUqWyBcGXg/VhWeu
 PHUV1JK/yf7AAqh8e9dMddp0TadGJYNGKycqSn+RfLJZSeNvYZaZKi1iCwOcgscIX3IeSW
 plAgLdLQl9p3Fvg08oLZYUFo0SIyey8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-L5FSmjIFMGGux5oNU6gBRA-1; Thu, 26 May 2022 16:47:47 -0400
X-MC-Unique: L5FSmjIFMGGux5oNU6gBRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA31294EDCE
 for <nouveau@lists.freedesktop.org>; Thu, 26 May 2022 20:47:47 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C110400F36;
 Thu, 26 May 2022 20:47:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 26 May 2022 16:47:30 -0400
Message-Id: <20220526204732.660069-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 0/2] Miscellaneous runtime PM fixes for Nouveau
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Noticed these minor issues while trying to investigate

https://bugzilla.redhat.com/show_bug.cgi?id=2086470

While unfortunately I've been unable to confirm whether these patches
fix the specific problem in question, they're likely fixes we want to
pull in regardless.

Lyude Paul (2):
  drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from
    pm_runtime
  drm/nouveau: Don't pm_runtime_put_sync(), only
    pm_runtime_put_autosuspend()

 drivers/gpu/drm/nouveau/nouveau_display.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.35.3

