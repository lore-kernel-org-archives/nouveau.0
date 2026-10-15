Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53775CC6B38
	for <nouveau@archiver.kernel.org>; Thu, 15 Oct 2026 09:11:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65911223B;
	Thu, 15 Oct 2026 09:11:18 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4C8B248AAE;
	Thu, 15 Oct 2026 08:52:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792054359;
 b=PjUHB9BL8zhW3R5CaNJtsgbUcsQQyLxFKa/dmpH/92GKH7GGO/FsMpw+WemR7rgpCzaT5
 nbs+zXPaUhVwmn0qjq3TpddtNwz686TQjrDJyICx3ARCgxxlvsUoYP35qLcC8NalTsBeFJF
 Pfcj8app5GNgQoiUOaqtBmURtPlm+ACHUFHzgCrNoEris5wEZcDT0ztYmhw3XXd13J+4EEg
 apQMyBBgXytVjvOODm7PPjMu9bvbqL0sX6hcDzKxVPrBgiqKFbAwoWMc8q6OXhRhstd8SbN
 NhIlvgHKlxdkHmMIfexNpuJ5AmULm424OLn9MKnBDqrcJCj6Vhxjf6SS2HUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792054359; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jEoeOoyKShfauUM6omyrvuy8JMoL6O15hulliMOGIOA=;
 b=CW1oqAeyqJmQMDUPsAUqK5nwNyC8NjEdbNoXa19eLQCGi5Uc7pLD+fD5oPglyi6zefLvL
 jNXLDmJPHTgho+Zg1U8XlDgXGdeofBnzuUGI0BOiGk6NrkN7P0GhhJoD5PxG6I8jBnvpaDJ
 TVEvombgqQvskw4+RbCPZVG8RGjxGbDXFjhOekI6S6Xe44Hl3sdrcKdz03w6ivcspW/CJDd
 D7kX+7fVklgTnOO6RI++qLmGvlQpMHoiVV6aoWFa+3k1IYF6O7prkAQz41UREoNBotIl5a7
 vtnovRSfZ8cQLfyY4gZNCS5wTSK11kTVVv8Sh97aTvFD1WqsqJBG+T8qRhDw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 11C084874C
	for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2026 08:52:36 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9A5D11222F
	for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2026 09:11:09 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-93a40a9a01aso250998185a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 15 Oct 2026 02:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792055468; cv=none;
        d=google.com; s=arc-20260327;
        b=AsQXnTZJUCZMZWp+twg3b4Uhh1YMtyswhS5Og4DzRQ3Bw7wzXVFdFT2tDdRsv6kKFm
         btL4MKVyRzp1cf2eUWtCAK8y2s1KwR5Sksk7L46kDDLKHO1Drb+r9x55XPUslPnCa1FI
         SQNS7gcuBd7e5NbGpEH02Ki5Jz+gtIiZl0cKVbmzZAGuPT3LKJPVfHhMTwjgE/hceu91
         /p4FWSaCPxaffFge0lFxbp7ZsnPQe4hjE88r9WnTR1shCNdGfAhr27SKLSbeWXNfOm1k
         MydWJjxW+WNrMBgSfi/sXb9Dl40dxPCMy6JsDtgg32sOZpqBpylnYypsHEKVxI2Z94MD
         bgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jEoeOoyKShfauUM6omyrvuy8JMoL6O15hulliMOGIOA=;
        fh=byTEA01EvqHFQdcaWfFDNref5PecJIX/vxG30vPa5+Y=;
        b=i8ZWS3RhEmy+1YYd3cvN3hNC54qcP5ZyFTv+G2flyNa9/x9JuoE4QgAUVJ6RVLLYJv
         cdF/h8pXqAEx3EjuC68eOdnjnHw1d1I93ZIwINgKaTkWfgxW67bd0121iKv9Rhb4Kwge
         EG21ThDPWcoqZsj1N9zp00sr2abwiNT/5TeB3xFLmbu+HBIf+vD0HA+/7+IMWUKy2/S2
         CJClykG/3hPsTTEXRW4Q+HCRtXG50qnVzKmE+DEmdJIlFnLptJOVmkpy26jWmNiqzVMc
         w5pN24fCsq4Ki8JBNmjWeZrpV6Eoun+9icsuyusLszCe26zOtw70XevHLqx4D9J97hDe
         tY1Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055468; x=1792660268;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEoeOoyKShfauUM6omyrvuy8JMoL6O15hulliMOGIOA=;
        b=bA0oMtBlREg8pitz69UjrYJKVRFWZJvzUPLA5SczzxHRTzAcnh+pDOwfH6zif+/I13
         VFtkDfPAAJctN8XfzLQwEfr2kYSX8IkfwjvDaTkQe8qfOr8CHjv9kXDAB3UIaOjpxJd1
         tiCJRF5fCpfVVEbeiY9FWCDTKAakjQQYzNMxGz8LBMhvRFDgWd8f2w3kbEVN1YXBZFGI
         XsoUE5SIOxCWPGNx6rwf5owCjaFucrb1GVvTKQuchUPNlMgbewXjS0v8YgSSvcaQVHY6
         Dqon8EQcbc655/Y5L8KEsxfk42SYcbJs+eA3T5AB3rWPYRV/1klBvOs3gv0ENjhCbV7d
         jGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055468; x=1792660268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jEoeOoyKShfauUM6omyrvuy8JMoL6O15hulliMOGIOA=;
        b=PC5KX/LZUbnf2W1mVB9DFM8GLf9fM1wXlRnhF8nl8p0T/NF5at93PZSH72J4MApGUg
         MaK9Lk+59E5kXoLXt4QriCT1i+hsjFqvvCQLeA5QwAbsM+W25/ofMY5USolqKn6931Ym
         /Rs2rbYdroUwx4sfr1rmZhcI3dBfJCZdtS09x6pXZEUUNrQj5yK4H60rxrOj+AB3IAW8
         sryKPQ+lXN+P4PhdZRcqy7QljjqRPSLIczGM/+f9eUcCoiqlcZKW7j4JRi3FRqjzgP2e
         S8H7PZTktPkwwoWjhO0bA7PMOnYvMvsLmmtEcYKhaXGrFWoZP9HHqoUNSc1HkfNae/vr
         PtHQ==
X-Gm-Message-State: AFq9FYLZsZmHTRx6Sl6C/vztcxWUYBj7rDNaUPpUArEtHxahvdYEYEOA
	QY+56GXGWH4YPPZFtTr2x6kFUXp7YP0O1L4e+tiUPFfZ9yklQde5G/XCxidaQzCvrC+RTE9Y7Mu
	sw0boAuYgnf+uueU9K0zAKzgmbiZH5MLbWq/Q
X-Gm-Gg: AYBFou2RhMB2A+nIghi82RYMRmabSAImwgGbGz64qE/VYhW5hue6hcunPEsPkDnxBaP
	wbjSvnqRel5W30q8a8ppHW/NXmFvK76/+sRTC/jEPW+jxIe6mTwUFQmK59ccVzj63JDKwwYnDUb
	x402ULH85qHfl5sUDzOEYfSS1B9ufme0XFnMXRKY9TQt1ONU9dVx+lS6J/Y2TnB61y2LB3ohEHl
	eQ3ELC1z72azif1oRLIpyrmOuqzxRPH6bn9amEoHpBAfGcMZ6/VZs8IvKrpoDpa/wxSe6woSIQw
	WEchiJqt0+QKcJBUSbxjGeCom1KRRxZ/0i/p++jJKrNg7/QMpk31YBKANJbbZM5L5clCxZL4ZbH
	3Zl0tcMgAOtg=
X-Received: by 2002:a05:620a:2850:b0:93e:94c3:e851 with SMTP id
 af79cd13be357-93ec135054cmr2512973085a.9.1792055468406; Thu, 15 Oct 2026
 02:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260928081450.19340-1-dilddream31@gmail.com>
In-Reply-To: <20260928081450.19340-1-dilddream31@gmail.com>
From: =?UTF-8?B?6rmA67KU7ISd?= <dilddream31@gmail.com>
Date: Thu, 15 Oct 2026 18:10:57 +0900
X-Gm-Features: AclHuK9dY7-4Z1BJVfwNpzcd1NSLlAb1ICM3Ix05ep8_FkWQ-f6VLJo26bPN6Nk
Message-ID: 
 <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000009cbe2f065ddd6d4f"
Message-ID-Hash: SIDTMN7VBHQ6TWTY4I62XMNACIAWUZHD
X-Message-ID-Hash: SIDTMN7VBHQ6TWTY4I62XMNACIAWUZHD
X-MailFrom: dilddream31@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SIDTMN7VBHQ6TWTY4I62XMNACIAWUZHD/>
Archived-At: 
 <https://lore.freedesktop.org/CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000009cbe2f065ddd6d4f
Content-Type: text/plain; charset="UTF-8"

Gentle Ping.

There has been some related discussion here:
https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr

The patch has also been independently tested, with no reproduction of the
issue reported so far.

Thanks.

--0000000000009cbe2f065ddd6d4f
Content-Type: text/html; charset="UTF-8"

<div><div style="font-size:inherit"><div style="font-size:inherit">

<p dir="auto">Gentle Ping.</p>
<p>There has been some related discussion here:<br>
<a href="https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr">https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr</a></p>
<p>The patch has also been independently tested, with no reproduction of the issue reported so far.</p>

</div></div><br></div><div dir="auto">Thanks.</div>

--0000000000009cbe2f065ddd6d4f--
