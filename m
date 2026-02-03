Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7650CE8784F
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 17:17:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3430110E72D;
	Tue,  3 Feb 2026 17:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="MazUbTBD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 43D6541B48;
	Tue,  3 Feb 2026 17:08:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770138494;
 b=uBHKc+bP9YRZJIK6n3uDXBc7zzapVh9wXO5UzjoZbr7qgPt9T2HbLl5t/DV8X1VBO+syk
 h6T55c3SuJCj/UCe1Tvb2QGNMUEuqXp6TRn0pXULgVHy+M7Ii4OxQnRtBDdZLTjCJFp59BJ
 CMGJpeWCsTfZI6r20hvHWCTyWykX5ShXFXyfLJm8xZ42PwViWn/JqjA0LGE/LjwwhKK/xT4
 pNd57E1woymrpoPCYawxECYZWbYPS/rTRy69eUPPFhfS20IVHXInriXnTTa8gok5B5ZVWLz
 xuHzUtb7IbABCQs3RngQOoYQdrstkwBdzxt5D5UzxwKMo97bwSF7IeFrQC/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770138494; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
 b=vxIhFsSjJ57uukd1j6/6vvJSVG/UJ4hEuc6CWuiWITZsT1ZXVzw6n7mID9ozwrvZpxPvk
 ass5SKwSlXeFuREu23eDCOMCUZ/7cI93peSvB+bX0UyrNMNo00OAjHnQ8QNAFLqpBCqzdwg
 D2TLffmVhK18izobux86NzcmXyq6FLcd8i+58T289Q+tfN505sEiubRZCvTa62FVHZZKjpH
 QQ/e6wFcA/q6zdx4EltS48n6BG99BsksT0yZQ0o3RG4emD3y47q0CmHvec/+XntZcm879Cp
 lH3qgNVQ1QAmNT45wGzFuwGMcPJs4rYVKMkGhKtYuiO/J5AIK12ZrQq81RNA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B049B40B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 17:08:10 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 238EE10E724
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 17:17:26 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so1100567966b.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Feb 2026 09:17:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139044; cv=none;
        d=google.com; s=arc-20240605;
        b=EbxzuPEk0IOevLrP3YO8c2TWy+P0h4ysxMrsIAQ1w29L6Ighvqxb4J4tt1SA05W0Bz
         ZljbjjlqIFMwiYDjsvPVq7R3Tn/XjKDB/97fndUcg3kVyAQ9JKYRhmySMW65oE9j2F5t
         IF1KFcJGLBuAuu0Ky2NErBIs5e2TiqYgZNK6uK0OAbQIpBkp0J41qmw8zpNZXWUhcHrR
         Pb9moar8YIMV1sDRksONgPYlPqczw9ZNUVbsf7uYwnEI+rbkXucf3ynjElIzUye7VxkK
         gk7/xzKCZofg2ZKe1bQx2WnxYXQJAAMXGZDDsw+Ct8q3fZdqszGdirmvx0cF5cgPPGI8
         +QOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
        fh=SZ1wWxaH+EpsKbmz++gwW/lls5yWu22Z5xopjAEBBOs=;
        b=FIY2u/+CWIQlPpKfLiazoDFWrg2Dd5vBxOoGgnX7FrGP9n06Y47xkVMTtrOlgo/PHy
         rF8UXLYtM5Nmuq9osQKmRq3fByRauAgVco8cKB5tGyhWp8S1xE+Oz8Lt/trD7sDnYBr4
         YTqgJiMeZLe9Fzq6Chx8TvgWQq3Dt8tzk/VpsVhEtXufbDn2s57BH0tNHtSM5L/DKke6
         A44WGqUQphBESeUSxNc4/FA1pKQr7fqBnjzf+BhmvkTmGNmwX/FuVmOw8xHVpu4ltpyC
         15ar5hjW9+juqqnJUkdatxDOW3oX7NwVQcueKVuUT42f8NEdVi4ffzRgUOI3tmkIH7Su
         s0dA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770139044;
 x=1770743844; darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
        b=MazUbTBDB+jdmh43jkB1UQFLMxNYznXjntN6z1waumdD8g7XWEUSeMwphU8UNNqf9O
         9EFmy03KGVEousaiYZ7LE5BqpDG1gWOMIVssCHLr+HcyuZ5lIMJnqECcJk+xkWHdyx3u
         oCr6Yaf1154xLa1/5N00+lJ0uz6/3WnF0wnLwjXdP5cyxzbfIL8K0VEgFwZ9leteUiv+
         rY4Oi/xZAhE6WgdRxKZDOCC+D9SRjwKpIdUX5/iryRKMTugu2ydBGu6aYlR5tjKNaPMW
         Dr83jekOIFp6lmwaiHwlqOP6+3eBytoql726eC09yENmpRQasA1dJZWIVLxeLBIu7MNQ
         z9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139044; x=1770743844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXUcacBTiAMKHApnkp/9joztisqR6cQaDE+uiBNMCxk=;
        b=RdMlFa+FqXdpMXFCSJWaNvAUtDZyAJ8zQnC7X8DgvYxRRrNLHpnbX9xuV5mkRpI+P0
         39ZZtgPBGCTgz9jq0bKy2Pwvs5xlRs6G3ZzZ12MB5GLfQCIUmgk4BreBxMrC0xapsACy
         r3I4UUlsIdy5mgiZb2bAs1jnMV/Y+fPa1l/8hOsuLHtXeGq7esWZucfNXP7pepsjf2Wy
         s2R7GmeU36GBxB/Yz9NKEixz6JpTu7V1yD7rASXnN7m7BvkFQwlFzi3mZzCzBtVxW79C
         qB31n+ROCgjIfp2yOYxIp9jxLZXi2mtBAcMB8hSiqmknSgvzucy8Hb1Iqdx0l/KUcu8L
         brxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtfogSNiOxvRiokf9dQ/2dpFW//re6kjGS/4zx1h50aQB932DpxQNkqpnZNgs5W7/TDl6QGCFN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj/h+vKmd4eL4blrGJDqVAc9Spoy9sNa+BeNnEVJBsbOyM8Beg
	uMeeqpslWfbWS5KiZdm02M/VWr1+C/STw32iNafbJA3Ht3TzJVLA2Uf4d0FAOc+n/uJ7wxGC1cr
	bBopplZqWlu5M3WsZAGwDkhKzGpFQ+5mrQQiQGexZsQ==
X-Gm-Gg: AZuq6aLdAfmJc44wVCMjrS+DDnSCLn7B+H0fCjujkgEUsPVzSVFu1am2btNiRr1x0mC
	T1vFR2E0YNN72LDbRqBB0hPIuidPd6hBeRDnz59KiDPXGT0EMV6lvZmFyPcC/ZRHhw+ayyYObXQ
	Urfyr7Phfr9VOvhJTDrsLY9BqEBXb1feGCQxjogPj6t/fzTz+L6mjqVhnGiJJoopi4kJ9Jw3B9+
	HirSjWGzIqRJDGiVqm5Dt1BcRfKEJOUC8153jGzZK948+HQ0msZkyGlA7K1tnpicYyi73c=
X-Received: by 2002:a17:907:26c9:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8e9f196585mr15408166b.42.1770139044388; Tue, 03 Feb 2026
 09:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20260202220402.2217813-1-airlied@gmail.com>
 <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
In-Reply-To: 
 <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 3 Feb 2026 12:16:58 -0500
X-Gm-Features: AZwV_QgM1aeOQoCbcngqwZlMPlTD5sT2OKWl9VNfIi_vZ5xZ2YFLd_KZuY5W4pI
Message-ID: 
 <CAAgWFh2NiUYduXf_hQB6cqmXQZQ0t8qBz+d5J01EWXyE8XEgZg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v4)
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: UXNR654GRZNP3PS2JSGAEFIWSRAS3MW4
X-Message-ID-Hash: UXNR654GRZNP3PS2JSGAEFIWSRAS3MW4
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UXNR654GRZNP3PS2JSGAEFIWSRAS3MW4/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh2NiUYduXf_hQB6cqmXQZQ0t8qBz+d5J01EWXyE8XEgZg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

CTS looks good here on this version of the patch.
