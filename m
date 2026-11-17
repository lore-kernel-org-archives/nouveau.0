Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9790606A32C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qyTbe6qK
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 065B010F98A;
	Tue, 17 Nov 2026 21:44:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4950E494D4;
	Tue, 17 Nov 2026 21:24:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794950693;
 b=DUDapoZtKsbLL4rNuIYqT/y1ZPAuWW1Q2viv2/IbSK4KCd09h4nhYCj4ZRGWFwv6TfXiO
 vnFtEf3movOh0FloCkHcPP9MGluyz77UyPkOkkHG/zM11eBXtQ5xYn69hOElLqdv5cbaNm7
 woxIEcgbSt3TrKqxhDCc70MqqNfqgkvY3TRaiTEO2hK28GjETDAKBIQ7Y3xsODku6+tZyZn
 zY7xRrpPV9sttKUOO43Y59Y1lGxYdHNnXb9wdQvB+iI5S3668W4LX5vWtBEtpHLfUchvD/i
 5ICsscI+AwCBuDQT9Rzmd+MOx1FMz9pPBQCvVH+3JwcMkfoeCAuyiace5CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794950693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
 b=EdAkd7ohOxd6avxxuZMY7/SVqD6xZGgxqRzhZDNJpVlaBsTJupKWLmMDF5oGjM8rlJ6pu
 qusHF+w2rXSDAH5p35X2xlf4Q9iYqOUBxe1cqGClPm5IhzroUB1O11EBg5ige5CmpIz1M7v
 Hs4r4mQSb3mKPdRQXLP7j6J4gIaZmJ0XC+5GvR3daYaSpANd4BlRhuel4lrtoAVDe00yPNF
 8I3lZ4bUUdJMh1anpMb27KLpM0UfVSND8ggp2tcnneuxBTAfUb5TmQkSekfVaZdOZiF39Uv
 RbMA3k/tNsEjaC7SVANC8rhiGW53JotEKE1BOrTOn79g/uMwnGf4INPqb4ew==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 524FC494CA
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:24:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDD9410E6AC
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:44:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so3508945e9.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951876; x=1795556676;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
        b=qyTbe6qKddiVdyIr72d/Nrh0YmmiOP4bQoI0aELPTwd9j3BTSSUEgkA9BTIzZGaVxR
         HC7/hJYMVp9qm0LO9II0qiK6nVPxvjj4kZgLw1ZicVz5XD9qd9iHKqgNr0y1Nbl5SSyi
         T4kWQgCe1O6VYndI4ypS9dlv9wWyeCRwLynN78zF+pdUkChEVeMhI9r1d1lUM0eYNVeJ
         qmh9npp3BLvE+6DyR+Ts16P8Fc5mXow+8Zs754/JAvj94bypDGKNvcpsSJxL6KuxWgOq
         TJVfrsNsFXY8zSXHYc6DJ1kk9Po3ozRL9nzmRLNx+tBR8USV+iFbC3Fg87NJBRGRRS8s
         nmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951876; x=1795556676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
        b=JVhwuh3DeujmOh61RZ9Kgjv1W6a076bL1h/9efLQj8SD/bKyrvi7RtHu0f7cvQQ8lK
         2tnK7v8Q3ab2aos+x01Vsh3id9zplbUqOFKxVQmS1yYzLfTfxb7u639jQPU1q+ezBW5n
         JxILyeY19QwQeAsc/Iy1AUFRjUmb/4QcipM7ehwmHKzYol2o1H7CWmRMXD919qhke41G
         lRQWRrGERmJPexFRR8qe14rcMKj76dwsfPDWGMnWFTC2gpSmE1/EwHWcdYIdJ7mt1IHt
         N2XjFoQlloNiX7M3DDjMdKPEHxD8LO24aofm/G8OzjGv28PhROdF1AUcDDzodZvdHBJZ
         EBuA==
X-Forwarded-Encrypted: i=1;
 AL+hErFqnYpSrHcLdyFJ4gy4vWA8seDiZViYfGJom1jtQ/5QUJ7EkQSA3U061aFRY+RK3mN/xsGZ3L81@lists.freedesktop.org
X-Gm-Message-State: APuU4Z914FRk6WAtFHraXD5BHkE2vO5r2bvW07AsrL07O0gDLjYaexaL
	VYor/N4bIHo19SO5HDZAch4kcTmei/5RShEytszDps8Su3PrT3tkg4id
X-Gm-Gg: AYBFou1ij3FjgIJMItJU/fX0hSw2Ilk96qCVbPonGXLclKK5oCaphCbhFTEXkZn4QDL
	QPJQfHqXFvT1A0/kn/4qeW/rNP65lJiw8ta4byl/Svg+s1klj67hhcYZ/L0cIRszgd5qKmeZmfC
	R8Q7blLgySzIbGcsG7mWflmUyBPyGBoWyrrU4v+L8j2K1zPAsraMoGeOpiR2whVQw7wOupmv2hC
	ZqcJ2rJSMoJ0WZ1DwOKILxUKcwCN41NDi4ew6cAfqH8nORwpbDQj6qAZg1ubGqTjvFTQdTpPomY
	WnJeGpq2Wnr4RVXP8XOdWSzO6dn/VHuRmt0xafjtQhlYP/1o/UTupNKH9rnwnhujliETNwJ9Kcu
	0LTiLxIkF5hQo5tWVyyMKAIK1ddEq0IwUvvye6PJ56G/nn7XXrwWwq3QLHmBaj5kjM5OfBR5dZz
	Fvy9M47BmbJEVEb+Th6J6FO2eEgyFwXkcK3tuKB6lu6lJEDD0T23gbxhdFFG2Q/A5m3PV+SzbtF
	8hlkShF5AEhfHcXey83TeFfdPSl1wKofPMSkR0rqNGnPWK367kQwgjdDCTP6u/0+e2SjWoCN7Rr
	8Xtbmz3jMqXQjhM+qf4qw5hRo7yzUuMT37oNFn5WM0G4QtBQ5kcOHDImMKS+yQ==
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id
 5b1f17b1804b1-4bb7da3ad9fmr9007535e9.28.1794951876264;
        Tue, 17 Nov 2026 13:44:36 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:35 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/nouveau/bar: take the GSP-RM flush pointer from the
 BAR2 io_mapping
Date: Wed, 18 Nov 2026 01:43:51 +0400
Message-ID: <20261117214352.337961-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AB2R7F2RGXON3BXMCK3E24BJXEO7SGFG
X-Message-ID-Hash: AB2R7F2RGXON3BXMCK3E24BJXEO7SGFG
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Thomas Andersen <phomes@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AB2R7F2RGXON3BXMCK3E24BJXEO7SGFG/>
Archived-At: 
 <https://lore.freedesktop.org/20261117214352.337961-3-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

r535_bar_new_() maps the first page of BAR2 with ioremap(), to flush
BAR2 writes with a read while flushFBZero is not mapped. On x86 with
PAT, a mapping that overlaps an existing one gets its type. The instmem
io_mapping is created later, so with GSP-RM it is also mapped UC- and
its writes are not write-combined.

Take the flush pointer from the io_mapping. A new bar2.oneinit hook
sets it up once the BAR2 page tables are bootstrapped and the
io_mapping exists.

Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem handling")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |  8 +++++
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
index a1fa1b0c8954..6950801d2e03 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
@@ -133,6 +133,12 @@ gf100_bar_oneinit(struct nvkm_bar *base)
 		if (ret)
 			return ret;
 
+		if (bar->base.func->bar2.oneinit) {
+			ret = bar->base.func->bar2.oneinit(&bar->base);
+			if (ret)
+				return ret;
+		}
+
 		bar->base.subdev.oneinit = true;
 		nvkm_bar_bar2_init(bar->base.subdev.device);
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
index d0168e0b78fb..5774bfa8d96d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
@@ -16,6 +16,7 @@ struct nvkm_bar_func {
 	void (*init)(struct nvkm_bar *);
 
 	struct {
+		int (*oneinit)(struct nvkm_bar *);
 		void (*init)(struct nvkm_bar *);
 		void (*fini)(struct nvkm_bar *);
 		void (*wait)(struct nvkm_bar *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index fae08ac3b18c..9b907d9e80af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -24,9 +24,11 @@
 #include <core/mm.h>
 #include <subdev/fb.h>
 #include <subdev/gsp.h>
-#include <subdev/instmem.h>
+#include <subdev/instmem/priv.h>
 #include <subdev/mmu/vmm.h>
 
+#include <linux/io-mapping.h>
+
 #include "nvrm/bar.h"
 #include "nvrm/rpcfn.h"
 
@@ -65,6 +67,25 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u8 page_shift, u64 pdbe)
 	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
+static int
+r535_bar_bar2_oneinit(struct nvkm_bar *bar)
+{
+	struct io_mapping *iomap = nv50_instmem_bar2_iomap(bar->subdev.device->imem);
+
+	if (!iomap)
+		return -ENOMEM;
+
+	/* BAR2 writes are flushed by a read. While flushFBZero is not mapped,
+	 * read the first page of the BAR2 io_mapping.
+	 */
+	bar->flushBAR2PhysMode = io_mapping_map_wc(iomap, 0, PAGE_SIZE);
+	if (!bar->flushBAR2PhysMode)
+		return -ENOMEM;
+
+	bar->flushBAR2 = bar->flushBAR2PhysMode;
+	return 0;
+}
+
 static void
 r535_bar_bar2_fini(struct nvkm_bar *bar)
 {
@@ -155,7 +176,7 @@ r535_bar_dtor(struct nvkm_bar *bar)
 	nvkm_memory_unref(&bar->flushFBZero);
 
 	if (bar->flushBAR2PhysMode)
-		iounmap(bar->flushBAR2PhysMode);
+		io_mapping_unmap(bar->flushBAR2PhysMode);
 
 	kfree(bar->func);
 	return data;
@@ -178,6 +199,7 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	rm->bar1.fini = r535_bar_bar1_fini;
 	rm->bar1.wait = r535_bar_bar1_wait;
 	rm->bar1.vmm = hw->bar1.vmm;
+	rm->bar2.oneinit = r535_bar_bar2_oneinit;
 	rm->bar2.init = r535_bar_bar2_init;
 	rm->bar2.fini = r535_bar_bar2_fini;
 	rm->bar2.wait = r535_bar_bar2_wait;
@@ -191,12 +213,6 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	}
 	*pbar = bar;
 
-	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, NVKM_BAR2_INST), PAGE_SIZE);
-	if (!bar->flushBAR2PhysMode)
-		return -ENOMEM;
-
-	bar->flushBAR2 = bar->flushBAR2PhysMode;
-
 	gf100_bar(*pbar)->bar2_halve = true;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 22b0fde6ba34..1b4be4b1f0bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -436,6 +436,14 @@ nv50_instmem_dtor(struct nvkm_instmem *base)
 	return imem;
 }
 
+struct io_mapping *
+nv50_instmem_bar2_iomap(struct nvkm_instmem *base)
+{
+	struct nv50_instmem *imem = nv50_instmem(base);
+
+	return imem->iomap.size ? &imem->iomap : NULL;
+}
+
 static const struct nvkm_instmem_func
 nv50_instmem = {
 	.dtor = nv50_instmem_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index b423f01f5fcd..88990adda766 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -4,6 +4,8 @@
 #define nvkm_instmem(p) container_of((p), struct nvkm_instmem, subdev)
 #include <subdev/instmem.h>
 
+struct io_mapping;
+
 struct nvkm_instmem_func {
 	void *(*dtor)(struct nvkm_instmem *);
 	int (*oneinit)(struct nvkm_instmem *);
@@ -27,6 +29,7 @@ int nv50_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero,
 int nv50_instobj_wrap(struct nvkm_instmem *, struct nvkm_memory *vram,
 		      struct nvkm_memory **bar2);
 void *nv50_instmem_dtor(struct nvkm_instmem *base);
+struct io_mapping *nv50_instmem_bar2_iomap(struct nvkm_instmem *base);
 
 void nvkm_instmem_ctor(const struct nvkm_instmem_func *, struct nvkm_device *,
 		       enum nvkm_subdev_type, int, struct nvkm_instmem *);
-- 
2.56.1

