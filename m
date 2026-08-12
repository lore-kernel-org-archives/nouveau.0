Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AEFC5B572
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 15:00:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41DFA10F058;
	Wed, 12 Aug 2026 15:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ouEH6aM7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAD6E476FB;
	Wed, 12 Aug 2026 14:44:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786545863;
 b=gG4ApnLdVwylC7ET+fGuzYE7qGjqe1YwaCSgzWQdvBnA/DEHnw0ydbMBM+NIVR8VhpZAY
 T2Svi7kmVYMkzdg0vaFo1DQFwTry/NCHPt+yIOwbHEwDJP0Fxp7CTXOj7dU826XuPAiQ3bF
 Yu0bafsBWMefRV/wH027e/2xF7YUYrV6lNQLm3Rakczs8v/in+TIsYr+6BY4EIYusq0c+46
 fgMDDZ5FiGnIdM5nnhXb6SMkQ4b4yFmWoM+brTVuVlGx+OX2G1evbIV9m47jwhjBXZGzPEM
 jaLEXSD4/fA3qpTFdl44j6lxidpZOrVx6kEGaWVHtZSkTaMjo3yjvoYr7H9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786545863; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q5RKCcCs+aO4MrLdOnYHMwBF2RezT4AlJ4Gp/mR+XLo=;
 b=R+YtXDlC2o/DeR4dUVyEuTyFxQHbplcrQOvDtt1E2fiapeoLFCVudjkpm7ImChmikM+a4
 Yfc+LQ3Ihf3/Cn6bgTZEB521c1dQyLUtM6+G1Ywhs5PZKhUsDxBY3X7CoDBPVEDN7RII0HO
 RO3retvY2dVCBUswlOtL49qcxSU62oWnjiwcAQDCuz49tdy+MnNkqnPntItPpoMuTA41jCm
 l0YGGN7hM5m8WSAI6XA4LeT7BUkbgGHNo3MV7TlLDqF8tF9qo0mhv7e2n65RfkERTfDpMqH
 js2yF15QG2enycIrDfm+2oEEVbyicIwsM61SnNrT+/0e/czZEI6XrwTZVLTQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3A98345261
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 14:44:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A636B10F058
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 15:00:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-38fdeaed181so1443206a91.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546837; x=1787151637;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5RKCcCs+aO4MrLdOnYHMwBF2RezT4AlJ4Gp/mR+XLo=;
        b=ouEH6aM7TZBI2V7TH83YVgc7wDYFsOEppz9dTMQqmEvg1nLDmeVBmeA6c/LvUOx727
         JHIFmNEwYxGxGMNdO846yC8trkSHUX7MoabXEuALyo+fR4NZ0OG6SXJOVve3xBYOMvln
         Caef8+TTGLXuu29Ga3YfbBOkAw48SqV1sx5qFw4tzQ2sOb/Ahttm/Aj7eMcH1sbc4QmA
         SQ2tnpHj2g2OXBocfLzp/+LOVZePquVIBDV/AojplhoWkRacxS0iCQj9t9a29JIsof9j
         fU/GIyHtHVEjnvFQEmQ3nI73lO2uuizX9v8Km27/D1zwoVUq1GkbC/V4Z8kzw08TMzqY
         bHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546837; x=1787151637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5RKCcCs+aO4MrLdOnYHMwBF2RezT4AlJ4Gp/mR+XLo=;
        b=MO3i16S0rO9ZEyNpX0AlZhjJruenWjlveMVhJJ5bc4k972Dzi4WsDiUwD37NFyte7B
         U9QaBbanlti3Kw85nGFk6DyzEeUg7T1cqYlrBDY6kAQTaUiwudS72TeQ3O81etZl9zLK
         zZ3ka4VaVp3LOx+KEoyFAWJReF5JQGL9WQe8+EV3/9JsDtLLFx76SHZdoVdG1JMcvksp
         sPMiy6ewseFwmvYOckhxAchW8mrshayG2c4kZUq6KauWRCaeMNMk0V1SrPtliCo0v6YX
         fnwuarHndSLbJf0DwbalfVjkN9JeWb0oWgU7PIwhbADEws2+I0/cKCkelu3M29xXy6uZ
         XOJg==
X-Forwarded-Encrypted: i=1;
 AHgh+RptWCq2KarxgX/+u1zSc8cj0TYbdVZzECiMw263OBunvZ3aBT3BTW7iC5pm0TuumSNE69VjzguO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYKNv7BI130wU1sTEguc/VzFfmXEoJxJDHTrjVKWI2gUMMctfv
	Qb66SrLbmfviYeTzn+omwoC405PV4ujFwyT2Iyi/8tLmuSlof2U8NwSG
X-Gm-Gg: AR+sD11j99QrauYDunnFwVyyexYVMh/WIMJ9SwHn+aWkVro1KihMlEr2fAwsIdS0lLu
	bhYXLtiKJnEmlZ0ceUl4eP+hdyuRhnEq0XHG9LFUfifDEjzCFtSMNoRa2e4xs7X4Mw0IvxqIwV2
	MIPiaeWkzXD1telxTYRrmg2SPEW84C77axIY8lydR1v7p2tHm3wkCQ85Hwky0MFh/LdxTtSE++U
	4pVUXzOYk/+3O6E1tvYfKuYcqk/7c5Kh7IdX4NlAhvDg8z+DhAexft1BJ2WayAirkSE5gYftj+3
	ZNTEnYBHIpQ6Xro/HismyZztdzlFfhb+4Q3CdCYdg935oGz9f0ByJ7+E5gfbii+o2mK4nP7PI/i
	2/phUiZMVmxr5SSWXHoPCGO+/70Q7z85SoQb53N5D1bN0+v2XRxHSGlWtaQFQk2Ad5eHZsTt9bA
	o5GjuY0Z/GK0xFGpMvV+Ez/4gkfcicvv82zHMlKY8rnecNWOG39Q0/sOi9Py0O
X-Received: by 2002:a17:90b:2d87:b0:38e:1497:af5b with SMTP id
 98e67ed59e1d1-393013c41e8mr6639072a91.1.1786546836771;
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f935f73csm3896491a91.6.2026.08.12.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Wed, 12 Aug 2026 23:00:04 +0800
Subject: [PATCH 1/2] drm/nouveau/sw: prevent NULL deref of disp in vblank
 methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
In-Reply-To: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786546828; l=2686;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=U4T7yVA0PCbP5g0s2yLY6Rg/fJ0eJtWweG0p/5LOj4Q=;
 b=zuoq23EqGDpiTQ22kZ6ODTRR2vhXOyPyC1C+c7ujp9yvu7qEc12Nu3mhBQN/oi2bH0Mkqjldp
 cfH5yZjZk6/CGDGFIQxyquHlnS8uQjUtZ8Pu9QRDOQ4/mxFg8b8kqGN
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: NOZCEY5JVDLXLYLLQDM6AUCY3L236TFZ
X-Message-ID-Hash: NOZCEY5JVDLXLYLLQDM6AUCY3L236TFZ
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NOZCEY5JVDLXLYLLQDM6AUCY3L236TFZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The NV50 and GF100 software-class vblank methods nv50_sw_chan_mthd()
and gf100_sw_chan_mthd() evaluate "data < device->disp->vblank.index_nr"
to validate the requested vblank head before allowing its notifier.

On a headless card the display subdevice is absent: nvkm_subdev_disable()
(strap-driven from devinit) and the -ENODEV path of the NVKM_LAYOUT_ONCE
device constructor both leave device->disp == NULL while the device
continues to probe and still registers a render node (DRIVER_RENDER). An
unprivileged client holding a /dev/dri/renderD* fd can then create a
software channel and push method 0x0408 (NV50) / 0x040c (GF100), which
dereferences the NULL device->disp and oopses the kernel.

The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
already tolerate an absent display ("for (i = 0; disp && ...)"), so no
vblank notifier is ever registered on such a card and the method handlers
are the only path that assumes disp is present. Guard the dereference
with the same disp NULL test the constructors already use.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
index 0171cdf6f639..4cf8cd120c76 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
@@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int subc, u32 mthd, u32 data)
 		chan->vblank.value = data;
 		return true;
 	case 0x040c:
-		if (data < device->disp->vblank.index_nr) {
+		if (device->disp && data < device->disp->vblank.index_nr) {
 			nvkm_event_ntfy_allow(&chan->vblank.notify[data]);
 			return true;
 		}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
index 0cfb1eaae6de..b202e11238a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
@@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int subc, u32 mthd, u32 data)
 	case 0x0400: chan->vblank.offset = data; return true;
 	case 0x0404: chan->vblank.value  = data; return true;
 	case 0x0408:
-		if (data < device->disp->vblank.index_nr) {
+		if (device->disp && data < device->disp->vblank.index_nr) {
 			nvkm_event_ntfy_allow(&chan->vblank.notify[data]);
 			return true;
 		}

-- 
2.34.1

