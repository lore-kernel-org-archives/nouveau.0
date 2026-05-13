Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC1BCD37AC
	for <nouveau@archiver.kernel.org>; Wed, 13 May 2026 17:50:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23610EFC0;
	Wed, 13 May 2026 17:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mmkw8lNP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6ABA141C4E;
	Wed, 13 May 2026 17:37:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778693846;
 b=mj3GMdi8zzTvhj1HS8oLzm4sfnkxEGWT/n8Jd1Cx0XEmRdYIe20fubKv9XHPKH3zcXylb
 xctDSTJjHQUeZzxy1oi1mPnqKscmuHDqWgyRObE/UKaAbtk6i9MVGB41C5GYCTWs9fv4/Ch
 IkhmfCktjEH6+ZzVVVNXhTWByp3csifRlRkKH67uc38xSsXxBnmrqrEhJNKV+wykU0Edg8+
 RWCVl+euAp0Edw7pQ5TCRrZKip31HqTEaHg58/Nb9T0Bsp7oRlX3xqTdO6rNfppjADUXYcv
 iG3kJDTvwX8FggyD5Jb8zbuideXDFuLJzdZEeIIVl3nwFlmmfRTZ9W3WrmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778693846; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=obOaH/rodhS+A66+h4JJFqrYSWRTiEApCWTJ41LIyfU=;
 b=pyISHm2HluXly3QeBUFVlc1YKZEM4jGc/TI3yIJCwXvkqVkeyZZ3kk8NSRZVcTAz9rfX1
 7QK8Hgk/qYjCSVQWK5lZqy4Q4btqDA4oL2SooSspgiHCUFCLNvtauf0n5yBa7H/kQPRp6sO
 fBcrIl1kzoTyqH2bb2/M2r3gZ56BHGQrLZ2siQLw+G0FuJHnjJ8LL/BKH3/LBo6P7Q0Bph7
 sW/bQx2IT7k0M6s6FJ+rIB3bRJQpA+EBZTwYKZ9rIWb6dNNim7g3UUvTGghvuXdg4dqTALr
 UNdGAENZ1tkhCNq0C+qMFsC5seYxic568dzZ4JVfo3Py/LzFdWFQl3UYF6Ig==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EB09440564
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:37:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9BA10EFAA
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:50:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-44c44af71f8so685296f8f.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 13 May 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778694618; x=1779299418;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obOaH/rodhS+A66+h4JJFqrYSWRTiEApCWTJ41LIyfU=;
        b=Mmkw8lNPnjGqp5HVg+folcw33t72+Y/PVDzwnbAW4lDgYsALL8GrKliU9OrgIT4jp2
         bUhNsTwA2Pia6EHI6GMZk5+M4bN9nol5/X8cqQbmOvj86b1IdHFfny1TV13lQHt3PXF6
         mveBJZ1fDw158ltQnNdNJX1m4szEbbm+l8/lxtyVu6j5u2TqVWWI+H/D560zJAKl0k7O
         ypj6x0cUI+A3mVHsdAgAmrpll68RB8/CLJQj+fhXMO9vMfUqoIiYDijyW37CW378VF7z
         EOOgiNTxzB3JEUnftWSPqLNVenyNE9JQD2TlpEU1dDUAxRVj+9sXdFjI3WRwl3hcqmEe
         m1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694618; x=1779299418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obOaH/rodhS+A66+h4JJFqrYSWRTiEApCWTJ41LIyfU=;
        b=RIOpGx41GgdQCXN6GkfwmgIRnQ2kg6H/bmYwp9mWYYLEJdIt+XQE2rRYvgjpEr0NFA
         L1vmwy7d5tFsfLGtjk9RtFLokBWlQrb8kVOuKpDz0sIlqYqcbK2fZQf2Mj5STy4qGt+a
         w8Hh/StHxZvpAu2DiEWmE8ddpx8I/I7raUbj0bAYT9U7mSDMmwpv2hLVQksTYL9BCNQ/
         N5tE21Li3jx96Oipab4JP+I42HBNHDMqvQe7MzXDSsGs7/7rzIqbCqUsnDdrt8zCQjey
         HOw+qbe2SuyB62YTjbD7a4jdCbMjVnxdybRdRBK7Bt25XTH9oFAeRcTriTFFpgQvU0P0
         RsBw==
X-Gm-Message-State: AOJu0YxBpfeWrUFFSNPzgmCRJc6H61cV35Me4t+4bk5GWaHJCMYrVbh9
	l7emb4GFH5QmnpXUVMyDcWbokuz6L0QeEcf2oF2XMeFRKbMmBJge7rVGNwXJQPryhAw=
X-Gm-Gg: Acq92OH3n2uEGkjS0i0Zh5hdoBuKQlhwi+XlVPTFSZPPDkiRTabJWJPrPDORJJukzwc
	9c8o2+/e/qrpfIMYtg/bgT1HWn19f/PphLb+DMZm0m/o3aYiQ1WDor7xT7tvJW1lq/q4DdntBJJ
	lw/CsnMeULMg3xOMcCdIWWP1U54ddgnFGZK1mBKkHIwHQsGkK5ify7SeS9Q+3VHfmG9Ok29cZR4
	PW3xX2hPsY2NqHG+ElNzU7Vs43k2yBwje49thwn/P49pQRQS4nArt1HJQ0gaTj8W6OhFiyrRMeq
	bT72QU26/TfWqrRnYsPw50zZ4nLxfWzrtb+0B6j70jDYBE+4maTrGzinxSSEi3r6tDmFvuAhGGA
	5LOX27mtqE6nRP1a6WAw1gdxjUY7q8JR+x7dzgGK5E1AjDqK/AbzTzBFNBK0SewofX7JxoItNU/
	jcnsUx4pOwh0Ljy9VnW67G/D+iaf/zRLcq+0B9mBBQbhglwXtD33AvJ6feUclPm32A7hJ+YYl4p
	L6/kxY66JLET70=
X-Received: by 2002:a05:600c:1d06:b0:48a:5758:7999 with SMTP id
 5b1f17b1804b1-48fc9a34a11mr37886085e9.4.1778694618016;
        Wed, 13 May 2026 10:50:18 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-214.um39.pools.vodafone-ip.de. [109.193.28.214])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13a7sm486730f8f.29.2026.05.13.10.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:50:17 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/fifo: add recovery path for Tesla
 cache_error/dma_pusher
Date: Wed, 13 May 2026 19:50:13 +0200
Message-ID: <20260513175014.96599-3-marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513175014.96599-1-marek@czernohous.de>
References: <20260513175014.96599-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AVWZPIGWSPWIJWBT74FHTYK3ZB4SO2D4
X-Message-ID-Hash: AVWZPIGWSPWIJWBT74FHTYK3ZB4SO2D4
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AVWZPIGWSPWIJWBT74FHTYK3ZB4SO2D4/>
Archived-At: 
 <https://lore.freedesktop.org/20260513175014.96599-3-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tesla / NV50 family chipsets (nv50, g84, g94, g98, mcp77, mcp79),
FIFO fault handling in nv04_fifo_intr_cache_error and
nv04_fifo_intr_dma_pusher logs the fault and resets hardware registers
but leaves the offending channel running. Compared to Fermi+ which
calls nvkm_chan_error from nvkm_runl_rc, Tesla has no escalation:
silent state corruption is possible, no telemetry beyond dmesg, and
repeated faults on the same channel keep firing forever.

Add a shared recovery helper nv04_fifo_recover() that both intr
handlers call after the existing logging+reset sequence. It implements
two tiers:

  Tier-1 (per-fault): nvkm_chan_get_chid + nvkm_chan_error(chan, true).
  The atomic chan->errored short-circuit means re-faults on the same
  channel are no-op; other channels are unaffected.

  Tier-2 (sliding-window): per-fifo lock-protected ring of fault
  timestamps. When the count within fifo_wedge_window_ms reaches
  fifo_wedge_count, schedule a workqueue job that emits a
  drm_dev_wedged_event with DRM_WEDGE_RECOVERY_REBIND. The
  drm_dev_wedged_event call cannot run from IRQ context because
  kobject_uevent_env may sleep; the workqueue indirection handles this.

Tracepoints (nouveau:fifo_chan_killed, nouveau:fifo_dev_wedged) provide
zero-overhead telemetry consumable via perf or bpftrace.

Module parameters fifo_wedge_count (default 10, range 0..32, 0=Tier-2
disabled) and fifo_wedge_window_ms (default 60000, range 100..600000)
allow tuning without rebuild.

Validated on Apple Mac mini Late 2009 (NVAC, MCP79).

Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 .../drm/nouveau/include/nvkm/engine/fifo.h    |  12 ++
 .../include/trace/events/nouveau_fifo.h       |  58 +++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  29 +++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |   4 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  10 ++
 .../drm/nouveau/nvkm/engine/fifo/recover.c    | 121 ++++++++++++++++++
 8 files changed, 238 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
index 96c16cfccf16..7c27b4c8a212 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
@@ -55,6 +55,17 @@ void nvkm_chan_put(struct nvkm_chan **, unsigned long irqflags);
 
 struct nvkm_chan *nvkm_uchan_chan(struct nvkm_object *);
 
+#define NVKM_FIFO_WEDGE_RING_MAX 32
+
+struct nvkm_fifo_wedge {
+	spinlock_t       lock;
+	u32              count;                                  /* aktuelle Fenster-Tiefe */
+	ktime_t          ts[NVKM_FIFO_WEDGE_RING_MAX];          /* Ring von Timestamps */
+	u32              head;                                   /* Ring-Head */
+	struct work_struct work;                                /* schedules drm_dev_wedged_event */
+	atomic_t         wedged;                                /* Tier-2 already fired? */
+};
+
 struct nvkm_fifo {
 	const struct nvkm_fifo_func *func;
 	struct nvkm_engine engine;
@@ -86,6 +97,7 @@ struct nvkm_fifo {
 
 	spinlock_t lock;
 	struct mutex mutex;
+	struct nvkm_fifo_wedge wedge;
 };
 
 void nvkm_fifo_fault(struct nvkm_fifo *, struct nvkm_fault_data *);
diff --git a/drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h b/drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
new file mode 100644
index 000000000000..46d043a82850
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM nouveau
+
+#if !defined(_TRACE_NOUVEAU_FIFO_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_NOUVEAU_FIFO_H
+
+#include <linux/tracepoint.h>
+#include <drm/drm_device.h>
+
+TRACE_EVENT(nouveau_fifo_chan_killed,
+	TP_PROTO(struct drm_device *dev, u32 chid, u32 fault_type, u64 info),
+	TP_ARGS(dev, chid, fault_type, info),
+	TP_STRUCT__entry(
+		__string(devname, dev_name(dev->dev))
+		__field(u32, chid)
+		__field(u32, fault_type)
+		__field(u64, info)
+	),
+	TP_fast_assign(
+		__assign_str(devname);
+		__entry->chid = chid;
+		__entry->fault_type = fault_type;
+		__entry->info = info;
+	),
+	TP_printk("dev=%s chid=%u fault=%s info=0x%llx",
+		__get_str(devname),
+		__entry->chid,
+		__entry->fault_type == 0 ? "CACHE_ERROR" : "DMA_PUSHER",
+		__entry->info)
+);
+
+TRACE_EVENT(nouveau_fifo_dev_wedged,
+	TP_PROTO(struct drm_device *dev, u32 fault_count, u32 window_ms),
+	TP_ARGS(dev, fault_count, window_ms),
+	TP_STRUCT__entry(
+		__string(devname, dev_name(dev->dev))
+		__field(u32, fault_count)
+		__field(u32, window_ms)
+	),
+	TP_fast_assign(
+		__assign_str(devname);
+		__entry->fault_count = fault_count;
+		__entry->window_ms = window_ms;
+	),
+	TP_printk("dev=%s wedged after %u faults in %u ms",
+		__get_str(devname),
+		__entry->fault_count,
+		__entry->window_ms)
+);
+
+#endif /* _TRACE_NOUVEAU_FIFO_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/nouveau/include/trace/events
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE nouveau_fifo
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 517ff2c31dce..c62b7fc3a1d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -22,6 +22,8 @@
  * Authors: Ben Skeggs
  */
 
+#define CREATE_TRACE_POINTS
+
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -74,6 +76,9 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
+#include <engine/fifo.h>
+#include <trace/events/nouveau_fifo.h>
+
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
 			"DRM_UT_DRIVER",
@@ -111,6 +116,18 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
 static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
+MODULE_PARM_DESC(fifo_wedge_count,
+	"FIFO faults within window before drm_dev_wedged_event "
+	"(0=disable Tier-2, max 32, default 10)");
+unsigned int nouveau_fifo_wedge_count = 10;
+module_param_named(fifo_wedge_count, nouveau_fifo_wedge_count, uint, 0400);
+
+MODULE_PARM_DESC(fifo_wedge_window_ms,
+	"Sliding-window width in milliseconds for fifo_wedge_count "
+	"(default 60000)");
+unsigned int nouveau_fifo_wedge_window_ms = 60000;
+module_param_named(fifo_wedge_window_ms, nouveau_fifo_wedge_window_ms, uint, 0400);
+
 static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
@@ -1495,6 +1512,18 @@ nouveau_drm_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
+	if (nouveau_fifo_wedge_count > NVKM_FIFO_WEDGE_RING_MAX) {
+		pr_warn("nouveau: fifo_wedge_count=%u exceeds max %u; clamping\n",
+			nouveau_fifo_wedge_count, NVKM_FIFO_WEDGE_RING_MAX);
+		nouveau_fifo_wedge_count = NVKM_FIFO_WEDGE_RING_MAX;
+	}
+	if (nouveau_fifo_wedge_window_ms < 100 ||
+	    nouveau_fifo_wedge_window_ms > 600000) {
+		pr_warn("nouveau: fifo_wedge_window_ms=%u out of range; resetting to 60000\n",
+			nouveau_fifo_wedge_window_ms);
+		nouveau_fifo_wedge_window_ms = 60000;
+	}
+
 	nouveau_module_debugfs_init();
 
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
index 376e9c3bcb1a..1ff29753731d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
@@ -5,6 +5,7 @@ nvkm-y += nvkm/engine/fifo/chan.o
 nvkm-y += nvkm/engine/fifo/chid.o
 nvkm-y += nvkm/engine/fifo/runl.o
 nvkm-y += nvkm/engine/fifo/runq.o
+nvkm-y += nvkm/engine/fifo/recover.o
 
 nvkm-y += nvkm/engine/fifo/nv04.o
 nvkm-y += nvkm/engine/fifo/nv10.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 9dd924694306..a61183fa38af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -337,6 +337,8 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
 	struct nvkm_runl *runl, *runt;
 	struct nvkm_runq *runq, *rtmp;
 
+	nv04_fifo_wedge_fini(fifo);
+
 	if (fifo->userd.bar1)
 		nvkm_vmm_put(nvkm_bar_bar1_vmm(engine->subdev.device), &fifo->userd.bar1);
 	nvkm_memory_unref(&fifo->userd.mem);
@@ -390,6 +392,7 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, struct nvkm_device *device,
 	fifo->timeout.chan_msec = 10000;
 	spin_lock_init(&fifo->lock);
 	mutex_init(&fifo->mutex);
+	nv04_fifo_wedge_init(fifo);
 
 	return nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fifo->engine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
index fa13cd55b593..cb81941ecccd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -345,6 +345,8 @@ nv04_fifo_intr_cache_error(struct nvkm_fifo *fifo, u32 chid, u32 get)
 				   chid, chan ? chan->name : "unknown",
 				   (mthd >> 13) & 7, mthd & 0x1ffc, data);
 			nvkm_chan_put(&chan, flags);
+			nv04_fifo_recover(fifo, chid, NV04_FAULT_CACHE_ERROR,
+					  ((u64)mthd << 32) | data);
 		}
 	}
 
@@ -410,6 +412,8 @@ nv04_fifo_intr_dma_pusher(struct nvkm_fifo *fifo, u32 chid)
 	}
 	nvkm_chan_put(&chan, flags);
 
+	nv04_fifo_recover(fifo, chid, NV04_FAULT_DMA_PUSHER, state);
+
 	nvkm_wr32(device, 0x003228, 0x00000000);
 	nvkm_wr32(device, 0x003220, 0x00000001);
 	nvkm_wr32(device, 0x002100, NV_PFIFO_INTR_DMA_PUSHER);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index fff1428ef267..bf551906dcd4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -83,6 +83,16 @@ void nv04_chan_start(struct nvkm_chan *);
 void nv04_chan_stop(struct nvkm_chan *);
 void nv04_eobj_ramht_del(struct nvkm_chan *, int);
 
+/* Recovery helper for Tesla cache_error/dma_pusher (recover.c). */
+#define NV04_FAULT_CACHE_ERROR	0
+#define NV04_FAULT_DMA_PUSHER	1
+
+void nv04_fifo_recover(struct nvkm_fifo *fifo, u32 chid, u32 fault_type, u64 info);
+void nv04_fifo_wedge_init(struct nvkm_fifo *fifo);
+void nv04_fifo_wedge_fini(struct nvkm_fifo *fifo);
+extern unsigned int nouveau_fifo_wedge_count;
+extern unsigned int nouveau_fifo_wedge_window_ms;
+
 int nv10_fifo_chid_nr(struct nvkm_fifo *);
 
 int nv50_fifo_chid_nr(struct nvkm_fifo *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c
new file mode 100644
index 000000000000..14c0eebf7040
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * nv04_fifo_recover - shared recovery helper for Tesla cache_error and
+ * dma_pusher fault paths.
+ *
+ * Tier-1: kill the offending channel via nvkm_chan_error.
+ * Tier-2: after a configurable burst of faults within a sliding time
+ *         window, request a device-wide drm_dev_wedged_event so userspace
+ *         can rebind the driver.
+ */
+
+#include "priv.h"
+#include "chan.h"
+
+#include <core/device.h>
+#include <subdev/timer.h>
+
+#include <linux/workqueue.h>
+#include <linux/jiffies.h>
+#include <linux/ktime.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_device.h>
+
+#include "nouveau_drv.h"
+#include <trace/events/nouveau_fifo.h>
+
+static struct drm_device *
+nv04_fifo_drm_device(struct nvkm_fifo *fifo)
+{
+	struct nvkm_device *device = fifo->engine.subdev.device;
+	struct nouveau_drm *drm = dev_get_drvdata(device->dev);
+
+	return (drm && drm->dev) ? drm->dev : NULL;
+}
+
+void
+nv04_fifo_recover(struct nvkm_fifo *fifo, u32 chid, u32 fault_type, u64 info)
+{
+	struct drm_device *drm_dev = nv04_fifo_drm_device(fifo);
+	struct nvkm_chan *chan;
+	unsigned long flags;
+	ktime_t now, cutoff;
+	u32 i, count;
+
+	if (drm_dev)
+		trace_nouveau_fifo_chan_killed(drm_dev, chid, fault_type, info);
+
+	chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
+	if (chan) {
+		nvkm_chan_error(chan, true);
+		nvkm_chan_put(&chan, flags);
+	}
+
+	if (nouveau_fifo_wedge_count == 0)
+		return;
+
+	now = ktime_get();
+	cutoff = ktime_sub_ms(now, nouveau_fifo_wedge_window_ms);
+
+	spin_lock_irqsave(&fifo->wedge.lock, flags);
+
+	/* Insert current first, then purge expired and count survivors. */
+	fifo->wedge.ts[fifo->wedge.head] = now;
+	fifo->wedge.head = (fifo->wedge.head + 1) % NVKM_FIFO_WEDGE_RING_MAX;
+
+	count = 0;
+	for (i = 0; i < NVKM_FIFO_WEDGE_RING_MAX; i++) {
+		if (!ktime_to_ns(fifo->wedge.ts[i]))
+			continue;
+		if (ktime_before(fifo->wedge.ts[i], cutoff))
+			fifo->wedge.ts[i] = 0;
+		else
+			count++;
+	}
+	fifo->wedge.count = count;
+
+	if (count >= nouveau_fifo_wedge_count)
+		schedule_work(&fifo->wedge.work);
+
+	spin_unlock_irqrestore(&fifo->wedge.lock, flags);
+}
+
+static void
+nv04_fifo_wedge_work(struct work_struct *work)
+{
+	struct nvkm_fifo_wedge *w = container_of(work, struct nvkm_fifo_wedge, work);
+	struct nvkm_fifo *fifo = container_of(w, struct nvkm_fifo, wedge);
+	struct drm_device *drm_dev = nv04_fifo_drm_device(fifo);
+	u32 fault_count;
+
+	if (atomic_xchg(&w->wedged, 1) != 0)
+		return; /* already wedged this cycle */
+
+	if (!drm_dev)
+		return;
+
+	fault_count = w->count;
+
+	dev_info(drm_dev->dev,
+		 "nouveau: fifo wedged after %u faults in %u ms\n",
+		 fault_count, nouveau_fifo_wedge_window_ms);
+
+	trace_nouveau_fifo_dev_wedged(drm_dev, fault_count,
+				      nouveau_fifo_wedge_window_ms);
+
+	drm_dev_wedged_event(drm_dev, DRM_WEDGE_RECOVERY_REBIND, NULL);
+}
+
+void
+nv04_fifo_wedge_init(struct nvkm_fifo *fifo)
+{
+	spin_lock_init(&fifo->wedge.lock);
+	INIT_WORK(&fifo->wedge.work, nv04_fifo_wedge_work);
+	atomic_set(&fifo->wedge.wedged, 0);
+}
+
+void
+nv04_fifo_wedge_fini(struct nvkm_fifo *fifo)
+{
+	cancel_work_sync(&fifo->wedge.work);
+}
-- 
2.53.0

