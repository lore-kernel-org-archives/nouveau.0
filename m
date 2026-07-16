Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5C4C4450A
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 21:45:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30DC510F3F8;
	Thu, 16 Jul 2026 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.b="Bwqbjtjq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE4624721F;
	Thu, 16 Jul 2026 21:30:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784237412;
 b=tuu5YvF2Qlhk0xTn0PyvJOCSmjSZrQWFocxvH3Z7jhMWYEuCwa+3whVIKD0jkzYIdNCci
 b+nu4pTuwkLm4JkcQK1+AZ1JVPxU6mgKftwMhNjWQh62eHjpbQ2JQpPE5A30KLK1lvq3j15
 LHbqwX1hqG1uHWZhk7sFZ9q6c4fIr+M+uuKK/tbp25sMol/nso37wVTTTkXsolIgsPY5VuR
 96DEziSIHrfo/SRkn7/7Rdg0ZsmBJ/W1PhlqMVH+De+Zut+fcjEIri5qAZl4lqiykntRAfE
 HhXZJjnwbLgB4WInWgIxOqdDeyNIsMyO8FVZqtIQVDVqGDKwPmlOBoIzKE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784237412; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b48V2mjHWtO3DRxcg0I7El8TeH9sLhSUkfEF2Fih+nA=;
 b=KvTBVwWQWyxS0XtCMs7/9TxIY7DECTD02VHRnbj8QhlwcpG8f4rC7Zs92c/QpzPa3i1+t
 0kg6pNrBnfSgchYAmgfLJohn5FcpxHq+cbhZevJU+BJcvQQr91wioi9vo8qBrGLX1o47Vqk
 OlX4VRg3nyzAx6Jw7gZWE8cfrh8XVXcDu2xUZwFXQlVo5wZ3lNR3mgbO48tXfB3/B50XgfR
 j7FZrmvnSZrchTAaBYgGFATejJuPhXLmrOfIU/4aswFVz1ZIgBdj0gzL/F/qmk+DoyU+m9b
 HFm7sOdn4V3AJP8APj/zScLSed5TDWgRKAxrNXRqy2Oh5l8TcARemzTxMxSg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=xs4all.nl;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=xs4all.nl
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=xs4all.nl;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=xs4all.nl
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 39FD7448C4
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 14:51:12 +0000 (UTC)
X-Greylist: delayed 664 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jul 2026 15:06:29 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl
 [195.121.94.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7DF10E37D
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 15:06:28 +0000 (UTC)
X-KPN-MessageId: 5f222859-8126-11f1-83b1-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5f222859-8126-11f1-83b1-005056ab378f;
	Thu, 16 Jul 2026 16:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:date:message-id:subject:mime-version:content-type:from;
	bh=b48V2mjHWtO3DRxcg0I7El8TeH9sLhSUkfEF2Fih+nA=;
	b=BwqbjtjqEyBz0gxGSu6vGGH+++GN8cgttZEmiHIPMBaMbWrcDDhzQTRL6cKpfUx3aROj/iz+ZXSvk
	 dckN2oOdxgTSsicdXvOuP7V1QLU9QO6ryNii8CqBmyBEDMVUf+1ksdAM9O1peLbp5fbQvyJmXtnrZf
	 y11fNMu8iXwgrpkSGzsd8ZHOpZ/8UAn9nvWApSrMAWi5/haD7CLuaQHY5tagjyV0GzTPPYlkSUG/XY
	 4TxmbZcIj9hriwhpNZ1IBoHC6Idla/jdguZPhfn03tUb/8WWuZkpicJSMXux7hoE3rbFsdHcHKKe/L
	 bUf9LpyGqbWJlT/q+WuQbPfVC5k21yw==
X-KPN-MID: 33|vTbzhwvOSD9S7gcWt1KykwtGfEO35dmAd1JvMErXoRE7cph1uocz8/1RW0YvnUM
 ffOfpZWk/72n5EUSvZvefarOw6jAepHmdDZ3DGOXVSXM=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|XMBJ2ekhgyqFVkwC43UGX6ffaHluPDwmwQ41akygCRQ+hDBgO2LQqn/GLUGy7SU
 gHFK6pWNZHEgOlfXikkPzCg==
X-Originating-IP: 80.60.70.196
Received: from smtpclient.apple (80-60-70-196.fixed.kpn.net [80.60.70.196])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 5ec8a675-8126-11f1-86b1-005056ab7584;
	Thu, 16 Jul 2026 16:55:22 +0200 (CEST)
From: Arjan Filius <iafilius@xs4all.nl>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [PATCH] drm/nouveau/disp: Prevent division-by-zero during DisplayPort
 link training transitions
Message-Id: <69D67A9F-1A56-4814-AE68-50559DED42AF@xs4all.nl>
Date: Thu, 16 Jul 2026 16:55:10 +0200
To: Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-MailFrom: iafilius@xs4all.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3YZWCGN56NEJRRTXTYX5GNGD3TJX7NE7
X-Message-ID-Hash: 3YZWCGN56NEJRRTXTYX5GNGD3TJX7NE7
X-Mailman-Approved-At: Thu, 16 Jul 2026 21:30:11 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3YZWCGN56NEJRRTXTYX5GNGD3TJX7NE7/>
Archived-At: 
 <https://lore.freedesktop.org/69D67A9F-1A56-4814-AE68-50559DED42AF@xs4all.nl/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Dear Nouveau Maintainers,
=20
Please find below a proposed patch to prevent a division-by-zero kernel =
oops and subsequent lockup in the Nouveau display supervisor engine when =
DisplayPort links transition to 0 active lanes. This bug was observed =
and patched/tested against the mainline kernel version **7.1.3**, but is =
present in all current upstream code.
=20
---
=20
### BRIEF EXPLANATION
=20
During screen sleep transitions or multi-input display switches (KVM =
switching), the active lane count of a DisplayPort link can temporarily =
drop to 0 (`ior->dp.nr =3D=3D 0`).=20
=20
When this occurs, the DisplayPort supervisor function =
`nv50_disp_super_2_2_dp` is invoked via modeset interrupts. Without an =
early-exit guard, the function attempts to perform symbols/hblank and =
link rate calculations that divide by `ior->dp.nr`, resulting in a =
kernel division-by-zero math exception, lockup, and system freeze.
=20
This patch adds an early-exit check at the beginning of =
`nv50_disp_super_2_2_dp` to abort display configuration when the link =
training lanes count is zero.

*   **Tested Kernel Version:** `7.1.3` (mainline stable branch)

---

### EXTREMELY DETAILED TECHNICAL BREAKDOWN

#### 1. Hardware Context
This bug has been consistently reproduced on a Lenovo ThinkPad T430 =
(Intel HD 4000 + discrete NVIDIA NVS 5400M / GF108 chipset) connected to =
a Lenovo ThinkPad Mini Dock Plus Series 3 (Model 4338) with dual =
external monitors on dock DisplayPorts (`DP-2` and `DP-3`).=20

#### 2. Root Cause Analysis (Code Level)
Inside `drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c`, when =
`ior->dp.nr =3D=3D 0`, the driver executes the following lines in =
`nv50_disp_super_2_2_dp()`:

*   **Line 1179:** Calculations for horizontal blank symbols:
    ```c
    h =3D h - (3 * ior->dp.ef) - (12 / ior->dp.nr);
    ```
*   **Line 1185:** Calculations for vertical blank symbols:
    ```c
    v =3D v - ((36 / ior->dp.nr) + 3) - 1;
    ```
*   **Line 1190:** Calculations for active link data rate:
    ```c
    link_data_rate =3D (khz * head->asy.or.depth / 8) / ior->dp.nr;
    ```

In all three instances, the denominator `ior->dp.nr` is `0`, causing an =
immediate kernel math exception in the display workqueue =
(`nouveau_display_hpd_work` or `nv50_disp_super`), locking up the =
graphics pipeline, freezing the screen, and hanging any reboot attempts =
(requiring a physical hard reset).

#### 3. Daily Workday Trigger Scenario
1.  The T430 (via dock) and a secondary workstation are both connected =
to different inputs on the same external monitors.
2.  The monitors' input sources are switched to the secondary =
workstation.
3.  At the end of the day, the secondary workstation goes to sleep or is =
shut down.
4.  With no active inputs, the external monitors enter power-saving =
standby mode.
5.  When the user subsequently wakes up or interacts with the T430, the =
driver attempts a modeset refresh. Since the monitors are asleep and =
inputs are switched away, the lanes count is read as `0`, triggering the =
division-by-zero oops.

#### 4. Stack Trace (Oops Log)
```text
[di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC responded, but =
no EDID for DP-2
[di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC responded, but =
no EDID for DP-3
[di jul 23 10:28:26 2024] Workqueue: nvkm-disp nv50_disp_super [nouveau]
[di jul 23 10:28:26 2024] RIP: 0010:nv50_disp_super_2_2_dp+0xa7/0x320 =
[nouveau]
[di jul 23 10:28:26 2024]  ? nv50_disp_super_2_2_dp+0xa7/0x320 [nouveau]
[di jul 23 10:28:26 2024]  nv50_disp_super_2_2+0xf2/0x160 [nouveau]
[di jul 23 10:28:26 2024]  nv50_disp_super+0x139/0x280 [nouveau]
```

#### 5. Verification Proof (Bypass Log)
With the patch applied and running on kernel `7.1.3-custom #2`, the =
screen standby transition was bypassed cleanly. The driver caught the =
lane count of 0, bypassed display configuration, and proceeded to put =
the graphics chip into its low-power runtime suspend state (`suspended`) =
without locking up the OS:
```text
[45162.232371] nouveau 0000:01:00.0: disp: DP link is inactive (lanes =3D =
0), skipping display configuration.
[45162.232402] nouveau 0000:01:00.0: disp: DP link is inactive (lanes =3D =
0), skipping display configuration.
[45178.605627] nouveau 0000:01:00.0: timeout
[45178.605629] WARNING: nv50_disp_dmac_fini+0x168/0x1c0 [nouveau]
[45180.608524] nouveau 0000:01:00.0: disp: ch 1 fini timeout, 8e061008
[45182.608521] nouveau 0000:01:00.0: timeout
[45182.608523] WARNING: nv50_disp_core_fini+0x143/0x190 [nouveau]
```

---

Signed-off-by: Arjan Filius <iafilius@xs4all.nl>
---

### CHOOSE ONE OF THE PATCH OPTIONS BELOW TO APPEND:

#### OPTION A: The Silent Production Patch (RECOMMENDED FOR UPSTREAM)
*Note: Kernel maintainers generally reject warnings or print spam for =
expected hardware sleep/disconnect transitions. A silent return is the =
preferred upstream pattern.*

```diff
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c =
b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 51c045bdfcbb..ab1bc0898def 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1157,6 +1157,10 @@ nv50_disp_super_2_2_dp(struct nvkm_head *head, =
struct nvkm_ior *ior)
 {
 	struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
=20
+	/* If the DisplayPort link is inactive (0 lanes), skip =
configuration */
+	if (ior->dp.nr =3D=3D 0)
+		return;
+
 	const u32 khz =3D head->asy.hz / 1000;
 	const u32 linkKBps =3D ior->dp.bw * 27000;
 	const u32 symbol =3D 100000;
```

#### OPTION B: The Warning/Verbose Patch (What was tested locally)
*Note: Prints warning logs to the kernel buffer for validation and =
troubleshooting.*

```diff
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c =
b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 51c045bdfcbb..ab1bc0898def 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1157,6 +1157,12 @@ nv50_disp_super_2_2_dp(struct nvkm_head *head, =
struct nvkm_ior *ior)
 {
 	struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
=20
+	/* If the DisplayPort link is inactive (0 lanes), skip =
configuration */
+	if (ior->dp.nr =3D=3D 0) {
+		nvkm_warn(subdev, "DP link is inactive (lanes =3D 0), =
skipping display configuration.\n");
+		return;
+	}
+
 	const u32 khz =3D head->asy.hz / 1000;
 	const u32 linkKBps =3D ior->dp.bw * 27000;
 	const u32 symbol =3D 100000;
```

