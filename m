Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA1BCD8C8C
	for <nouveau@archiver.kernel.org>; Sun,  7 Jun 2026 15:49:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5FB710EAA3;
	Sun,  7 Jun 2026 15:49:45 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 62EC746750;
	Sun,  7 Jun 2026 15:35:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780846554;
 b=N+jcDK81nFnOUmcngAOS4bFS7NiAKwCEPRuyO+RiIt3fkux14yiNLvSsCWn/zDJgNpdey
 7/m79haVuKH3tFD0YmDHyTbX9qEOMmQuZa5pFnj5raEy09Zo2pL+h9BAQ9RZvbXdDaHOZLd
 q2DNFdW/6ekh6HQC1cqRslH1mMJ+vQ8hWXHoY/ICIkYvH2eYve45YIC+P74pUvTh1xP4xdJ
 E4mojmckF5XPEZYxsNlpbIY+SV6VXJLpGwx3DnXDsfo8TqekMkdWOEM2ZPrP6vD3ramdR6g
 W48tH3AcifpAZH/zI+7znMCRJGRjUi/R1MlWXxGXLmrD8bqwbaS3984PJnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780846554; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eD1lDDxF9QwuIL+AcC0lggT7zgJymJ7ZWh375xYshUM=;
 b=Pz0xQsG9SH/0tIW04OMIIFd1QqxvvyxT8wl3nP+v+CjKOm445FHXa3u/B2sZ27Gme68er
 6K8x+AoSR+r1wvzICZMYkgp4A42RysJjpn/7uviR7zj6Gw1KN8Y0Tl6uXH0VlXlNWG2Smm7
 L6SjocONmcQG1S4Gcf54FLnOuNzslH+LH5/OveyOyYDtvsSkoJ6ASgVOsvkW02pfFmSz0sG
 KTVS6fOBUGgycxQ/Dd2CNITmcwC+d56dk9gDioOCYjC6UVKNuO8+NLb8iUfEryYWKRdJamm
 dcSj+PqhlorEu9qVfieorDrJBtgJ2aqW+E4ECSST009kxiZh9DKrXuNxoPBQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 991DF428DE
	for <nouveau@lists.freedesktop.org>; Sat,  6 Jun 2026 15:49:29 +0000 (UTC)
X-Greylist: delayed 413 seconds by postgrey-1.36 at gabe;
 Sat, 06 Jun 2026 16:03:17 UTC
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F1B0010E802
	for <nouveau@lists.freedesktop.org>; Sat,  6 Jun 2026 16:03:17 +0000 (UTC)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXr9IiQyRqIdiEEg--.22962S2;
	Sat, 06 Jun 2026 23:56:18 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH] drm/nouveau/acr: fix missing nvkm_done() in error path of
 nvkm_acr_oneinit()
Date: Sat,  6 Jun 2026 15:56:06 +0000
Message-Id: <20260606155606.77593-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXr9IiQyRqIdiEEg--.22962S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4UCw4xCr4DJw1UCFWrAFb_yoW8Xr1rpF
	47WFyayr4xJa1ftayktF18CFyruwsYkrWIk34DK3s8ZwnxAryavr4Fya1UZryFyrnxCr13
	XFsrJa45AryYyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU1eWlPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkKA2okN20QHQAAse
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: EWOYNSASIE5LDZVZ6BWX4OSNYRCW72NI
X-Message-ID-Hash: EWOYNSASIE5LDZVZ6BWX4OSNYRCW72NI
X-Mailman-Approved-At: Sun, 07 Jun 2026 15:35:52 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EWOYNSASIE5LDZVZ6BWX4OSNYRCW72NI/>
Archived-At: 
 <https://lore.freedesktop.org/20260606155606.77593-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In nvkm_acr_oneinit(), nvkm_kmap(acr->wpr) is invoked unconditionally
at line 309 to obtain a mapping reference. Additionally, when both
acr->wpr_fw and acr->wpr_comp are present, a second nvkm_kmap() is
called inside the conditional block. Both mappings are expected to be
released by nvkm_done(acr->wpr) at line 320 before the function returns
successfully.

However, when a mismatch is detected during the loop within the
conditional block, the function returns -EINVAL at line 318 without
calling nvkm_done(). This results in a leak of the kmap reference(s)
acquired earlier.

Fix the issue by invoking nvkm_done(acr->wpr) prior to the early return
to ensure proper release of the mapping references.

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
index 4c7745cd6ae5..7fd967a2554f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
@@ -315,6 +315,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
 					  i, us, fw);
 			}
 		}
+		nvkm_done(acr->wpr);
 		return -EINVAL;
 	}
 	nvkm_done(acr->wpr);
-- 
2.34.1

