Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6A0CA5FE6
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF8EF10E9D2;
	Sun,  4 Oct 2026 13:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=saltyming.net header.i=@saltyming.net header.b="TxJeh66/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE0A048968;
	Sun,  4 Oct 2026 13:27:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120451;
 b=xYFdp49wHgh/ZqOfRSER1uxmswy5SEAyDeI8j3gS6N0z6SULCZ3C1Oa1sy4WUK13jijB2
 MqgZV1g3IpYyJt29hdizgoSvwC6TefJ08txIG9ddIXPAOZW/UOQVNbK9lJoDMU7OHl5R5lM
 CDDUSGjq5BNI0wHBMTMXasIRue1JDc0p3Am8ws3b4FaRXcNsw+iPIe3wMtP9B5C5xkmRPeM
 aq+l3ML14G3YDxb4yLCWP46zZUdkFH1ekruhhZiz515BBtao34QdLDfLyUeOHEUmxvwwQRJ
 0hDmUOe9UwY/EHhWyZqFCf5DJwUQ189hrBicE/T6IUmILY7vHZSjwu5Af8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120451; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hxN7kjCEhLnn1+Ezysc3TnjEFzT6AYEfF7E3Sz1y6Gg=;
 b=Q0OL2aTTQM5mH76g0iNJZp6OZG8bGtxx4hNGoliS2EIdssIM78sKgnCeKm9MnAilExu0f
 wn7Bfu9Vki1y2bsfQptEF8fyNrxgpFFhTgjyXC4dNcO67LlZevkmiM6xp8hjTBVLHZVh5ku
 S63SiuVeACDd16asgAiKAfHefIw7T3CtHSHwYGsVvbDAtj9jOmYIKGD5Swr8CAJp3oPaaoJ
 gTT3JoFqEXNrfRuX8pa9vNZjhYeMJoCix9LH8atYGrjWDrp3n4N7zJOgQcbY/ekkyazT+Hd
 wAY9QT0nQpORX8GtmtHNTiSJfZKeQU1+Phlro7EMATdVl7qHPiNEP3x3bLJw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=saltyming.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=saltyming.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1505A48945
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:27:34 +0000 (UTC)
Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7013410E2E5
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net;
 c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791071145;
	x=1791675945; bh=hxN7kjCEhLnn1+Ezysc3TnjEFzT6AYEfF7E3Sz1y6Gg=; b=TxJeh66/vM
	x5EYFw/Vg6L39o7mEDaj1RUAz+z+eeiosizglHDzEa2vOimurYyXuQ31XbiMFtj3hq/SShZiE3V
	D82n36AY20CE4/UbnkcNPAIgbI9q+95DIqu7AbZClLtAvdlR8ats2pwIkl/EaUiON/17hoUZZ36
	dd7ZItCKdwue4kKA/g6QnMUvVvupCJbutbLnJ1f1WndBpaMQi++NrXCG+o5zqg/T5s4BwmS2+ZG
	x5vPlWcbyVdQwaKO+Iis6qpmiVxeefu+F5H9HxCNq7OUOf/pQpHT/nCfwxkYdShDxKoU1KbbDgz
	BTbHJg4xp6aBevAJFT0XEvRm4qhy0EvA==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id c20494d6-2986-4f94-ae89-a3b351de38a6
	for <nouveau@lists.freedesktop.org>; Sat, 3 Oct 2026 23:45:31 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none,
 av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC PATCH 1/2] drm/nouveau/pmu/gt215: add graphics engine load
 counters
Date: Sun,  4 Oct 2026 08:45:20 +0900
Message-ID: <20261003234520.69573-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003223420.77993-1-hamin@saltyming.net>
References: <20261003223420.77993-1-hamin@saltyming.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: hamin@saltyming.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: GH6AMBBWTTCOIECZ2T3KQNNPRTB3T7HC
X-Message-ID-Hash: GH6AMBBWTTCOIECZ2T3KQNNPRTB3T7HC
X-Mailman-Approved-At: Sun, 04 Oct 2026 13:27:28 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Aaron Kling <webgeek1234@gmail.com>,
 Hamin Sung <hamin@saltyming.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GH6AMBBWTTCOIECZ2T3KQNNPRTB3T7HC/>
Archived-At: 
 <https://lore.freedesktop.org/20261003234520.69573-1-hamin@saltyming.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The PDAEMON in GT215, GT216, GT218 and MCP89 has idle counters that
count PMU clock cycles depending on the state of a selected set of
engine idle signals.  Nothing in nouveau uses them on these GPUs;
gk20a_devfreq.c drives the same counter block on Tegra.

Add nvkm_pmu_perfmon_init() and nvkm_pmu_perfmon_read() and implement
them for these GPUs: one counter counts every cycle, a second one the
cycles during which the graphics engine is not idle, and reading returns
and clears both.  The counters are only programmed once
nvkm_pmu_perfmon_init() is called, so nothing changes for existing
users.

The next patch uses them to select performance levels through devfreq.

Link: https://envytools.readthedocs.io/en/latest/hw/pm/pdaemon/counter.html
Assisted-by: Claude:claude-opus-5-5 sparse # max effort
Assisted-by: Claude:claude-fable-5-1 # max effort, review
Signed-off-by: Hamin Sung <hamin@saltyming.net>
---
Sorry for the duplicate copies of the cover letter, and of the two
nouveau fixes I sent with it: my mail server delivered each of them
twice to most recipients.

 .../gpu/drm/nouveau/include/nvkm/subdev/pmu.h |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/pmu/base.c    | 29 ++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c   | 40 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/priv.h    |  5 +++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h
index f57a3a5a288d..de844e69a5e6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h
@@ -39,6 +39,8 @@ int nvkm_pmu_send(struct nvkm_pmu *, u32 reply[2], u32 process,
 		  u32 message, u32 data0, u32 data1);
 void nvkm_pmu_pgob(struct nvkm_pmu *, bool enable);
 bool nvkm_pmu_fan_controlled(struct nvkm_device *);
+int nvkm_pmu_perfmon_init(struct nvkm_pmu *pmu);
+int nvkm_pmu_perfmon_read(struct nvkm_pmu *pmu, u32 *busy, u32 *total);
 
 int gt215_pmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pmu **);
 int gf100_pmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pmu **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
index e556b1905702..fb51db6a2ca3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -51,6 +51,35 @@ nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
 		pmu->func->pgob(pmu, enable);
 }
 
+/*
+ * Set up the PMU counters that nvkm_pmu_perfmon_read() samples.  PMU
+ * initialisation resets the PMU, so this has to be repeated after resume.
+ */
+int
+nvkm_pmu_perfmon_init(struct nvkm_pmu *pmu)
+{
+	if (!pmu || !pmu->func->perfmon.init)
+		return -ENODEV;
+
+	pmu->func->perfmon.init(pmu);
+	return 0;
+}
+
+/*
+ * Return the number of PMU clock cycles that passed, and how many of them the
+ * graphics engine was busy for, since the previous call or since
+ * nvkm_pmu_perfmon_init(), and restart counting.
+ */
+int
+nvkm_pmu_perfmon_read(struct nvkm_pmu *pmu, u32 *busy, u32 *total)
+{
+	if (!pmu || !pmu->func->perfmon.read)
+		return -ENODEV;
+
+	pmu->func->perfmon.read(pmu, busy, total);
+	return 0;
+}
+
 static void
 nvkm_pmu_recv(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
index 32cee21ed858..37310a8ebe81 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
@@ -260,6 +260,44 @@ gt215_pmu_init(struct nvkm_pmu *pmu)
 	return 0;
 }
 
+/*
+ * PDAEMON idle counters.  Each one has a mask of engine idle signals at
+ * 0x10a504, a cycle count at 0x10a508 (bit 31 clears it) and a mode at
+ * 0x10a50c: bit 0 counts cycles in which all masked signals are set, bit 1
+ * cycles in which they are all clear, and both together count every cycle.
+ * Idle signal bit 0 is the graphics engine.
+ */
+#define GT215_PMU_COUNTER_TOTAL 0
+#define GT215_PMU_COUNTER_GR    1
+
+static void
+gt215_pmu_perfmon_init(struct nvkm_pmu *pmu)
+{
+	struct nvkm_device *device = pmu->subdev.device;
+
+	nvkm_wr32(device, 0x10a504 + GT215_PMU_COUNTER_TOTAL * 0x10, 0x00000000);
+	nvkm_wr32(device, 0x10a50c + GT215_PMU_COUNTER_TOTAL * 0x10, 0x00000003);
+	nvkm_wr32(device, 0x10a508 + GT215_PMU_COUNTER_TOTAL * 0x10, 0x80000000);
+
+	nvkm_wr32(device, 0x10a504 + GT215_PMU_COUNTER_GR * 0x10, 0x00000001);
+	nvkm_wr32(device, 0x10a50c + GT215_PMU_COUNTER_GR * 0x10, 0x00000002);
+	nvkm_wr32(device, 0x10a508 + GT215_PMU_COUNTER_GR * 0x10, 0x80000000);
+}
+
+static void
+gt215_pmu_perfmon_read(struct nvkm_pmu *pmu, u32 *busy, u32 *total)
+{
+	struct nvkm_device *device = pmu->subdev.device;
+
+	*busy = nvkm_rd32(device, 0x10a508 + GT215_PMU_COUNTER_GR * 0x10);
+	*total = nvkm_rd32(device, 0x10a508 + GT215_PMU_COUNTER_TOTAL * 0x10);
+	nvkm_wr32(device, 0x10a508 + GT215_PMU_COUNTER_GR * 0x10, 0x80000000);
+	nvkm_wr32(device, 0x10a508 + GT215_PMU_COUNTER_TOTAL * 0x10, 0x80000000);
+
+	*busy &= 0x7fffffff;
+	*total &= 0x7fffffff;
+}
+
 const struct nvkm_falcon_func
 gt215_pmu_flcn = {
 };
@@ -278,6 +316,8 @@ gt215_pmu = {
 	.intr = gt215_pmu_intr,
 	.send = gt215_pmu_send,
 	.recv = gt215_pmu_recv,
+	.perfmon.init = gt215_pmu_perfmon_init,
+	.perfmon.read = gt215_pmu_perfmon_read,
 };
 
 static const struct nvkm_pmu_fwif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
index 2d0a8fa6f196..880a7785589a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
@@ -30,6 +30,11 @@ struct nvkm_pmu_func {
 	void (*recv)(struct nvkm_pmu *);
 	int (*initmsg)(struct nvkm_pmu *);
 	void (*pgob)(struct nvkm_pmu *, bool);
+
+	struct {
+		void (*init)(struct nvkm_pmu *pmu);
+		void (*read)(struct nvkm_pmu *pmu, u32 *busy, u32 *total);
+	} perfmon;
 };
 
 extern const struct nvkm_falcon_func gt215_pmu_flcn;
-- 
2.55.0


