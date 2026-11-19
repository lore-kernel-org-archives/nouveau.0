Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3684606A32F
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVrD3PzW
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD8C511267A;
	Thu, 19 Nov 2026 17:04:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 996FB40472;
	Thu, 19 Nov 2026 17:04:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795107851;
 b=ZUmj6QxXiQNRWq9+gBMJ32ThzLKEVmZ4qgQ1E5FgJzlMf5nSbCXxFJGmWZyzDJmWm9DGB
 JzRwGgEOPaLKhVjLhhsFrVJqaQcwxDaN3RMaSVpYsi+4NA+8Iv/buuxjJDTGv7Z7WWVUk/P
 zva5X3kUYFkS+ugLmIPzDU9AMC6k46pphKDcZRlfPbDbftsNMBLGfsnZMXl0Jl8f53uhZNd
 +GATgYCF06Ihp7OryPWNxBoKIqHvePn6QamJji+0ZNIrc/nYm796EysB9M7FevuyMONhHNV
 KPIQsRpEhoIoSt6yVrCFVhyCaRiB6dBaWEEIyx9kwx8v0yYrnrmYhBC+UgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795107851; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
 b=zHzFodnyrxcdeiqJ7JE9gO7SKMwhNIcE+3u80u2BRCDoYRk7SCoTiTVd1pWgNH8ONOSUP
 kmFEIDPj+pmIGTwsEvyuI1ReexKE+GZe9/nvmxpSV4+wAKqZ8+YoO4rPP+zRM3LqJ69te3S
 nqfpfmLNEJyp/voJN4fbFya3FyjjioheBsEp6OLTez1HzTa8mo/a+KaO5XriSGHvRZfs2r0
 MAoJORRDqhMfy1Bw/gg43IO3CR8Kg9A9Z1qICX0LlF2OoHEpntyUtB8W6IDFeHkLCgogRjd
 WuI3dOkOHRZQQs5Ht9OxEADCGpVd+rLPG5McLdb4vS+dU6Mxr8prgOxucvag==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
 arc=none;
 dmarc=pass header.from=google.com policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A7A9D40280
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 17:04:08 +0000 (UTC)
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9596810F060
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 17:04:03 +0000 (UTC)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3837afac185so4818063eec.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Nov 2026 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107843; x=1795712643;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=dVrD3PzWsDp5I5pd5FaQLxRl/k1HQbVvc6SzD4dEfmRHA0q94vHt9NI7JIN8xXnaD/
         XaO3pHK3AL+Ec94aso81jOK0tuRlaO57Sy8xgPUxQlI58S9AZXgV+HcJvwencJEbA1NS
         x83+IAxkl+JjopH+FYN5RyLqmVP2UX75JVcXcg5p6yRpnDP6sEaeIeke3ovRBJeTCt/B
         2SubHRyVqduqihq6bv7zm7OqnCUpzoDEyRbhNYBOk4IGd152czKtWAbX5AWyU1QWsz1Z
         TgY+JPGhKZ5Fo88i3zpXgFeC+W/qEvIEqbGhluZh5e67ksPBQslJNx4BCQ6fSYn0V/bl
         e8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107843; x=1795712643;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=zRqNF3dOvG/f+8y3OCI/Z1k7xm3nbluhzYEysoY8RJe5QygZRLykFYr85OHjzzU+Ku
         TgMQ0F5oj0Jl4IZBG8jcTq6FBFWGt1Vlw8r2prwTt2S+piSQnb2kSzEC1K2ac8A51xSy
         EnRYqp7R1WfmgGMg6PFA3bg+DAfMPGoVz23WqxDdTgPHSepOtg+1RZ+4ZlpVdE8Ukcl6
         bAjPCJca3+zjMyNstNINFUrv2xTB3sexRHLGqDXJx8wDC+qoLBNf8Zb4r/n/yRyrLIAj
         VMoLVDSgLHos/mwmCsrJfX/rBV3B12rcC30jn90j69aHZVnx9CgWyvxYjfbCsSIcWYrU
         4S0Q==
X-Forwarded-Encrypted: i=1;
 AL+hErF7g1cr6NCDvXdg5V++6P+86z8yAt0AkeD9jQxMPtZHnWkF/LmGSagYbJaPOMueVR23cmm18k13@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+xQH6JDU2gSKtwCWFTR7MwRVDPkZyyY245dYJOepZTWEwZmRBH
	1BTKF3mK+6H4uSI5Dec3/dsRRT9Yo2P8q5nVGcf/Vz8XcgjJeu4OqEMXJFVEAzr3NLu/95qEnog
	9KAAwG6ZDjQ==
X-Received: from dybml48.prod.google.com
 ([2002:a05:7301:1530:b0:376:328a:f96a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2113:b0:37a:a9db:6bd2
 with SMTP id 5a478bee46e88-3828026960bmr6552673eec.11.1795107842263; Thu, 19
 Nov 2026 09:04:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:56 -0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106937.git.irogers@google.com>
Subject: [PATCH 0/2] drm/nouveau: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: D4AZZNN4I4O6OTE6P5QPQ4RQYUAUKLLY
X-Message-ID-Hash: D4AZZNN4I4O6OTE6P5QPQ4RQYUAUKLLY
X-MailFrom: 
 3Aiz_agcKB7UdmjbZmnbjjbgZ.XjhijpqZVpgdnon.amZZYZnfojk.jmb@flex--irogers.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D4AZZNN4I4O6OTE6P5QPQ4RQYUAUKLLY/>
Archived-At: 
 <https://lore.freedesktop.org/cover.1795106937.git.irogers@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two independent fixes in drm/nouveau found while auditing Clang
warnings (-Wswitch-enum and -Wconditional-uninitialized) on an
x86_64 allyesconfig build:

1. Handle NVIF_CONN_TV and release nv_connector on error in
   nouveau_connector_create().
2. Initialize primary_crc before switching on src in
   crcca7d_get_crc() for GB20x RG CRC capture.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Nouveau hardware.

Ian Rogers (2):
  drm/nouveau: Handle NVIF_CONN_TV and fix error cleanup in
    nouveau_connector_create()
  drm/nouveau/kms: Initialize primary_crc for RG CRC capture on GB20x

 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c  | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.56.1.708.g77570a6a1d-goog

