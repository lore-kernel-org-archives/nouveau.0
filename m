Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3887CCA5FCE
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0FC10EA6D;
	Sun,  4 Oct 2026 13:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=saltyming.net header.i=@saltyming.net header.b="NDiZXtCN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5135448963;
	Sun,  4 Oct 2026 13:27:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120452;
 b=kpm4RNLx+WMjmKur9mPmyGfE6ouhcVxCtMsT8gtilsaUrMmiYYxC7tnGRAe8cNxvsaqIz
 bI1mluaU1OfMgYZnC3aP5i4mabuTkqqjM9Mah7FL0MILMtYXIJvRu4ddPwCUaWrcEZyTmwd
 DwbfbZSyi5r7KTwKKM+4SXYxtFBHIDswGu19o5uX6AY2tJjiQK0/2FonAa3542oW2lI62gA
 ZKPNkHQ4T/0my0hSNcypVTHY+VrGa6p1fI7YIGNZFZV7xdfAwdn6Zpg+KMNDC50y37F3/op
 yAYhwnzG9qru/vP/6ryJiGL5Pvpxi8ctuY5qsISKTcnG7Yz0eH9t3p61zMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120452; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SpMElC1YAVODIxrpp6eHGEleRiGF9sRORp3rjubAuCw=;
 b=asiXwqCK9zP33B+MK3TLPwYTYyibdFzjrbr0XxQV/1NLpv+rMSNat7xdbZQynW41sHdcP
 noUyBQI0zGIKOa3/FM2Bab269B4Rp6rWKELPCAy+3Erkdy/Mb5OmMbIvc2oUDVH0M9qQ4e/
 7uTxEmr3ULr+wFZpYR/hh4fVsIKMRtI9FFu8ncfHO4qygifX31u1ZkMTFUIIzCbzoslYUuq
 RC9hDooTpBjiWgM5mFWEhvHMvYXReIw0IYwyUwAjpolOHqSxBFuwjecoeqZWobW6oGv5e3J
 jJWTdYG8gOamm2Wkh98htjH5C7E8T+nCJ5A0HhJLX7YZERK1L1ApyYXqWpDw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A67AE48945
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:29:14 +0000 (UTC)
Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E60A610E12C
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net;
 c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791071247;
	x=1791676047; bh=SpMElC1YAVODIxrpp6eHGEleRiGF9sRORp3rjubAuCw=; b=NDiZXtCNXe
	zNSJabaD8tyb2mF86b9YyPOlxkFC5ITgyUufCJFRBN2Q7akTFvGXcEvtrTPufAZdYH6Mmpfesvw
	/lMATDB7VXyE8fWcVVyBUGSbzQrFsH4ixaMMsivnOaIDW7NM75Rq1Ra5KDOzQzFuVBuuu0hJbMh
	avWfHw3aW4hwQtmKFlkEgK40LTdrzXstwxLI+4Bt10GQWLop4OIOa8raLsRHybsxw2tJGLQGsT8
	JhAmuO6hR1fJvIXQK0v2RgZUIvBfpeRf9PFW5j5VrtnNURC/EkJ/iOnX2fHFupXPAKOh9pnalr0
	w6Ixbr2lZlXmixl9zRUwW4nT4QWcgh+A==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id 495c0566-7eb4-4b50-a543-d264d0948dd1
	for <nouveau@lists.freedesktop.org>; Sat, 3 Oct 2026 23:47:18 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none,
 av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC PATCH 2/2] drm/nouveau: select GT21x performance levels by load
 through devfreq
Date: Sun,  4 Oct 2026 08:45:32 +0900
Message-ID: <20261003234532.73345-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003223420.77993-1-hamin@saltyming.net>
References: <20261003223420.77993-1-hamin@saltyming.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: hamin@saltyming.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 4MB66DRCTLT64LBCWY363V7YQZFHDTRO
X-Message-ID-Hash: 4MB66DRCTLT64LBCWY363V7YQZFHDTRO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4MB66DRCTLT64LBCWY363V7YQZFHDTRO/>
Archived-At: 
 <https://lore.freedesktop.org/20261003234532.73345-1-hamin@saltyming.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Booting with nouveau.config=NvClkMode=auto puts the clock subdev in its
automatic ("perfmon") mode, in which nvkm_pstate_work() programs the
pstate held in clk->astate.  Only the GK20A PMU code ever changes astate,
so on GT21x automatic mode stays at the highest pstate, which
nvkm_clk_init() selects.

When automatic mode is selected and the PMU can measure graphics engine
load, register a devfreq device with one OPP per pstate, keyed by its
core clock, and let the simple_ondemand governor drive astate from the
PMU counters added in the previous patch.  Moving astate rather than the
user pstate keeps the existing precedence: a fixed pstate written to the
debugfs pstate file still wins, because nvkm_pstate_work() only consults
astate while the user state is automatic.

Each pstate change on these GPUs pauses PFIFO and may reclock memory, so
the governor samples every 100 ms and keeps the current pstate while the
load stays between 30% and 50%.  Above 50% it selects the highest pstate,
at 30% or below the lowest one at which the load would be at most 40%.
The frequency reported to it is the OPP closest to the measured core clock:
simple_ondemand rounds its target up to the next OPP, so a PLL reading
slightly above the vbios value would otherwise make it step up.  Sampling
uses a delayed timer, because the 31-bit PMU counters could wrap while a
deferrable one waits for an idle CPU.

devfreq_suspend_device() only stops the monitor, and sysfs or PM QoS
requests can still run the callbacks while runtime PM or vga_switcheroo
has powered the GPU down.  A mutex and a suspended flag keep them away
from the hardware until the device has been resumed, and the cur_freq
attribute, which is read without devfreq->lock, reports the pstate core
clock cached at the last sample or pstate change.  The PMU counters are
set up again on resume, after the object tree.

The devfreq device is only registered at load time: selecting "auto"
through debugfs later keeps running at the highest pstate, as before.
Other NvClkMode settings are not affected, and without CONFIG_PM_DEVFREQ
nothing changes.  Select the simple_ondemand governor whenever devfreq is
enabled, so that a built-in nouveau does not have to load it as a module
before the root filesystem is mounted; the Tegra devfreq code needs it
too.

Assisted-by: Claude:claude-opus-5-5 sparse # max effort
Assisted-by: Claude:claude-fable-5-1 # max effort, review
Signed-off-by: Hamin Sung <hamin@saltyming.net>
---
 drivers/gpu/drm/nouveau/Kbuild            |   1 +
 drivers/gpu/drm/nouveau/Kconfig           |   1 +
 drivers/gpu/drm/nouveau/nouveau_devfreq.c | 328 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_devfreq.h |  19 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c     |   7 +
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   1 +
 6 files changed, 357 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 385d24530d1e..3fb89452c6cb 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -20,6 +20,7 @@ ifdef CONFIG_X86
 nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
 endif
 nouveau-$(CONFIG_DEBUG_FS) += nouveau_debugfs.o
+nouveau-$(CONFIG_PM_DEVFREQ) += nouveau_devfreq.o
 nouveau-y += nouveau_drm.o
 nouveau-y += nouveau_hwmon.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 3b5757aed9c8..7c57e50bf398 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -29,6 +29,7 @@ config DRM_NOUVEAU
 	select ACPI_VIDEO if ACPI && X86
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select PM_DEVFREQ if ARCH_TEGRA
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND if PM_DEVFREQ
 	help
 	  Choose this option for open-source NVIDIA support.
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_devfreq.c b/drivers/gpu/drm/nouveau/nouveau_devfreq.c
new file mode 100644
index 000000000000..7c999de16754
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_devfreq.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Load-based performance level selection through devfreq.
+ *
+ * In automatic ("perfmon") mode, nvkm_pstate_work() programs the pstate held
+ * in clk->astate.  This registers a devfreq device with one OPP per pstate,
+ * keyed by its core clock, and lets the simple_ondemand governor move astate
+ * according to the graphics engine load measured by the PMU.  A fixed pstate
+ * requested through debugfs keeps taking precedence, as it does over astate
+ * already.
+ */
+#include <linux/devfreq.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/mutex.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+
+#include <nvif/if0001.h>
+
+#include <subdev/clk.h>
+#include <subdev/pmu.h>
+
+#include "nouveau_devfreq.h"
+#include "nouveau_drv.h"
+
+/*
+ * Each pstate change pauses PFIFO, waits for the engines to go idle and may
+ * reclock memory, so sample at a moderate rate and keep the current pstate
+ * while the load stays between UPTHRESHOLD - DOWNDIFFERENTIAL and UPTHRESHOLD.
+ */
+#define NOUVEAU_DEVFREQ_POLL_MS			100
+#define NOUVEAU_DEVFREQ_UPTHRESHOLD		50
+#define NOUVEAU_DEVFREQ_DOWNDIFFERENTIAL	20
+
+struct nouveau_devfreq {
+	struct devfreq *devfreq;
+	struct devfreq_dev_profile profile;
+	struct devfreq_simple_ondemand_data gov_data;
+
+	/*
+	 * Serialises the devfreq callbacks with suspend and resume, so that
+	 * none of them touches the GPU while it may be powered down, and
+	 * protects the members below.
+	 */
+	struct mutex lock;
+	bool suspended;
+	ktime_t last_sample;
+	/* also read without the lock, see nouveau_devfreq_get_cur_freq() */
+	unsigned long cur_freq;
+};
+
+static unsigned long
+nouveau_devfreq_pstate_freq(const struct nvkm_pstate *pstate)
+{
+	return pstate->base.domain[nv_clk_src_core] * HZ_PER_KHZ;
+}
+
+/*
+ * Return the position in clk->states of the pstate whose core clock is closest
+ * to @freq, and store that core clock in @pfreq unless it is NULL.
+ */
+static int
+nouveau_devfreq_pstate(struct nvkm_clk *clk, unsigned long freq,
+		       unsigned long *pfreq)
+{
+	unsigned long best_diff = ULONG_MAX, best_freq = 0;
+	struct nvkm_pstate *pstate;
+	int i = 0, best = 0;
+
+	list_for_each_entry(pstate, &clk->states, head) {
+		unsigned long pstate_freq = nouveau_devfreq_pstate_freq(pstate);
+
+		if (abs_diff(pstate_freq, freq) < best_diff) {
+			best_diff = abs_diff(pstate_freq, freq);
+			best_freq = pstate_freq;
+			best = i;
+		}
+		i++;
+	}
+
+	if (pfreq)
+		*pfreq = best_freq;
+	return best;
+}
+
+/*
+ * Read the core clock and cache the frequency of the pstate it belongs to.  The
+ * PLLs do not always hit the vbios value exactly, and simple_ondemand rounds
+ * its target up to the next OPP, so a raw reading slightly above an OPP would
+ * make it step up.
+ */
+static int
+nouveau_devfreq_update_freq(struct nouveau_devfreq *ndf, struct nvkm_clk *clk)
+{
+	unsigned long freq;
+	int khz;
+
+	khz = nvkm_clk_read(clk, nv_clk_src_core);
+	if (khz < 0)
+		return khz;
+
+	nouveau_devfreq_pstate(clk, khz * HZ_PER_KHZ, &freq);
+	WRITE_ONCE(ndf->cur_freq, freq);
+	return 0;
+}
+
+static int
+nouveau_devfreq_target(struct device *dev, unsigned long *freq, u32 flags)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct nouveau_devfreq *ndf = drm->devfreq;
+	struct nvkm_clk *clk = nvxx_clk(drm);
+	struct dev_pm_opp *opp;
+	int ret = 0;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	mutex_lock(&ndf->lock);
+	/* Nothing to do while suspended: resuming selects the highest pstate. */
+	if (ndf->suspended) {
+		*freq = ndf->cur_freq;
+		goto out_unlock;
+	}
+
+	ret = nvkm_clk_astate(clk, nouveau_devfreq_pstate(clk, *freq, NULL), 0,
+			      true);
+	if (ret)
+		goto out_unlock;
+
+	/* Report the pstate in effect: a fixed one set through debugfs wins. */
+	ret = nouveau_devfreq_update_freq(ndf, clk);
+	if (!ret)
+		*freq = ndf->cur_freq;
+
+out_unlock:
+	mutex_unlock(&ndf->lock);
+	return ret;
+}
+
+static int
+nouveau_devfreq_get_dev_status(struct device *dev,
+			       struct devfreq_dev_status *stat)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+	struct nouveau_devfreq *ndf = drm->devfreq;
+	u32 busy, total;
+	ktime_t now;
+	int ret = 0;
+
+	mutex_lock(&ndf->lock);
+	now = ktime_get();
+	stat->total_time = ktime_to_ns(ktime_sub(now, ndf->last_sample));
+	stat->busy_time = 0;
+	ndf->last_sample = now;
+
+	if (ndf->suspended)
+		goto out_unlock;
+
+	ret = nvkm_pmu_perfmon_read(nvxx_device(drm)->pmu, &busy, &total);
+	if (ret)
+		goto out_unlock;
+
+	ret = nouveau_devfreq_update_freq(ndf, nvxx_clk(drm));
+	if (ret)
+		goto out_unlock;
+
+	/* Nothing counted, or a wrapped counter, gives no load: assume full. */
+	if (total && busy <= total)
+		stat->busy_time = mul_u64_u32_div(stat->total_time, busy, total);
+	else
+		stat->busy_time = stat->total_time;
+
+out_unlock:
+	stat->current_frequency = ndf->cur_freq;
+	mutex_unlock(&ndf->lock);
+	return ret;
+}
+
+/* The cur_freq sysfs attribute calls this without devfreq->lock. */
+static int
+nouveau_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+
+	*freq = READ_ONCE(drm->devfreq->cur_freq);
+	return 0;
+}
+
+void
+nouveau_devfreq_init(struct nouveau_drm *drm)
+{
+	struct nvkm_device *device = nvxx_device(drm);
+	struct device *dev = drm->dev->dev;
+	struct nvkm_clk *clk = device->clk;
+	struct nouveau_devfreq *ndf;
+	struct nvkm_pstate *pstate;
+	unsigned long freq = 0;
+	int ret;
+
+	/*
+	 * Only take over the automatic mode selected through NvClkMode.  Both
+	 * NvClkMode=auto and the NVIF pstate method store this value for it.
+	 */
+	if (!clk || clk->state_nr < 2 ||
+	    (clk->ustate_ac != NVIF_CONTROL_PSTATE_USER_V0_STATE_PERFMON &&
+	     clk->ustate_dc != NVIF_CONTROL_PSTATE_USER_V0_STATE_PERFMON))
+		return;
+
+	/*
+	 * Check for the PMU counters before adding OPPs: on Tegra the OPP table
+	 * of this device belongs to gk20a_devfreq, and the error path below
+	 * would remove its OPPs.
+	 */
+	if (nvkm_pmu_perfmon_init(device->pmu))
+		return;
+
+	/* OPPs are looked up by frequency, pstates by position in the list. */
+	list_for_each_entry(pstate, &clk->states, head) {
+		if (nouveau_devfreq_pstate_freq(pstate) <= freq) {
+			NV_INFO(drm, "devfreq: pstate core clocks not increasing\n");
+			goto err_opp;
+		}
+		freq = nouveau_devfreq_pstate_freq(pstate);
+
+		ret = dev_pm_opp_add(dev, freq, 0);
+		if (ret) {
+			NV_ERROR(drm, "devfreq: failed to add OPP, %d\n", ret);
+			goto err_opp;
+		}
+	}
+
+	ndf = kzalloc_obj(*ndf);
+	if (!ndf)
+		goto err_opp;
+
+	mutex_init(&ndf->lock);
+	ret = nouveau_devfreq_update_freq(ndf, clk);
+	if (ret)
+		goto err_free;
+	ndf->last_sample = ktime_get();
+
+	/* A deferrable timer would let the 31-bit PMU counters wrap when idle. */
+	ndf->profile.timer = DEVFREQ_TIMER_DELAYED;
+	ndf->profile.polling_ms = NOUVEAU_DEVFREQ_POLL_MS;
+	ndf->profile.initial_freq = ndf->cur_freq;
+	ndf->profile.target = nouveau_devfreq_target;
+	ndf->profile.get_dev_status = nouveau_devfreq_get_dev_status;
+	ndf->profile.get_cur_freq = nouveau_devfreq_get_cur_freq;
+	ndf->gov_data.upthreshold = NOUVEAU_DEVFREQ_UPTHRESHOLD;
+	ndf->gov_data.downdifferential = NOUVEAU_DEVFREQ_DOWNDIFFERENTIAL;
+
+	drm->devfreq = ndf;
+	ndf->devfreq = devfreq_add_device(dev, &ndf->profile,
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
+					  &ndf->gov_data);
+	if (IS_ERR(ndf->devfreq)) {
+		NV_ERROR(drm, "devfreq: failed to register, %ld\n",
+			 PTR_ERR(ndf->devfreq));
+		drm->devfreq = NULL;
+		goto err_free;
+	}
+
+	return;
+
+err_free:
+	mutex_destroy(&ndf->lock);
+	kfree(ndf);
+err_opp:
+	dev_pm_opp_remove_all_dynamic(dev);
+}
+
+void
+nouveau_devfreq_fini(struct nouveau_drm *drm)
+{
+	struct nouveau_devfreq *ndf = drm->devfreq;
+
+	if (!ndf)
+		return;
+
+	devfreq_remove_device(ndf->devfreq);
+	dev_pm_opp_remove_all_dynamic(drm->dev->dev);
+	drm->devfreq = NULL;
+	mutex_destroy(&ndf->lock);
+	kfree(ndf);
+}
+
+void
+nouveau_devfreq_suspend(struct nouveau_drm *drm)
+{
+	struct nouveau_devfreq *ndf = drm->devfreq;
+
+	if (!ndf)
+		return;
+
+	/*
+	 * devfreq_suspend_device() only stops the monitor; sysfs and PM QoS
+	 * requests still reach the callbacks, which check ->suspended.
+	 */
+	mutex_lock(&ndf->lock);
+	ndf->suspended = true;
+	mutex_unlock(&ndf->lock);
+
+	devfreq_suspend_device(ndf->devfreq);
+}
+
+void
+nouveau_devfreq_resume(struct nouveau_drm *drm)
+{
+	struct nouveau_devfreq *ndf = drm->devfreq;
+
+	if (!ndf)
+		return;
+
+	mutex_lock(&ndf->lock);
+	/* Resuming the PMU reset its counters, and nvkm_clk_init() the pstate. */
+	nvkm_pmu_perfmon_init(nvxx_device(drm)->pmu);
+	nouveau_devfreq_update_freq(ndf, nvxx_clk(drm));
+	ndf->last_sample = ktime_get();
+	ndf->suspended = false;
+	mutex_unlock(&ndf->lock);
+
+	devfreq_resume_device(ndf->devfreq);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_devfreq.h b/drivers/gpu/drm/nouveau/nouveau_devfreq.h
new file mode 100644
index 000000000000..a9c139c71b38
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_devfreq.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NOUVEAU_DEVFREQ_H__
+#define __NOUVEAU_DEVFREQ_H__
+
+struct nouveau_drm;
+
+#if IS_ENABLED(CONFIG_PM_DEVFREQ)
+void nouveau_devfreq_init(struct nouveau_drm *drm);
+void nouveau_devfreq_fini(struct nouveau_drm *drm);
+void nouveau_devfreq_suspend(struct nouveau_drm *drm);
+void nouveau_devfreq_resume(struct nouveau_drm *drm);
+#else
+static inline void nouveau_devfreq_init(struct nouveau_drm *drm) {}
+static inline void nouveau_devfreq_fini(struct nouveau_drm *drm) {}
+static inline void nouveau_devfreq_suspend(struct nouveau_drm *drm) {}
+static inline void nouveau_devfreq_resume(struct nouveau_drm *drm) {}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b0f9fb10a74d..6ecb2dd997bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -60,6 +60,7 @@
 #include "nouveau_vga.h"
 #include "nouveau_led.h"
 #include "nouveau_hwmon.h"
+#include "nouveau_devfreq.h"
 #include "nouveau_acpi.h"
 #include "nouveau_bios.h"
 #include "nouveau_ioctl.h"
@@ -587,6 +588,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 		pm_runtime_forbid(dev->dev);
 	}
 
+	nouveau_devfreq_fini(drm);
 	nouveau_led_fini(dev);
 	nouveau_dmem_fini(drm);
 	nouveau_svm_fini(drm);
@@ -679,6 +681,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	nouveau_svm_init(drm);
 	nouveau_dmem_init(drm);
 	nouveau_led_init(dev);
+	nouveau_devfreq_init(drm);
 
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_use_autosuspend(dev->dev);
@@ -993,6 +996,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
 	}
 
 	NV_DEBUG(drm, "suspending object tree...\n");
+	nouveau_devfreq_suspend(drm);
 	ret = nvif_client_suspend(&drm->_client, runtime);
 	if (ret)
 		goto fail_client;
@@ -1000,6 +1004,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
 	return 0;
 
 fail_client:
+	nouveau_devfreq_resume(drm);
 	if (drm->fence && nouveau_fence(drm)->resume)
 		nouveau_fence(drm)->resume(drm);
 
@@ -1024,6 +1029,8 @@ nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
 		return ret;
 	}
 
+	nouveau_devfreq_resume(drm);
+
 	NV_DEBUG(drm, "resuming fence...\n");
 	if (drm->fence && nouveau_fence(drm)->resume)
 		nouveau_fence(drm)->resume(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5fc75dc750ed..226567a02d4c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -298,6 +298,7 @@ struct nouveau_drm {
 	/* power management */
 	struct nouveau_hwmon *hwmon;
 	struct nouveau_debugfs *debugfs;
+	struct nouveau_devfreq *devfreq;
 
 	/* led management */
 	struct nouveau_led *led;
-- 
2.55.0


