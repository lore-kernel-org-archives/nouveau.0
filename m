Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE5FC5CFDB
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE0C10F533;
	Thu, 13 Aug 2026 20:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RyT8feOj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CC7784772B;
	Thu, 13 Aug 2026 20:21:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652482;
 b=Pr36LWgyU4+fjYCucRT8+l0QkrcDYM8lHqOMhDEZgEzn47VL2ziVt62rqyCRIcvSn1qv4
 I10CUePwVzlCvwNoXL7k0JSf6sVjshE2U5iocwusiXAoHqC5KxznhmuHONCrakXr4H0cl29
 6eyvzqVlYm76G63xQ+q80rhQfRorg3WTW0ugrd1HuLKJLcRA7K58X88XiCqjRnAIP99GLo7
 YDLARg6qwG1hwhUSRsDwcjGZ/S2LTmSI4y4X1puzgg4P9v2b+vj39RYGGtT8SCmR3XcAIVJ
 cTW0Q3kRmgcnfjkCrwyYOU3HgsYcg3xtcA0rwqlG98dGqmQ91K9P+J8qvgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652482; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YBhhibg1vyYDwWwIbLf0SqOtkO3UKVVzhbK80flWEUc=;
 b=wIda3MqUdw5Wqb6sKaErgp+ZCBaTOBb39BypEPYssJIBmGSVoqx4LAWo6fRJd/QlOhUfz
 QOioL+W3HCbz+TglLZUvgC3BUZZIpE+wbeoaXHRz1BsVnWMLmGJf/CMlILEZjQeCjd5mIh2
 vrahe2dysmdCWTY+uxNgPT3OnDiH0LqUUG/DWPQckozQ5F0i/sxXG2jtg8fPzzKi9wclUhe
 z7JzE/9ShcKDYiL6zX8yYCYk3yy2F+ammIH+QgO+NaCD9Bqv4rxM9UNpKAJcSkNVAqOzJxh
 zN+YA5mmli+1Vh3Qko9IyM60sEacOz9xciX9h3yHnUlVSy/eDtPKtTVBiFiQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7773747758
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7096610F50C
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YBhhibg1vyYDwWwIbLf0SqOtkO3UKVVzhbK80flWEUc=;
	b=RyT8feOjaOqc3Xp8+f0gDxjJGYWdJVtFFA0d0ULHZlssZbOoPHdKCMMYKoFmRxsjnhZoop
	XtaYAihsYDvXmteOV/po2scHtgGGQF8VZY/IvswEgr1suPbrE6aAmZRwBNcj9YufPS2cJn
	dBec8WUe7kTCJK4PYdBV+zci017BYbU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-jSMuU-TtP4ia37DtqRyQlg-1; Thu,
 13 Aug 2026 16:37:33 -0400
X-MC-Unique: jSMuU-TtP4ia37DtqRyQlg-1
X-Mimecast-MFC-AGG-ID: jSMuU-TtP4ia37DtqRyQlg_1786653451
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0EA0F180064B;
	Thu, 13 Aug 2026 20:37:31 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5173D195608A;
	Thu, 13 Aug 2026 20:37:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 0/5] drm/nouveau: Enable atomic modesetting by default
Date: Thu, 13 Aug 2026 16:27:04 -0400
Message-ID: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: uOsmiKOkAiNCXEZrsCnYT7HXSpEiSM6zZbnN7_mhbo8_1786653451
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: WW3VOPKZFE3IPYVCDRGILKS6IPQQUFGX
X-Message-ID-Hash: WW3VOPKZFE3IPYVCDRGILKS6IPQQUFGX
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WW3VOPKZFE3IPYVCDRGILKS6IPQQUFGX/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nouveau is one of the very few modern hardware drivers in the kernel that
doesn't have atomic modesetting enabled by default, in part because when it
was originally written by Ben there wasn't much in the way of good atomic
modesetting clients to actually test things out with.

Nowadays however, atomic modesetting is very much the norm - and support in
userspace for non-atomic drivers is starting to bitrot a bit - leading to
its own set of issues. At the same time, many of those issues are fixed by
just turning on atomic in nouveau. Plus, I've been running nouveau with
atomic modesetting on by default for most of the machines I work on, and
I've already fixed quite a number of issues to the point where things seem
quite stable (excluding a single screen flashing bug on my desktop, which I
am not particularly convinced has anything to do with atomic modesetting).

This patch series enables atomic modesetting by default, at least for
NV50 and newer. NV04 is left unchanged, as atomic modesetting was never
implemented for it. This series also enforces leaving atomic modesetting
disabled on <NV50, and adds the value of nouveau.atomic to our kernel
debug output.

Previous version of this patch series:
	https://patchwork.freedesktop.org/series/171310/

Lyude Paul (5):
  drm/nouveau: Fix cleanup bug in nouveau_drm_device_new()
  drm/nouveau: Print the nouveau.atomic parameter in
    nouveau_display_options()
  drm/nouveau: Fix drm_driver struct/nouveau.atomic parameter handling
  drm/nouveau/kms: Only allow enabling atomic modesetting on nv50+
  drm/nouveau/kms/nv50-: Enable atomic modesetting by default

 drivers/gpu/drm/nouveau/nouveau_drm.c | 116 ++++++++++++++++----------
 1 file changed, 71 insertions(+), 45 deletions(-)

base-commit: 9b388fc3d0e63a4f5b022d326151e176e8d82e25
-- 
2.55.0

