Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C8CA5FCE
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 03:01:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 083DE10E363;
	Fri,  2 Oct 2026 03:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZL7D9HIN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 645CD48898;
	Fri,  2 Oct 2026 02:43:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790909006;
 b=fERfEihSNuwo69+dsy8ezGjXqbFfYKee/wdsKztp5tBx6DIrYAws6R9/Si0tu1MwlvjXf
 8tDHPH+M3K76dcdm1pONazyrDOnobsNvSq/eBISA2KIQoigoRmi0SmBaoblo1+v1Vl9Eohm
 +5SrPNPgGeEOZCCyfdIe/PtDpPt+ldzADFVD+Hy4Y0qU4Zy8VZgKv4jUg4SJxdKctcwrcFY
 bmNjcRenp4mIl03g/30chsLjUcyEwI/wQBlq1qjreLPasxDA6MFPl1oSDdzR87X798Ynh5f
 A+wTN4nNBKp7H5bEnToZLH/45NS2TkUh8rGmuYWhIBKAJ7QyDo9kLQy6dbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790909006; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AyFVOhvCGQIiViIbb7+gjM5CZL+S3jyqr2aX/1FUz8c=;
 b=OfG/oESJiJHCdoVkvLEzjGj9FLtcoEqLnkNG+Ep2O/y2JbGeJc71V2NQl9Qq7pM8wCUtE
 nGn0G/uOWrj4TCF42tYacldniZWheY7X9jITUT5PdlnPw8sLtqHncW0UZlNk/8CqEv9n+ye
 cqX8eidxbmuHeZEIy/iG56E95mytRlYQug1vMfFfIxtxwY3pczK6G4gQvtf7fHjwnB+ChsT
 PvkCw0i/MXlEevknmBPzHXT8ad1VuDuF8cUdY+yZoPZiFymc7Wv15BN1SPqZwnzd5Rz/reC
 VigXHfpPCHQ7zPcP3XyD3ddDbIxWo4p2pZkekuPQowh1a2z3C7fktmWGGH3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D6A8C47237
	for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2026 17:40:32 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com
 [74.125.229.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 348DE10FBD1
	for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2026 17:58:28 +0000 (UTC)
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1382482eec.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 25 Sep 2026 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359107; x=1790963907;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyFVOhvCGQIiViIbb7+gjM5CZL+S3jyqr2aX/1FUz8c=;
        b=ZL7D9HINfy6hzF10rAhP7GoOFySlmfVQMxoZMgj3ioOxgcB7Y+unvHtSBP3TvVyejy
         PgcghWHqMOsfxHdVXqNwRj/IKIDSnwqRFrXZuIE0U1V+Xv6K7pVvycTFyDjAOrRAxnOv
         LvzMQDlD7jWFjEhm5cFJu3AN4X+DZCr4laSkf3l0kJ8JJRSNmUvvip7hNMBT9NzUhius
         tFJ1XOWDxpMKvOkYdVLhCMBdEF7DkLxQxfsqg6UL1CBd4292CBYD9AYvXXt2kGx7i6Sd
         Ga4IM6m18KGWAw9i4cNVIfWUpFH/IAfQqUJl1JYcbXHhgMoETAbc9Yb0EHRuTFCnv/Lo
         nxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359107; x=1790963907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyFVOhvCGQIiViIbb7+gjM5CZL+S3jyqr2aX/1FUz8c=;
        b=zldOaSFVYIWWQppdzD7mPuvCDG14r1qHVtdGRQ1V7j2HrKhJEZ6/hlCSl0zxgtChKQ
         ExWbzfabM/UtHyfGdfWQnV6pjBjG72dOoe5F2Pp05D5m5aqB8GYTESFbzqXbW4EPAM7B
         hHEsveOwNspoOrgUicgY9E1NKRUgtEU1Ai55oIOXZIo0zZK1aU8p2V9QjidmJbwXhfwi
         GidISrcLCEuni1SlEOlR0YRzgaI3oJ5557O+TRd/3aBW8EK5YgnBDlRGDc5eNRUsqyfJ
         HzrtmeIA6LKn37JE0xsn6uP1qgQmv6m92NQnLu3SN1aSjpZhvmogi9aYm8vb9TaMF9uC
         nvuA==
X-Gm-Message-State: AFuF++maXHNqCuEhG12eR2ZMfMXBPHO6ShMSwFMRN24ZEuYOMEQeVEia
	2cw2zK/TrCzjujrfu3TbnMUXCpdBYcE0M65rYQiaOYFAf5LXhZJv8ngt
X-Gm-Gg: AYBFou3D6qrE0f7KLDMggOxueO5/Ysagp3DwnZmDOP3gNT1kSzEPy5FwNJ2KVPW/O3Z
	08K0N2+nxtui+5flYcRPiCNs7U4pimC/mGkIFxI5HyoGTYVK+ZCdXj8OhYx11f/Rc9B5OwETLPB
	T/8X9d5hnUMJTJa+ATjqpm05cIRdHoVVypmE3GLObe4lzDx/F83phPX2atvG+9iktrY18db+XGo
	u/is8RqkhQlt404j09F5JC4ssloF6yJNBAk/UfaLrKRZNdfZorSpZ1nOFTBS6OxvO56gY0GB7gP
	YbPp0u0rAXkRXyhxV9ZENcsFZ7BxJ+GBs/UtExJlORhPU/AdfqDJjUtDAFeY83qqSdUUUdbhTkv
	bFkCP3P16lqtCeW4A3KqOwm0eTUTWyRJnxp3xhA3rqtu1VIt/C91bQWKcEn15pRqoTKT88zSSnX
	+gp9KaXIwzgyrV4CfMzqd83imOOrfJmuxBodfTMx8pEh8SpyldoGs8AmodtXbipkQ=
X-Received: by 2002:a05:7300:c394:b0:33b:fae8:bbd6 with SMTP id
 5a478bee46e88-3426febb742mr935256eec.2.1790359107087;
        Fri, 25 Sep 2026 10:58:27 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34145c17074sm6579075eec.26.2026.09.25.10.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:26 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: airlied@redhat.com,
	dakr@kernel.org,
	bskeggs@nvidia.com
Subject: [PATCH] drm/nouveau: cancel irq_work before freeing connector
Date: Fri, 25 Sep 2026 14:58:19 -0300
Message-ID: <20260925175819.3699225-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: qwe.aldo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 4VAK54EVNZTWV6CKKOAP4RFTOGJFXPFL
X-Message-ID-Hash: 4VAK54EVNZTWV6CKKOAP4RFTOGJFXPFL
X-Mailman-Approved-At: Fri, 02 Oct 2026 02:43:23 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Aldo Ariel Panzardo <qwe.aldo@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4VAK54EVNZTWV6CKKOAP4RFTOGJFXPFL/>
Archived-At: 
 <https://lore.freedesktop.org/20260925175819.3699225-1-qwe.aldo@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_connector_irq() schedules irq_work on the system workqueue.
nouveau_connector_destroy() calls nvif_event_dtor() which unregisters
the interrupt event source so no new callbacks will fire, but it does
not drain the system workqueue.  If a work item was already queued,
nouveau_dp_irq() can run after kfree(connector) and dereference freed
memory.

Add cancel_work_sync() after nvif_event_dtor() so any in-flight or
pending irq_work completes before the connector is freed.

Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index XXXXXXX..YYYYYYY 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -395,6 +395,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	nvif_event_dtor(&nv_connector->irq);
 	nvif_event_dtor(&nv_connector->hpd);
+	cancel_work_sync(&nv_connector->irq_work);
 	kfree(nv_connector->edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
