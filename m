Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E9606A32F
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 07:03:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2485C10F3B4;
	Tue,  3 Nov 2026 07:03:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 95F0E48CC9;
	Tue,  3 Nov 2026 06:44:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793688250;
 b=qGTonlfGGnixXkNWVjg/p5AanFpLuMOFIV4/ZhMkKw0lJ/gKGRBjkN+/bEUoH1Uk3uH2J
 SvuH+0ALcxPn5u7gW9s9ncGZjZsK5fs47ijmyXWCVPgfWEamBIoeVHCSwkUtA2dC8xxMD50
 B090T6y0FvaY2z/cOo/ApZJ3zfkCKmToyYxKCFWMec4b5t1kiBTZfMDuCl4HC9CuFHpAKPG
 TygtGiA2NKFgws00tjCS0OJEJzg7UwveosiAaneY7PXBKzB2Q0sV0iOm07mM8iZHBA7VlTw
 ER31K4Yd4eptdGeFMsCUI3zooDk5ZCPNF4Bw47Bm4/7LXHDJ2HqhNQy1tg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793688250; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aQIzl+tuB5OFcAf0kolt2eswfBhJMyO4rrUmymjV7pY=;
 b=I+LcO82aSM+6OliDSIzpv8oZc8ZRwM7WpNnAtORdphakCro+xctGDsVzHzx+jKuut6LP7
 lY1AWDvw0r/K6rGKwEGl++c/0oSjaOtPGjMCBI7BrlXRJVgQ5x/j4//8OmHu1J6oIbNtT0l
 0dYPIIac/krAxx8P9KHtTBrj3vfiarDJBWwx/b81NvYm+wgB+1A5X4YrBlVZM0VwJGZgZGi
 ya/DyyUGFWFHkfKLFOIuM8ELY7C8Wtg5DgfSFPfe/mZ5NJTczkY7gRbmxpm9plMHbuJN4xC
 5TExc2csewL/p/7f5uWKrwzqiqBRMVKZ1R4EBEvK53NxPQjjk/tEFhZhgFuA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C41045C59
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 06:44:06 +0000 (UTC)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B510E7A9;
	Tue,  3 Nov 2026 07:03:25 +0000 (UTC)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADn9ZY6h+lqvKQ5AA--.377S2;
	Tue, 03 Nov 2026 15:03:22 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH] drm/nouveau: Remove the audio device link on component unbind
Date: Tue,  3 Nov 2026 07:03:31 +0000
Message-Id: <20261103070331.1079868-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADn9ZY6h+lqvKQ5AA--.377S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryfCr15XFyDJry7tr43ZFb_yoW8GrykpF
	48XF9xArWUWa1agay0y3W0vF15CanYyFWxC3sFk3sIgws0yr97CryYqw48XrW5JFs3uFs0
	qrnxt34UXa18CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUO2
	NtDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQAA2rpWfWRkAACsy
Message-ID-Hash: FUDK2HGWLSLXJHWYQVM4YVT3XKS4YFRU
X-Message-ID-Hash: FUDK2HGWLSLXJHWYQVM4YVT3XKS4YFRU
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FUDK2HGWLSLXJHWYQVM4YVT3XKS4YFRU/>
Archived-At: 
 <https://lore.freedesktop.org/20261103070331.1079868-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nv50_audio_component_bind() creates a stateless device link from the HDA
device to the GPU. Component unbind clears the audio component pointers
but never removes that link. Stateless links are reference counted and
must be explicitly released by their caller, so repeated component binds
retain a link reference on every cycle.

Remove the link after disconnecting the audio component in unbind. This
also covers a later failure of the HDA component master's bind callback.

Fixes: 742db30c4ee6 ("drm/nouveau: Add HD-audio component notifier support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93db6..bcfddb7008ac 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -672,6 +672,8 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	acomp->ops = NULL;
 	acomp->dev = NULL;
 	drm_modeset_unlock_all(drm->dev);
+
+	device_link_remove(hda_kdev, kdev);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
2.34.1

