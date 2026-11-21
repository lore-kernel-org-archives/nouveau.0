Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F449606A320
	for <nouveau@archiver.kernel.org>; Sun, 22 Nov 2026 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6z0+5DL
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0910EA6B;
	Sun, 22 Nov 2026 17:59:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6F1474034D;
	Sun, 22 Nov 2026 17:59:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795370347;
 b=JAcEtwId6v2gXZ9JscJHAjYtdGk4jrPk63u2RnDpsg+OdW0nkIkH9NWTcR+4LLoRfE0Xr
 0ls0QeO33VekpfM2XjdGBFFiKoEKkts1WkSJ5vMDzIg6mKqMOPOQGgPhnlmOcGl/YdXyLjj
 Ji09bdxbqHdSVWgQPQbBJTj7QLshTWjW81f8bBhGBV+UnhzYAMuov6zK7Z3vEGl4p1lpeTb
 xR+GEkv9bmDW65PGzPGT4UwlTLET+UtVVd3kbQFFOtjJIhWKi+JAWBnAFkP3iOmeRJsjhIC
 dX2WvDIv1L7CIfe2Kc+29/MxOuhAGj/wE4CQVKnPmU2tWBg/B+BoB5Y5ny6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795370347; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
 b=PzoeA9BjdkWPYcEL4bKfD17EdxOFUwHcNSf28/Wk6wvsI3ADfYSVKQwH3xpS6bDm8k6yD
 xz9rwBSKO5F1RxR/XBEr14uIhwtTiBnWSmW+cn3HN0b11p79Li0KGR6AEnl12oYs1bJ2sZJ
 RrDLejtNJeDQikBHaq+rDP/reKvnuMxqcv6sZ3hBVZM69eCGglEBqfcLzYNVBDUE/fK/L+N
 ZjfWiiRMg6rA82eqdvlQQXnGYUbTDiu9N7iiecysF0g6X7YoNQr3UhFoHw2BIu5P/+SoGs7
 FQd3E/J2b3pNvvboIcoh8isW8APhZ+R5RQscBWziJ+UQG6YGRNrMCyH8iSLw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=none;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 86F2B4002A
	for <nouveau@lists.freedesktop.org>; Sat, 21 Nov 2026 13:14:06 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7489410E9B7
	for <nouveau@lists.freedesktop.org>; Sat, 21 Nov 2026 13:14:01 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-5eadef147ffso1465464e0c.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Nov 2026 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795266840; x=1795871640;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
        b=D6z0+5DLseFJil6tzOph1gkY+Rqg6aSVA+DcBtXtxqae1bTqRSQ7D4OUR0LzAAleGX
         dbHGjEytAgf2UDku3IUHXowjZScHu49fsrjxv2n+s+XuwW86jk+KNR4JuXjUnzVr6A+H
         BIWJD97TNmmI3+pf0HX6gtZxf4s7mlYGKQsaI6FKa5gqcjQXVlqqexBQnh9k6PiQbdW2
         Kdfqq+n7i0jcjQWBDOY7eaGTCDljBaQBi8LLvxvkPJNtA1uBraxInmFgY3ylHcwz/9Mv
         2WSdPO13dJc7XRslJumeK4wNhv6MZMrek/rsP5a6NACB0Lo2Gfs6Jj2KZrFx6fiDlfd+
         1d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266840; x=1795871640;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3uk1V2g2BrgRRimIAVfUYX/6Cv+bp9NcizxCwFi/VHA=;
        b=wdgHa9IWIiC4tbVUXxs2iSlIjErXGn6J9shNq3GqU9TEnqjzSdSCiC3gORZpB1PFDT
         ylflqIQhjaolaAw/3yRUoV+KmMJapc4/eReMGSDc/kWBnNbwhLmW3JUVLYKSVuPlaBHD
         L2BNEKCAuqB2dkJDzJoMrkIvYZhAKnqS1puAJYjG7f2tnVZjtysANpFGa+MEaTGzarMJ
         jcKXgy95vTnHnoAV/11ObHtswxyxvH5/M78MyUavqiaMCklNsrxVvu54DX0uzKWSs0x2
         cUHWgQBv6I2RILPulD0yqiYS5AreeBjFay7CjSTpeoaqGzVKbAbnt352g/k3jBOxsSbq
         jKjQ==
X-Gm-Message-State: APuU4Z+s/jLVtm/ibZIki0L87vDICwvJHWeHQQfYz/WAlV68A4xsrAwr
	oe3Kab6wz/Ffpaym/Og3e+lYiWFnPe0C6Rp0bXxvd4GzEjAP5rCyQydGqKxp8GytsNk=
X-Gm-Gg: AZFdTZeJQr8q8XnQ+ou0dWWvJjvcT7Xrsln37RHZ8T5LSEKmOVE4JOh8gHh1R2lVOzL
	sFAF5H8rhsGR9q7UZ80x9Z0qnc+tOyoopFJF5iicw16Nb0e8grdjn18jtnOGG3VAjgVHaYsaFji
	avmfrxnu6ZIAzqAVntDUadmy76SgmcYTjxsT9Bpxdp9U5N4fDeVsKv128iOi19VD8as0cNxXfVY
	vEg7era/xoLMQXvxkUW06ILLL7PSLqcSKgeowQLobdgu8NKQ7FnoACbhYiq8KfcLy/kx93uKclM
	kg4bcupdfaWl+P1NrJdPsRDfmGPsEzKMQOsdmZ0jXMfIO+tnY/S6Vtx7BjcdnzQUgl3CiAiQE6S
	9HYuNqBn0L4wobnSSDKNK3zolr8kPD9awtcBDe1NPp1ptxHTZu2rhf6SweRQodHymEHJBpp2Hxb
	zG9A+SWgnFa7ggrwD1WDsiiQN9DmudMWxw8crNlTr+nEFBMHSoAf4KQgcYl22mBEnXawnluMnuD
	QzrnBv1X8n1DZQXBX3WmDgQ3OiTRmiZWR31N/nnJZ/Lgx3ffcJwwPVle9CvxorRVJvTsJNkwgnE
	jq5PDyAVQ3gLD/q6e0i6M7/yo3ih77XKusGAsZoDZj+EEy8=
X-Received: by 2002:a05:6122:4201:b0:5ee:a81:e77 with SMTP id
 71dfb90a1353d-5ee8af0e023mr2950746e0c.6.1795266840149;
        Sat, 21 Nov 2026 05:14:00 -0800 (PST)
Received: from localhost ([2804:14d:5cd5:542e::1a7f])
        by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-99e6dfc0b22sm5702260241.6.2026.11.21.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:13:59 -0800 (PST)
From: "R. V. Lobato" <vieira.lobato@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Subject: [REGRESSION] nouveau: GM108 hangs at boot since
 "drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts"
 (6.18.64)
Date: Sat, 21 Nov 2026 10:13:50 -0300
Message-ID: <20261121101350.bab69dff11a2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: vieira.lobato@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: PVNZTRYXWRYT7NLXJ4SY2NFRJXKRBWLD
X-Message-ID-Hash: PVNZTRYXWRYT7NLXJ4SY2NFRJXKRBWLD
X-Mailman-Approved-At: Sun, 22 Nov 2026 17:59:05 +0000
CC: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PVNZTRYXWRYT7NLXJ4SY2NFRJXKRBWLD/>
Archived-At: 
 <https://lore.freedesktop.org/20261121101350.bab69dff11a2@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The 6.18.64 backport 15465d681517 ("drm/nouveau/devinit/gf100-: try
to avoid double-running vbios scripts", upstream 2139cb633d48, review
patch 426/686 <20261113153835.372076643@linuxfoundation.org>) breaks
nouveau on my GM108 laptop GPU. The machine hangs during boot.
6.18.63 works. Reverting only the gf100.c hunk of this commit on top
of 6.18.64 fixes it.

Hardware: HP Spectre x360 15-bl0XX, BIOS F.04, Intel HD 620 (i915,
drives the panel) + NVIDIA GM108M [GeForce 940MX] [10de:134d], no
display engine, runtime PM enabled.

On 6.18.64 the VRAM size is garbage and the boot stops shortly after:

  nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)
  nouveau 0000:01:00.0: bios: version 82.08.62.00.15
  nouveau 0000:01:00.0: fb: -1159778304 MiB GDDR5
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ PRIVRING ]
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10f65c [ PRIVRING ]
  nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 17e280 [ PRIVRING ]
  (no "drm: VRAM", no "Initialized nouveau"; the system hangs)

On 6.18.63 the same machine prints "fb: 2048 MiB GDDR5" and nouveau
initializes normally.

My reading of the cause: the new code in gf100_devinit_preinit() runs
the VGA CRTC check only when

  !(nvkm_devinit_disable(base) & (1ULL << NVKM_ENGINE_DISP))

The guard expects nvkm_devinit_disable() to return a mask of disabled
engines. In 6.18.64 it calls the void ->disable() hook, which disables
subdevs with nvkm_subdev_disable(), and then always returns 0. So the
guard is always true, also on boards without a display engine. On
GM108 the VGA CRTC reads hit the PRIVRING fault at 0x6013d4 and, I
infer, return a nonzero value (I did not log it), so post is set to
false, the VBIOS init scripts never run, and the memory controller is
left uninitialized.

nouveau.config=NvForcePost=1 lets the machine boot, but only fixes the
first init, because force_post is cleared after the first preinit.
On every runtime resume of the GPU the check skips devinit again:

  [   35.770421] nouveau 0000:01:00.0: Enabling HDA controller
  [   35.805652] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 0000000000120000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channel -1 [007fd38000 unknown]
  [   35.806084] nouveau 0000:01:00.0: fifo: SCHED_ERROR 20 []
  ...
  [   75.453651] WARNING: CPU: 0 PID: 1081 at nvkm_runl_cgrp_get_cgid+0x79/0x110 [nouveau]

Counts per boot:

  kernel                        runtime resumes  fifo faults  SCHED_ERROR  WARNINGs
  6.18.63 (two boots)           25 / 30          0            0            0
  6.18.64 + NvForcePost=1       2                31           103381       39
  6.18.64 + gf100.c hunk revert 3                0            0            0

The revert I use (restores 6.18.63's gf100.c exactly):

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -27,7 +27,6 @@
 #include <subdev/bios/init.h>
 #include <subdev/bios/pll.h>
 #include <subdev/clk/pll.h>
-#include <subdev/vga.h>
 
 int
 gf100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
@@ -100,25 +99,6 @@
 	 * can use it as a reliable way to know whether we should run devinit.
 	 */
 	base->post = ((nvkm_rd32(device, 0x2240c) & BIT(1)) == 0);
-
-	/*
-	 * However some VBIOS init sequences miss this bit. So fall back to
-	 * the nv50 method of checking if the bit is not set. Running the
-	 * VBIOS multiple times may have detrimental effects.
-	 */
-	if (base->post) {
-		u64 disable = nvkm_devinit_disable(base);
-		/* magic to detect whether or not x86 vbios code has
-		 * executed the devinit scripts to initialise the
-		 * board. only works if there's a display engine.
-		 */
-		if (!(disable & (1ULL << NVKM_ENGINE_DISP))) {
-			if (nvkm_rdvgac(device, 0, 0x00) ||
-			    nvkm_rdvgac(device, 0, 0x1a)) {
-				base->post = false;
-			}
-		}
-	}
 }
 
 static const struct nvkm_devinit_func

A proper fix probably needs the guard to test whether the display
engine actually exists (for example nvkm_device_engine(device,
NVKM_ENGINE_DISP, 0) after ->disable() has run) instead of the return
value of nvkm_devinit_disable(). I have not tested that. I have only
tested 6.18.y; I can test patches on this machine.

#regzbot introduced: v6.18.63..v6.18.64

Thanks,
R. V. Lobato
