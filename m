Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98797C55172
	for <nouveau@archiver.kernel.org>; Sat,  1 Aug 2026 12:11:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E03B810E318;
	Sat,  1 Aug 2026 12:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bVQKXaNn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 03ACF4756E;
	Sat,  1 Aug 2026 11:55:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785585343;
 b=CVVemLCwp/xP4lZWsriRu9TO2hgKV4k0MJelfXiVJu8zbrjeQGQo/UN4YwP5efWgodAOX
 96hlweHRFlqRciwjdH+AnJv7LQ5HUct8SWdgSUeWWw9peNdtv2Fh5QZXEina9GC2zdrA0yH
 hyoM7cbpYpM6XxaWaBWIObaitgp1V0jXCJLxHQveei+59sZrs2Ll14qb0iO9DQavx14RiHJ
 lSEYBuEcGdK1IKrtYhydSCjU0xpIfMDyN1RFJjenhR7/33oDQ3NjJ++AMxhMqxOLpcZ00Sc
 iBigBI+fBBtkxXVfV5tLZl1m6eBRRm4q22yMKNbpXPQAEhuFj/zzS/87grbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785585343; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DOZGrUXGjxDGJTEIeB1H6x5d4O0bKmWClzqnhdgmKgE=;
 b=GD83eyvsAKTXMHheLW3mnrJGfW/8pxFdgAFH/s/MbL21GCV1d7onhQPP1eAnnYV9n1kjv
 C2xtSwSb/K8YOG4B87tOStYbLU+VbUA9XR7bhjdd8N1xikgh9S8433tl5NpPN+2xS27RZgC
 8U0z98eFnG6PAawIS3HW7PuEIJ3TE0/dRIhhQWxMOLJ5Ufxmn5mniDPkGwpd3CxPRiklkn9
 HkeCjoQ3Wvo0DMvID/9JVF6vdK6k6cXnDQpCQXcf+ITQX6jN8/PBeWSDFhwX9S1eDfQTMMT
 JaLUmM2eqmorJGk2TdlDP8Xu6zt/r1yJdPl/xE41NnF85Kg3fSLrQnssL0Qw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3859C44855
	for <nouveau@lists.freedesktop.org>; Sat,  1 Aug 2026 11:55:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3A9710E306
	for <nouveau@lists.freedesktop.org>; Sat,  1 Aug 2026 12:11:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso2674825e9.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 01 Aug 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785586292; x=1786191092;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOZGrUXGjxDGJTEIeB1H6x5d4O0bKmWClzqnhdgmKgE=;
        b=bVQKXaNnNL7rv5fPQFunGQezC2eGfTxGIvu6meWBdspwiLmv1Ra8v0so4Tej/YXGSK
         n1JsjC+i2ywXHzwj0ADpKI5RS0TAQ7jdjRQJGYmceMh1b3YB97bwB+G6Ynx/V3+m/bBx
         jVJJp5ATWnWb5LAi1Gvi4xlrMv8FqqwpNWsS2ZfR8feqqlsU+bO7zyFe59/5yJZxUAQT
         D5XEDWa+BgjLcfCSLVYyGi6F4lI+sWkEXnjADo6JafIdbRvDHvvDbGjS29GES3A92OAK
         dS9ZTl2UeVa+tmWCNJ4yzkoA/PldhU/BXkt5lmgmMcxrFNkJWkdxDudixWQyjBH4ZHPi
         TJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586292; x=1786191092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOZGrUXGjxDGJTEIeB1H6x5d4O0bKmWClzqnhdgmKgE=;
        b=MuZ1jmzEnJacICzWk5yYMxifSP5IWTdi7IsuQLTbkVObeOIpyoHd2zfwj/nvpguAai
         VF2OdlyKW4vkVbGFmrf7WwngJkSKKYvuez0KqTmj6ch5W1cQxTZRya10uZJn/AsJWKif
         NFb9rWXDS4N1lH17mSTHSkt27ra+s7XjxBEey62zGxTjmizuPn3TaQFKWseLFd3OYhrg
         +SK7CULzokrA1YfDnnWhcuAtfzXUM2SZwPnwIR86tXUa2TSUpo9dtZNpGZd1dAxAUzHt
         MHDVh8zQ/szrBOSSc95q0DLfImzBhckREZHgIdTDnFVqnwhc6wC5VM+yx8hMZEKMp7/5
         TJug==
X-Forwarded-Encrypted: i=1;
 AHgh+RrxH20bmJOdWJYi70HY7RScd9a54uYLFtniEypcb3LF6m9BTEB59PSulMg5F9GBzDzDDonVUY5Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHR+SbJ5iqQo/Dpf/ArSDaIInzvZ2rzbt/6KqQ9B34QXZyXALv
	FZ2DvSN7xoIfWxSVbPKbclWRGs1dNwbJYuC4agwcXCoNOsUdlC5LBUDn
X-Gm-Gg: AR+sD13uErQtEVcbOvliVkVWutd6iOEYQdgEwGOwQeq8mBEwi92MKSj3qe5Ho+Pg7VR
	D6sUkZVBkECz3tAP0XKBiE7lAkRUzGx/FT32HEQjR+KigCDyboWa6fDzWd7N+kiNheVLOu3i7RL
	J/ypfeewCYvbCrL7TpbcALfEmZr3UJhZxl3pmEWRU1m30OLAsoQJYB57Ci4hNzaWVhbJx2eKsgU
	hQo2T77TMjytVmQQFbeEn1ilyACztYJanREocnm2voNHN7+zzpECmBeBjLKgga+SOyqmKIpHY6b
	T72LiImMehk6njz2ZSqZoqmnnVBMems0ZJ08Xhl0kbS7O4jvKm/lNtAMwaxRk29Sv/DqGP15slW
	p+SgDssqMO/+TWhrbJ8WqhAeaCH1UVO+AUJQT4Vc0iZbHfmU3b1lNAk9o/qSwWgG6fV77sGEcoE
	wMpFP5ll5VTbBgdb2w7Dwn0XgzVprvtgqPGzKjkPuucr/TZRXixab77wAGOnpFNogqOlVPpingz
	A==
X-Received: by 2002:a05:600c:c3c1:10b0:495:63e4:7f78 with SMTP id
 5b1f17b1804b1-4980c672b1cmr33123135e9.10.1785586292085;
        Sat, 01 Aug 2026 05:11:32 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.83.195.12])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d17f2sm18174953f8f.2.2026.08.01.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:11:31 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: Re: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate
 desync in nvkm_pstate_prog
Date: Sat,  1 Aug 2026 14:11:22 +0200
Message-ID: <20260801121122.358187-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XT7VXLXZBXWN6O4S7JTM3AXA5OQN4E5Y
X-Message-ID-Hash: XT7VXLXZBXWN6O4S7JTM3AXA5OQN4E5Y
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XT7VXLXZBXWN6O4S7JTM3AXA5OQN4E5Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260801121122.358187-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Note: this series applies on top of my earlier "[PATCH v2 0/4]
drm/nouveau: fix list cursor use after loop in the clk pstate paths"
(20260712123616.1180830-1-postadelmaga@gmail.com, sent 2026-07-12), not
on a clean tree -- patch 2/2 here touches the same nvkm_pstate_prog()
that v2's patch 2/4 modifies.

Both patches fix pre-existing issues an automated review (Sashiko)
found in v2's patch 2/4 while reviewing it: nvkm_pstate_prog() silently
discarding RAM clock programming errors, and clk->pstate being updated
before hardware programming actually succeeds. Neither bug was
introduced by v2 itself.

If it's easier to review as one unit, happy to resend as a v3 of the
original series with these two folded in -- let me know what you'd
prefer.

Francesco
