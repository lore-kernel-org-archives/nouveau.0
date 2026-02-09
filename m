Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DFCE81BB0
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 12:40:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71A9010E3D6;
	Mon,  9 Feb 2026 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RnfsNijL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 911A341C6C;
	Mon,  9 Feb 2026 12:31:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770640264;
 b=AybaXtFrTb+R0YeojBGZeVY4Oxrl5se81lr2I2GLaAG45mTqK4QakE46faRBZkYQTbSIv
 4GsMHjNFSOx0pKJwESR8x9uzGj3CYFNSJ5vv6BZqoEMT/A5SYc2/uBBBC/ShUBBi3QaMADs
 n/96M4zYaMIFE564qS4Hchf1mfCyRzEtjsRePyt3N9VRx4xNilrnI/cAMxOlDIBV9N5c/nW
 Bgg5GI7ui6SIZ5QRuLaVHf7RKnc3fRCvwXF114cmUyuCq80TLfO2R6dsrKF3vB+4LcySWlN
 lOtUsMuM/NQ7NL0gkyXpRqXqki0nmh9umJYfsHln8WZ3G/bPjiYI6mqk3KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770640264; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
 b=f+kSqWeGuRKo9SZlNajPSXPCFBBcZAtfWdT9wZhdFcS+5KuQgOUR25lDT7kHOYCMr6CiR
 QfzsVFllZG77bQX2K3+642tfwm9335V1xjzIFGHDpB2c1Vx0MEnZtawvB6nWGB/eGzoQvos
 410+fBqA75Et6ZvZ7v//7Q32jOGI9ZT+OVzzXo+hN/WLLRjt8zXU3JZv5XdbJwEsty+KVna
 42NDo9y4OcWcO8j1+INcpv9SXZIasGRVtud/xU3t0yRZsz5+iwW9uz2jILVYeUjw6vePPDQ
 yX72JRC4PSanDbGi64rKfse6oi9IgEpAS0sKo4HWMpYAxKyjxUn09MEtcbkQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 35709402B7
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 12:31:02 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFFF610E3D2
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 12:40:30 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4806865a01bso43675295e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Feb 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770640829; x=1771245629;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
        b=RnfsNijLCZ5YjS+6NFSJudAbeDNg4stQR1KvyQzUfswZg3V2KHwgZM7TM+/BqSq4jC
         MSGmBoJKLh9aQz3jNmNOm3sUtH8OTZVKhwnS0PNdw/VnUUzZvCZT/9cJuy2euO/9pOIJ
         PJDRfly9EYWhw63lHA4RN3kQQiA9DrXA0Y66JTqpL7guoPcaMKPTc41pYxJ4hP/5x+Ec
         3x6SQUEtP8QWcd7sJq4K8o0ASdRU+2P9p6jkeg73UtiS/HxFTnu0Ia0/eVE80NPEBZzj
         koI7TqUHafWcpgTk6f6A7i3UORGqBKkaYPqA86aMhfxR8E3DHbqrDQX624Xw1bbb5PWz
         Jr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640829; x=1771245629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
        b=mlWgwZvVbVPnwuA1XEgLdnfPjuTedYJNznEErTORUuxULkAs12V0XKccA1KIDTn1to
         hXpG3u4RuM86YMORWQaoQ3DTjgvw57JyzDNWQzbYQ8GjE6bIJrDf2LylpBA/JYIMiGOV
         mNxDCuO+4J63G/HgLtIYwvfQYEqowTJZd4oAGH6TA/C+CPDV8YVF2DqEivrReLzAu/3H
         v+GbWvo2HlcK3pF/nx8xHTZ/s5loyv5MmYO1xA5SczgmwMy4tQzb+Awk3yvdaK1r8IDl
         0Haif+7S/1FMA5UOlrnV9GpBuK70JStSPHUkN6w3PdyVK9yMaImBy5+D9PIQfvqM3O6N
         M7mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZF+9eNewOhAPK0CWEHW3ppOxAnIhN8Nxgfd/xhig74Z/W2EFCVeBtew3sTkBfXwShc9e0dIOt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfzgnsGm/H4hQPysMRH5kA44uemeJXTRahBnKszkeYa5/tZAYh
	4LJWaDa/VC8uycQgNlu7stADdPGMZ4c9zmP0RH5SoPxB517q6S9dQoIw4Xr9RXW5v39qfHvbHla
	q+3weKUnDXOI44gyVcg==
X-Received: from wmjv20.prod.google.com ([2002:a7b:cb54:0:b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4d:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-4832096698bmr152297515e9.19.1770640829288;
 Mon, 09 Feb 2026 04:40:29 -0800 (PST)
Date: Mon, 9 Feb 2026 12:40:28 +0000
In-Reply-To: <20260206223431.693765-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-2-lyude@redhat.com>
Message-ID: <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: CMBWBDWEXINGO5JPAXEA3HET7XBT5E7N
X-Message-ID-Hash: CMBWBDWEXINGO5JPAXEA3HET7XBT5E7N
X-MailFrom: 
 3vdWJaQkKB-IEPMGIVcLPKSSKPI.GSQRSYZIEYPMWXW.JVIIHIWOXST.SVK@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CMBWBDWEXINGO5JPAXEA3HET7XBT5E7N/>
Archived-At: <https://lore.freedesktop.org/aYnVvFwBk1SfiJGQ@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
> Reviewed-by: Janne Grunau <j@jananu.net>

I think this email is misspelled?

