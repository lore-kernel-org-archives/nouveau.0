Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668EBC43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 18:16:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE310E3BE;
	Sat, 11 Jul 2026 18:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHA31VqS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 685B5470CB;
	Sat, 11 Jul 2026 18:01:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783792860;
 b=hZQKaOjzKjmLjAjX6ZFU9m9TTl+dVaQHZkJpbcdK+DaZFPRdasxghmhtdDhq5tOl95HkY
 Vfp7s6EhdRUdbmF+H63NLA8KYCBVK3wsRI/QrpxWYmMAYx760BDarISQl/UO69w+XbDfAq5
 LVf9G4DYiN9lVXUIpptGMjban0s+s0A/vSSHgbht41XDmRqkQNl8ZRnZRDudr/O2d/i0Mug
 g/af8Q3B2x2EPwkngCnA4gD2uT9Mm4wPZaM99GiP9+beZfGthOBv3jyaSZOuHZ3zYglirt3
 7H4wiBAx8Mqy1HuO+mgDVo6jmt90bQWSiLPe/BKCJqpsKP6Yz0PetvZfYNpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783792860; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d5f6B0smxVafC/d5W+ptxFghTcXMGQ4dtdszLH5dcD0=;
 b=MZenDYnK5WOWyBfjx8jkF8RO8LjDZCvKgTz3plxv1ZEZf9f8a8HCcORAOWHOMChy/OQA8
 Edw29fNAke9iOjGg9Etw6u/P1LB1V8B/Yh4GQv6kGIR+YF1M7ByZbECtIuvyqt44ZWpS4Hi
 PhVtGmulIisNeQkOY1+6VN6D5Fzw0vKWhEfftQkjIxJgbcP1OuykTsluxzuQehqVUPPdRDR
 8huPC5ZPub8MAGhgA4YdzX8V9xhfewPuBX0CVoy11Jg1SIi2fBvipc5hBlXcC1JEeE8TLJz
 zfdqz4yqNr7vR3veRtWRpa2BnKeZVPwb41rRTAVLKF8dG+e3mR2vSwLUkvJA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 60E50470A6
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 08:30:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61010E317
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 08:45:16 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8484a0b998fso2508298b3a.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 11 Jul 2026 01:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783759516; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVA0aG3BazPeTNNdwt7GU7jKSUjhAQ/cISHUJ4Bkq9Df9H4LjeLWsUWo0HDPsfyGJH
         RJqmXrAVZICmx7Nnc3OiBOIIMM6MUO9vRH80tEzICkpHom1U/w13CssZ8QQrIg2ptz5w
         WIk16Ow7VqsGluRjqPHcbpxGD4clnwLsJU2Y1GqiX78WUdES9d6v0uqNvZYBhJCqSkKw
         X8V/+VbzGnhC17ioK1bCdQZgw4bnKK0JZRUAkCMU67yLSY91NwkRZue8TPfUWXad6yfy
         HZL+kdwqYZLHhrfJ5D0RUswF+259y2VSHXah9mssNLJol5jsVg7tBvbtV2xp1XJLd4nR
         O3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d5f6B0smxVafC/d5W+ptxFghTcXMGQ4dtdszLH5dcD0=;
        fh=Uy6LYaV5gOEJVvmztiHfz4eAvRzGDx1isDghySKRCx8=;
        b=KRpiZx3aaCumuix/+2C9bwbjOVsv7tH8hRsycg98lTRk2ENiAcu7gzX8U3RGMzhyNM
         W9cNkaUhFrjr73v28Vvq55Ox9eUYgU1UBVe0gmckartk1PvbpdZH8QNEqHYltgMfFuXE
         TpWDVoNfdj8QeuIV9E+HBD/xccSDXWbM9fWgO2tHFEvBm1wgi/aYFFvciuJmNgNzAUwo
         GJkUC4zgsI/KZghOs1XNo8jXVsnn3LUluowOL05mDtSY0D1evA3G4cQoPuya0qqwJ8EW
         KDgTXStEjaFACSrnjUOzncIMQRJB1F0KLXYrOTDyMztiJugltIcjvBBhWFV3NG5nKVpN
         km/w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783759516; x=1784364316;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5f6B0smxVafC/d5W+ptxFghTcXMGQ4dtdszLH5dcD0=;
        b=ZHA31VqSbSLFs+j9nGb/vyVT8ZXBIMKnyMIv+S7h/OhQsg4gpjdkmWfQnnoUZf4sMl
         C3cC+cb77ZpyMznObMGh5Vbf5eA6jQkX940yH5K/cOS05MFMNO/ZKbk6uqeTI6GVYIfR
         D8P1Ha8GRrtkFGUcd8PoRBMIU8/9AqFEx/a5rkwjun2I3tgiIYyMRashuFIg+eSTvXG7
         9FLEKL6+1s+jlWhXrBqJl/QgPP4cpLMUTpxH0jZ3pwx0dSoLWpkPtDMtK6DOaRilDEEg
         x0QhVYaSXFDCwJBETRrCVjNPvmS2ad6Rc/tuTpVHrFjHBe/ux/B0baraXqjcF3MQn+dR
         VvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783759516; x=1784364316;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d5f6B0smxVafC/d5W+ptxFghTcXMGQ4dtdszLH5dcD0=;
        b=TVljBHi7vMQG5f8QXCsHzQQwvFediNvHPUCTrjS1K9ipJUkZdPa+EJJIC4bu/0MjRH
         EgSDKnqzgx3rTvEDGB2QGmR65rGL1J7Y1Lf3ZcipB9EKDzIavtdLNT7VypTapPXINb7W
         lHUmzgCtp03Plk12QkibQwBK9eiovMFbnp6fVzR2qMXA3vuJktLDYBoyVItRj61bGB2X
         7TaWOnrET32sHwOUAiKluzazQmhs7fOdJ89e9VAPiXRNhn7iK3zFLEOY3ROt0rkt2Gzm
         Xt/sZLCKxosC1CM8FtxAx5txghYlhJ2zOon/TecoLLl297IewTTzRujb2Fkf1ceR/O6A
         Vl8w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoMghRECZL9bAk7qqFlHvM1hzs+9B3a9Zmt4JLHaWbDXV7RyVHOueQpQewjNfYZQIzqXMHpq9QF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybcUaTtQcU4fSLiCo814xFWtFmSa7U/m3wEltYNBsgzM3ATRhv
	eQU98jz3aVZmrYabC46S+d/kzvRiShHF0O9VVe/33+VVZ2SC6HG7c7Jge1RjuJAtj0LgO1kuqvt
	CuoQAYtTscsngHRO1Y/xNFwF/keY5q6vjUJAN
X-Gm-Gg: AfdE7clbFypDcb55DYX7z7LmCTpWSOE7+SIiyS6e5tUyevub9SqG65hCJjMHZSRmbrV
	v7EXnhTc0eflyQ5tfP50j0uRZvAM/nvXOQKuJZBfz4nUOR/GvCvVT9CHFA4xSHTS/LtbesgYlBQ
	eDG8XT6tDtxWJJoeXFwWDrMYxcplcRGuRbjJcdPGT8u/+7dJ77hmJRf3PiXuHLjdYjhl7KhKgxk
	sdWFJAOENgNTvCY9V4y8KCK5hsWlPFSwx1gKgA1XhKeeR+CVuv+3Pow31G/YLyCtHBxaOF0B86z
	799dXkaGsuiyLX46aPFtc22g0lzR
X-Received: by 2002:aa7:8891:0:b0:845:44c7:5e28 with SMTP id
 d2e1a72fcca58-84889649d8cmr2012798b3a.31.1783759515638; Sat, 11 Jul 2026
 01:45:15 -0700 (PDT)
MIME-Version: 1.0
From: Francesco <postadelmaga@gmail.com>
Date: Sat, 11 Jul 2026 10:45:02 +0200
X-Gm-Features: AUfX_mzSuKPUAnaWauxVFZ8dn-PVTnVgi02lCEG6OlYh7Rf8UL0yhrQEFIw3mPY
Message-ID: 
 <CAHwn+vnw=DD=j7umFVdcr8-F6yUz=iM+3yfA+HcHKXJwpNrHRA@mail.gmail.com>
Subject: [PATCH 2/2] drm/nouveau/clk: don't clobber reclock status when
 restoring volt/fan
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000004b61c7065651e01f"
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: Z7TZO6O4L2V72MWZMRGRHE3WERAS3UIC
X-Message-ID-Hash: Z7TZO6O4L2V72MWZMRGRHE3WERAS3UIC
X-Mailman-Approved-At: Sat, 11 Jul 2026 18:00:58 +0000
CC: dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z7TZO6O4L2V72MWZMRGRHE3WERAS3UIC/>
Archived-At: 
 <https://lore.freedesktop.org/CAHwn+vnw=DD=j7umFVdcr8-F6yUz=iM+3yfA+HcHKXJwpNrHRA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000004b61c7065651e01f
Content-Type: text/plain; charset="UTF-8"

nvkm_cstate_prog() reuses 'ret' for the voltage and fan-speed restore
calls made after clock programming. As a result a clock programming
failure is silently discarded if the restore calls succeed, and
conversely a successful reclock can return an error if the final
therm/volt call fails (which is already only logged, not acted upon).

Keep the calc/prog status in 'ret' and use a local for the restore
calls, so the function reports what actually matters.

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 14 +++++++-------
1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 42f3709e0..4f08326f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -199,16 +199,16 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct
nvkm_pstate *pstate, int cstatei)
}

if (volt) {
- ret = nvkm_volt_set_id(volt, cstate->voltage,
- pstate->base.voltage, clk->temp, -1);
- if (ret && ret != -ENODEV)
- nvkm_error(subdev, "failed to lower voltage: %d\n", ret);
+ int tmp = nvkm_volt_set_id(volt, cstate->voltage,
+ pstate->base.voltage, clk->temp, -1);
+ if (tmp && tmp != -ENODEV)
+ nvkm_error(subdev, "failed to lower voltage: %d\n", tmp);
}

if (therm) {
- ret = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
- if (ret && ret != -ENODEV)
- nvkm_error(subdev, "failed to lower fan speed: %d\n", ret);
+ int tmp = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
+ if (tmp && tmp != -ENODEV)
+ nvkm_error(subdev, "failed to lower fan speed: %d\n", tmp);
}

return ret;
-- 
2.55.0

--0000000000004b61c7065651e01f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"auto">nvkm_cstate_prog() reuses &#39;ret&=
#39; for the voltage and fan-speed restore<br>calls made after clock progra=
mming.  As a result a clock programming<br>failure is silently discarded if=
 the restore calls succeed, and<br>conversely a successful reclock can retu=
rn an error if the final<br>therm/volt call fails (which is already only lo=
gged, not acted upon).<br><br>Keep the calc/prog status in &#39;ret&#39; an=
d use a local for the restore<br>calls, so the function reports what actual=
ly matters.<br><br>Co-Authored-By: Claude Fable 5 &lt;<a href=3D"mailto:nor=
eply@anthropic.com" target=3D"_blank">noreply@anthropic.com</a>&gt;<br>Sign=
ed-off-by: Francesco Magazzu &lt;<a href=3D"mailto:postadelmaga@gmail.com" =
target=3D"_blank">postadelmaga@gmail.com</a>&gt;<br>---<br> drivers/gpu/drm=
/nouveau/nvkm/subdev/clk/base.c | 14 +++++++-------<br> 1 file changed, 7 i=
nsertions(+), 7 deletions(-)<br><br>diff --git a/drivers/gpu/drm/nouveau/nv=
km/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>in=
dex 42f3709e0..4f08326f2 100644<br>--- a/drivers/gpu/drm/nouveau/nvkm/subde=
v/clk/base.c<br>+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>@@ =
-199,16 +199,16 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_pstat=
e *pstate, int cstatei)<br> 	}<br> <br> 	if (volt) {<br>-		ret =3D nvkm_vol=
t_set_id(volt, cstate-&gt;voltage,<br>-				       pstate-&gt;base.voltage, =
clk-&gt;temp, -1);<br>-		if (ret &amp;&amp; ret !=3D -ENODEV)<br>-			nvkm_e=
rror(subdev, &quot;failed to lower voltage: %d\n&quot;, ret);<br>+		int tmp=
 =3D nvkm_volt_set_id(volt, cstate-&gt;voltage,<br>+					   pstate-&gt;base=
.voltage, clk-&gt;temp, -1);<br>+		if (tmp &amp;&amp; tmp !=3D -ENODEV)<br>=
+			nvkm_error(subdev, &quot;failed to lower voltage: %d\n&quot;, tmp);<br>=
 	}<br> <br> 	if (therm) {<br>-		ret =3D nvkm_therm_cstate(therm, pstate-&g=
t;fanspeed, -1);<br>-		if (ret &amp;&amp; ret !=3D -ENODEV)<br>-			nvkm_err=
or(subdev, &quot;failed to lower fan speed: %d\n&quot;, ret);<br>+		int tmp=
 =3D nvkm_therm_cstate(therm, pstate-&gt;fanspeed, -1);<br>+		if (tmp &amp;=
&amp; tmp !=3D -ENODEV)<br>+			nvkm_error(subdev, &quot;failed to lower fan=
 speed: %d\n&quot;, tmp);<br> 	}<br> <br> 	return ret;<br>-- <br>2.55.0<br>=
</div></div></div>

--0000000000004b61c7065651e01f--
