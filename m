Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AC9C61DFD
	for <nouveau@archiver.kernel.org>; Tue,  1 Sep 2026 01:06:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A177610E86E;
	Tue,  1 Sep 2026 01:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h5c9VBJo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EB79647CF4;
	Tue,  1 Sep 2026 00:49:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788223742;
 b=ZLT2+OCrVpQU78RT9uVtFaNrQQFmNnJamEx1gbEvSZhIrHZuYScKNNLwNCzMWJUCZ/Xiv
 mEanQo7qWJLgyha0bdjyKESYE5+s4EIJCcEPWn2GLkEPhetLvjY8kZQ+hmgszxfk8ZMUWSb
 4m/Zqkj+8zA9CUdtBzqSNsed2QPkY5YUz2tqRrPd3B4s5RvYmS5M+WDnDZo2lZKjIitaQxz
 qBuLVKQXjepZR8cf5acmB0A2XZ/4KNvuypExs0bbAueaUdePD/HGh+u2EHiGFb6m+RHxKZP
 9elQSxVHh9O8P8/UVX5lzhA0CwmCyzzaDkfYo0UP0yXZbQq8MoSygKRQkmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788223742; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1dQ0R9ob+mA/FCDM4U6hP93Z6+K8llHiiFSOPCJL90U=;
 b=HClyQbGHXslvM4uYg7TtNDu9rU53RH6uCTM2ZXrKGM4Pcq3ThKwd3yefqFDHxwUpgukVj
 ykvb/Q+PHXEpQwuEkWymslBgnytwIa49Z/rAtO7y4lW0f4iGpHvZNCwz7N4ljtQr6pZt8A4
 UF4i9cFyYiCgVbBbcyUOyqz6qUoWk/rFgbUjKxmmAEGXsy7ImrDvjg0lAAegGC+qriE1Nvy
 yUf3VN9jq61H6OUt45Mz/ICf42L7SGRPQI+GmcO/n/cAZYuc3nOqQQiihKiBm4pdq2fOzUv
 OTsUsoH++NqfU/+mZ44ewMqDhLm0mT9gDw7CyGHUVFLcsyi5w1oJxKxOwE2Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DD0147CFA
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 00:48:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27BAC10E2C9
	for <nouveau@lists.freedesktop.org>; Mon, 31 Aug 2026 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788199320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1dQ0R9ob+mA/FCDM4U6hP93Z6+K8llHiiFSOPCJL90U=;
	b=h5c9VBJoQDZp/1p2pFWqAbn6XpxwjA3I2+iLk5hFBff8FrGYcThrPPca0e2pm9XV8yY8YN
	NXJQr8PCDzvu3dTnPLWKiHRdkE/h3HP+WDLBucFpzczBBrDEenSlHv1D6RQgb1l23RegTI
	+qxAVdaTbaXcDJ8wLju2B0tXD042aa4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-q7Tc9Ry5P1uqcZAvvDPddQ-1; Mon, 31 Aug 2026 14:01:59 -0400
X-MC-Unique: q7Tc9Ry5P1uqcZAvvDPddQ-1
X-Mimecast-MFC-AGG-ID: q7Tc9Ry5P1uqcZAvvDPddQ_1788199318
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e62e3459fso488777785a.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 31 Aug 2026 11:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199318; x=1788804118;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IydsfYgveubFKZpRxbshazB/ks9+hZoRPru/03kQ0MM=;
        b=WF5es8AcJUjH1QiU8guzdun9KCcoM5YU9T+OdcI7zFCW9O4KtsUEypYiswXH4hj3xC
         eFGNlpqwAByhCq7/YgHNFOWO9eBlpM1YiHdD9nD5NKcnMlPeqkCJ4Jiy9EAmbuNscgP2
         kCD6GQEgi7u2kFZsg0l7Xa7Kwl/ppxd6QkV8wljrQnBk3dGQE3QrJWMEm/OIKuR906MU
         E9M1JebGOU8czKTaoqAPfHhlUEB890dgQq5UYvZ6M71/6zw0pm5xBaL5S2aOe4Xdmksi
         hZDX08SCcJq5h0cAGUwdEbKombeJO3BnUn8TRHAmP02kSkK92/ii0Reu9Gx5B3qZq3H6
         PJ8g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrc2VjUpx7ppF1o+ST+XcDrR1JKxYxhuJ79DYPtCbvufHqjrrEWCDwvNL9WfPily7iEc86/QcKp@lists.freedesktop.org
X-Gm-Message-State: AFuF++k4CeTqv2IYUsGZg9Kd5h5HE8zio8ge2QMxDivd3I3HNrvSZ+gF
	9PlOI9M4qvwzAdUMF/66c52XhwK5e8Veiy/b6Uvzdgq5dDK78eA5L7aNb97g5dRkQGqhqeoCb09
	ylI6ruOQNqYUUa/6BVG6HL4sQ22eetcTqVczyyH5nPj4Ci+xF4U2KzJFBI/beM+f3Tag=
X-Gm-Gg: AR+sD10K2koXcURNB3bFardYrxuJsqrV9vadyNs6mWYdJVKapcOBJqipoLyqdij8em5
	UT2FaBHaXJJ+JqbiU3qHQsWtOXuoY/M42nS7awsCvLxAwxjhW+3to6XxseyicooOxUjcGyD/a1v
	uy0NVPlk7/Atx2ki5VF4gGZ6oCvip5tHya7+MjS2rG3AJYFGWHvuIQbHwvjMnzkEphsjJrG5jBS
	Xhv9BEgyfObpzU/hIrTbHejnoi0YRQOczgz0eJJ6Amxr8ReZrJhbqDDErCyaQzwBNRglGf6NJ9f
	X/6INPGAJMIBRwnvIwU/wBCePLQ7c1rHg5wpOqBAfmtZ9YrFdhzriwButrvdouhmNKFOnFF4
X-Received: by 2002:a05:620a:2991:b0:939:36f3:fea8 with SMTP id
 af79cd13be357-93936f400d5mr1117057985a.25.1788199318434;
        Mon, 31 Aug 2026 11:01:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:939:36f3:fea8 with SMTP id
 af79cd13be357-93936f400d5mr1116956085a.25.1788199312920;
        Mon, 31 Aug 2026 11:01:52 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9391700a637sm840604785a.5.2026.08.31.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:51 -0700 (PDT)
Message-ID: <6c3656fb11362f9011fa71febfb5e55c96404d78.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/clk/gk20a: fix undefined behaviour in
 signed left shift
From: lyude@redhat.com
To: Muhammed Sariyildiz <asiyee994@gmail.com>, dakr@kernel.org
Date: Mon, 31 Aug 2026 14:01:50 -0400
In-Reply-To: <20260810214247.21416-1-asiyee994@gmail.com>
References: <20260810214247.21416-1-asiyee994@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BAmrcvwR2LbqASAPfK0UvbQUvLMnw0x9ksKi9T1DaFM_1788199318
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VIEB5OI7K7PPTCXSENKWGIXRCSNYQIPS
X-Message-ID-Hash: VIEB5OI7K7PPTCXSENKWGIXRCSNYQIPS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VIEB5OI7K7PPTCXSENKWGIXRCSNYQIPS/>
Archived-At: 
 <https://lore.freedesktop.org/6c3656fb11362f9011fa71febfb5e55c96404d78.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sorry for the delay, this one slipped through the cracks.

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Mon, 2026-08-10 at 22:42 +0100, Muhammed Sariyildiz wrote:
> MASK(w) expands as ((1 << (w)) - 1), and
> GPC2CLK_OUT_SDIV14_INDIV4_MODE
> is defined as plain 1. Both are used, via GPC2CLK_OUT_INIT_MASK and
> GPC2CLK_OUT_INIT_VAL in gk20a_clk_prog() (and reused by gm20b, which
> includes gk20a.h), to compute:
>=20
> =091 << 31
>=20
> Left-shifting a signed int into its sign bit is undefined behaviour
> per the C standard (ISO C11 6.5.7p4), and is flagged by UBSan and
> static analysis tools such as cppcheck (shiftTooManyBitsSigned). Make
> the shifted operand unsigned to fix it, matching the pattern used
> elsewhere in the kernel for register bitfield masks.
>=20
> No functional change intended.
>=20
> Found via static analysis (cppcheck --enable=3Dportability) while
> auditing nvkm/subdev/clk for correctness issues.
>=20
> Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> index ea5b0ba..7a93f9f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> @@ -27,7 +27,7 @@
> =C2=A0#define KHZ (1000)
> =C2=A0#define MHZ (KHZ * 1000)
> =C2=A0
> -#define MASK(w)=09((1 << (w)) - 1)
> +#define MASK(w)=09((1U << (w)) - 1)
> =C2=A0
> =C2=A0#define GK20A_CLK_GPC_MDIV 1000
> =C2=A0
> @@ -79,7 +79,7 @@
> =C2=A0#define GPC2CLK_OUT=09=09=09(SYS_GPCPLL_CFG_BASE +
> 0x250)
> =C2=A0#define GPC2CLK_OUT_SDIV14_INDIV4_WIDTH=091
> =C2=A0#define GPC2CLK_OUT_SDIV14_INDIV4_SHIFT=0931
> -#define GPC2CLK_OUT_SDIV14_INDIV4_MODE=091
> +#define GPC2CLK_OUT_SDIV14_INDIV4_MODE=091U
> =C2=A0#define GPC2CLK_OUT_VCODIV_WIDTH=096
> =C2=A0#define GPC2CLK_OUT_VCODIV_SHIFT=098
> =C2=A0#define GPC2CLK_OUT_VCODIV1=09=090

