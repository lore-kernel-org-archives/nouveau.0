Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBEAC561E6
	for <nouveau@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 671C810EF6F;
	Wed,  5 Aug 2026 17:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="feRXrQ+7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 29B4B47580;
	Wed,  5 Aug 2026 17:13:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785950002;
 b=0USJLtmH96taqHyCPhxauKVO4Xh/UjaxP6sMIwHPJkZlJNjzc9YLBSRcdgYZY1WDHGNB7
 sn4wBTsw3NJCNogUOCc9vKFrtE0ICy8G3Mw0D597AcPTmO7RlNy2jz2or7K79gh2zlbxClj
 OMkXGi7ANKwGNX3yWIgDCPauTpmv1wjFXf/1AI9IuhUwfxMYBV+SqAQurULWkZGbU+LewjT
 LWyBMz5nf+7DOriCooA6ugb0X7yq6dqvgO4WLTBbmzecqNXMiDBuG0IJWJhdVREPa3S8NkU
 xwgh17qM7HUOBoxnf/mG4xigcsDCdDjXb4tYscjnL21Ko03QGbhBQcOi0qyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785950002; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NejjrKENKzWANlNw/++5ptDBbOGn/cuN0FJaDOx2asU=;
 b=CE5y9tLezFt1LM4/3K6bf/aEazoZpnz5+lUyxtMNoo3Iv5kOpQ1ABqWnS8TYlOVpchEdC
 G7IPfWKdMyIzNvI5vUo7SYkzL6KB/nrVLWcsjEFgRcDE5n56nzamn2+bLar7K/sfGlmAAtB
 axRUyAjyUp4yCX+JAABaDCeagFdBoOr+RP4tqQw2a5CBxd+VPRuWEnWnStKXTIfefa/RoSN
 LvcFmcH0U0tJ8gT4vNTYm1ODlpKaSvkPa1Hy6fObyby2i0IT/O8ezK6jTOAfB9TTBDtnsuZ
 qH0FiJKCLVaCKfEGmDis5nVhnCVAVk3pWrcJGrTpCAvrPJhq2Y4c7kKFFrAg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C3BC47580
	for <nouveau@lists.freedesktop.org>; Wed,  5 Aug 2026 17:13:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1805610E23C
	for <nouveau@lists.freedesktop.org>; Wed,  5 Aug 2026 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785950960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NejjrKENKzWANlNw/++5ptDBbOGn/cuN0FJaDOx2asU=;
	b=feRXrQ+7BnYqSM1PS2iVMzfOsr7XMaPYvjyd07UN24zHfsQgD0QNnissDwuLRRx2xwhvFM
	Kqxar0OQikC/2c7RFLW6Dkphp/P8zPjVQLWj1tLlzdm0lEQK2pWM74zzk1ILE8HgHNua88
	FZU7YcrRPqU6nbfbNU5mv4lV/Ypo5qA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-w0-JhSEBNQKMrOoNe8wTvA-1; Wed, 05 Aug 2026 13:29:18 -0400
X-MC-Unique: w0-JhSEBNQKMrOoNe8wTvA-1
X-Mimecast-MFC-AGG-ID: w0-JhSEBNQKMrOoNe8wTvA_1785950958
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93494174477so102225985a.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 05 Aug 2026 10:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950958; x=1786555758;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0EJjLd2CiUGDjKzo2WpgZtP8C/lKhszyy+rUI8pYGE=;
        b=RPKIm0R0sY6Ipmjy2r5o3Tjq+2smXNM7UtSPO2fO27hV7GJG3PCOg2o8a6BtKQcoYp
         86Su/qL1ODJ51YNSqQ1I22YnfET12iIZHzppkvNGtVdbwbbxq7l6Z6GrDxFb091IxnJ1
         jdEg2miggrMMXx0FV5wCneRwuTvPsyWjOtRnRS63sJV6wYNpEhotRGFa9W1SPU+sQtY4
         zgfkKOqtSHjprN9IiW3MIU5hO6F0UlxG+Trm0qq0DDGPKKTneNIauE5hwCup7sGgCI7i
         qSuSHyw3cMTIY1wmrnQ340zkWXRM4xrDUBQA5H6BdIc9nhD4u2pBoXsq0evEOk9zhRiR
         /OwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqZwkfs5aGO17mMeb4hlWT/JqcA5E1dxcSkCvoSUBN8QCLVp5eOsjlnyk42q02/6FldpZrHRseY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNKZkb6gINLyG5EJz8J60H04pzTHmsFu0dCs2EbLwvjO+dqEo3
	NFKmVmH45reU8S6yQy0wmFPdeN5VHXXlpGHIFbS+xh99/C+hS5CJVj5eFTEkgx6TRfHfRDVgycg
	sZoUIRAlgIu1JyNwI13HYgPodFi1ZIKbLU/zEli+K8kFH+UVn8RVp/yM/XRlSWg8rtUg=
X-Gm-Gg: AR+sD12j2dssVOhw+lg767ng5wqubkHAiNh5wZq3szfkCEOu3uF7dIdrouxVlVR/+jH
	FfZS4ecIXWxjoUS6LVAuiewcwkoVaKPrYvWfqJio2L2vMTOrhmUhnyu/dDlwUncZURmNnC8cATQ
	Y910Tbr7q49FR944oxQDEQxEkTd+lOV8u3fTEp63aSvzihRUfWqdVaF/CBsywqcIs1UdXPjYi7d
	GcVjZHpUaykY5pktBo9PKU4wHa7qVFwwulCjRrBHXRLtAvlx0LXKYw/sexErm+9QucLiCb91fHL
	foR0ONmXWXDcmhP27UA4dC6WygUp8TWnQWyHzG/iZYs2ItemF9NeR9Iswcz8Ij9/bhnelGVb
X-Received: by 2002:a05:620a:f12:b0:915:a111:86ae with SMTP id
 af79cd13be357-9364922a3ecmr742287785a.35.1785950957450;
        Wed, 05 Aug 2026 10:29:17 -0700 (PDT)
X-Received: by 2002:a05:620a:f12:b0:915:a111:86ae with SMTP id
 af79cd13be357-9364922a3ecmr742282985a.35.1785950956885;
        Wed, 05 Aug 2026 10:29:16 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a567666sm196142685a.33.2026.08.05.10.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:29:16 -0700 (PDT)
Message-ID: <2de49c1551bef14f30776221c10e43ebf1305ff6.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Prevent division-by-zero during
 DisplayPort link training transitions
From: lyude@redhat.com
To: Arjan Filius <iafilius@xs4all.nl>
Date: Wed, 05 Aug 2026 13:29:15 -0400
In-Reply-To: <6BF6102D-CBBC-4C98-8E74-F2AD208A7169@xs4all.nl>
References: <69D67A9F-1A56-4814-AE68-50559DED42AF@xs4all.nl>
	 <d51b99262dd7feb96d245926fcec65890f35c59d.camel@redhat.com>
	 <6BF6102D-CBBC-4C98-8E74-F2AD208A7169@xs4all.nl>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OCLpusCfn0BueA5PmZFmT6K7IfAEvOeaNPDcwvZ-7GI_1785950958
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5HIBJIZG5JVIC7RQ6DGTROUIFSW6UQGU
X-Message-ID-Hash: 5HIBJIZG5JVIC7RQ6DGTROUIFSW6UQGU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5HIBJIZG5JVIC7RQ6DGTROUIFSW6UQGU/>
Archived-At: 
 <https://lore.freedesktop.org/2de49c1551bef14f30776221c10e43ebf1305ff6.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

JFYI - going to try to review/test this ASAP, just been sidetracked
chasing some big runtime PM issues in nouveau atm :S

On Fri, 2026-07-17 at 10:15 +0200, Arjan Filius wrote:
> Hello Lyude,
>=20
> Yes, I did use generative AI to help refine and structure this (old)
> patch.
> It is completely based on work/debug/fixing I had done manually few
> years back.=20
> Generative AI helped me to send the message, but re-used my old
> patched code, brushed up a bit.
> And tested it this week on kernel 7.1.3, but previous tested on
> 6.8.0.x and 6.9.9 kernels.
>=20
> In 2024 i submitted a bug report/fix/workaround (to prevent a full
> lockup every day) on the Freedesktop GitLab under Issue 377:
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/377
>=20
> Back then, my local workaround was a bit less elegant, and had a few
> extra checks/debug statements.
> I had almost forgotten about the issue since my workaround was
> running fine.
> When I recently booted up a clean mainline 7.1.3 kernel and saw the
> system freeze again within a day and every day,=20
> and had to fsck my disks due to it, I remembered the fix I once
> debugged and posted in 2024.=20
> I wanted to see if I could find a cleaner, more elegant solution and
> used AI for it, to see if the patch could be in a nicer place,=20
> but ended up to basically reproduce the fix i had written in 2024
> (without AI).
>=20
>=20
> Regarding the two patches (A and B):=20
> * **Patch B** was the version I compiled and tested locally with the
> `nvkm_warn()` statement
> =C2=A0 so I could verify in `dmesg` that the standby transitions were
> actually triggering the block and being safely bypassed.
> * **Patch A** is the exact same check but silent (without the warning
> logs).
>=20
> To avoid any confusion i repeat my patch, which does not produce any
> logging every time,=20
> but just avoids the lockup referencing null pointers when external
> displays goes to sleep.
>=20
>=20
> ```diff
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> index 51c045bdfcbb..ab1bc0898def 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> @@ -1157,6 +1157,10 @@ nv50_disp_super_2_2_dp(struct nvkm_head *head,
> struct nvkm_ior *ior)
> =C2=A0{
> =C2=A0=09struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
> =C2=A0
> +=09/* If the DisplayPort link is inactive (0 lanes), skip
> configuration */
> +=09if (ior->dp.nr =3D=3D 0)
> +=09=09return;
> +
> =C2=A0=09const u32 khz =3D head->asy.hz / 1000;
> =C2=A0=09const u32 linkKBps =3D ior->dp.bw * 27000;
> =C2=A0=09const u32 symbol =3D 100000;
> ```
>=20
> This completely fixes my lenovo T430(NVIDIA NVS 5400M) + 4338 Dock
> and 2 external (multi-input) monitors freeze, proven over some years.
> At the time the nvidia kernel driver on my T430 became an issue wih
> newer kernels, and notice nouveau driver did pretty well too.
>=20
> Hope this claries it.
>=20
> Best regards,
> Arjan Filius
>=20
>=20
> > On 16 Jul 2026, at 22:40, lyude@redhat.com=C2=A0wrote:
> >=20
> > Hi, can you please clarify whether or not you used generative AI
> > for
> > this patch series? If so, this needs to be noted as part of the
> > commit
> > message. Additionally, both of these patches look to be identical
> > except that one prints a message and the other doesn't. You can
> > just
> > send a single version, we will figure out how to handle that part
> > after.
> >=20
> > On Thu, 2026-07-16 at 16:55 +0200, Arjan Filius wrote:
> > > Dear Nouveau Maintainers,
> > > =C2=A0
> > > Please find below a proposed patch to prevent a division-by-zero
> > > kernel oops and subsequent lockup in the Nouveau display
> > > supervisor
> > > engine when DisplayPort links transition to 0 active lanes. This
> > > bug
> > > was observed and patched/tested against the mainline kernel
> > > version
> > > **7.1.3**, but is present in all current upstream code.
> > > =C2=A0
> > > ---
> > > =C2=A0
> > > ### BRIEF EXPLANATION
> > > =C2=A0
> > > During screen sleep transitions or multi-input display switches
> > > (KVM
> > > switching), the active lane count of a DisplayPort link can
> > > temporarily drop to 0 (`ior->dp.nr =3D=3D 0`).=20
> > > =C2=A0
> > > When this occurs, the DisplayPort supervisor function
> > > `nv50_disp_super_2_2_dp` is invoked via modeset interrupts.
> > > Without
> > > an early-exit guard, the function attempts to perform
> > > symbols/hblank
> > > and link rate calculations that divide by `ior->dp.nr`, resulting
> > > in
> > > a kernel division-by-zero math exception, lockup, and system
> > > freeze.
> > > =C2=A0
> > > This patch adds an early-exit check at the beginning of
> > > `nv50_disp_super_2_2_dp` to abort display configuration when the
> > > link
> > > training lanes count is zero.
> > >=20
> > > *=C2=A0=C2=A0 **Tested Kernel Version:** `7.1.3` (mainline stable bra=
nch)
> > >=20
> > > ---
> > >=20
> > > ### EXTREMELY DETAILED TECHNICAL BREAKDOWN
> > >=20
> > > #### 1. Hardware Context
> > > This bug has been consistently reproduced on a Lenovo ThinkPad
> > > T430
> > > (Intel HD 4000 + discrete NVIDIA NVS 5400M / GF108 chipset)
> > > connected
> > > to a Lenovo ThinkPad Mini Dock Plus Series 3 (Model 4338) with
> > > dual
> > > external monitors on dock DisplayPorts (`DP-2` and `DP-3`).=20
> > >=20
> > > #### 2. Root Cause Analysis (Code Level)
> > > Inside `drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c`, when
> > > `ior-
> > > > dp.nr =3D=3D 0`, the driver executes the following lines in
> > > `nv50_disp_super_2_2_dp()`:
> > >=20
> > > *=C2=A0=C2=A0 **Line 1179:** Calculations for horizontal blank symbol=
s:
> > > =C2=A0=C2=A0=C2=A0 ```c
> > > =C2=A0=C2=A0=C2=A0 h =3D h - (3 * ior->dp.ef) - (12 / ior->dp.nr);
> > > =C2=A0=C2=A0=C2=A0 ```
> > > *=C2=A0=C2=A0 **Line 1185:** Calculations for vertical blank symbols:
> > > =C2=A0=C2=A0=C2=A0 ```c
> > > =C2=A0=C2=A0=C2=A0 v =3D v - ((36 / ior->dp.nr) + 3) - 1;
> > > =C2=A0=C2=A0=C2=A0 ```
> > > *=C2=A0=C2=A0 **Line 1190:** Calculations for active link data rate:
> > > =C2=A0=C2=A0=C2=A0 ```c
> > > =C2=A0=C2=A0=C2=A0 link_data_rate =3D (khz * head->asy.or.depth / 8) =
/ ior->dp.nr;
> > > =C2=A0=C2=A0=C2=A0 ```
> > >=20
> > > In all three instances, the denominator `ior->dp.nr` is `0`,
> > > causing
> > > an immediate kernel math exception in the display workqueue
> > > (`nouveau_display_hpd_work` or `nv50_disp_super`), locking up the
> > > graphics pipeline, freezing the screen, and hanging any reboot
> > > attempts (requiring a physical hard reset).
> > >=20
> > > #### 3. Daily Workday Trigger Scenario
> > > 1.=C2=A0 The T430 (via dock) and a secondary workstation are both
> > > connected to different inputs on the same external monitors.
> > > 2.=C2=A0 The monitors' input sources are switched to the secondary
> > > workstation.
> > > 3.=C2=A0 At the end of the day, the secondary workstation goes to
> > > sleep or
> > > is shut down.
> > > 4.=C2=A0 With no active inputs, the external monitors enter power-
> > > saving
> > > standby mode.
> > > 5.=C2=A0 When the user subsequently wakes up or interacts with the
> > > T430,
> > > the driver attempts a modeset refresh. Since the monitors are
> > > asleep
> > > and inputs are switched away, the lanes count is read as `0`,
> > > triggering the division-by-zero oops.
> > >=20
> > > #### 4. Stack Trace (Oops Log)
> > > ```text
> > > [di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC
> > > responded,
> > > but no EDID for DP-2
> > > [di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC
> > > responded,
> > > but no EDID for DP-3
> > > [di jul 23 10:28:26 2024] Workqueue: nvkm-disp nv50_disp_super
> > > [nouveau]
> > > [di jul 23 10:28:26 2024] RIP:
> > > 0010:nv50_disp_super_2_2_dp+0xa7/0x320
> > > [nouveau]
> > > [di jul 23 10:28:26 2024]=C2=A0 ? nv50_disp_super_2_2_dp+0xa7/0x320
> > > [nouveau]
> > > [di jul 23 10:28:26 2024]=C2=A0 nv50_disp_super_2_2+0xf2/0x160
> > > [nouveau]
> > > [di jul 23 10:28:26 2024]=C2=A0 nv50_disp_super+0x139/0x280 [nouveau]
> > > ```
> > >=20
> > > #### 5. Verification Proof (Bypass Log)
> > > With the patch applied and running on kernel `7.1.3-custom #2`,
> > > the
> > > screen standby transition was bypassed cleanly. The driver caught
> > > the
> > > lane count of 0, bypassed display configuration, and proceeded to
> > > put
> > > the graphics chip into its low-power runtime suspend state
> > > (`suspended`) without locking up the OS:
> > > ```text
> > > [45162.232371] nouveau 0000:01:00.0: disp: DP link is inactive
> > > (lanes
> > > =3D 0), skipping display configuration.
> > > [45162.232402] nouveau 0000:01:00.0: disp: DP link is inactive
> > > (lanes
> > > =3D 0), skipping display configuration.
> > > [45178.605627] nouveau 0000:01:00.0: timeout
> > > [45178.605629] WARNING: nv50_disp_dmac_fini+0x168/0x1c0 [nouveau]
> > > [45180.608524] nouveau 0000:01:00.0: disp: ch 1 fini timeout,
> > > 8e061008
> > > [45182.608521] nouveau 0000:01:00.0: timeout
> > > [45182.608523] WARNING: nv50_disp_core_fini+0x143/0x190 [nouveau]
> > > ```
> > >=20
> > > ---
> > >=20
> > > Signed-off-by: Arjan Filius <iafilius@xs4all.nl>
> > > ---
> > >=20
> > > ### CHOOSE ONE OF THE PATCH OPTIONS BELOW TO APPEND:
> > >=20
> > > #### OPTION A: The Silent Production Patch (RECOMMENDED FOR
> > > UPSTREAM)
> > > *Note: Kernel maintainers generally reject warnings or print spam
> > > for
> > > expected hardware sleep/disconnect transitions. A silent return
> > > is
> > > the preferred upstream pattern.*
> > >=20
> > > ```diff
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > index 51c045bdfcbb..ab1bc0898def 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > @@ -1157,6 +1157,10 @@ nv50_disp_super_2_2_dp(struct nvkm_head
> > > *head,
> > > struct nvkm_ior *ior)
> > > =C2=A0{
> > > =C2=A0=09struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
> > > =C2=A0
> > > +=09/* If the DisplayPort link is inactive (0 lanes), skip
> > > configuration */
> > > +=09if (ior->dp.nr =3D=3D 0)
> > > +=09=09return;
> > > +
> > > =C2=A0=09const u32 khz =3D head->asy.hz / 1000;
> > > =C2=A0=09const u32 linkKBps =3D ior->dp.bw * 27000;
> > > =C2=A0=09const u32 symbol =3D 100000;
> > > ```
> > >=20
> > > #### OPTION B: The Warning/Verbose Patch (What was tested
> > > locally)
> > > *Note: Prints warning logs to the kernel buffer for validation
> > > and
> > > troubleshooting.*
> > >=20
> > > ```diff
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > index 51c045bdfcbb..ab1bc0898def 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> > > @@ -1157,6 +1157,12 @@ nv50_disp_super_2_2_dp(struct nvkm_head
> > > *head,
> > > struct nvkm_ior *ior)
> > > =C2=A0{
> > > =C2=A0=09struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
> > > =C2=A0
> > > +=09/* If the DisplayPort link is inactive (0 lanes), skip
> > > configuration */
> > > +=09if (ior->dp.nr =3D=3D 0) {
> > > +=09=09nvkm_warn(subdev, "DP link is inactive (lanes =3D
> > > 0),
> > > skipping display configuration.\n");
> > > +=09=09return;
> > > +=09}
> > > +
> > > =C2=A0=09const u32 khz =3D head->asy.hz / 1000;
> > > =C2=A0=09const u32 linkKBps =3D ior->dp.bw * 27000;
> > > =C2=A0=09const u32 symbol =3D 100000;
> > > ```
> >=20

