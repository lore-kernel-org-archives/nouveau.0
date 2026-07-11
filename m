Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A7C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 18:15:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 101C110E3B6;
	Sat, 11 Jul 2026 18:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cPCGy2s1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B878470C9;
	Sat, 11 Jul 2026 18:00:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783792852;
 b=CN6X+3+lvySmwhpcHvF2kXBC1yC/i59ytm10JE0m5WaDwYxylxxLV4qWFEukuZStthvKo
 K5Px6/V2bhKK3MVqkZpqw6KMYguNx6slrNxtDPtZe+EtFisRZHM296a1nKF8MMm046RBKsp
 y830dRV1S+K0pv5q51ww8ORnOLLo20PmZ4VS/Il7JCd7YFe3IbalPlhgoqrZ6W/DLO+TMym
 yYWOfckTkhu5UzdOh3fE8KkpgM4sgzGEu9fUI4MakC8qJk2YkrsjV9FWtT+Emey+Nq1K9gA
 YOKU7TPOMB819jtJ1v7ZPMIdlGoTcknWWls1cdyHrCkiq06WThOG6nVlBtQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783792852; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dOtkU4x9PdYj+8HW6RC7BqjcU55iCa0C1SdNdtAVTLU=;
 b=hMAQ04Zib9FEPyT8ou+QzJme768PIR0F84aTcX1fuXrGzcG0lxzzfG8NskDFjcpzhROsH
 unK2UMkHRhU4so//4sGVfGDqTWdGWu1HsiNHQgmCpA8VefB69Yhb9TgCuDZkSr9LfKVnGNv
 se/diRGsh/0yMd605uTdJ9MYbyTgCQFyyJoebg4YmpLLCjlo+Xk9iF3r5ZX+lnjRMbVb5SQ
 VILQLT/GKBcapzNx2fUhEdbz59w6K4jEQ8czuAA7MlQXuqMzArDfBnbf6tMDY1P4+0HtSuh
 5d4wtVEN1YjTh7cch324PBsHN88jN+/y/AIzz/vErUyMQkb216kWIbbhxR2g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 21B1446FE8
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 08:29:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5FA510E317
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 08:45:04 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8484f229529so1147387b3a.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 11 Jul 2026 01:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783759504; cv=none;
        d=google.com; s=arc-20260327;
        b=XTe25xk72oIKLQKVhlk8UKNeKDVcVmfZ44k+8yGO+945UiHBSN5pOyg7DV9CimZ9/0
         NKzN07rQvZG2qpchhlDjaX+gPKEafUUwHX6Z0SmDepgOmPJ200tIFaOtG+ANtJE+euHc
         lb9pRdzuvfBRjOJt+CdSSluC2bmcKCXJCBrYkf8SpO0ROjh/y9jLMZMOs/YxhrtlW53A
         gHWviXyuWaSDwfCrMrLZpwQb022K4JJ0+5h483IIJ1C0Uf3ftf/AMiuErwEPg7lOX3uK
         wdHH/iClJO+81jsmi6KibCuKN/tP1Q9q0n2SxZxPqbXEFTnFEVS++0Cjlc5zsmU/Y8IF
         L4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dOtkU4x9PdYj+8HW6RC7BqjcU55iCa0C1SdNdtAVTLU=;
        fh=TOFmEjSnmnd+LFrTgfUxcNqjG37jxsdReiiLMMsE7+A=;
        b=Y86glFq54D2nMh8xngpb1H/K0JCRfvorFl2OZ+YpEuaJ8JA7yQnnIfVK6rXiqKT7b8
         S5aZnbH7teFjoCduMuVIj9dAJP/5eE+03owxVgEXYkkNzjqlhYvT7O+PeQvLbfVemPAU
         phQ2Z/SNThqj7cReAoR+6Z8+weJNuH7zsDveXOFa5pSpobOsOg0lswDS3Jwj+TrIuyXw
         jatMMQwinDSbwx5ekgCqs+dWVOVS66XsmMMu9PfYJyIVrD+N3g3A2r9UxLhl2q9w+mBo
         wu4YywSz2qAdNLDn+m1kCMcLdv8WDYT+7/brEZHyXvXDSaqjXsRDFoWEgGlsWYQVIFgl
         7m/Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783759504; x=1784364304;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOtkU4x9PdYj+8HW6RC7BqjcU55iCa0C1SdNdtAVTLU=;
        b=cPCGy2s1lCFs7rFHsGyV6GYaCvHy941i3VryL3C1pq7So334UTyBLHcFc6ChfDIU8M
         kwc45O+OVPH+o/KorJ1UNi67MkYboz9TkO8f9rJtGu74oZYo+na9lqZqVzMZVimpAYZe
         FyMs9LV8dNarH7zhRjPeOOfjn1BJGT/xZOYgCcd0eRlAuNPNkdir/QbbPMGjr7b3E5SA
         9jgAciugPRvc/D1nnPqJTYytjAVj35uFNU256eldctfL6T+Gs7a5J50f8kkn2FErDdXT
         9Ck3j6dkv7Dr6U+WKWCXBJIHpuEvYagZZw3gJwxIjb8BFbl5JD9jIXTjFk7QA3urmIl5
         ukEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783759504; x=1784364304;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dOtkU4x9PdYj+8HW6RC7BqjcU55iCa0C1SdNdtAVTLU=;
        b=oOPvd7yCB2vZEW4OQOaiABCUL96wE9Q1sCwoeiJQo0+73WmTOWc4Hc4imFe2fe+ABM
         TIZTOdNCviyYzvqWiw1l3DxnxCf6fMTIk2V31piWEQi0JbLSiYKylP2ptgL8CfKOtKbU
         JutgSicA9ZFf5n432cBcQ0bE1iHD7wZwGCh6vTZZaryn9HLKuoq44QX1kP3TYMQC3cjy
         ymMHjCS1v9Dc0J8XodhNxoAdjM10O5t1xHm3oaSP1n+QdD3IrcyU7VudqA+/mpDzNaOZ
         klhKuYXrej9G+KyKgF83SEG0GJUPMPk6tEUySGQtRKjCK4aIbetH6pWiY9F3OUhp5kNl
         vrmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoHMnyebnEwXEQE6M63mqAfWV703ik8htm7Fd2HPRSPCdGphZiOk/NMXuwv3hRneU9JAgtjMn1Y@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyut0Yf/p6h6lUt2Jeq9rxa2fp4hkh6pQ7XAT2DOdOfcuG7BnMY
	9eLc7MXHJLcI0Y/tbYuoHBrhtI6WWl1nuEZ9veNra6JeZgYcuFOzR1zsV0NwvyA3V7S3ZRQfA42
	FDDT0NSckpoLcT2vffUgZsPJbD4ldCVhQEZ2k
X-Gm-Gg: AfdE7ckF4HqylbjCvGHaJteMaoW9DVlTn4kvxWRR/7h5tVC1qps42ECgJ/jNLghCXLX
	7yqxy8/yj7qYKRZ1JwOT8//X9KLUF0PYkbxqwmIFe+a4nnNpk+EXAzGuTXSisWvzCxeTxZ7aU8R
	mf89+98XgHD8kL4LbFWvTWuqGQv7GIpryl+VM/HH6qx87vwoiLGJaJne0Ni7WwKSUz8pLHKw1cq
	hGfjOnWxAUwUgAW8mNnVvF3Mj22CfIp1BMV9qFj5daMuZFXAGoivIpEtAHKbnKAZ60DhcC1RT5B
	l1IoimwlyCSpHIOP09CeYQ56RJcS
X-Received: by 2002:a05:6a00:3d4b:b0:845:e3af:dde9 with SMTP id
 d2e1a72fcca58-848897d301emr2123925b3a.38.1783759504399; Sat, 11 Jul 2026
 01:45:04 -0700 (PDT)
MIME-Version: 1.0
From: Francesco <postadelmaga@gmail.com>
Date: Sat, 11 Jul 2026 10:44:52 +0200
X-Gm-Features: AUfX_mxh-8mbQqBqE9heeoRHEh4TRnjFx2WiI2YPMUUIOodX-uUwuItU51FO51A
Message-ID: 
 <CAHwn+vnP4eGFW3Z0g_YHT6PW7beOvrOD833Gyy6LwL05mj6Whg@mail.gmail.com>
Subject: [PATCH 1/2] drm/nouveau/clk: fix list cursor use after loop in
 nvkm_clk_ustate_update
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000009fe9d8065651df81"
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: C2V666MCJCXE3RGSDGB2NIMZBZ3JTTKZ
X-Message-ID-Hash: C2V666MCJCXE3RGSDGB2NIMZBZ3JTTKZ
X-Mailman-Approved-At: Sat, 11 Jul 2026 18:00:50 +0000
CC: dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C2V666MCJCXE3RGSDGB2NIMZBZ3JTTKZ/>
Archived-At: 
 <https://lore.freedesktop.org/CAHwn+vnP4eGFW3Z0g_YHT6PW7beOvrOD833Gyy6LwL05mj6Whg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000009fe9d8065651df81
Content-Type: text/plain; charset="UTF-8"

If the requested pstate id is not present in the state list (or the
list is empty, e.g. broken/missing perf tables), the list_for_each_entry
cursor runs off the end of the list and the subsequent
pstate->pstate != req check dereferences the list head cast to a
struct nvkm_pstate, which is an out-of-bounds read.

Track whether the entry was actually found instead of inspecting the
cursor after the loop.

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 ++++++--
1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 572e63846..42f3709e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -479,13 +479,17 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
return -ENOSYS;

if (req != -1 && req != -2) {
+ bool found = false;
+
list_for_each_entry(pstate, &clk->states, head) {
- if (pstate->pstate == req)
+ if (pstate->pstate == req) {
+ found = true;
break;
+ }
i++;
}

- if (pstate->pstate != req)
+ if (!found)
return -EINVAL;
req = i;
}

base-commit: a284476db2653ae893f46cbea408eb412db54eb0
-- 
2.55.0

--0000000000009fe9d8065651df81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"auto">If the requested pstate id is not p=
resent in the state list (or the<br>list is empty, e.g. broken/missing perf=
 tables), the list_for_each_entry<br>cursor runs off the end of the list an=
d the subsequent<br>pstate-&gt;pstate !=3D req check dereferences the list =
head cast to a<br>struct nvkm_pstate, which is an out-of-bounds read.<br><b=
r>Track whether the entry was actually found instead of inspecting the<br>c=
ursor after the loop.<br><br>Co-Authored-By: Claude Fable 5 &lt;<a href=3D"=
mailto:noreply@anthropic.com" target=3D"_blank">noreply@anthropic.com</a>&g=
t;<br>Signed-off-by: Francesco Magazzu &lt;<a href=3D"mailto:postadelmaga@g=
mail.com" target=3D"_blank">postadelmaga@gmail.com</a>&gt;<br>---<br> drive=
rs/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 ++++++--<br> 1 file changed, =
6 insertions(+), 2 deletions(-)<br><br>diff --git a/drivers/gpu/drm/nouveau=
/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br=
>index 572e63846..42f3709e0 100644<br>--- a/drivers/gpu/drm/nouveau/nvkm/su=
bdev/clk/base.c<br>+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>=
@@ -479,13 +479,17 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)=
<br> 		return -ENOSYS;<br> <br> 	if (req !=3D -1 &amp;&amp; req !=3D -2) {<=
br>+		bool found =3D false;<br>+<br> 		list_for_each_entry(pstate, &amp;clk=
-&gt;states, head) {<br>-			if (pstate-&gt;pstate =3D=3D req)<br>+			if (ps=
tate-&gt;pstate =3D=3D req) {<br>+				found =3D true;<br> 				break;<br>+		=
	}<br> 			i++;<br> 		}<br> <br>-		if (pstate-&gt;pstate !=3D req)<br>+		if =
(!found)<br> 			return -EINVAL;<br> 		req =3D i;<br> 	}<br><br>base-commit:=
 a284476db2653ae893f46cbea408eb412db54eb0<br>-- <br>2.55.0<br></div></div><=
/div>

--0000000000009fe9d8065651df81--
