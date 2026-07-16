Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55B3C44512
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 20:40:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB41D10F3FB;
	Thu, 16 Jul 2026 20:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cCU78sNI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 73D3647219;
	Thu, 16 Jul 2026 20:25:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784233519;
 b=myuAMIZA1Vw6p+w7mxf/Sxa92WfW83bup6CGvrJXJWm//s0B/m2Ue8chsIUwX/l/3vLi4
 lSapDeVuvETgnMAG0d/FBGqRexvDrH7n2xqM66FX7YOr5nueFzs2crK8MRrokX8YuJI+fP8
 gYKAWwYjIHFNyx6Y8nTaxLSNoiORnLR8LkqyoZwzgkVvCyEAtaOT1hrdNiQTP6hYtMZvrqP
 PSeUrMeqmnKB6ka0QNkYTB1HLAuysh2BQZKVIaEU7mguShPCp/8Gcg45930xWRPrYfaYT+7
 aEH9eVKAHUaOVOs5V7DzMd1rYi7zWL3h3QK4VWs85YtP6smI+RrumUpSA49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784233519; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XrjZT/Iz0BFH24w3hnw1dhyD5W6CdMQ8puWnqaztS9E=;
 b=QlJbIMkV1GJybZJT4p7+c09I9KT+GshhfrFwh5jk3rCzd+iCoQtvYeFNtLDlAT/SEodnN
 qNbliGdIUg4nkpXEayU9VH/8fkiYkKNp9OEl3px1UmD24014qaR91eASi+fciaYquo+MGNd
 20zBnylNPk6JTz+eqzPTTsCi7MO1o4ymunYcS9V1EwxOfxxYFQINJBuQ+hZ0YpOC2eZ54X0
 3Zg29SivLTR8nCE/if276ElRSATZ70hOO9nJ0s1G0qaqc1QBPXOjWqGlFUnvD78dv1Rwclv
 qGVPfAMagHXnMOUpZa3Fa7UMjQ0K9zFITFbmxvmgnl/QKqLrZIZ409H7XH5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 238A046D04
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 20:25:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F132E10E3C5
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784234434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrjZT/Iz0BFH24w3hnw1dhyD5W6CdMQ8puWnqaztS9E=;
	b=cCU78sNIeGC9Hhmi5AdwpxdEu+AyXtR0rVICY6BfEGpZO21sxWXgUu0/05kkfEbpZc6/fP
	yvvosQzJTVJZzxlZzmMZF6zpzz1byr7G/YOZifPw7shy56kLl3JoGHlwc76M/VtWoMe1EM
	y0ah1/JuDeY0DwIcO5CBUGW7CHJyJI8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-DGeAvc26OqC4LqDq-du4hg-1; Thu, 16 Jul 2026 16:40:32 -0400
X-MC-Unique: DGeAvc26OqC4LqDq-du4hg-1
X-Mimecast-MFC-AGG-ID: DGeAvc26OqC4LqDq-du4hg_1784234432
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bec738909so61445071cf.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Jul 2026 13:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784234432; x=1784839232;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5d6Dsz72G+wI4rBRnHzICgsrc1S97mJgQumeACQ5SI=;
        b=MtdiYNdMZ46W65v5qf4qrbKOB5isNjYwSYUfrWn7dwYgY5s13J9s4/rld4KUgMg976
         lJDdC+zVluzMlweviV6nBm4ngS17gDhjotlOWH3pCT4gvZracLNkohqT2xThcm78f2OD
         97+YtcFB/P0f4ukQGwN8Bbwj4bFY0lMO3KNMxlUHCfk80Lvft7uRebK6LMikcVIHGppa
         I6RxvOB+iYbbdE56VVZr7HEtGa4yw3yXqnzHgtoQ5CeIhY8wqgWWE1tsCZ/BlSbdVWf5
         DL5lbHw6Fq455b7dczrWD2iYG9daSUtVoJBrYyWOhUQ2supJx3Eb8Ju2CceO4JKThW6k
         nRiQ==
X-Gm-Message-State: AOJu0YyE1AYvVBVAxdEV7CMzFedBmulngWlehfmXiaoMiIQqBB8iEQeO
	JhPUyWCgx2uckmCpCxlAPlzZNgY7Qmytt4PaSIhCiAexr1neV4lTEgnDKfn3hr8tJO3OPJ26Uz6
	9OHl0qXBCqJyrvGnS/IR+Bjt8LVF1Y2t8ltc3arL9o5Lyo2FcpJ+Eh23jOQ4OSSmhrqM=
X-Gm-Gg: AfdE7ckc7Va8RkBE/TqDfgw7HsE1dFsBFLmHg2M7CuVd+tnJ836XhG+tpDxCyfGPOPe
	ql/Dg1IW93/b7dnKuzZjYFR27+cfH28V+uYoks9shYyaP2Og14n9vqOIEAaUDsv6zFuAGI0YLTT
	zC9IxAt9czuNuFf4reAXpZ9FQ5qAeEBbQ9KifRxNJAJ8h7jzwdMbg2xd48xmQ6SmyMhm3+DRKX1
	XOwzf0MoHijUCWSFi9y0Idb4LkS5kJQbIrUIWCNJjXSY/bC5uxY6YqSXcC28nQJ9T1EnWd8K0xz
	WE/wgUmUsNkOh1i/NmAw+WG6qeB+W750OW5s1b5S7XjQi/0kHyAF8U0We8Ur3J7uGFuajh7P
X-Received: by 2002:a05:622a:251:b0:517:812c:ae29 with SMTP id
 d75a77b69052e-51e42453f12mr134213841cf.53.1784234432090;
        Thu, 16 Jul 2026 13:40:32 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:517:812c:ae29 with SMTP id
 d75a77b69052e-51e42453f12mr134213541cf.53.1784234431629;
        Thu, 16 Jul 2026 13:40:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caab6e9f4sm166614571cf.2.2026.07.16.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:40:30 -0700 (PDT)
Message-ID: <d51b99262dd7feb96d245926fcec65890f35c59d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Prevent division-by-zero during
 DisplayPort link training transitions
From: lyude@redhat.com
To: Arjan Filius <iafilius@xs4all.nl>, Danilo Krummrich <dakr@kernel.org>
Date: Thu, 16 Jul 2026 16:40:30 -0400
In-Reply-To: <69D67A9F-1A56-4814-AE68-50559DED42AF@xs4all.nl>
References: <69D67A9F-1A56-4814-AE68-50559DED42AF@xs4all.nl>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WJ2AXdZ0fZpGo26HRUcs142KPeKtDABq6QvCdIOLzm0_1784234432
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LHYXVLID6ASOMX4J73QRXNWJJRDSKAG4
X-Message-ID-Hash: LHYXVLID6ASOMX4J73QRXNWJJRDSKAG4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LHYXVLID6ASOMX4J73QRXNWJJRDSKAG4/>
Archived-At: 
 <https://lore.freedesktop.org/d51b99262dd7feb96d245926fcec65890f35c59d.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi, can you please clarify whether or not you used generative AI for
this patch series? If so, this needs to be noted as part of the commit
message. Additionally, both of these patches look to be identical
except that one prints a message and the other doesn't. You can just
send a single version, we will figure out how to handle that part
after.

On Thu, 2026-07-16 at 16:55 +0200, Arjan Filius wrote:
> Dear Nouveau Maintainers,
> =C2=A0
> Please find below a proposed patch to prevent a division-by-zero
> kernel oops and subsequent lockup in the Nouveau display supervisor
> engine when DisplayPort links transition to 0 active lanes. This bug
> was observed and patched/tested against the mainline kernel version
> **7.1.3**, but is present in all current upstream code.
> =C2=A0
> ---
> =C2=A0
> ### BRIEF EXPLANATION
> =C2=A0
> During screen sleep transitions or multi-input display switches (KVM
> switching), the active lane count of a DisplayPort link can
> temporarily drop to 0 (`ior->dp.nr =3D=3D 0`).=20
> =C2=A0
> When this occurs, the DisplayPort supervisor function
> `nv50_disp_super_2_2_dp` is invoked via modeset interrupts. Without
> an early-exit guard, the function attempts to perform symbols/hblank
> and link rate calculations that divide by `ior->dp.nr`, resulting in
> a kernel division-by-zero math exception, lockup, and system freeze.
> =C2=A0
> This patch adds an early-exit check at the beginning of
> `nv50_disp_super_2_2_dp` to abort display configuration when the link
> training lanes count is zero.
>=20
> *=C2=A0=C2=A0 **Tested Kernel Version:** `7.1.3` (mainline stable branch)
>=20
> ---
>=20
> ### EXTREMELY DETAILED TECHNICAL BREAKDOWN
>=20
> #### 1. Hardware Context
> This bug has been consistently reproduced on a Lenovo ThinkPad T430
> (Intel HD 4000 + discrete NVIDIA NVS 5400M / GF108 chipset) connected
> to a Lenovo ThinkPad Mini Dock Plus Series 3 (Model 4338) with dual
> external monitors on dock DisplayPorts (`DP-2` and `DP-3`).=20
>=20
> #### 2. Root Cause Analysis (Code Level)
> Inside `drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c`, when `ior-
> >dp.nr =3D=3D 0`, the driver executes the following lines in
> `nv50_disp_super_2_2_dp()`:
>=20
> *=C2=A0=C2=A0 **Line 1179:** Calculations for horizontal blank symbols:
> =C2=A0=C2=A0=C2=A0 ```c
> =C2=A0=C2=A0=C2=A0 h =3D h - (3 * ior->dp.ef) - (12 / ior->dp.nr);
> =C2=A0=C2=A0=C2=A0 ```
> *=C2=A0=C2=A0 **Line 1185:** Calculations for vertical blank symbols:
> =C2=A0=C2=A0=C2=A0 ```c
> =C2=A0=C2=A0=C2=A0 v =3D v - ((36 / ior->dp.nr) + 3) - 1;
> =C2=A0=C2=A0=C2=A0 ```
> *=C2=A0=C2=A0 **Line 1190:** Calculations for active link data rate:
> =C2=A0=C2=A0=C2=A0 ```c
> =C2=A0=C2=A0=C2=A0 link_data_rate =3D (khz * head->asy.or.depth / 8) / io=
r->dp.nr;
> =C2=A0=C2=A0=C2=A0 ```
>=20
> In all three instances, the denominator `ior->dp.nr` is `0`, causing
> an immediate kernel math exception in the display workqueue
> (`nouveau_display_hpd_work` or `nv50_disp_super`), locking up the
> graphics pipeline, freezing the screen, and hanging any reboot
> attempts (requiring a physical hard reset).
>=20
> #### 3. Daily Workday Trigger Scenario
> 1.=C2=A0 The T430 (via dock) and a secondary workstation are both
> connected to different inputs on the same external monitors.
> 2.=C2=A0 The monitors' input sources are switched to the secondary
> workstation.
> 3.=C2=A0 At the end of the day, the secondary workstation goes to sleep o=
r
> is shut down.
> 4.=C2=A0 With no active inputs, the external monitors enter power-saving
> standby mode.
> 5.=C2=A0 When the user subsequently wakes up or interacts with the T430,
> the driver attempts a modeset refresh. Since the monitors are asleep
> and inputs are switched away, the lanes count is read as `0`,
> triggering the division-by-zero oops.
>=20
> #### 4. Stack Trace (Oops Log)
> ```text
> [di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC responded,
> but no EDID for DP-2
> [di jul 23 10:28:25 2024] nouveau 0000:01:00.0: DRM: DDC responded,
> but no EDID for DP-3
> [di jul 23 10:28:26 2024] Workqueue: nvkm-disp nv50_disp_super
> [nouveau]
> [di jul 23 10:28:26 2024] RIP: 0010:nv50_disp_super_2_2_dp+0xa7/0x320
> [nouveau]
> [di jul 23 10:28:26 2024]=C2=A0 ? nv50_disp_super_2_2_dp+0xa7/0x320
> [nouveau]
> [di jul 23 10:28:26 2024]=C2=A0 nv50_disp_super_2_2+0xf2/0x160 [nouveau]
> [di jul 23 10:28:26 2024]=C2=A0 nv50_disp_super+0x139/0x280 [nouveau]
> ```
>=20
> #### 5. Verification Proof (Bypass Log)
> With the patch applied and running on kernel `7.1.3-custom #2`, the
> screen standby transition was bypassed cleanly. The driver caught the
> lane count of 0, bypassed display configuration, and proceeded to put
> the graphics chip into its low-power runtime suspend state
> (`suspended`) without locking up the OS:
> ```text
> [45162.232371] nouveau 0000:01:00.0: disp: DP link is inactive (lanes
> =3D 0), skipping display configuration.
> [45162.232402] nouveau 0000:01:00.0: disp: DP link is inactive (lanes
> =3D 0), skipping display configuration.
> [45178.605627] nouveau 0000:01:00.0: timeout
> [45178.605629] WARNING: nv50_disp_dmac_fini+0x168/0x1c0 [nouveau]
> [45180.608524] nouveau 0000:01:00.0: disp: ch 1 fini timeout,
> 8e061008
> [45182.608521] nouveau 0000:01:00.0: timeout
> [45182.608523] WARNING: nv50_disp_core_fini+0x143/0x190 [nouveau]
> ```
>=20
> ---
>=20
> Signed-off-by: Arjan Filius <iafilius@xs4all.nl>
> ---
>=20
> ### CHOOSE ONE OF THE PATCH OPTIONS BELOW TO APPEND:
>=20
> #### OPTION A: The Silent Production Patch (RECOMMENDED FOR UPSTREAM)
> *Note: Kernel maintainers generally reject warnings or print spam for
> expected hardware sleep/disconnect transitions. A silent return is
> the preferred upstream pattern.*
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
> #### OPTION B: The Warning/Verbose Patch (What was tested locally)
> *Note: Prints warning logs to the kernel buffer for validation and
> troubleshooting.*
>=20
> ```diff
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> index 51c045bdfcbb..ab1bc0898def 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
> @@ -1157,6 +1157,12 @@ nv50_disp_super_2_2_dp(struct nvkm_head *head,
> struct nvkm_ior *ior)
> =C2=A0{
> =C2=A0=09struct nvkm_subdev *subdev =3D &head->disp->engine.subdev;
> =C2=A0
> +=09/* If the DisplayPort link is inactive (0 lanes), skip
> configuration */
> +=09if (ior->dp.nr =3D=3D 0) {
> +=09=09nvkm_warn(subdev, "DP link is inactive (lanes =3D 0),
> skipping display configuration.\n");
> +=09=09return;
> +=09}
> +
> =C2=A0=09const u32 khz =3D head->asy.hz / 1000;
> =C2=A0=09const u32 linkKBps =3D ior->dp.bw * 27000;
> =C2=A0=09const u32 symbol =3D 100000;
> ```

