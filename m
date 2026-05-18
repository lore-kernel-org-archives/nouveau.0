Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA827CD4F3C
	for <nouveau@archiver.kernel.org>; Mon, 18 May 2026 15:29:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 85A0B10E8E4;
	Mon, 18 May 2026 15:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QUX37yq5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B337A43570;
	Mon, 18 May 2026 15:16:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779117384;
 b=WhFmAsffnAodpfrTxvEj4m7K410g95NIAyPV9YI4c4zZNNbq6A5Q0RkIyckfuOTPiOmPf
 fo8z37PEnIQlwH6GKoins2H+J7G+S2yGc9HCBphxMStewn/NNKlXZPuhqUJtyYvT62H+rb1
 DRlLI+ExhRucp9iYAUOcWq9tJGALA2BscquE8Ok7xCVu3/X27BuB7w5EVnwkw9vi3JlETfO
 a1XtR+nrOz+H86MPihVe6jksC8x8E3r5Kn5nNbTiN+A5AxLgw40+TjYAKAOc9p/R8QhpvLv
 x7AnecQFvAlXp8mKb1lAPcKPwd/i43hDfK/7QFiV7vBJy4Cr+XYkb5GSssew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779117384; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
 b=teqCst93C2MF2Yxt2NDoXEdC4ExE/zHUCkIY69LI+tO4rLyYk81AlADVXO10oWsfn8jLl
 Qb4htf7NPG9pUfWwiBbbqa2l8S0qd+K24/rWM/kn9eaxNxz7O1pehScBMcb/KtfcC19hJa8
 LR9UWBtsaoEpV1VSr5g3jtiPCDHeD/OzEgPEm2CBZumSq0chBfl0Y72zEOX9y7LiukExdoj
 VOt4bRH2rkO8Ih7tu391JvOr+bY16oaDg7qzEeCmFUKU+2lxK51Ex6F7LMka5vVmlNmAPe/
 eM+xgg+/pNWYLB4Kir76Je7exefIrXn5QrEvm2I9+TcePoOTXT2u8VZ3d4Zw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C727940372
	for <nouveau@lists.freedesktop.org>; Mon, 18 May 2026 08:18:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D23E110E719
	for <nouveau@lists.freedesktop.org>; Mon, 18 May 2026 08:31:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5a858881ad2so2718526e87.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 18 May 2026 01:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779093094; cv=none;
        d=google.com; s=arc-20240605;
        b=bUQYDfhvzXkIbMrRdxN8RUXzjAiNvu0c7Z0n6VcjveKyQnXhwLFPlhmA8yIy0uG0Jw
         GQBah/t7yrXTik6WDPMx5Xm2bqltad9Qw+NKHZTRxfNG6s0qDtrOEtnbIQBzuksyxMg+
         fa0zVoi33/wdWFWnqsEPMOmo5Sd0Id0puh6WyACuPvxvZQzi3VR6+SxWnCNQWgQ1VfiB
         uUQZo0Nn+UfARiDtuZzAxBYBNYomJGchfIHwcQpy6WZ99ZUSTsV0ycXSyC+0+HF38yvC
         1ji35P17UQvM2uh+G648QHMsTiAokxQjUFZctu+ddzmA64bDwVDjMsblbKb94A9pVUYG
         tqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        fh=K2Qs8p7/sRdCk/S47VbK3ZCzV4BICWh26taGAJ61Eg0=;
        b=T6EbCEIsdQS/2R84fmq22P493UdFQXmY1I45MkOcMYsFSeboVKvo/fTTaz3edMZc4A
         4ZQwzkovkUoqWrC1Z/JWwJn4jlEqT2apSFbMh55X9/7NVpmyUGqtLgTQ6bNAT4H5Lffn
         CUv+0B6YohVwYAU4GAbyzLPes1hZl8cmwmhi5Ozwa2bYaR9zx0tWlLFwRC2KxAItlkdp
         V5ikr6gnn1V7yD8QDm1QJ/yMMMdS0WZrXan3mrOHTEyzDubo3rPBckKbphIinccBrfpU
         SogaryRiPmXXftbqagyP0to4DuLGW96uHLrOX0BXxRC3SQ7wefabi/mIRIlHYhbSBZe7
         xCYw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779093094; x=1779697894;
 darn=lists.freedesktop.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        b=QUX37yq5T6yrC5NUlWOLz3Vqa4wXhOTFakRs9Rr+Y7DkFqo5Nh8G9VR13ZyPU5mmno
         LQhvHqv8NfRjkaljYwQqIfadUCycoW+UHToPkcgLdiyAKtYG1P6uXDWR4zORpEEcFw0y
         V00nT4juTFYx65vqlZpcI3VaYqS2DYRY59w6u7AMjOyoDxWSBwrXwXhRKJ3K98xXpmmn
         3Lsp2CtLmKodoFSKxT7fNZ8azZHrMM/ckHwwzk4+IFSVo6uwisFyQkdzPpufT5DEt5vq
         XfZqnZ6X43Vm27Qw0iRsJWtF1y+rYo6rVIPhT27VIuioXb9uNwSeexwc73rcw8Awz4xD
         RTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093094; x=1779697894;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXjBimITY5H7LtNFJ4WtXw2YFpJ3YRTyr396f3fYQvM=;
        b=OfibQQPv19/0eHWoE8OTd+TZl7YeykjJHshbP+Yk1N13wq9HrbmnPx188BcUpPCm0g
         xU3K9sp7rDM5mXNsBDNzvYFFiw/z3vmH5+pv32XR6dvkb7b+UHh2RXcWJdmW0lA1hpaV
         O4ekLEeR0VJ3q7hC6hsKUQgtfdhIrGVulpI2lE3MIhMnt5/q27EWYUbBra3xDWNwPP+l
         xoSLdyQNc1jQyEcRvSWZLZSbIhAMlSwYVysIygk8yKGqSkpuzffhQ8dKdu/E7RSyHKbj
         GOhtdF7DHPRqb8ybnYddvAt8+p92XBJO+utuPS54Mboixhzp3Kge82eFKrb+Kq82JXVO
         OA2g==
X-Gm-Message-State: AOJu0Yyx5Zbz9i9xc8SmLOeSdJiiYLvWZvudpv/CKhOxCV/YIuhx9+n6
	PRlsV0bDtsB46X9GtbnpTKan1/rKvUt62P568vaKrbiP198CHJvp1cE2l8JDqjmdd47rRNNB0PL
	N+QQqwV9ZPd7mwAHDjYXSkqr8VBk6Dz765OiQ
X-Gm-Gg: Acq92OGjYjFkuYC+kmd5zGVOJbL7CW1/OICyNf0YvbBJjJFkXRV/7CcF+Oc+ngvwNm7
	tiLg2ntunTeEL9214xR0g2uKRgchsJHlZX+dv1MyvpjrJNhrQO46FrhFcDsmxrHGYwlJx+7p+W7
	lyiYT1rL6SfNC7wXtaihQbiefLwgh47PGjueX8I005tgu8wmpK9tsaajru6SaM8GydCXhFX+LOC
	VNlKG11q6wZb85iSPg7KxI8jiPRJB/7urfdYV28ok1t+zrYAOyUaFvnlwg7PxibOTtzI3Tt1r1l
	OUy+bkqFIYtZPsOK6PulEPNgOpsUlUxgu+53vNeEi30Qcw6sP2znAw+R42NULn2g0M8Z
X-Received: by 2002:a05:6512:3f1b:b0:5a8:eae9:a21f with SMTP id
 2adb3069b0e04-5aa0e740453mr3631424e87.41.1779093093845; Mon, 18 May 2026
 01:31:33 -0700 (PDT)
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 18 May 2026 03:31:22 -0500
X-Gm-Features: AVHnY4KpCYio1aV1Vz8BRbe1LIMHiOSmZcRfNWgqeCFliaqtqIVBAe6gbMiCbPw
Message-ID: 
 <CALHNRZ8ngy6dqcjpA5v6=opDyisivGztE32uvNS+VRsOGhuY_g@mail.gmail.com>
Subject: [BUG] drm/nouveau: Tegra186 Broken Rendering
To: nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: webgeek1234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 24T6RKBFMRJ3UJOKKXQ25FXCIEUIP53Q
X-Message-ID-Hash: 24T6RKBFMRJ3UJOKKXQ25FXCIEUIP53Q
X-Mailman-Approved-At: Mon, 18 May 2026 15:16:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/24T6RKBFMRJ3UJOKKXQ25FXCIEUIP53Q/>
Archived-At: 
 <https://lore.freedesktop.org/CALHNRZ8ngy6dqcjpA5v6=opDyisivGztE32uvNS+VRsOGhuY_g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Tegra186 rendering with nouveau is broken. See the p2771 video
attached to the related freedesktop issue [0] for an example. This
recording is via a pikvm and starts from boot. The bootloader logos
are fine, but around 33 seconds in when the kernel starts rendering
the LineageOS boot animation, there is intermittent breakage.

It has been suggested that this could be the display clocks being too
low, but all the clocks with 'disp' in the name are set to max_rate
except for nvdisplay_dsc and raising that to max via the bpmp debugfs
nodes makes no difference. The rate of the gpc clock also appears to
make no difference, if anything higher makes the problem worse. My
understanding is that gpc is the only clock that the kernel needs to
touch to scale the gpu clocks, and bpmp handles the rest. This issue
also existed before I implemented gp10b pstate support in nouveau, and
the subsequent devfreq support.

Does anyone have ideas what could be causing this? Or anywhere further
to look to debug this?

Aaron

[0] https://gitlab.freedesktop.org/drm/tegra/-/work_items/10
