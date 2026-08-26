Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA2C61DBE
	for <nouveau@archiver.kernel.org>; Wed, 26 Aug 2026 20:30:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00BED10E1CE;
	Wed, 26 Aug 2026 20:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAOODK1/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB78847C4A;
	Wed, 26 Aug 2026 20:14:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787775245;
 b=D78HKfzku5hh4HvY7ADFNRkkt69cTAZB76+2ZcmHjg+c6hadr1N82mCmm78zRh5iGJep/
 qevERnfSBRznrDtAJUJzRPEeNkLphJSaXwV2peLG1pZNuU1GSEJgZhw8mnaNqNBvCzjCs0J
 kMr/2oYMwUBjYB2BtAn0S7UFy9xejjpolpbJPVQv822dQoaHeCKUzbDQrh7jED23bXE7K+N
 S1HBNK1BKF22trRjtlYZeW/tmNVXz9R/FALS4/93E6QZRl2Xw/4b73TyIul+sOQ2vAQ67ym
 L0+mswo7avJqPc38sOd1aEIQMtEtlRfBjPCPYc6WuNRBVma45OFO4R0vjrsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787775245; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ufqJcA4GLe7bKYSt4VuOA7LyG7GHrT+0lE+aWzUukb0=;
 b=uS0joOBM4sMFRPO5VrP5G7X8QTO9JjlaNbA625EgWF2RDWsy5IssFGm/cAjWdceq9uQTE
 GPEFcTmTGoc2xdlacl7RZO7aiShS+tF4+aKPnnKGE1XXklzeYPTOvTWUhVsvcyJYjtNMhI/
 9J187RMNqwUbdgp9+LXhXabZb/3zs5DkeD8cCe0nChlvjSU6o0lZBowIEAy70Zg/X9H66dg
 aVVrbnb2gyfkLgeOymfcE02QMYQ6csEd0pJNcChceZyQZA3n68RiMzU485mYZ64BHLwm/4l
 JytUQdaky7yvyz+II0fZYevoevAHg3zH8F0qVrqoRNwT/BbQ8PNwy+CjdMuQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 19F2A45CA1
	for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2026 20:14:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE2E810E986
	for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2026 18:02:48 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7dbcb505578so14027217b3.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 26 Aug 2026 11:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787767368; cv=none;
        d=google.com; s=arc-20260327;
        b=KvvfiZdgz2LNeVjG67AiRgQEfABoQEWTm1t7bv9lvdNnT7hxzJkdQMsV6DMCXDoyeJ
         rgCy4n/a8dxPTGyeYcDnqwQUa5AmyDYP0rjbzCYm3N8/fpndRXju9KW5XOzKvO5EK/M/
         W9KfSARu4SE4lBwUdvlxOwgJ2bDm8Y0BWCc2kjNsaSyJCWv5EHKrqHCHa+xUuwa9Gyar
         SWIyD7oVgb4WXFkRWmOPNlC8QihWiBapsurDOYOY0vaqdALUl/O6FTG00o1Crec10NzD
         UhOI36wn0bYZE3amh0OoFie/Ch0HkyCv2RfyqXAnbBEh1m+ER3ZB11uR1iT9vOZ3WtLb
         KK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ufqJcA4GLe7bKYSt4VuOA7LyG7GHrT+0lE+aWzUukb0=;
        fh=oea/FLlOqbedNm1aCNDg2rwa0DdUWqqhVZWIhCIBp7M=;
        b=Q9WztekShfIJalfmvkzu/X9PER/DqRdUoqvPv8IR0GVUlErtWBmsso3waZWBsLAjT+
         wdv7hsmI9jOBzRtcV5/Z5oJZP1gUhDxeAhkarDM/GoWMUYkxkP0qkLvytkWIxPBQg30U
         6p32gWX9IbLvU8QZLCbaO30OD/sgrV+VV2bQRfWLLjR1WfojD4V0xe19m5XB/jg4ue3A
         vDoeKFOW7vbQcxNBRWr3xRXItIuKI/6Lth+W9U4rYTMhJ8/HPbEjjI4FoT82NXdMChkH
         qjpxJbaJL4nXVxfxgz/cuPtut4fm5XPMaVBcb0w5Zb/HXFQX8kKa1zI5ni8sCpuOG1Vp
         HK+w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767367; x=1788372167;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufqJcA4GLe7bKYSt4VuOA7LyG7GHrT+0lE+aWzUukb0=;
        b=GAOODK1/a1CbYedXewMuoe0+/NalFMEJH+S05Z7nurzQ1dLW7PN6PF/pEGgLrCCwow
         v46Lr/GRcblxrpPPgIBnl6iURXjuFbER/xbhev/yM8k89yNDuHO8p4Y78hpdaJdx1bra
         VbMl3v9+dMR19OADSobH3NIuaJPojSBsQt6jVFmqUz4/OMD6FVvEaCRjCyxdaM+ooJFj
         1XieLfNxxvSwbY0wsV7UPIERoEq7FEwtQE4CWNnhBa8jBmO4cko/FpjifwB4bvRku83b
         xzhO1kvxpTXqZM7BOaG9UN852n73HtXUj3ucLrBil3NbBala2++6xCh3LwFcExA51hdO
         0dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767367; x=1788372167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ufqJcA4GLe7bKYSt4VuOA7LyG7GHrT+0lE+aWzUukb0=;
        b=PeYk659a/G7j6TDJelWVkCg5kHEjYGMAQgD7es+ZyDJsnxKqx9rJAVRX7KjSxiaEbd
         ZJh+yvn6ZpWosqnVopxsSzLvk+gLhX32zrwtG0EdJ9rl7XfRElWLkY13vzTsGgVyq86i
         gYDf+n9Qz/ZaGf2sdB7FAGAQ/H7yNEEXkfN7PhpSjUC0/zsCCPx5dX6pzYVuGr1BF6ZE
         R2K7owi54EjY5a4YFfosWgveUSaMD6JRGA7FSOrLjjoTYMLOl+Qem7aS3OZTFcQWJnwB
         7cZPx3iGgYRiiGmR9NYGHmP3QpUF0sCQbbxyE6bv8rXkBAb3g1UGKMiqacOIRfqV6AZ+
         knLg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoaSPU+Vam6oinyq+ZffqSDhcl6ZEDFq0qxJ7eW60s+qsXABYXKLJf7lkcRGMPhuVZ4b1P1ghF3@lists.freedesktop.org
X-Gm-Message-State: AFuF++mDxFAoB157J7z4Z+uoc1lSfXNDqtFKN2i8k4Ftnwo5TjRYuo/8
	fL/CL7IEp5LVzShRXp5FeWSe1qFpJf1AdB2Riqbxe40BMlGBOmebND08nm2UAGMyW8dL/tth4RA
	QjkvJI4tvHzPPBe15fFlnYAG9GKidzEs=
X-Gm-Gg: AR+sD10jjDW5L26wFgy+SrzHiSV+H33RbJh9cug5Yg+lvn6bDNP9lCY3w6/GTu+7hDc
	l6nq4WMIhDhk9pgZW3ntHuyIHBT/lsYqWYQFdaDesDMSDvN7PjF1QrrJ4VHzDSefLFbek5gxIlR
	CjYS6UN3LoEbzvdGLfIT9BHLXFMg8ik6fH4mpgLrZ2EDAr6ZXjuYimZlptyMxSL3LO2BAE76AVN
	7ywS+Qz/cV5y2fZhvJGmeeDoj1SXE7YKqADibWmX7PaA61qVHMF2horxv0SL2cI/BkJTGfC0Zxl
	wdhmpAMFx8kIhq5llJtQoTJ+Otpjt4SIYK81he1f5fEx
X-Received: by 2002:a05:690e:1c09:b0:667:b645:5303 with SMTP id
 956f58d0204a3-66d25760bd1mr3181148d50.33.1787767367406; Wed, 26 Aug 2026
 11:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260810214247.21416-1-asiyee994@gmail.com>
In-Reply-To: <20260810214247.21416-1-asiyee994@gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Wed, 26 Aug 2026 19:02:35 +0100
X-Gm-Features: AcwNN1UgVU2OJU0Ndh5gFopwbB5Zne-wNYn2HQhiFLBY_r0ZLdpgNTzIBOLm2KA
Message-ID: 
 <CAK77STDMnTrD9E6-N6+te9EZQ0gZTHd-qUZY5Lv1i=M1mm9oDg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/clk/gk20a: fix undefined behaviour in signed
 left shift
To: lyude@redhat.com, dakr@kernel.org
Content-Type: multipart/alternative; boundary="000000000000e01da80659f70697"
Message-ID-Hash: MBOALFXD7KKTAZNLH73QBMAOSKMYIJAJ
X-Message-ID-Hash: MBOALFXD7KKTAZNLH73QBMAOSKMYIJAJ
X-MailFrom: asiyee994@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MBOALFXD7KKTAZNLH73QBMAOSKMYIJAJ/>
Archived-At: 
 <https://lore.freedesktop.org/CAK77STDMnTrD9E6-N6+te9EZQ0gZTHd-qUZY5Lv1i=M1mm9oDg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--000000000000e01da80659f70697
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi just pinging to see if anyone has had a chance to review this patch.
Thanks

10 A=C4=9Fu 2026 Pzt 22:42 tarihinde Muhammed Sariyildiz <asiyee994@gmail.c=
om>
=C5=9Funu yazd=C4=B1:

> MASK(w) expands as ((1 << (w)) - 1), and GPC2CLK_OUT_SDIV14_INDIV4_MODE
> is defined as plain 1. Both are used, via GPC2CLK_OUT_INIT_MASK and
> GPC2CLK_OUT_INIT_VAL in gk20a_clk_prog() (and reused by gm20b, which
> includes gk20a.h), to compute:
>
>         1 << 31
>
> Left-shifting a signed int into its sign bit is undefined behaviour
> per the C standard (ISO C11 6.5.7p4), and is flagged by UBSan and
> static analysis tools such as cppcheck (shiftTooManyBitsSigned). Make
> the shifted operand unsigned to fix it, matching the pattern used
> elsewhere in the kernel for register bitfield masks.
>
> No functional change intended.
>
> Found via static analysis (cppcheck --enable=3Dportability) while
> auditing nvkm/subdev/clk for correctness issues.
>
> Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> index ea5b0ba..7a93f9f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
> @@ -27,7 +27,7 @@
>  #define KHZ (1000)
>  #define MHZ (KHZ * 1000)
>
> -#define MASK(w)        ((1 << (w)) - 1)
> +#define MASK(w)        ((1U << (w)) - 1)
>
>  #define GK20A_CLK_GPC_MDIV 1000
>
> @@ -79,7 +79,7 @@
>  #define GPC2CLK_OUT                    (SYS_GPCPLL_CFG_BASE + 0x250)
>  #define GPC2CLK_OUT_SDIV14_INDIV4_WIDTH        1
>  #define GPC2CLK_OUT_SDIV14_INDIV4_SHIFT        31
> -#define GPC2CLK_OUT_SDIV14_INDIV4_MODE 1
> +#define GPC2CLK_OUT_SDIV14_INDIV4_MODE 1U
>  #define GPC2CLK_OUT_VCODIV_WIDTH       6
>  #define GPC2CLK_OUT_VCODIV_SHIFT       8
>  #define GPC2CLK_OUT_VCODIV1            0
> --
> 2.43.0
>
>

--000000000000e01da80659f70697
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi just pinging to see if anyone has had a chance to revi=
ew this patch. Thanks</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">10 A=C4=9Fu 2026 Pzt 22:42 tarih=
inde Muhammed Sariyildiz &lt;<a href=3D"mailto:asiyee994@gmail.com">asiyee9=
94@gmail.com</a>&gt; =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">MASK(w) expands as ((1 &lt;&lt; (w)) - 1), and GPC2CLK_OUT_SDIV14_I=
NDIV4_MODE<br>
is defined as plain 1. Both are used, via GPC2CLK_OUT_INIT_MASK and<br>
GPC2CLK_OUT_INIT_VAL in gk20a_clk_prog() (and reused by gm20b, which<br>
includes gk20a.h), to compute:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 &lt;&lt; 31<br>
<br>
Left-shifting a signed int into its sign bit is undefined behaviour<br>
per the C standard (ISO C11 6.5.7p4), and is flagged by UBSan and<br>
static analysis tools such as cppcheck (shiftTooManyBitsSigned). Make<br>
the shifted operand unsigned to fix it, matching the pattern used<br>
elsewhere in the kernel for register bitfield masks.<br>
<br>
No functional change intended.<br>
<br>
Found via static analysis (cppcheck --enable=3Dportability) while<br>
auditing nvkm/subdev/clk for correctness issues.<br>
<br>
Signed-off-by: Muhammed Sariyildiz &lt;<a href=3D"mailto:asiyee994@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">asiyee994@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/clk/gk20a.h<br>
index ea5b0ba..7a93f9f 100644<br>
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h<br>
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h<br>
@@ -27,7 +27,7 @@<br>
=C2=A0#define KHZ (1000)<br>
=C2=A0#define MHZ (KHZ * 1000)<br>
<br>
-#define MASK(w)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((1 &lt;&lt; (w)) - 1)<br>
+#define MASK(w)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((1U &lt;&lt; (w)) - 1)<br>
<br>
=C2=A0#define GK20A_CLK_GPC_MDIV 1000<br>
<br>
@@ -79,7 +79,7 @@<br>
=C2=A0#define GPC2CLK_OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (SYS_GPCPLL_CFG_BASE + 0x250)<br>
=C2=A0#define GPC2CLK_OUT_SDIV14_INDIV4_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<=
br>
=C2=A0#define GPC2CLK_OUT_SDIV14_INDIV4_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 31=
<br>
-#define GPC2CLK_OUT_SDIV14_INDIV4_MODE 1<br>
+#define GPC2CLK_OUT_SDIV14_INDIV4_MODE 1U<br>
=C2=A0#define GPC2CLK_OUT_VCODIV_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
=C2=A0#define GPC2CLK_OUT_VCODIV_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
=C2=A0#define GPC2CLK_OUT_VCODIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000e01da80659f70697--
