Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CF2FF885D
	for <nouveau@archiver.kernel.org>; Sun, 26 Apr 2026 09:16:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABD810E52D;
	Sun, 26 Apr 2026 09:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bw39loPX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D91C945C55;
	Sun, 26 Apr 2026 09:03:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777194223;
 b=nVceuQDPWQ3zybCGI3nMM+lVqeh2QneEv0Jw/V+hLFFQoJqMuxyfWGfj+A3TG0F+lYW4K
 stuBshRxD9Ro3rg5gAiDMxVVcL4jkhhPAud2dxV5/DDZ3Ffh/E8g/2ZRJwpLDtl36v88EQX
 L0G21FTf1PUh5HLwXWMYuZleVQCFrNNZn0fIIW5LJbYmE3/tAadbMjE0QwDyy+m256KIFD9
 7sAuGSzEcxZdShiWCSr43gYQF/Lazu1rGxFnJd7e2qqWyYeupsX7j4tokqTnv1nygyruGo9
 /WFqseccG0tkxyDqoQ+J+uII5Jy2GzdwVq5/NeZgf87G0TXqhwOQQbcD6lKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777194223; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MpyPL5TyTayqbvU2HEjTYaipnvh2LNQ+6cgKsY26UEw=;
 b=wtodbJA9CoV5t/y5t7Kufbsl2e+VL/vt+S3EgIXUwwRHFwMwqzrxFoMJ7LvbCWE7kMi5a
 iR13NT7Lwp+NOg7+EqUWdc8m+S0MFYzAig7sw4KNz2FTMt/QcbhPMJX6DvWdYColIvK2dNc
 n1j7+p/6gBqpPyipA0GLuHjAHLFHabGoXhfh/SiLinC+YOzLbyZlqabK6JmZ3jEvoiYdO4c
 nPR2VNndCkEyITa1PTl7zMAw6cXIkfSzQ9RMY/u5WIsHWabQlPciZ0ZnXeRtFP8Jm4xbj3r
 Sd16uVEIMT2CHyMUeS/JtMJs2tpfW7z1mrI8Kl31W+3uqMFGv5CVSVUrBAKw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1DBC144F60
	for <nouveau@lists.freedesktop.org>; Sun, 26 Apr 2026 09:03:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4452B10E19E
	for <nouveau@lists.freedesktop.org>; Sun, 26 Apr 2026 09:15:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43fe7c6f61fso912634f8f.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 26 Apr 2026 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777194957; x=1777799757;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpyPL5TyTayqbvU2HEjTYaipnvh2LNQ+6cgKsY26UEw=;
        b=Bw39loPXn+C37IRnR7yaW1dfyhP8PdvPK4rBE06IJnZQXDMpGcMczgw80fIh3gYE/A
         EC0HLsKWPqJKd5uFi/EvhK+skgAZqVdBK3eY7T5kT0oJke+8mk/yFXDmwgeTcGjCJxQf
         B9plMLZyVrky2/vyRM0mSSjRItRkK/0hfojeFG6c2R3y2RvoPaSoJNBnkxGfPgctcVL6
         FK3lzEKNLj97Lo/Gc+SE0m/hDm0I3dp51RhYWcrHEgB+ZUrslzRViD6OZXwxfXgUzpbL
         9nsZ6zjFIpAQs5ISQGX5QWKKczo8xGVMda3leyImGLD1u0Gq8DjMI2UoG8rpODU7G0p3
         r5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777194957; x=1777799757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpyPL5TyTayqbvU2HEjTYaipnvh2LNQ+6cgKsY26UEw=;
        b=qMXmk3ZZU6jLktBz7ef9nTr/0KSXMaMd3QT7EQGHCQ88eAkaYV9c3Db3AVIg77TVes
         Qana+rFHjU2HHjs3uAk3GUIOja9E20rSWz7z+NeQdSofSo+d9EUdxgjRH3G7gRi4JVCz
         3l58p3bR9Bbqicw5AStt5YNCJeihfIbIEWMH5n0ATXngbsgDZYrIaBdFZrb0ljs1slP3
         cHHwg/6rgoX3fSROU6896ICseKQ+1NagTzx1dtSbkQt58JM1++frbKUUqVRZoqP3oIPy
         AI0YvpdTXUgWNyDrlm2X6CB1CP0Epj/wNjleQ8RaRJoWQL0C8HB2U3IqoFotnG3i6lSx
         q1ZA==
X-Gm-Message-State: AOJu0Yw38bv4Z9EW/UlJ8cWKmq1hfKX21jTUAfOUvhnAHo2EaZfTTpgH
	Se4uT2Zq8MBog5GsBSmzQHMjni6FGrfvGBOW/FW3STv9CaH7loyQ81m7RCRcWuzT
X-Gm-Gg: AeBDietpfh0euQQ8LwWnd0maV6Lo+ppW2ibe1V2PvthPd1zNIsHFlGsBi/jR7vCoAzW
	ny1QMkLvO+z7PzqNpAldkWUWyYBWzUiVDKWigm7jMANXtj4EkzWO3OWij/Mp4kCqwVbgqzb2vUM
	lWdjBa0EPPce9R+0lUbBeKJftxkq2JN/lv94w2cgKCzf8i8JqQsRi3f0TpXiFo42anPL+GedmxV
	iQ2tdl8MiCKKGLZLC0UIVrEKK24+cZL+rXHydbNARWW8QghRzjrUXjvSb4QLaJPhvuUNtUYNmu0
	bdoazEYhcVV/hP49jTLAwYTEB0SvfdlDWkIFoApYT24rek3S/EkZHxqisq93/Uy5N3GSOFU/Aca
	V/526Ss3Xj8b1uUhhSWKmouVecYaJLimllUr6lWfnljeez/Qu8/I3sgSEVs8/huuBnqp36Ukkaw
	0O+00PW+IZvtpZzeWAYDRxp9CPbK4QRgt+fQfOW7Nvq7bd7t/YIEMiTc9EvaL0CafMTWz5CIVSb
	ptLkUas2hcDvzl05KQWF1Yh1lyTuWQEbRw=
X-Received: by 2002:a05:600c:4686:b0:489:6c28:dbb4 with SMTP id
 5b1f17b1804b1-4896c28dccbmr204731515e9.5.1777194956440;
        Sun, 26 Apr 2026 02:15:56 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc558f2sm552070085e9.1.2026.04.26.02.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:15:55 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/nouveau: stability fixes for NVAC (MCP79/MCP7A)
 -- 3 weeks soak report
Date: Sun, 26 Apr 2026 11:15:54 +0200
Message-ID: <20260426091554.21272-1-marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409172126.115441-1-marek@czernohous.de>
References: <20260409172126.115441-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CKDTN3HTIXSWKVWAUMWNLX6YEYJEOUOG
X-Message-ID-Hash: CKDTN3HTIXSWKVWAUMWNLX6YEYJEOUOG
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CKDTN3HTIXSWKVWAUMWNLX6YEYJEOUOG/>
Archived-At: 
 <https://lore.freedesktop.org/20260426091554.21272-1-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

just a soak-test follow-up on this series (submitted 2026-04-09).

The three patches have been running on my Mac mini (Late 2009), MCP79
chipset with the integrated GeForce 9400M / NVAC, as my daily-driver
graphics stack across 17 reboots on the patched kernels (14 boots on
v6.18.18 and 3 boots on v6.18.22) since 2026-04-09. No regressions and
no new failure modes attributable to the series:

  - No FIFO errors (PATCH 1/3, nv46 MSI rearm)
  - No NULL deref under labwc/Wayland atomic modesetting (PATCH 2/3,
    CRTC NULL check)
  - No spurious DisplayPort disconnects on HPD IRQ glitches (PATCH 3/3,
    DP retry link check)

Regards,
Marek
