Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E29A606A31D
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4wWbJFA
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3B23112A96;
	Sat, 31 Oct 2026 02:09:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E495048C3E;
	Sat, 31 Oct 2026 01:50:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411443;
 b=pydZlDnwgnUrLkVJWBtu3yyy26XIBvHRynI/eu6ZuX+DqyGtWvipJJTnPoAicCsHvKa9X
 V2zAZWvV+mkMlA/xnxEmWEdV8CNKCAbyuS0cZg8jFvI+ZJTjqCG+EmED0V0KbXMLp39Vpxr
 iyNeGhWmQLFfn5CCp0Q5yjItul3t7ynGIZnsVvcW14YoBwCeG9XFw7Hdvh/qI1O9wTsQg9J
 wzU0d/nQXnVZ3EWWqnpWjgRZZACaOHA6lYNJBTSyE/BzxY0f1RUHDbEaqbKt154XPdRIM+r
 ev43QKbnD/WVxyAj5zbOMbeLGHzQixU+9zyf5cPCT1BQsHly+V6cRT5cH5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411443; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
 b=WT/XOeSEEex1yU21guCqFba27yHEj9iOn4DayC8WfaL1DP6JBwJk1b4LcCNQeWJtV/dxs
 pMtXPHMYVYX+967KX0ytNjj//Yuag4vPxPDk9S+bE67hkSbo2Xyqn96VjxZV7+Zm3iuyP85
 DCnuywYKlupH1IJyso9i19ULpMH+p7zarjBVRDNjCqmcf0rTHNyU1tLn9xxMROiEbUcs67+
 TSk/9PzoJ1J0i8V+THV5aTm+S3qbuHCYhpbn1gaplppq6Nwi5s46XmY76JxNMtG8Ts9OayQ
 8cchLhJGNBI7ZqcSyqjTa8FU89ICJPxBnMG5ZhHzeRugOtbA1AP3UQzhk+nA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A2F9446CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2451121A4
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:32 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c3f8d72d7ceso296619966b.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269111; x=1793873911;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
        b=e4wWbJFADQ6Rvivr2M60Ktzft79PX6sD9r7BiEk23tKnM/lJC4bxGFG6e5bqR7Zb1D
         8e0VJsmX/uWnvV+7UarkHy5TfvntmfZdv5aOkBXi27D9UzMkX6E3lh41pFj8kUTpW3BU
         O/eKK9Uh6XFzFPS6Y0ZgFZAb1WSFRehB1E0EztHs6VdKb/BevaK5l2xaWDV4PGtKW90l
         DQZkP0UU8dra08Cdt+TQtj+NAUFa2ZjNJhzv+H6ulfzfny28oFZFziuIdhk5GeYe1fhT
         FmCcL8d0E3nhPXy9z6AzO4nolFfxxc46OP5J+CSSaCBoTx/qz3Lb9I/iLp9eF52GFX5t
         A5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269111; x=1793873911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOEmoLrkij3HmYBFR+Syf3gWz1S3EKgtiAPD6c4+pN8=;
        b=l+njYQdd4+wLB1eQgsYW6Qcp1DJbDE5+tPqqhvED2EaUo1m00jjd9+kcyCT4ZWdawD
         et8Zxn2Tj2yzLYDDYUs20IDnsJgLk0k3/dOXjQ8Sb6JWQhTF04UqEi4oqvvRplb/lXlF
         6ei/3IK0Ag5JSwUVkGXuutrq4vCM9OUdRAwnvtye/qZYKjd2ohOTmM2rn2m3GW7kvpyk
         ymraoUJuj0blbmEzozYMHoGlPdtOCLl5ep2lS8YKk/4V57paSnbecoACJ2xP6+nb8ceu
         eSFrRh98mn+Ut9mEeLgTOpqfo55aK7Fn4EssbTsuZdNFaHu6sphJ3M5CWf0Diob7MTY0
         GSGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxfRTnDtjRyuuFwrnIrlcR2imCBafs0aBTAZcX9NsnBbW5d5+tF9tw1aTluDhNcPaUNuLvxAWrE@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJh+/X+BQuoz5/MvwxzmFMsD4eoGmIsdkB8lrYD4wqvgDLea4ON
	ypSCVzHah+nroLWOuStolv36UiU3Zclp0QaLsYU8YMG59vXXN9Ice5Ms
X-Gm-Gg: AYBFou16pFZYdpgWloDDAD0gC/+Wvm6hzmSjrnx0GQ+o9L8f0IIjTmyub7oP8Q8xJBr
	y5BfrejlWCj5dx4V1DakzTRBKEZhzUqn6ig65l7+nJQEtJud6cZRzGGj+/Bk9A3q62LIJ5I8PDs
	f99jsokEk+dlO8q6WiCs25oVFyXVWWLmVeUIiPDZm10CGyeK1TjzrwE7Z9OqfEqPZ09a8a8WjPM
	p7nnVDm1qVniMNOMOtbD846HMPgSl5jiIebeMjf+wzkaMirKfJHGltU+se0LZjtVXkldb7uq19u
	STJZi6ffIYPRJD6jqd/cr0z/3abUVlFDG4fOfkQh6F6/SLbcvuRV6DQpPWLckwfh0QLf7uSH1lq
	lVNKPBrDySwM6tXu2T+OVUGImR9xjr/RK4+hgtEheQRd1jzPqfDbfQWvbE2hbfQav/o4YZ5/Hfq
	1IX8vX0eQJUpD4jCyNoT1/3X9MSnveDrONHeyU/U2/ortha3UwNsE43fJDvCr1NTq78B3vNoVHU
	0L9yGnPtSVkRkEsx/WXKEmL1XTomBnDkmOnqnstfM3alnC6UBPMNwqd9EfAhk3UbcnZdSvvYlma
	epUGFMP/z1rXiIYmZUv96JICtFSDbQfGAUEBEQx93N+8UvcqSLHkUemUt9Yfqno=
X-Received: by 2002:a17:907:930a:b0:c46:a5bb:5740 with SMTP id
 a640c23a62f3a-c49bdb64c4dmr397674666b.5.1793269110523;
        Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:22 +0100
Message-ID: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmitrymalovanyy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 2RFMPZWI4MZWEKUP6MDIQM5ERIRCN65S
X-Message-ID-Hash: 2RFMPZWI4MZWEKUP6MDIQM5ERIRCN65S
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:50:41 +0000
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2RFMPZWI4MZWEKUP6MDIQM5ERIRCN65S/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-2-dmitrymalovanyy@gmail.com/>
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

DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
downstream device with DPCD Revision of 1.2 or higher must enable
Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
DP_ENHANCED_FRAME_CAP bit does not need to be checked.

Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
sets it in the base receiver caps, but clears it in the extended
receiver caps at 0x2200, which are the ones we use:

  base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
  extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81

Through a USB4 dock (CalDigit Element 5) the link trains without
enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
does not change it. Connected directly to the laptop the same sink
syncs without enhanced framing, at RBR, HBR and HBR2.

Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
changes behaviour for every driver using the helper, but only for sinks
which already violate the spec by not setting the bit.

Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
framing (0x101: 84) and the sink syncs (0x205: 03).

Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 include/drm/display/drm_dp_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5b05a7fbe..4f20f60db 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static inline bool
 drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
+	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */
+	if (dpcd[DP_DPCD_REV] >= 0x12)
+		return true;
+
 	return dpcd[DP_DPCD_REV] >= 0x11 &&
 		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
 }
-- 
2.50.1 (Apple Git-155)

