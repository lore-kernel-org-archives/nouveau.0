Return-Path: <SRS0=i17k=IP=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11ECC433E6
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 22:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780DA64EF9
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 22:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780DA64EF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E4F6E855;
	Wed, 17 Mar 2021 22:42:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A76E850
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616020954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bp9tRlTGqYHOldMsz1KPVazXiKNMgTACgEbJV4rTGxA=;
 b=IjY+Q+xkTkt0KcpPKi84NaaH7TNv1O3QxPf2FnXbEgU05VO23cjdJ5EioE2Vg3ges0gN+t
 f5LkK7HpDPFbtfoEVe7hgQuGOxfvt5/IuA6+6aXNuYtin0L5/KPagFMSr297mfGDzFcENy
 y14LqwQuJ+r4VnCxCMZD9lLcqxfvDjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-3hTXodWrMFS9Z2b5BDtWVg-1; Wed, 17 Mar 2021 18:42:32 -0400
X-MC-Unique: 3hTXodWrMFS9Z2b5BDtWVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99054190B2A1;
 Wed, 17 Mar 2021 22:42:31 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A861001281;
 Wed, 17 Mar 2021 22:42:30 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:42:22 -0400
Message-Id: <20210317224222.447100-4-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 3/3] tests/kms_color: Stop leaking fbs
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

While I was testing this out with nouveau, I noticed that this test leaks
quite a lot of framebuffers. Didn't cause any issues, but we should fix
this while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 02a1a2de..b1b91c74 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -105,6 +105,8 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(degamma_linear);
@@ -189,6 +191,8 @@ static void test_pipe_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(gamma_full);
@@ -292,6 +296,8 @@ static void test_pipe_legacy_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free(red_lut);
@@ -510,6 +516,8 @@ static bool test_pipe_ctm(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(degamma_linear);
@@ -618,6 +626,9 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		 * equal to the CRC of the CTM matrix transformation output.
 		 */
 		igt_assert_crc_equal(&crc_full, &crc_limited);
+
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
 	free_lut(gamma_linear);
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
