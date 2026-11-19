Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55991606A320
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 21:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AILszQfw
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2FA112751;
	Thu, 19 Nov 2026 21:27:00 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6D83640570;
	Thu, 19 Nov 2026 21:26:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795123610;
 b=n0LXPFVRobJen7Ov6sFxi4DfMIEwRncBiQ/xYll2tL28rN0C9FkopwE4rMg27W0mpzMk8
 BIQPZ3WCEoPz3T3T6Gemj08A+aqOqHIZKSuXboPudMJJWn3l+Z3YyYyOLn0cQ+pferJBZ2g
 YsnDc2Y3A/W3fNIroccC95jePjNl4UVRRXVvUGz9jEtZo756idKX9EcG+2/cCoSI39eSFiP
 DPzaHwbowd7gAj6uMx1HxOGHWfJUA45wny7PNjwJy/CeB99cM4ju6F8hnGD1YUtdFEmf/no
 Oy/j8XadmX5vkUaJCXnJqOjd7HO1vDbZ7BVxCql2Nc+B/eSXh6wbmzMDEwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795123610; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vY24YozXGGsZy0MbrhPHZ+OQZbKbtp3K5o/Zm2P/mac=;
 b=ZUeSdeOIGWVAPUTgFqZXopPhqFO/EslYCf7p41JZ0GJapJfj9lxcMqBY8lNyT5wI4IPVd
 6/+9EVUMNaEb5yW0sdFEhtjqjWU68Bd+qxmwjlTofTxF3Ll6V0dMhmmJkuMgwkq43i0ZKgr
 0aruLSjuAVkpnEYo6Wc8M5i0aotrLfjaimS9YfAYGduG/dEkytPMYtJUAWhyYVkoBDwdwH9
 saqPJwSm2j8Ntpnhcz+XLnwYnc+iDtT0lr/uIACvjyMbN5UPLQRiAwTLHwH6zp+bWezbMmT
 /GvVJyIMW9SCA49H2rmGr3EPWDaNwm8qPH1pC6ebaNBlws+MC9w1ALE81HIw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=none;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A2AB404BF
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:47 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39910EFED
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:40 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-8b2d14968c9so2425597b3.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Nov 2026 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123599; x=1795728399;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vY24YozXGGsZy0MbrhPHZ+OQZbKbtp3K5o/Zm2P/mac=;
        b=AILszQfweAah0skn796ecmiCmetuAvQqB+lOZHYIEJjR35qPISsXJL3w0mcpphh2gP
         C2Tj0h2dJYVnFuxU2O4/XccGIqFkwFUzI/MyGZnYQ4rkvhLm53Vsw27Ca4uehzcAZUM9
         yTYj1hzLF6PR40Y4g0G/MaZ6yW+VKYcveVU0ZiJS1NFrm0kkjDUHhdA5FA0zm5mfH+O6
         w5g9c6dh8Td931hC+iYYL1OiW2uXNjLZRm38yPTUri3RrzWKDs8JpwXIZrfSYjKN2APZ
         TwPmRKGb+90W4BALdPkpRDAh7L0/Sbay8EUGzGMWkxZc7rQijBJSNLdGWTrZ5SxraSWa
         asSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123599; x=1795728399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY24YozXGGsZy0MbrhPHZ+OQZbKbtp3K5o/Zm2P/mac=;
        b=DlQEh5+Hb3XXBoIcMWlDFUo3jnkUCKk7GsfevTBV4z2j5G5Nlz4pb6k6rtDg09aEM/
         lqcUZh5u07foPInD/pEFNw1ABRybPPiOtkx58klklfyuZYUORfQU8b37COpQ9y+DWpqU
         KCB36LssbWVZy6rWQqjYtBHZgcik2WrIwJqvWuiwpQwIl+wjT/K3FTiLjXElUCVjLMFP
         LTynLFVNXeUcL5RGE/clVVeFUKuDq+eL3wuDI7AS7c1b/akebtFjrAN38vdpMptwp2qb
         yXgVtHyoL7LMd/zdQZ/6Te3po138aBGJxoXu0YtvACuD0Nh2aSB5YcdLISPAXj5KIJsp
         pZNg==
X-Forwarded-Encrypted: i=1;
 AL+hErGDWyArTIUoEDnUPwaRUOBz8RiCPV79S5ls++W/zkyjUZF9i1Exxm9SPmho5+wbjwGR3u6oA/5f@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/l7UaFN/EjoZyn7TLLkNK9noqBdJwz2YFha1E3lWqg1/POFsKV
	4Mmk7Gg6hJ42vIn20VGCAevkDq7ULJauYzfNW5KeM0nNMav5AbOJJi7X
X-Gm-Gg: AZFdTZfwhzfCTkgKuGRYbtW2QjbL1O5qUmpkt+eMmlju3XqdPe9MQMI81rplLdSi24a
	s+m5xQupvjXT44I0xvz64mdo1CI1e60YuPO1jxbccN7eDjBKavhYDOUHk+ggp+DVOp95J3Rdtjc
	s555bIvZMR8odwuhdmYYP3qLLfFGq5n7NBJ6+Z5Wfd9udvsS3IyVWoBVOCn2+hhnrbwIMHyGUKP
	We1tq2n1WTLjViisBz+O0P0Ws1oONt13eLj1SH6uLg2UMs5XyXGqcX9YNtaLvKnaHYkFmd4tMpl
	eqA/RGUNyyXosP08/s6MBKvJKQ8QPArjQZltWF5+nQLdcy8VL11y2Km2rg0APDfVYdSKupmqdap
	wgOrlDgdO+0sCHvNnGCB0L62TUfCHqDMyhJlTqFGE4w43aVQKYewUG/3XCCBD2oIAOdNeWBr57V
	HkzrCY6+svBHVLedqf2L2hCTbmk/gBxNlIFgQbpHNqgoA+nIyVyTwybMEJmB8SJe80zzwcOOfPX
	ESbiwO006GHqjenlSV4lCgSFYknCKxxre2o5L1/8k7T2RPMgjJkBVtPsms/wXhNmJEn4RhGbg//
	2DhXjZv2eMDXsdMcF3F0RReyGPygO33PrkAFtZEndufpzuJe1dFAOxhClVel2m+9fu4Vvg91pOu
	xxX2T6sof2DhB15CUPiZHguzkE9NWQfPTH7tKSk4Iyw==
X-Received: by 2002:a05:690c:316:b0:8b3:5f18:7f81 with SMTP id
 00721157ae682-8b52050fc52mr3650177b3.65.1795123599062;
        Thu, 19 Nov 2026 13:26:39 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b52034f7absm5433547b3.41.2026.11.19.13.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:26:37 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 19 Nov 2026 16:26:33 -0500
Subject: [PATCH 2/2] drm/nouveau/dispnv04: Allow PMU sleep on iMac G4 with
 NV34M
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nouveau-pmac-sleep-v1-2-360c08654a25@gmail.com>
References: <20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com>
In-Reply-To: <20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jUk7WaGILTaMpFlfNkLk0zUgL4/Qx/PtclGtgMowS9g=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+Z3ZYpb/48E8ur2630aPo/M74qovXY81+e/7wfLG9Y
 eszTpmpHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPN1XqGX0xMx6zelE
 0P35yvGG3dEMGy8orEjJUFomuu6JspK+/5I8HI0Lom0KPKNuDA5levn8l/2ax5PGOvlOPbc99Lz
 7/RErnizAYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A
Message-ID-Hash: VZRFIYPUM2RMO3UFMDA4QDDEMFOAUTDJ
X-Message-ID-Hash: VZRFIYPUM2RMO3UFMDA4QDDEMFOAUTDJ
X-MailFrom: mattst88@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VZRFIYPUM2RMO3UFMDA4QDDEMFOAUTDJ/>
Archived-At: 
 <https://lore.freedesktop.org/20261119-nouveau-pmac-sleep-v1-2-360c08654a25@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PowerMac6,1 and similar boards are flagged PMAC_MB_MAY_SLEEP. They
only offer PMU sleep (mem_sleep "deep") once a video driver calls
pmac_call_feature(PMAC_FTR_DEVICE_CAN_WAKE) to say it can bring the
display back after the GPU loses power. radeonfb and aty128fb do this,
nouveau does not, so with nouveau only s2idle is available.

nouveau resumes the NV34M (10de:0329) in the iMac G4 correctly: it runs
the VBIOS init tables and restores the mode. With the previous patch,
the backlight PWM is restored too. Make the call for that GPU.

Other GPUs are left out because they have not been tested.

When nouveau is built in it probes before via-pmu registers its
suspend ops, so "deep" is offered from boot. With nouveau as a module
it is not, because the valid states are computed only once, in
suspend_set_ops(). radeonfb as a module has the same limitation.

Tested on an iMac G4 (PowerMac6,1, 7448, NV34M) with nouveau built in:
one suspend to RAM, woken with the power button. The console came back
with the backlight on and no errors in dmesg.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 7d44d18e1b88..b4f522fbaf64 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -35,6 +35,10 @@
 
 #include <nvif/if0004.h>
 
+#ifdef CONFIG_PPC_PMAC
+#include <asm/pmac_feature.h>
+#endif
+
 /* Apple GPUs whose panel backlight is a PWM in NV_PBUS_DEBUG_DUALHEAD_CTL. */
 bool
 nv04_display_has_apple_backlight(struct drm_device *dev)
@@ -330,5 +334,15 @@ nv04_display_create(struct drm_device *dev)
 
 	nouveau_overlay_init(dev);
 
+#ifdef CONFIG_PPC_PMAC
+	/*
+	 * PMAC_MB_MAY_SLEEP boards only offer PMU sleep once the video driver
+	 * says it can restore the display. Resume has only been tested on the
+	 * NV34M.
+	 */
+	if (to_pci_dev(dev->dev)->device == 0x0329)
+		pmac_call_feature(PMAC_FTR_DEVICE_CAN_WAKE, NULL, 0, 1);
+#endif
+
 	return 0;
 }

-- 
2.56.1

