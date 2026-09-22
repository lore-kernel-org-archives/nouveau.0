Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57645C982FA
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 01:25:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0110710EEF0;
	Wed, 23 Sep 2026 01:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="jn7xbqPn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 627B348540;
	Wed, 23 Sep 2026 01:07:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790125669;
 b=0NdTAVB7TTANbwWUkdoFH4DqBAOKPRE9J8UMgjHB+CWOfBGRRiBKj21svcbEyXbBV/LpE
 ajbxi1nUgJxeGbobQeM8+fWwc62HSJPkcs2iLSVP/k8TkQQAEUH5kraQWEOmTNcIHQ40ihH
 Y0F9MDt36uBLZCyMhDvH+Qb/Mmb05ftfGwx/Z8p8xhr69UzJ0JS86Ogye5/jCGNtsS28Ucc
 gjwc88d5rW6gI9p9950R28xwqcRCxJKz+QlCKHbK1yebTXVMGRr7e2SsFMpcTxVm5hV7aOK
 Io7fpSRtuHHE5vcwxp0XDvwAXMN1gkFWuGcuWlWDNfjfm/De9ovpX6eyQgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790125669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vIrYC04odE5pQ6R2UASoUz5BjmqK1y0jkv+Mfufb6E0=;
 b=tGeBzHvUfQ6AheJVSwUo1wOWUCVNXb3fjDQdYZJ+hmLu+sxVw0Npp6aZzHwiy+g9EqncV
 Vv8NjDJmzAEj+RFeP0yB7LFCq6j59gS4zedYGfClU1NrX2jCFVVj4mgljq3jJqxU5UduJ4w
 StlltsjX0sCIxfxenwnZLXh0e5HBgmL3vr1GcBFU6AtGjvBxcuMNBaNaK2MVIKQGpTtaILV
 BsxRyqqbQTk7VT6EIUa4yP3ZznrbeRBt2s/KvKJHDvWaueavfRTyW/Rq2e3cPgqPLLWBTxQ
 ftzZxwoD1+DAupjMTY2CKgWOIHn+utOhTHtZMGubUu6GwzD2d8YArnIdukcw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yahoo.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yahoo.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yahoo.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yahoo.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2639E48507
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 21:36:02 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC9110EE95
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790114030; bh=vIrYC04odE5pQ6R2UASoUz5BjmqK1y0jkv+Mfufb6E0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=jn7xbqPnQ2Zxclef1bVG7cRNL8OGC8HR8riDqdKLGuLa8QGfPKH4TcecbuewbaymUyFBic+TEP5liC6z0C7bvVyh5RZiBbo2ZIlAecnHqP69xK4SR8TzwpGgMVg5tXdaw38/bdVhZyc9olblEEHvvIgP2+jMa6V6x2UC8SjepvN4Z5CR/hVO/uREGm194ib+uoKZwRc84SYzVj2LN05ZleNGtFsjl369E+BC9m4eBhc22C4PWeqmOQycotBTlzjaJvxAiZGNZLwp4nR9MBvI/do7ftp7nyxpdn/ZRUeoMaYpsK7ZuLXBkfbh3zWf+Rz3giiF8JzrUjC4XFWIx4PPvA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790114030; bh=qcDq1gJ7sVa+fGCvq/9f4ARlJ2M7zxUf/W+PL78hCUu=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=s3Pc4RXaN7nBXOMu3NU4hVL4znscXvU/2vAywKTibnR77iSEUsNh19BDr4w5LgMdNpD/9JqQaBLrNGbEfatKjx79RjUzDH8a0EVkvUDodn+IeZmQDP++YsvcqSnf8A7fKxLUglJgrNNCcpanXq9yLbvMMC/C1Ymf/WiAuAfp9xipEDg7dgjMDIgbdC2T+Y463r9S45su9AC132dSWJuFqourFyddTsxAsNsvuYHGPmpUjm49hAiCxFbyfn/v3mG2/TMsyutPhuzKnSaTBc6HPdCcVUsn1l16ek6OcCO9oEwdOjdrnIwyZOjuntVTeVROLVbS8vk2w9luNVqndYQilA==
X-YMail-OSG: 2VTOBIMVM1l0bWV1okvsMthTuuDcRsgLzdYcjZjGLIl5r7eXAKfNx75OXCE_R3W
 qwh1lyJ.eEZq7UuZyXSTkjb_UEsidzL3Gbm99PYrYPS99QI6rCwx333NRVMFv_gekLeaAfUnET.n
 G2DMQJk9dzGfxwl0fRMiOWhSrtDrRqVKVgkZ45Ms3OkmijJm7R882En0U4hzdq..qRF5lslI5smL
 ki.zMULODIrTdpA.Fp87axoAsSbkYZgoOko5kpnAi2sDGze2_veNB9vdK505grhOWDQyoXjKjN.v
 _3_VWvvs2c69z1rbChmqtr3GB9_qXVWyX862ohqiLjIqskELgm_WthDzQM7HqiLk7C8OWbMOZ.qI
 sxzIviVeLiMQfljssZg_1MsY7eGwZeO2vWcUBxVpSK4KDn7D2ucTuGwB3vv8iD5.J4l9UI8.jlD4
 hkChu3PgKTXd56QGq_jvvHiw11GurPH5Xs4Ng1T3BdBK95YabQDFtmr9rFTK1gQYFwY8B0gJbWF4
 2AY1PDoo3aMggwcBCvbRyUzI0N1q.iVN3lj3pyZ6.fuX8_V7OeEXe.8aTTu1MOydPYIwnxVyVmrC
 iOYdYmevu61qtpcHonE1kQldZB9Hy9UMF9X._DYgpDvW7Xt4lnkEu_YlrvQOaWksdUBeQszxwDnZ
 N_tEsCd6lg_juL4CfG0Na3swPQ1BwpNkZAyDjwB9bXh5Apt3vOfziIasjnvvz_ZzoMygXrCnbutx
 hU.ke_ps90NyqVyn5sFfrgQ_n3nPRjFdX8xC9zcnqed7ABmiFQ8XfhDqZ9ln0r19gYY4yqPpasYa
 FIxb0tsE61h3zElt9UAYLW8Yxq8lgDZbbO6lIqh3zbcUwN_5oDEgsflVR8ouEjwZKriWa5VbpDFN
 mHoOKk9_jsRXK1dC9JBINZWYBIw0VnuI7D67FFnGzlVsyrZsfhIC.bq3PEsgTMy0bh2u9uxvkjGL
 dWNvPkTI5PW_ntj3bZo3eWfe1lD4_soZziuxvci_IFub8CCylJOqhMlFShTazzvtoOO3etC0Y_3h
 DctAliCt_KCNUMP4tkBBbo7j_AHxK0Xtzs588w8Gem65w_SPAx2Tud41wJZ4b3XVF8dXrs0UQWdt
 XR53m1tzSs6wIeOwFMPXmyPNRN63QW5XUPUkd0BH8msmFXrnqKj4yRQy14y4AgOe9OD0yp5jBs71
 Kftfs8I0ipi__KEFGk50UhyXsZNFKC17OdxK1dKnT9LhF94kH9aEV6gsaQ4ITeuYJBOJsWeGRQxM
 o5k1rG4XVUxtYV2UH7O_6jSDZ.UorLTrOdOaucB8ItW3f7hrM5eWCyzMWAkQbnmpycDKb5K2GEq9
 WL8t6G0blgNSzaM.W70BjZmVHhNtVKEX7AbfKQNWiIHSteu0pxcPL3zghS2ew_n6FpLFl27uH8rG
 dUTlypE1XyBRc5E0yeDBpUmAcwKWdJJUv8LO6s4fYv.57ZQRdo5fjsUq4rAkfzHDqKtWwOIG5Iol
 LI3v4B10cTXzxnxqeQJkE8AvC9sWQYZAg_3mdFUIi5DWQftQPyz5fOX9226DUUIE7hVBdFhQgiP5
 0Xk_PMxSkuth_NqLPA2v9kPMD5bL_.EPYktBMb.R1zlFuuGQf15kJolJqLOiQA1BS5GSkcqa325a
 qRM460p6RamQBAgUxFtTdIjUsyYZXE.o.p.Ntj.7oDW5.1JV1rsXP3HAR4_Vv7ZXFzjy2lExR9.y
 SuOUqHTiWZohuGIOjKebACqMPOE.MrDzEgQDKerMFOgpfTRKf8KSWX.gJxUBr5dPmPrvSNsy428J
 rsTvb8_dz7q.GXDh08DIiMyM588UpJg63bMYqC6ivJvRsrTdDbtj6PS.cT.FdK58YuINz1Kto3Fb
 Kf5xsLcJAt30SianJ5TiUmtgdSZr9RH.PnNx8FeUOSeoBFOJH5qJ7c2X5C19QpiNmVod.MYZ6xhn
 aN7vRcdyouOfhaBcGhWrW1NRYHEcb4qG31natQw_IZgDFEZyvOaoN84Ke5u6cWqFtnH3SzP.7Na.
 ZTKhYnx2EGyh2r3Kg9S1XKrXSWQmHEu1C2Q--
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 861e9fb3-a5f6-4f2f-8a4a-845190a185ec
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-101 with HTTP;
 Tue, 22 Sep 2026 21:53:50 +0000
Received: from dip68.lsn.bf1.yahoo.com ([67.195.177.77])
          by hello (SMTP) with SMTP ID 98779d167a59bfbe653b3ebdee112417;
          Tue, 22 Sep 2026 21:53:44 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/nouveau: program head output conversion for limited
 range and YCbCr
Date: Tue, 22 Sep 2026 18:53:32 -0300
Message-ID: <20260922215336.612239-3-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
References: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: MLU42ZPHIRHZZWM67TWTML7VLTJS26JD
X-Message-ID-Hash: MLU42ZPHIRHZZWM67TWTML7VLTJS26JD
X-Mailman-Approved-At: Wed, 23 Sep 2026 01:07:46 +0000
CC: nouveau@lists.freedesktop.org, dakr@kernel.org,
 Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MLU42ZPHIRHZZWM67TWTML7VLTJS26JD/>
Archived-At: 
 <https://lore.freedesktop.org/20260922215336.612239-3-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Turing and later display classes the final head colour stage is
programmed through HEAD_SET_PROCAMP, the OCSC1 matrix and the output
clamp ranges.  Nouveau only wrote PROCAMP, hardcoded to full-range RGB,
and left OCSC1 and the clamps untouched, so the head could only ever
emit full-range RGB.

Carry an output colour space and a limited-range flag in the head atom
and program all three from it in headc57d_procamp(): full-range RGB
disables OCSC1 and opens the clamps, limited-range RGB and YCbCr load the
matching BT.601/BT.709/BT.2020 limited-range matrix and clamp to 16-235
(16-240 for chroma).  The matrices are the ITU-R coefficients scaled to
limited range, with the register values NVIDIA's open NVKMS uses on the
same classes.

Re-send procamp whenever the output conversion changes on an active head,
and reset it to full-range RGB when the encoder state is recomputed.
Nothing selects anything else yet, so there is no functional change.

Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  2 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  3 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 74 +++++++++++++++++++--
 4 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index c34a42ea9ac4..64be784be335 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -112,6 +112,8 @@ struct nv50_head_atom {
 			u16 cos:12;
 			u16 sin:12;
 		} sat;
+		u8 colorspace:2;	/* HEAD_SET_PROCAMP_COLOR_SPACE */
+		bool limited:1;		/* limited quantization range */
 	} procamp;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b183e1865bf5..b216db61330c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -463,8 +463,11 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 	if (ret)
 		return ret;
 
-	if (crtc_state->mode_changed || crtc_state->connectors_changed)
+	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
 		asyh->or.bpc = connector->display_info.bpc;
+		asyh->procamp.colorspace = 0; /* RGB */
+		asyh->procamp.limited = false;
+	}
 
 	/* We might have to reduce the bpc */
 	nv50_outp_atomic_fix_depth(encoder, crtc_state, conn_state);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 6a3a93de0cbf..7b94c881e8bb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -370,6 +370,9 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
 				if (armh->base.depth != asyh->base.depth)
 					asyc->set.dither = true;
 			}
+			if (armh->procamp.colorspace != asyh->procamp.colorspace ||
+			    armh->procamp.limited != asyh->procamp.limited)
+				asyh->set.procamp = true;
 		} else {
 			if (asyc)
 				asyc->set.mask = ~0;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index f1e9f02d177c..9b5c02c86fc9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -81,21 +81,87 @@ headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 	return 0;
 }
 
+/* OCSC1 coefficients converting the head's RGB output to limited range,
+ * indexed by HEAD_SET_PROCAMP_COLOR_SPACE.  The three rows produce the
+ * red/Cr, green/Y and blue/Cb channels, the last column is the offset,
+ * and values are two's complement with 16 fractional bits.
+ *
+ * These are the ITU-R BT.601, BT.709 and BT.2020 RGB to Y'CbCr matrices
+ * (identity for RGB) scaled by 219/256 for Y' and R'G'B' and by 224/256
+ * for CbCr, with 16/256 and 128/256 offsets.  The register values are the
+ * ones NVIDIA's open NVKMS programs on the same display classes, which
+ * differ from a direct derivation by at most 4 in the last place.
+ */
+static const u32
+headc57d_ocsc1_limited[4][12] = {
+	[NVC57D_HEAD_SET_PROCAMP_COLOR_SPACE_RGB] = {
+		0x00db04, 0x000000, 0x000000, 0x001000,
+		0x000000, 0x00db04, 0x000000, 0x001000,
+		0x000000, 0x000000, 0x00db04, 0x001000,
+	},
+	[NVC57D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_601] = {
+		0x007000, 0x1fa234, 0x1fedc8, 0x008000,
+		0x00417c, 0x008090, 0x0018f8, 0x001000,
+		0x1fda34, 0x1fb5cc, 0x007000, 0x008000,
+	},
+	[NVC57D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_709] = {
+		0x007000, 0x1f9a44, 0x1ff5bc, 0x008000,
+		0x002e90, 0x009ca4, 0x000fd0, 0x001000,
+		0x1fe654, 0x1fa9a8, 0x007000, 0x008000,
+	},
+	[NVC57D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_2020] = {
+		0x007000, 0x1f9900, 0x1ff700, 0x008000,
+		0x003988, 0x00947c, 0x000cfc, 0x001000,
+		0x1fe0b8, 0x1faf44, 0x007000, 0x008000,
+	},
+};
+
 static int
 headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
+	const u8 colorspace = asyh->procamp.colorspace;
+	const bool limited = asyh->procamp.limited;
 	const int i = head->base.index;
+	u32 lo = 0x000, y_hi = 0xfff, c_hi = 0xfff;
 	int ret;
 
-	if ((ret = PUSH_WAIT(push, 2)))
+	/* 12-bit clamp codes: 16..235 for Y' and R'G'B', 16..240 for CbCr. */
+	if (limited) {
+		lo = 0x100;
+		y_hi = 0xeb0;
+		c_hi = colorspace == NVC57D_HEAD_SET_PROCAMP_COLOR_SPACE_RGB ? 0xeb0 : 0xf00;
+	}
+
+	ret = PUSH_WAIT(push, 20);
+	if (ret)
 		return ret;
 
-	//TODO:
 	PUSH_MTHD(push, NVC57D, HEAD_SET_PROCAMP(i),
-		  NVDEF(NVC57D, HEAD_SET_PROCAMP, COLOR_SPACE, RGB) |
+		  NVVAL(NVC57D, HEAD_SET_PROCAMP, COLOR_SPACE, colorspace) |
 		  NVDEF(NVC57D, HEAD_SET_PROCAMP, CHROMA_LPF, DISABLE) |
-		  NVDEF(NVC57D, HEAD_SET_PROCAMP, DYNAMIC_RANGE, VESA));
+		  NVVAL(NVC57D, HEAD_SET_PROCAMP, DYNAMIC_RANGE,
+			limited ? NVC57D_HEAD_SET_PROCAMP_DYNAMIC_RANGE_CEA :
+				  NVC57D_HEAD_SET_PROCAMP_DYNAMIC_RANGE_VESA));
+
+	PUSH_MTHD(push, NVC57D, HEAD_SET_CLAMP_RANGE_GREEN(i),
+		  NVVAL(NVC57D, HEAD_SET_CLAMP_RANGE_GREEN, LOW, lo) |
+		  NVVAL(NVC57D, HEAD_SET_CLAMP_RANGE_GREEN, HIGH, y_hi),
+
+				HEAD_SET_CLAMP_RANGE_RED_BLUE(i),
+		  NVVAL(NVC57D, HEAD_SET_CLAMP_RANGE_RED_BLUE, LOW, lo) |
+		  NVVAL(NVC57D, HEAD_SET_CLAMP_RANGE_RED_BLUE, HIGH, c_hi));
+
+	if (!limited) {
+		PUSH_MTHD(push, NVC57D, HEAD_SET_OCSC1CONTROL(i),
+			  NVDEF(NVC57D, HEAD_SET_OCSC1CONTROL, ENABLE, DISABLE));
+		return 0;
+	}
+
+	PUSH_MTHD(push, NVC57D, HEAD_SET_OCSC1CONTROL(i),
+		  NVDEF(NVC57D, HEAD_SET_OCSC1CONTROL, ENABLE, ENABLE));
+	PUSH_MTHD(push, NVC57D, HEAD_SET_OCSC1COEFFICIENT_C00(i),
+		  headc57d_ocsc1_limited[colorspace], 12);
 	return 0;
 }
 
-- 
2.53.0

