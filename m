Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD15EC982DF
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D180110F394;
	Fri, 18 Sep 2026 13:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSmR0YbS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 427EB482BD;
	Fri, 18 Sep 2026 12:58:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789736332;
 b=b6Ck/8A8TkVhYHGt/iu70cHeiRuw0p6UvJzTHuJGQykmjdw617gS1FxdJ5b/FYjD392UF
 pNlJwPGDkqmhrW9F03+T5lrwHxS41wCZWNhOfapy196XwZhvh9ignCcuMiEvFU4tcvi+ptc
 ovBYuvr++NU+YIPmRuM6jiz3nif9vI0RAA5REG0QZ42STSiXK/2uzsg7uJsCAyqArv4WybL
 htw580eH+rT5p0rhT8B2ZOsA6NeWMUb2Bc4rkB7tv64hk2q4IuxuSBPhNJB7wkW/LJ2w52h
 D71EEnpold1S7QkqEFOnqzBKPY6D+GuhgPolpjmSQtETeQhEBq33Z3JpYZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789736332; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MWU/Z4Cv9J6Gjygd5g2E8XPN0BiQe/Sbx9hToRJGZ3A=;
 b=IBCojCqP/tnTwKy2SIVKPNnCZggsf8aElxowGjYQk0Bj5DQ1dEr2mmfgiao/0Bv0RjipY
 /2I5tIx75Lm31zn0PQ0W+3xBdgY1/0xnFGoDjjZixRbcyKFDU67b7P1nPtomGzJpb/Lp/HV
 JXyxIPb96Jb1mnwxLZ/226vBepFxuMMp17mbMzDy9VG2SD/NJqwrYUCIB2GkUSKL5nms/3C
 QkK5Xp+ZRAdvsdMRR/5I92XH+IxtRAJ0xA4qJTfzzdlGw7RaKSw1D0kgX1/qFEnv+wDfDaM
 R2UbUTzid3Vf1HgOh75xCJ4+TLuqk3mU2ODWeEwHW66nzLWKLJ6CryjePCvA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A124F482AD
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 12:58:48 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C936410F377
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 13:16:27 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so453781f8f.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737386; x=1790342186;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWU/Z4Cv9J6Gjygd5g2E8XPN0BiQe/Sbx9hToRJGZ3A=;
        b=ZSmR0YbSd/UEw6OSq+XrIAN8mXOop9FW4P/EkTCEZiG6VWSR8mvMDvVn7HT1F4491c
         AMf1gMeqRcU3dCK3o4KljlCS1RttxFUBbrXMvNHr9daHYjV3FHoYbOocPbv9xYzDxqeE
         3dxxEXtHsor78mHmCY5ynpdTORbsTZ+FX+LVGq8AihVzppDRS451DCy1881LZkHkjir7
         xslx3lIuhh4/7TDS/433a5hElq8pLcodM/oGA0CfF3m86AP1vripD5b2NW/FZbxOztoA
         +Pc+30UWcoxqvV+Qef6NTkCIeDnch/sEx2oNtRxWIOAObz6gmVrb2AnTIPXNRa7zU/i9
         gzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737386; x=1790342186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWU/Z4Cv9J6Gjygd5g2E8XPN0BiQe/Sbx9hToRJGZ3A=;
        b=rqH2Lgr6p8KxwCLlzgrNN5Z7li66DSlRv/UI/oyEESmqnWAfQmtc0+IzHNpx8tm7JI
         GquFNoF812SD/rerUj/biusoG1avpBnmqeVZVo2Yro4pWrMPiTFZe3b/qGNt+sFRLXId
         mUXrcNPcsuZOEkd2cxysJT5mLPXiL2+PfLR2RC3vy6GC/o8fxw/Mle4jPRS2Xsx/UX8b
         hSw1TbEiHMZVTANMo1bgrJXQvwUg0IJ48ogdmNVpAULuBugrWwsIPTAJtP69fPJordPu
         QMfBzuO0iIUEIZSQCz+gGsLnHjMCBK/gKnBvPs95qWM0V7QPTSgn6nbQEGTinm/KnLIR
         tw1A==
X-Forwarded-Encrypted: i=1;
 AKwUvByye3crnzp+vzImGQAGnlknn9MNtDV1cJk4Mmfqsb3BMPn/qzL+1eETrBC1QwiNyMtPCDEztojU@lists.freedesktop.org
X-Gm-Message-State: AFuF++nkFOt4/C7tOzPIBxd1/A0PYDRT8eu6TkjtPvB6PZe0K4l6fk1C
	0zwfBlZgZizVXqxtWGpJ+fiMhvXVOIu3+3pyOWIeqYyW3RNVb8Q19j9/
X-Gm-Gg: AYBFou0emBLQ4yM/Z/YJiMrqMVrPJy8+x5g1IA14RQBQmTShwrrDI+r6GYF5+e8AL/J
	A6qHf061EE9N94QjRXsHFzEZdMY/4L662p2NNY8FPU5lRi59Q9o5wo/J8Y/xFf9HcGvuLwxya2S
	rzC7Dg96GGiwSQzZ2MZ1iRAf6KAdiW5jBeiKvD0NvQgnK3/K0Txnr/D6bhhmtebPeU+1ZBy+Ju2
	ngkfrkJxzFjv8oLgUSXKuA/XToufFZ8/i0AVnZb7VKWQnzVS7A4i7LjPDEas47JMiq73ND3Og8n
	+jIaiGGX4ypsN3b2sHX/6ZUfoWeDsV2eQj8+USolctTokJ/5tdR+LdSMMChvFpegnICjGMfoiGA
	3K1hNHE2DK3IZN4zlx/eH0hOxMe4jT2VJM8EM3A9UpeBSeGrBBTaTNIzgXBCx3926QlW45EJH6q
	bxzTadBdS9TTS7C1QfaxMkqYYfD9s+YFftYP5nx517b/w4AebqgrZUAbQ1727QwDtFfxNeeZcOz
	gLwJBfLYVI=
X-Received: by 2002:adf:e19a:0:b0:487:35d:cb0f with SMTP id
 ffacd0b85a97d-4871e216fc4mr3566538f8f.14.1789737386045;
        Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:25 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 3/4] drm/nouveau/device: don't use the pstate cursor after
 the loop
Date: Fri, 18 Sep 2026 15:16:19 +0200
Message-ID: <20260918131620.405133-4-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KLO2QIUGX7P4VDCTFZNIXZV2I6Z2HNKP
X-Message-ID-Hash: KLO2QIUGX7P4VDCTFZNIXZV2I6Z2HNKP
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KLO2QIUGX7P4VDCTFZNIXZV2I6Z2HNKP/>
Archived-At: 
 <https://lore.freedesktop.org/20260918131620.405133-4-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_control_mthd_pstate_attr() looks up the pstate at the index supplied
by userspace by walking clk->states, and then keeps using the
list_for_each_entry cursor after the loop.  This is not triggerable today:
the function already rejects args->v0.state >= clk->state_nr before the
loop, and clk->state_nr is kept in sync with the number of entries on
clk->states, so the lookup always breaks on a real entry.

Should the loop ever run to completion, the cursor would point at the list
head rather than at a pstate, and the pstate->base.domain[] read and the
walk of pstate->list that follow would read past it.  Rather than leave
that trap in place, track whether the entry was found and return -EINVAL if
it was not, like the other lookup failures in this function.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index f2e9a0626..28702741a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -74,6 +74,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	const struct nvkm_domain *domain;
 	struct nvkm_pstate *pstate;
 	struct nvkm_cstate *cstate;
+	bool found = false;
 	int i = 0, j = -1;
 	u32 lo, hi;
 	int ret = -ENOSYS;
@@ -104,10 +105,15 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 
 	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+			if (i++ == args->v0.state) {
+				found = true;
 				break;
+			}
 		}
 
+		if (!found)
+			return -EINVAL;
+
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {
-- 
2.55.0

