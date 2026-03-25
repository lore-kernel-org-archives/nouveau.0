Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D81093168
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 14:19:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A39BB10E7C3;
	Wed, 25 Mar 2026 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="K8x7jdMC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C0EDB4530B;
	Wed, 25 Mar 2026 14:08:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774447727;
 b=l/F5a99nUN9d3q0Wmuf9XAxjbewxS+Dh+9K1BfNgGAS9PQpZu+K1sEyWuvUmXNR2AFkUc
 DChZk7dNYLKgazcx/5O6ByXv8YijPUyAtToyiWxOYvtcYd9ZhrJ7yUauqzCsV2oDQQEk+3f
 sUQgP+zOhJ461r5VTUP3VDjrjrL/q+gor2NJ1Zk5I8Ok/yUNuSviEez6iSghb/F/nK9ZAFc
 DVjdVvnOs8T7wDrUUSs7JKoUEFyJQfR+sCZRXt5YaeiqZKB5MtkVGi54PdNR7bVMNdScUVY
 t/Vsb252i0az5/0MsjbV0GuX5h1fT6DP1XpQ0bd+odU3tr8KYwJu9JRcOC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774447727; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u23klA8/tUFH4NA33VZFcitcYgHXv0lrbMT5xAzySEc=;
 b=E8srXWgOnQm8h5MdhGJCFXON7uC+S4IpVhK69Nr31IzR9Qm12TLtsW6oD8f90ZjIrblQF
 mVgYxtC55HO4znYLR7AihfAKDVbfhNIEQahkeMEIDrCD/sKNGIVRniwLl3DnieZaN8IgXgF
 M0Yz7bGTqn/DqclU3gutGka5jHOFqf+ZnyObQzKmDzDJjrJ6WICtVVxdnfnJdBoqFRgWK70
 G6QS11nF2sTVe9cfssQnEnZH1o+2v/yLmXY2X7zUEji0bNwn8vdiJZSedAmXEHmvRkx9uc0
 /gROv4hQ8qQs+yZt9Mka7CxjdmKHTUK+C5oqwH6kgzW3r21bN7306rlnI0qQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=web.de header.i=markus.elfring@web.de;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=web.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=fail header.d=web.de header.i=markus.elfring@web.de;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=web.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7480944F5D
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 14:08:45 +0000 (UTC)
X-Greylist: delayed 837 seconds by postgrey-1.36 at gabe;
 Wed, 25 Mar 2026 14:19:51 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AAEB110E208
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774448388; x=1775053188; i=markus.elfring@web.de;
	bh=u23klA8/tUFH4NA33VZFcitcYgHXv0lrbMT5xAzySEc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=K8x7jdMC8HTH57xglObyyt9L+4KY6iI+f0MAEJvMsOczUIzgGIKewxPIOZLr06Dy
	 pXvDNwGJMALWkQbnSY37Rw40wi4auk25zGeftdsv0vKgPpfXMxRsrldr4oD2DjIEF
	 7OiXNHfWmjN84894MlcPXbqRpOmTkitqYjeKHZ44JAhK14xf/vdrVpB+OnL+6LmC8
	 zfPyGkab18QiBoYUARkbhDvxyq8erpsDTJLV6xL60dsIIzcikSVm1roweNtqittoy
	 9KjcI1B02SvU2adZ3eJNT2usSIi97OLvqIzpr+C374GC2KqCX7v7a1QrI4YJPEULn
	 U5ML1rbyzojaHjB9Ig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2xrq-1w8hBs3Qui-007TS5; Wed, 25
 Mar 2026 15:05:52 +0100
Message-ID: <e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de>
Date: Wed, 25 Mar 2026 15:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/nouveau: Omit a redundant pm_runtime_mark_last_busy()
 call in nouveau_pmops_runtime_idle()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d5UJvMslD2Hr4TKib2ej8EpiK17V/AqdMAvX/HeRHdEV4eQZ+0h
 qT5l+WbwB7AvX67crgHdTNM3gRM17iMrmiAjFtlZ/krFcXVfCABMQn4mMUqSDdOZtMxuwjt
 q23TeT6t8zYceYPnj7SQthCMhQswWUFa9NHiBd/BvUmWGlwkEf35IH2d4hXkNYul867tW4L
 fdRhPHXFR/EvzVDftpzaA==
UI-OutboundReport: notjunk:1;M01:P0:KBYN5ZTY/0Y=;w5jrOeAXF0zo/wf+R4k6fyxm6IQ
 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
 0I
Message-ID-Hash: WDYH5UCMCEJK4GHK6QNCZ3PUOBUFIXDI
X-Message-ID-Hash: WDYH5UCMCEJK4GHK6QNCZ3PUOBUFIXDI
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WDYH5UCMCEJK4GHK6QNCZ3PUOBUFIXDI/>
Archived-At: 
 <https://lore.freedesktop.org/e3631a8e-b4a4-4e14-822d-2199f1576cc9@web.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Mar 2026 14:55:01 +0100

The device's last busy timestamp was set in a wrapper function since
the commit 08071e64cb642ae19ebd6ffeb13b4f3d130b5860 ("PM: runtime:
Mark last busy stamp in pm_runtime_autosuspend()").
Thus delete a pm_runtime_mark_last_busy() call before
a pm_runtime_autosuspend() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouve=
au/nouveau_drm.c
index 5d8475e4895e..62ac9593230f 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1209,7 +1209,6 @@ nouveau_pmops_runtime_idle(struct device *dev)
 		return -EBUSY;
 	}
=20
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosusp=
end */
 	return 1;
=2D-=20
2.53.0

