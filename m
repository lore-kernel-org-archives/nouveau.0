Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF92C44525
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 12:58:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5210E79B;
	Wed, 21 Jan 2026 12:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="ejAWSczX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9E3EC40469;
	Wed, 21 Jan 2026 12:49:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768999782;
 b=DrQHVl2aksygI7I1HQIZ2gPRvqb9t2DC4rSPGgmO9fMFmqEwLBXyn6A/4VRct6UYLgosK
 ZgpvdgxpMotnqcQ6FlBTSzdxjK+apNcxC15bJgSgc6tPGm9zvVzCYzuznuIIqkjRs2ROWaA
 u40tftMWrv6qDIy1Cgjr7aShvRnGZ5Ee0O2UpXzCWJqluFK+K8yeB4rflEcbh7sUqhRZtMi
 XZxn067o3jfN09LR98Bps9a3rWIB3iHdwvzhTgezKJZCVZL+xyhDK1LE7mfWgxA/aJnIGrf
 ZAyNREtYYn4fg+waxqco9SKKt4ukGPSYFDQwdDRunW0oByGzRBc1g2lr96/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768999782; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+AdrJzDFk+iZHM5mX4cSeLtnmX3YwtJuX07LPIMl/gc=;
 b=Edz9wZOvCYPxQ1Y52DMmUK3Up542z9n37oazqSAa6UIUSKf7HWpgUEn+yndpenPAfi5k6
 +wrNnyI4LDiXz22uCpcK7Qt5TSGclDIJAsdyKoU2iVWU/pYk5+7Fu7gBl3whBqgXRoZYeDL
 3O9clX0ElO5rZ2et2fD93Xb3tRv3VH1xwec0sRUjhTbA9zul+2VqVJVZXwerX01RPEDb6x9
 0aXXJnRsiEpz5qkFwDz4hqm7FG0SVeciPwh5nQIpP5ua+TEpjkSppxykqexYNrT9M/eMOHq
 ONavdIuWTVrYx4z8ddwiXOHEDKNtj9P4uufAL843Ps12xVn98c6CKQ3No/5Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 91CCF400AA
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 11:43:24 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jan 2026 11:52:10 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A41EA10E75F;
	Wed, 21 Jan 2026 11:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768995417; cv=none;
	d=zohomail.com; s=zohoarc;
	b=LfsGDFhho8f+pL7xRcCxxdlWbHCaHNEsPGIRCzYXVqcGSKINHMplgNgqMo8gbJfFf8qfUKiUrb/P3IfdCS2IlYgI1qRqrkNmBWfDEaRwNZLLZTEr12dem12pmeLrVNGydvymO8yhpATneDfJ8ZHLxQbwjqAvLKo3uqbHwWOQoAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1768995417;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=+AdrJzDFk+iZHM5mX4cSeLtnmX3YwtJuX07LPIMl/gc=;
	b=YhiqdlS87yV8l5X3P+q9z9BVDCs4Q/uxcNeM5GBDiUMyQlvl3ieG82mnhLw+9fQwj4ltESDDqpjdMvYf8xCSgfB3OdAHOdkw5cx6DMq27XnaMuq5ougNP6AsieKhhEv6FyxCQtj8ssmlPbSpruNCju81duX+zlZiWCtEB/QXGfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768995417;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+AdrJzDFk+iZHM5mX4cSeLtnmX3YwtJuX07LPIMl/gc=;
	b=ejAWSczXNnRN+Om/j0kIoMt3Po43+7YyvzJpqxx8RXgh0NZo590IOBunKtLuustH
	1yVFZ9E209BJqy61SfF0EBzGC0zwfNV6zS3UJOF6EVl3zby0sjpzvdUjMfPUTiE3uv8
	yzQGzxXgZqh2XljT8bQjzqV1X2DW1zRBsNNqrGRc=
Received: by mx.zohomail.com with SMTPS id 1768995413291852.3338382709496;
	Wed, 21 Jan 2026 03:36:53 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Dave Airlie <airlied@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nouveau: pci: quiesce GPU on shutdown
Date: Wed, 21 Jan 2026 19:36:44 +0800
Message-ID: <20260121113646.111561-1-me@linux.beauty>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-MailFrom: me@linux.beauty
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: OM77KAODTZO3W7KBEKB46LK7K6DAK2HQ
X-Message-ID-Hash: OM77KAODTZO3W7KBEKB46LK7K6DAK2HQ
X-Mailman-Approved-At: Wed, 21 Jan 2026 12:49:41 +0000
CC: Li Chen <me@linux.beauty>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OM77KAODTZO3W7KBEKB46LK7K6DAK2HQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260121113646.111561-1-me@linux.beauty/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Kexec reboot does not reset PCI devices.
Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
userspace still holds DRM file descriptors.

Quiesce the GPU through the suspend path and then power down the PCI
function so the next kernel can re-initialize the device from a consistent
state.

WARNING: drivers/gpu/drm/drm_mode_config.c:578 at drm_mode_config_cleanup+0x2e7/0x300, CPU#2: kexec/1300
Call Trace:
 <TASK>
 ? srso_return_thunk+0x5/0x5f
 ? enable_work+0x3a/0x100
 nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

nouveau 0000:26:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free+0x73/0xa0, CPU#2: kexec/1300
Call Trace:
 <TASK>
 drm_mode_config_cleanup+0x248/0x300
 ? __pfx___drm_printfn_dbg+0x10/0x10
 ? drm_mode_config_cleanup+0x1dc/0x300
 nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

WARNING: include/drm/ttm/ttm_resource.h:406 at nouveau_ttm_fini+0x257/0x270 [nouveau], CPU#2: kexec/1300
Call Trace:
 <TASK>
 nouveau_drm_device_fini+0x93/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Signed-off-by: Li Chen <me@linux.beauty>
Reviewed-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..f2e04a048ac2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1079,6 +1079,37 @@ nouveau_pmops_resume(struct device *dev)
 	return ret;
 }
 
+static void
+nouveau_drm_shutdown(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!drm)
+		return;
+
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return;
+
+	ret = nouveau_do_suspend(drm, false);
+	if (ret)
+		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+	/*
+	 *  This is just to give the pci power transition time to settle
+	 *  before an immediate kexec jump. it’s mirroring the existing
+	 *  nouveau_pmops_suspend() behavior, which already does
+	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
+	 *  ->shutdown() we’re allowed to sleep, so I used usleep_range()
+	 *  instead of a busy-wait udelay().
+	 */
+	usleep_range(200, 400);
+}
+
 static int
 nouveau_pmops_freeze(struct device *dev)
 {
@@ -1408,6 +1439,7 @@ nouveau_drm_pci_driver = {
 	.id_table = nouveau_drm_pci_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
+	.shutdown = nouveau_drm_shutdown,
 	.driver.pm = &nouveau_pm_ops,
 };
 
-- 
2.52.0

