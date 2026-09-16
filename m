Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4C6C982C9
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 18:10:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8310ED34;
	Wed, 16 Sep 2026 18:10:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E53E48105;
	Wed, 16 Sep 2026 17:52:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789581176;
 b=VxaL5aYhATM58zXqzFUQcMG+UA9eL+i/AWkXvvhhktw9CJS+VQXpmpMEo3NVnSbRiPJHl
 SbY+dAsZZMWzBgcQVxIJRC+PN1PATNC+Ub4Q6i7a2J0Zch4uDmmcTkyGOdn0C+83rDAb1Ft
 BzlBCqzjM1dJ8k/3Lve8OJbOREA5zHViXNZwnpQ7fugl6mc/uP8Reo8qW1EypCqqaN6oCsb
 9akZV86AO3L0FcC8tKmuxm2O6AB9sq7tH8CS9pPlcfuTjPnd179S4P6m9dzJQISvToqzhqn
 Rq8QVh33O+fU1OvMPwiG6kOM/gNGc+Y+Ic0v3Q6sZtNntEQNkhxKP1Jixnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789581176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6jsQ3xemWOzULHtv1ukYJenLc1PMNN6gxdHuLsUeHnI=;
 b=UmQImLjNSogS0403V6NjqrXnqDAHrEhJ4tDSpQmvDiWVbayoUHldAhu1Wkl5QbsudoLz8
 V66Djq/5+PYnhOAHRi6wFWeztCVqoWH3JtkDIiAprE5z4i863SO/FETOc7VCklZJaKAJmuL
 pgDPTxYyaKqkZ34GWbGpCRcbM5CgBd7ASD1RXmTEdR/g9A4Wio4fNTsJVt3+6oAWKVCcVKi
 NBpkuzrSSzGLx1pm6uLrj774VnrWOITkBJaEqKejO48O4FIs5ieJVdMeGMKa3rhPPfs1U6T
 Lt+Je05FIg+kz30IS909BKMQqHY64uLHLb29byESB3YFX4KTbCwlh5NGw7wQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 73506478BC
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 17:52:54 +0000 (UTC)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6815110ED29
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 18:10:29 +0000 (UTC)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3pkAa2qpqgSRvCA--.23709S2;
	Thu, 17 Sep 2026 02:04:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Subject: [PATCH] drm/nouveau: Fix runtime PM leak in
 nouveau_connector_detect()
Date: Wed, 16 Sep 2026 18:03:42 +0000
Message-Id: <20260916180342.2090360-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3pkAa2qpqgSRvCA--.23709S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trykXr1UGw4kGF1DurW3Jrb_yoW8Jw1kpF
	ZrKFWSyrWkJw4rK3WvyF18JFy3A3ykJFW5Gasaq34Uuw1rAr1Uuw48Aw1qqFyjyr95G3yY
	y3ZFq39Iqa15C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr
	0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1VHq7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUMA2qqozV6OgAAsF
Message-ID-Hash: T7I5W4VKUWFQKRU75JU3EUE643LT75HR
X-Message-ID-Hash: T7I5W4VKUWFQKRU75JU3EUE643LT75HR
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T7I5W4VKUWFQKRU75JU3EUE643LT75HR/>
Archived-At: 
 <https://lore.freedesktop.org/20260916180342.2090360-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

If nvif_outp_edid_get() fails, nouveau_connector_detect() returns
early without dropping the runtime PM reference taken at the start
of the function, keeping the device powered on until the next
successful detect.

Balance the reference on the error path like the other exit paths
do.

Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch edid")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index cc239492c7f0..4a750d4bf1f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -600,8 +600,11 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 				new_edid = drm_get_edid(connector, nv_encoder->i2c);
 		} else {
 			ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
-			if (ret < 0)
+			if (ret < 0) {
+				pm_runtime_mark_last_busy(dev->dev);
+				pm_runtime_put_autosuspend(dev->dev);
 				return connector_status_disconnected;
+			}
 		}
 
 		nouveau_connector_set_edid(nv_connector, new_edid);
-- 
2.34.1

