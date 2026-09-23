Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D7C9830E
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 16:13:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0275110F0A4;
	Wed, 23 Sep 2026 16:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cmaiDgTE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0DD4048615;
	Wed, 23 Sep 2026 15:56:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790178960;
 b=xkuijpPsHR8KKjJHSxNCguahjkoUFQow2UBL56wvdUFrcX7k+PKIp8N6ehlrdRNVPIiqD
 xfkJ7RKsQt1+BsQKeYhEyYw4dnq1z9VEVDOfxyHoK6InNW7iGv/JoQezrKsl08D2gaEemXF
 0rMf2R7w/Fb8j7f85qdqUTfz+lMyLGlZzJjUFXX+ovm+0w7gKiR2YZjuL7HVNF0RuwXOTsK
 o53NyczFS0SeJoP3LUBASmB/AY7QKE2fB2EYjI9icISY3LcTZVGANZkz0OUd9Pi+YDHtWsv
 ScI+SWGyKc9bzn5UZAIRudvNKP/cwLqGNxVZoOtJ//MoV9QnojnI6cGxk3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790178960; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QdyoLNqVE+DHNfM+cg4CpjC0enh0kQx0mYfCbYmvo2A=;
 b=K2+8mMWmpyrc0gdZRF4WTokp4wZgyC6Mb06QsU+wWxOHuInS2DPKw5awwTj60Ul9xrwpm
 NbjGjIMi5GSVTtb7Aj77qJgSrut36HBJqC5Pt7lKBNu/q1m0vOXvUWVqRJS6pGnE5ZCcNbg
 wKOjL3eGhW62LUSLozrZHRYEHxK7wMElVTtlRaH4nqkOVp1drwxxctmR50LgKNQVb4qjqn/
 kN7ipc0a4RC+SLMcOFdc6B1FiEuYqW2V5aseeNN0nnqI24O0fFj3SHIe1eLv3jq6W93Nc6D
 XO6GrlCoLtexPYaQE7pU7W0r/jk9GFWrAwe46CF5u5o0Lr6RWoBVk/wZEUUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F38E948338
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 15:55:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9923C10EEB5
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790180027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdyoLNqVE+DHNfM+cg4CpjC0enh0kQx0mYfCbYmvo2A=;
	b=cmaiDgTEN16Ali1Ux0WxUKcz+akc+352uZvkG70dpXLmzRREXmBtrO2NyB3UupwkANZUUL
	hXdbJlrbgKqKyxqhdRkHzgUfQQb7khWY6Nz3YAbOZQniCpLwSIwXaI5SBR0ZbgATdSgB1O
	xqSdi4o/WiKr8POuHcKAGpGWmo6YaiE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-mweQbieVN0OLcb1f1BhTsw-1; Wed, 23 Sep 2026 12:13:45 -0400
X-MC-Unique: mweQbieVN0OLcb1f1BhTsw-1
X-Mimecast-MFC-AGG-ID: mweQbieVN0OLcb1f1BhTsw_1790180025
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9105cf082f7so20311446d6.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 23 Sep 2026 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180024; x=1790784824;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdyoLNqVE+DHNfM+cg4CpjC0enh0kQx0mYfCbYmvo2A=;
        b=ELQmPvN9dAxrGV9/12k6oGRNb81umOc/hmdl27fZetJ/xG9QZyjfdVz1HkLT56qkUX
         0ovhkUtApKHG4gE2fGNKgrdgylSBgU3XpaHLibc6+fMJn15gnUtBzyxPIriYFSNiHjFE
         hvaEqnYsD4CcXZj9zaDf8WkfuKQ/0hVmGHafH2r6DgfEOvQImwGOWfVxdeXrmvXDqtTM
         UbT1CgO1PJ3xAr0Bg3WbCE6Rq9UtQru3GLDkcCOs5heqy58WI1mvHtWIVeedn5OCzz7b
         wAIXVAJuitE6f2SJIiyDv5JigKF7euw6lLcQf758blPQwMtwJcn5WKI/2g1BDiidODsG
         9kdQ==
X-Gm-Message-State: AFuF++kXneE0lTqeUXFFIYr7WvOyoWxGR9X/EUjI4seFIVzXXYaGafss
	BOWgoVilNDtASs8DOPObwUHvAhlNSVlFKQuTPPUXHmbNuQ45ACvIrkCIT0m1fb09zRCBBh60x21
	gueRzrRGPyanUK4jppdwZnsb0VfCqSvZwq8nD4q9vRmXFekfpUCPlUJ/FYlHlnXLfzZs=
X-Gm-Gg: AYBFou35EUvqyYDhuPYz5iaYVgB9gPxxzOzikbGpw1pUGnl6YmqYsPbLa0UbPN+RGFk
	JKeG3mmpF2src02fiNTY6kFsNFNqC+OKfbWkwTWWH3vDpzIgoz0e28Sqxlr4+xrptE6BE/GLCHG
	3Rx/EJ9G8k5YHZtsn0PtLxblmC2cyXLJIR++zlT6Olc+VYPUaBJjuVY2SsPBlBkbzeP7SEw/+tZ
	PdKtK3OnmUYZAuuTwZR52OnxYl/1BwydR7U11oghZ4klCPv0ctXjKxMpGID4eQlaIxL7saQnycL
	Mp3EzdtZ7iiKMzwfkwecZWgtL5G2DTNBtsB3PA+hRHcPoebP5OZ/aNjigZJSpbrftCL2zWk=
X-Received: by 2002:a05:6214:e87:b0:90e:9d41:d44e with SMTP id
 6a1803df08f44-9140c373796mr52144136d6.21.1790180024403;
        Wed, 23 Sep 2026 09:13:44 -0700 (PDT)
X-Received: by 2002:a05:6214:e87:b0:90e:9d41:d44e with SMTP id
 6a1803df08f44-9140c373796mr52143796d6.21.1790180023908;
        Wed, 23 Sep 2026 09:13:43 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9140c411188sm23599656d6.19.2026.09.23.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:13:43 -0700 (PDT)
Message-ID: <c78df20bd86437dd3987053765a550b3bac0cc65.camel@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: HDMI output colour format and
 quantization range
From: lyude@redhat.com
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>,
	dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2026 12:13:42 -0400
In-Reply-To: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
References: <20260922215336.612239-1-Capitain_Jack.ref@yahoo.com>
	 <20260922215336.612239-1-Capitain_Jack@yahoo.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4xMjdboN6Vj0TMbbp6tZxfpGgXxfeEjd388xpJjgdio_1790180025
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HNDQSRPQCRKVPFPR3FI2IDGCQ7TM2F3N
X-Message-ID-Hash: HNDQSRPQCRKVPFPR3FI2IDGCQ7TM2F3N
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HNDQSRPQCRKVPFPR3FI2IDGCQ7TM2F3N/>
Archived-At: 
 <https://lore.freedesktop.org/c78df20bd86437dd3987053765a550b3bac0cc65.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-09-22 at 18:53 -0300, Daniel Campos Ramos wrote:
> Nouveau only ever outputs full-range RGB on HDMI.=C2=A0 This series adds
> the
> standard "Broadcast RGB" and "color format" connector properties on
> Turing to Ada heads and selects the pixel encoding together with the
> link depth: limited or full range RGB, and YCbCr 4:4:4, 4:2:2 and
> 4:2:0.
> It applies on top of the HDMI Deep Color series v2 (base and
> prerequisite ids below).
>=20
> The hardware stage was already there.=C2=A0 On NVC57D-class heads the
> final
> colour conversion is HEAD_SET_PROCAMP plus the OCSC1 matrix and the
> output clamp ranges; nouveau only wrote PROCAMP, hardcoded to
> RGB/VESA
> under a TODO.=C2=A0 The programming follows NVIDIA's open NVKMS on the
> same
> classes (EvoSetProcAmpC5, EvoSetOCsc1C5, the YUV420PACKER head
> control).
> The OCSC1 matrices are the ITU-R BT.601, BT.709 and BT.2020
> coefficients
> at limited-range scale; re-derived independently, they match NVIDIA's
> register values to within 4 in the last place, and the patch uses
> NVIDIA's values so the output is bit-identical to the proprietary
> driver
> on the same hardware.
>=20
> Selection policy follows drm_hdmi_state_helper.c, with amdgpu as the
> reference consumer of the "color format" property: sink rules per
> format (RGB/4:4:4 Deep Color bits, 4:2:2 up to 12 bpc in the 24-bit
> container, 4:2:0 through its own bits), TMDS character rates from
> drm_hdmi_compute_mode_clock(), "Automatic" picking RGB and falling
> back
> to 4:2:0, explicit requests honoured or refused.=C2=A0 YCbCr is limited
> range
> with the CTA-861 default colorimetry (BT.709 above 576 lines, BT.601
> below), declared in the AVI InfoFrame together with the pixel
> encoding.
>=20
> One default changes: "Broadcast RGB" Automatic selects limited range
> for
> CE video formats, as i915 and the HDMI helpers do.=C2=A0 Today nouveau
> sends
> full-range pixels there and can only declare that to sinks with a
> Video
> Capability Data Block, so sinks without one apply their default
> limited
> range to full-range data.=C2=A0 "Full" restores the previous output.
>=20
> =C2=A0 1: NVC57D output CSC and clamp methods (class header)
> =C2=A0 2: program PROCAMP/OCSC1/clamps from head state (no functional
> change)
> =C2=A0 3: Broadcast RGB
> =C2=A0 4: color format with YCbCr 4:4:4 and 4:2:2
> =C2=A0 5: YCbCr 4:2:0 on GA102+, gated per head on the capability notifie=
r
> =C2=A0 6: the same properties on DVI connectors, which carry HDMI to HDMI
> =C2=A0=C2=A0=C2=A0=C2=A0 sinks through passive adapters (reported by the =
automated review
> =C2=A0=C2=A0=C2=A0=C2=A0 of the Deep Color series v1)
>=20
> Tested on a GA106 (RTX 3060) driving a Sony KDL-46HX855 (HDMI 1.4,
> YCbCr 4:4:4 and 4:2:2, DC_30/DC_36/DC_Y444, 225 MHz, no VCDB), 25
> configurations in two runs: RGB full, limited and automatic at
> 8/10/12
> bpc; YCbCr 4:4:4 and 4:2:2 at 8/10/12 bpc; BT.601 at 576p/480p and
> BT.709 from 720p; 640x480 held at 8 bpc; and side-by-side, top-and-
> bottom and frame-packed 3D at 12 bpc with YCbCr 4:4:4, limited RGB
> and
> YCbCr 4:2:2.=C2=A0 Every frame carried colour bars over near-black and
> near-white steps; the sink accepted each signal and displayed correct
> colours and levels, and the driver's selection was logged per step.
>=20
> Not tested here: 4:2:0 (the sink declares none) and DVI (the board
> has
> no DVI port); both reuse the paths exercised above.=C2=A0 Volta keeps its
> current behaviour (NVKMS has no Volta display code to compare
> against)
> and Blackwell (NVCA7D, same methods at a different stride) is left
> for
> a follow-up.=C2=A0 The class header additions are verbatim subsets of
> NVIDIA's headers and carry their usual checkpatch style findings.
>=20
> Normative chain: HDMI 1.4b section 6.5 (pixel encodings, General
> Control
> Packet), HDMI 2.0 section 7.1 (YCbCr 4:2:0), CTA-861 (AVI InfoFrame
> Y/C/Q/YQ fields, default colorimetry, the QS rule), ITU-R BT.601,
> BT.709 and BT.2020.=C2=A0 Bench harness and logs:
> https://github.com/danielcamposramos/sony-bravia-linux=C2=A0(tools/stereo=
-
> modeset,
> run27 and run28); curated public indexes:
> https://github.com/danielcamposramos/awesome-linux-hdr=C2=A0and
> https://github.com/danielcamposramos/awesome-stereoscopy.
>=20
> AI partners were leveraged in the production of this work.

You need to either tag your work with Assisted-by: if it is generated
by an LLM. If you did the right thing and wrote it by hand and just
used these tools for analysis, that's fine.

FWIW, If this was entirely generated by an LLM, then this is quite a
lot of work and I'm very hesitant to review this. Going off:

https://github.com/danielcamposramos/awesome-linux-hdr

I am very concerned just about all of the results here came out of an
LLM, according to the LLM generated provenance file, which means an
actual real person with experience working on this needs to go back and
verify that all of this is correct. That is a lot of work, and the idea
that my review comments are just going to get fed back into an LLM are
not remotely encouraging to the effort of having to go through and have
a real person look this over.

>=20
> Daniel Campos Ramos (6):
> =C2=A0 drm/nouveau: add NVC57D output CSC and clamp range methods
> =C2=A0 drm/nouveau: program head output conversion for limited range and
> =C2=A0=C2=A0=C2=A0 YCbCr
> =C2=A0 drm/nouveau: add the Broadcast RGB property for HDMI
> =C2=A0 drm/nouveau: add HDMI YCbCr 4:4:4 and 4:2:2 output
> =C2=A0 drm/nouveau: add HDMI YCbCr 4:2:0 output on GA102 and later
> =C2=A0 drm/nouveau: expose HDMI output properties on DVI connectors
>=20
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/atom.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 305 +++++++++++++++-
> --
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/head.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 19 ++
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/head.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headc57d.c=C2=A0=C2=A0 | 112 +++++=
--
> =C2=A0.../drm/nouveau/include/nvhw/class/clc57d.h=C2=A0=C2=A0 |=C2=A0 34 =
++
> =C2=A0.../drm/nouveau/include/nvhw/class/clc673.h=C2=A0=C2=A0 |=C2=A0 17 =
+
> =C2=A0.../drm/nouveau/include/nvhw/class/clc67d.h=C2=A0=C2=A0 |=C2=A0 16 =
+
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c=C2=A0=C2=A0 |=C2=A0 48 =
++-
> =C2=A09 files changed, 488 insertions(+), 77 deletions(-)
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvhw/class/clc673.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvhw/class/clc67d.h
>=20
>=20
> base-commit: 73ef663c75688168e31dbe9c585b939be410a945
> prerequisite-patch-id: 6bd193908862475dd809b40037984747467236d6
> prerequisite-patch-id: bf3b51b5393ef1c612930f4c474e6852372ca7db
> prerequisite-patch-id: 22c3f84b6576853e9d3053d4e5a15a4bd37e6dcd

