Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE349C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 09:33:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6702710E336;
	Fri, 11 Sep 2026 09:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="Y2fuVcjz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B256941E2B;
	Fri, 11 Sep 2026 09:16:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789118178;
 b=I4fNOeVd3NjK5WihNy9gXjZBOBQ1pTDL8BmgSliZQlG/F/EnfkUUFrlTHaxjvy7VoAhSQ
 izh89auTRsSbcMixcoEWIcHUff+8YQ/ml85ng27HVbz2g+/vewlVL87hnIfZ3nZpZrwXq11
 iGBjm1Nmf+Hri8ub9Q1lkvKeIfWjdv4VQ3azwDXXOCpQ8V9VPHl7MGzZAtFGQH74KsajSWg
 HWCDn5UyEBXdwL9WVbq9VWOJy3EivD4ItuKZhTJwzkmzQMWIQM4gdftSfOTM8iD/2/ljIOA
 GhKfVWON4VDn45u5SxEaX0JIalh1nyiOYBZVVUjZWgENqztf3BlauV7pU5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789118178; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nl+3kTEA6kG+Ya0Qebsmh5RZwS1Ke2Bdvprd1eODfmg=;
 b=SKoUym/olWiJDeIE9epcN/nU/BkTxDr/0A/esYGPWAcuJgcZXBH/E68E02Q2kT9xpzd8u
 ynOEqUezukwBZk+Asz5WmtnhLpOlQ8TO+y2WJiJ9ZmABk+nzOiq4+POKTNZQlx91GI4O52q
 qRMe+TMi9A/cUMxyabeEyFtHo3z/ltOyiLdAr2eFI6HuA2Tmn27QlkFU5VCruFuCZBRIcUD
 y8Udjsqoq1KZGs9v5KTNRJEQktw4mtCmqdQ5rwWpj1j6HAFIkXYGQMutl3T1aziIclFFf7g
 S9SOKohOu9rIWFw22meoiwlxtBH1Qxi6+pds9JWNSJAd+QXTdblZASwVmLkg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=smail.nju.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=smail.nju.edu.cn
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=smail.nju.edu.cn; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=smail.nju.edu.cn
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E76FD40086
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 09:16:15 +0000 (UTC)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A774D10E047
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1789119215;
	bh=nl+3kTEA6kG+Ya0Qebsmh5RZwS1Ke2Bdvprd1eODfmg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Y2fuVcjz1Vy81NYsvAbLPsvWLWm2BNDuxzjTugP2v2LDSvizsfuzr3YBv1TjG7yG3
	 jq/lHWausqjiTGHao74YtPuLz60DDQwccYO0Me+lOraJOmA0wirSVuD1t/TARlf+D8
	 3Nn6IS++yj50jAc0R+HH3a6/H8kFTKtDKIBO91S8=
X-QQ-mid: esmtpgz12t1789118950ta17ba4e3
X-QQ-Originating-IP: 74Cznb4R1YCb91v6oqvm5/Nsioh1HIbE26jAmimgBZA=
Received: from hepeiyang-vm.wu.lxd ( [36.152.24.170])
	by bizesmtp.qq.com (ESMTP) with
	id ; Fri, 11 Sep 2026 17:29:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8586802869201418434
EX-QQ-RecipientCnt: 9
From: Peiyang He <peiyang_he@smail.nju.edu.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix memory leak in r535_gr_promote_ctx
Date: Fri, 11 Sep 2026 17:28:51 +0800
Message-ID: 
 <DFACFA54B3906F4E+20260911092851.1201981-1-peiyang_he@smail.nju.edu.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OKhYnE1LzMsBFJThBdom6MSL09/zZx+fUTFPK7C0Kk4pBozE8BMIOhJc
	mGKcDWVIvQ4YNZD6P25hWWzECf8xafn0stCUGIlb6rZLRvSvAScwOvbFRONrYVw0KliegIR
	lpOpBqNkJFpnywid4PN5Xx4OosUTpORgK16vYl56ABhEIY5swVnwIJIBY7CG8YWAm2/taDH
	1AEJTdORNDWHVszEezcCzvjDgUEnkY7aVrk9UW58J4YcxUBTvPlZL1ORDCHQzIaH49qpMSx
	dnJSk411pT5ov+iGGw2a2TvER0zWO5cKIgDgGfOi6wqQIkR1Pq4mJjTPg7WH7s/+n3K+QOx
	5iZi+IDVxObf39sxxPuSm9xdT3TFOVn/Pp4U5+pQHry7riFCSSDAadvwoGxgSpaA8sY1KO9
	WQX497ie5sI90BcKKH8L7kdQoU3y5Qwhr9891TE9tAZ899mIkldzfp3ZWCGh1RXGoapGOPI
	D82yea/SFHpWFIaTxJpon/HqJ9EGiGqCCEeuwoBJ3W64qAy4JJeiudgRCdgKCD6x0tJo59Q
	4/wJu08Ip+IJwfpQRQtglgA/e9v5NGAmKh1L+bj98jfSaCAMf4d/UbRK35yfo1FmTX3Kiy4
	rq+6ojeRMuM2foIpdwN6hBitLIDQvsYfqO3QXnDuV2/rS4+g0i3NtzJw8HzTdIM1TnJfHOY
	WTEiXENv0A9PupS36GGgJGOqVPm21TKse9VoOVHxDIHxAt6v5LPIOtUJp2n7XJDhua+RXSK
	/zFFf2FcFZAB6sI9w0sTMucSqQbTAN1eyXPY/aR56jsjYba5qhxmE5/U3fYArzOclBpAHJm
	33KUf6RC3GIe2NExnX0wlGgl1KVqP5WQJK4sXBpQxRT1cet8zcZK52OW2BQlUTtRGM2HDmC
	iEyroqxhShqPU29O3xZNdjzJdcB4oL8B1elUZO/zPuwEvO2B8OAhnxPAJmnaCAo12kMKfPG
	UfzBm26LIV180yMI3gAdlPlvP3TQ96oTKFcyqqDhcjfvycHQquaGw+kmOiSikJjSRTL3WLO
	qNy4usfG2a71pyiwLqVC68Up14klx7HlX3+hSeC0845gDmVgl3
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
Message-ID-Hash: 3ADGHEWVLU6TCXNITWZZ4IXQOAWPR2SK
X-Message-ID-Hash: 3ADGHEWVLU6TCXNITWZZ4IXQOAWPR2SK
X-MailFrom: peiyang_he@smail.nju.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com,
 airlied@redhat.com, Peiyang He <peiyang_he@smail.nju.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ADGHEWVLU6TCXNITWZZ4IXQOAWPR2SK/>
Archived-At: 
 <https://lore.freedesktop.org/DFACFA54B3906F4E+20260911092851.1201981-1-peiyang_he@smail.nju.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_gr_promote_ctx() gets the GPU_PROMOTE_CTX RM control RPC before it
allocates and maps the context buffers. If nvkm_memory_new(),
nvkm_vmm_get_locked(), or nvkm_memory_map() fails, the function returns
without submitting the RPC and leaks the request allocation. The leaked
allocation is a 4KiB GSP message queue element. This leak can be reliably
triggered by a non-root user with access to the nouveau device node,
and repeated leak can lead to a local denial of service.

Found when fuzzing the nouveau driver with a modified Syzkaller:

	BUG: memory leak
	unreferenced object 0xffff888019cb8000 (size 4096):
	comm "syz.6.42", pid 2747, jiffies 4294720158
	hex dump (first 32 bytes):
		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	backtrace (crc 43f743b8):
		kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
		slab_post_alloc_hook mm/slub.c:4597 [inline]
		slab_alloc_node mm/slub.c:4917 [inline]
		__do_kmalloc_node mm/slub.c:5333 [inline]
		__kvmalloc_node_noprof+0x62c/0x9e0 mm/slub.c:6905
		r535_gsp_cmdq_get drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:426 [inline]
		r535_gsp_rpc_get+0x3e/0x230 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:617
		nvkm_gsp_rpc_get drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:281 [inline]
		r535_gsp_rpc_rm_ctrl_get+0x138/0x490 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c:75
		nvkm_gsp_rm_ctrl_get drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:323 [inline]
		r535_gr_promote_ctx+0x1c5/0x1700 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c:68
		r535_gr_chan_new+0x140/0x1c0 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c:159
		nvkm_gr_cclass_new+0x99/0xd0 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c:117
		nvkm_cgrp_ectx_get+0x48a/0x860 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c:82
		nvkm_cgrp_vctx_get+0x252/0xd00 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c:136
		nvkm_chan_cctx_get+0x2ae/0xb70 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:112
		nvkm_uchan_object_new+0x285/0x840 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c:177
		nvkm_ioctl_new+0x378/0x930 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:132
		nvkm_ioctl_path drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:278 [inline]
		nvkm_ioctl+0x286/0x9b0 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:300
		nvif_object_ioctl drivers/gpu/drm/nouveau/nvif/object.c:46 [inline]
		nvif_object_ctor+0x3cc/0x5c0 drivers/gpu/drm/nouveau/nvif/object.c:269
		nouveau_abi16_ioctl_grobj_alloc+0x43f/0x9d0 drivers/gpu/drm/nouveau/nouveau_abi16.c:635
		drm_ioctl_kernel+0x192/0x350 drivers/gpu/drm/drm_ioctl.c:817
		drm_ioctl+0x4f8/0xb40 drivers/gpu/drm/drm_ioctl.c:914

Fix by splitting the original loop in r535_gr_promote_ctx() in two.
The first loop performs all fallible allocation and mapping work.
After the first loop succeeds, allocate the control RPC.
Then use the second loop to fill the promote entries and submit the RPC.

Cc: stable@vger.kernel.org
Fixes: 361c3cd8ae12 ("drm/nouveau/gr/r535: initial support")
Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
Assisted-by: Codex:gpt-5.5
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c | 54 +++++++++++++---------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 034db286d285..8b3474733311 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -47,97 +47,109 @@ r535_gr_chan_dtor(struct nvkm_object *object)
 		nvkm_memory_unref(&grc->mem[i]);
 	}
 
 	nvkm_vmm_unref(&grc->vmm);
 	return grc;
 }
 
 static const struct nvkm_object_func
 r535_gr_chan = {
 	.dtor = r535_gr_chan_dtor,
 };
 
 int
 r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 		    struct nvkm_memory **pmem, struct nvkm_vma **pvma,
 		    struct nvkm_gsp_object *chan)
 {
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_device *device = subdev->device;
 	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
+	int ret;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.subdevice,
-				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
-	if (WARN_ON(IS_ERR(ctrl)))
-		return PTR_ERR(ctrl);
-
-	ctrl->engineType = 1;
-	ctrl->hChanClient = vmm->rm.client.object.handle;
-	ctrl->hObject = chan->handle;
-
+	/* Allocate and map all context buffers before getting the control RPC. */
 	for (int i = 0; i < gr->ctxbuf_nr; i++) {
-		NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY *entry =
-			&ctrl->promoteEntry[ctrl->entryCount];
 		const bool alloc = golden || !gr->ctxbuf[i].global;
-		int ret;
-
-		entry->bufferId = gr->ctxbuf[i].bufferId;
-		entry->bInitialize = gr->ctxbuf[i].init && alloc;
+		const bool nonmapped = alloc && gr->ctxbuf[i].bufferId ==
+			NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP;
 
 		if (alloc) {
 			ret = nvkm_memory_new(device, gr->ctxbuf[i].init ?
 					      NVKM_MEM_TARGET_INST : NVKM_MEM_TARGET_INST_SR_LOST,
 					      gr->ctxbuf[i].size, 1 << gr->ctxbuf[i].page,
 					      gr->ctxbuf[i].init, &pmem[i]);
 			if (WARN_ON(ret))
 				return ret;
-
-			if (gr->ctxbuf[i].bufferId ==
-					NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP)
-				entry->bNonmapped = 1;
 		} else {
 			if (gr->ctxbuf[i].bufferId ==
 				NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP)
 				continue;
 
 			pmem[i] = nvkm_memory_ref(gr->ctxbuf_mem[i]);
 		}
 
-		if (!entry->bNonmapped) {
+		if (!nonmapped) {
 			struct gf100_vmm_map_v0 args = {
 				.priv = 1,
 				.ro   = gr->ctxbuf[i].ro,
 			};
 
 			mutex_lock(&vmm->mutex.vmm);
 			ret = nvkm_vmm_get_locked(vmm, false, true, false, 0, gr->ctxbuf[i].align,
 						  nvkm_memory_size(pmem[i]), &pvma[i]);
 			mutex_unlock(&vmm->mutex.vmm);
 			if (ret)
 				return ret;
 
 			ret = nvkm_memory_map(pmem[i], 0, vmm, pvma[i], &args, sizeof(args));
 			if (ret)
 				return ret;
+		}
+	}
 
+	ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.subdevice,
+				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
+
+	ctrl->engineType = 1;
+	ctrl->hChanClient = vmm->rm.client.object.handle;
+	ctrl->hObject = chan->handle;
+
+	for (int i = 0; i < gr->ctxbuf_nr; i++) {
+		NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY *entry =
+			&ctrl->promoteEntry[ctrl->entryCount];
+		const bool alloc = golden || !gr->ctxbuf[i].global;
+
+		if (!alloc && gr->ctxbuf[i].bufferId ==
+			NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP)
+			continue;
+
+		entry->bufferId = gr->ctxbuf[i].bufferId;
+		entry->bInitialize = gr->ctxbuf[i].init && alloc;
+
+		if (alloc && gr->ctxbuf[i].bufferId ==
+				NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP)
+			entry->bNonmapped = 1;
+
+		if (!entry->bNonmapped)
 			entry->gpuVirtAddr = pvma[i]->addr;
-		}
 
 		if (entry->bInitialize) {
 			entry->gpuPhysAddr = nvkm_memory_addr(pmem[i]);
 			entry->size = gr->ctxbuf[i].size;
 			entry->physAttr = 4;
 		}
 
 		nvkm_debug(subdev,
 			   "promote %02d: pa %016llx/%08x sz %016llx va %016llx init:%d nm:%d\n",
 			   entry->bufferId, entry->gpuPhysAddr, entry->physAttr, entry->size,
 			   entry->gpuVirtAddr, entry->bInitialize, entry->bNonmapped);
 
 		ctrl->entryCount++;
 	}
 
 	return nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.subdevice, ctrl);
 }
 
 int
 r535_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *chan, const struct nvkm_oclass *oclass,
-- 
2.43.0
