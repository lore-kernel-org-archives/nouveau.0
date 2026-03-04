Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A32EFCE47
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 21:02:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D18EA10EAB6;
	Wed,  4 Mar 2026 21:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhG+j245";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 066E944E6A;
	Wed,  4 Mar 2026 20:52:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772657544;
 b=oL81UXL+oJIIyIO0emjONRMLgMxcQEP+JMCo2FgpGuTQdnB5EIJ38RDceNU0nIWiuIQtv
 Jh9Yp/Ee3t9fUpwimUeA19bmKGFQs+oQMPUgUnb03TyNAB9G3OoRKDrX3UP3UYzFBMuiONd
 W6EPaYfugQmMUi+0qROFGGS71PrAmDR+SaXai/aDVgXKpppoSXmxg/Wzec5RDhaWZb+WYIJ
 nSUrWka0GovcZbO40rtng+QbN8N8MOtKYefyeAuJa6XGlI6oRrOvnq8AftVgguYosEQnBhh
 vGSG3fSm4+YbcX7uSJz051jGNFZJsGRMbXPp/YN0k+L3HB9jkcHiqpflZ8iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772657544; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
 b=XkLi02n4qxcQ/LTLV/m3VQqNSjxe2ImgxyCoauERCdGr/1T+olqvpsp3ke2XesZXJKzPb
 EaU2nKmX+YWOtE7qkYo04jIZWTcgoWL9ie8hH8I7lfp088UoystpPCxvb+FWRynmnVmEndB
 9dhRHu8nkxNSyD9qGKrtGtpGSygr0TTagRN3p60kREkB6dzb9V0pNJu/JAv+iyagBKTo6lJ
 C9vNdGlENZv/Poi4YnOrpWCOHL3FJrw+noKgPGwiXNzxR7AyQ2HFehGJsSO8FSipIxSfg2M
 NM3DUObdI99qAkBB+FmckSYiH8uvkfJ+B9f2dLw+cm3FEMjXX9UwJ7fkYxbg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D9B9544E37
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 20:52:22 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8096710EAAF
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 21:02:43 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-506a297c14bso62784221cf.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 13:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772658162; cv=none;
        d=google.com; s=arc-20240605;
        b=IX9u2Iz8Qf8QYpdiWTKiDDZTenWJOKdIJy+ijZjsHSqxL5sy/xNJ9kyYDqvnrNbfax
         /5QbvruGt2QSlfK+NSJcVFkEOtRVyHGMQNewrylP2w118L4L/lkZpb6YDWoCKvteQDb6
         Ny1EvjnG5KAuCHxlQRso5QVOcujCI7qZ2oI9Bhgfd3O0nk2IkESMKYMNYshK2hPO2HTX
         Dd9GH8f8tFzyJcSt6azFow2w+j3iMHpLJveSZN3T0WKBhZp70IaFRWbv2orCjDw4HYmS
         AK7LO7Z6pl3cS4XDSd1bXx27h+xpdHz+Na+4otk0seHOLSc3rVicz5JED/cvgj8EXjb9
         8fFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
        fh=SBOXUo7oqGHM5Z497za6r45eLBtRQomXIoZ0/RDm0Gc=;
        b=TE5dIqdWh45olmqHCqRSYXM5NTaEa76Sv8SGFte1/cNYOs+HZHHycVMSlnRsNZSv0g
         1Baj+yqf7o8br5ePkNEkmHZaYVnMKPFweb2yoyH+toJbjdYA9bbwRuSA8+7nR5sxzKIC
         3vZS4DEl3RuFmHWA48u4aHLljOfcRrmhsFpTDQop72V6NeRudXCbMcQuETqwiuAl5qOU
         yTBNkjfxvHLcLB4PhVDm2nWVSqoPcNaUTk8ZSklVWCIw59cycHfYj62IW+BM1kQIoOb6
         1LkPtZFLXUi/llmIVIsDSdyocdUl0apK/v6gJGDeuHBLJd/S+Wodr+IB1PjY/ClIaX7G
         ol5w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772658162; x=1773262962;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
        b=JhG+j245xOdnjdPVvKWJYYtJs/QjQ+pTq2r5L/NSnZs+7ZMJc1y2/+kROS8ka46GJ9
         WYSh5iEgGLZeJMOl8jP7TnX2bUCKqvPJskNOAJBEZhXU1pK5C+HRLrMmXuDxR0V0047t
         KWf4FIcl7aRHwMQ9xuJKCnldiQ+CNVM8nkAi2Jpf527CcSJvhojBfkDawWGGGGniraiy
         j7HKbh+4eYkrqToxI8oZDK7LFI52c0MaTK9PtYyClqcKp5BRZE1vGFnvpfo46HrWHrhK
         Smk2XYKz+3EqNf5iapHOkVuti0fg26Dd3sILVFeQD/BiqORpzm2P8I3cVU4hqHwXzqLI
         SsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772658162; x=1773262962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlhZF7vEEF7ihejrZ5obw8Q86R87gDIRFL7geQVcy6k=;
        b=LwEoSbMpFS+ON89xr1oD+4QGXcAJO7APCMvtmk6v/KGLHl3JIHs8PBmGXu1N/LC8ky
         RWI62wOdQC4xlM6psXH4v7igH2aLLgbp6aUGB94hRofooKCbp1k0O/wu3JQlokCSYDhZ
         d0CoprJXmKEqf612M8jIPTNRcygHsMOHpIxJD3Pi5So9JHdEkFMqIy2gWcJEeFOTuZLs
         z9w2L06vnx4o9DL9lZQKNoJPyTZh5eqDBa0faUD1RWWrGfX8TkclvlEPtWyDY0Nbqc1Z
         DRVH8neLI7svi0+imZbo0Ik8u3vDduPlemGxxn0V00jV9LDGKWA7XPkD3VoSnEeh5cpd
         c1SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoaU6jfkDK/Poi/2pE448SnL9oleOjXfV2Xf3FUpwoew9r5eVV/NIM1XJ87uz4jCW1+JFacmbc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk+t7u5hWAaj2K8wuPiL4wRXMPep0jMXQ9qKpnG0ouOQSGeY88
	MvFJA9CyrPTCiSRtrh0Cjb6+UojePGnAFz2SRusIo4ZVj3T73ILVnVDCfyhPz1IqL0tAK5YLtge
	MwUI2+SjfwtgDYWyTl5P9whBOY0Jw/OnzDRaU
X-Gm-Gg: ATEYQzyNkgSx9ujUiGsefjfYEBZ3dwbMTu8xCDvVd3Dd14Sqi6VA5WrQB2S7ay5s0B3
	VPWYnXwKUiX/ZKtJJhzLlQ/kZdeHklqecP/UWdq/OjOGNqD5zLKkd9kO0z343mlTNOkGdj/4yJf
	FmEKCwvUU4OzSffAERjHtmZDfo2oXO1pYH3c2FFkCHEMpRTGGq4QD9AFdbYfyxSxfVW/8Qjzkzi
	J/i8D+XGqzOVIRwiwMB5+zMAB0c0AmOGePAdbcu+qtaL14ugo1LpXubjZ+Ey+C08ccWi+QazwCq
	WVUArG9Uacv5c+pWzdovFJMZw9qoyCmb6MxQmFDZUg/c7LykHnPrys1sB0oupOiaWTM=
X-Received: by 2002:a05:622a:1b88:b0:503:2f41:aba5 with SMTP id
 d75a77b69052e-508db2ca3famr47720571cf.24.1772658162419; Wed, 04 Mar 2026
 13:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20260224031750.791621-1-airlied@gmail.com>
 <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
In-Reply-To: <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Mar 2026 07:02:30 +1000
X-Gm-Features: AaiRm52HcjplSTgUJ4c2kf_3WOSF_YUZKqmY2FNaKXgyoZSsV3JxDsYk0sn7Zt0
Message-ID: 
 <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device is
 asleep
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ICNJTHPYKGWR4W34FHRNMHMKMDNNXJOM
X-Message-ID-Hash: ICNJTHPYKGWR4W34FHRNMHMKMDNNXJOM
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ICNJTHPYKGWR4W34FHRNMHMKMDNNXJOM/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 5 Mar 2026 at 03:14, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
> > then just tell it the device is busy instead of crashing in the GSP
> > code.
> >
> > WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/=
rm/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> > Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_c=
onntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fi=
b_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft=
_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tabl=
es qrtr bnep s>
> > snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass sn=
d_soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc fir=
mware_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_=
codec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg=
80211 videobu>
> > processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_therm=
al platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zo=
ne int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4=
hc_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_ac=
pi typec_ucsi>
>
> I'd remove the modules linked in, it seems not relevant.
>
> > CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_=
64 #1 PREEMPT(lazy)
> > Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/0=
5/2024
> > RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> >
> > This is a simple fix to get backported. We should probably engineer a p=
roper power domain solution to wake up devices and keep them away while fw =
updates are happening.
>
> s/away/awake/ and line length.
>
> > Cc: stable@vger.kernel.org
>
> Do we want this backported before GSP introduction?
>
> I.e. if it's only about the WARN_ON() and otherwise doesn't cause problem=
s it
> should probably be
>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-R=
M")
>
> otherwise
>
> Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for each=
 dp connector")

Go back to this for safety, probably won't blow up but it could still
cause wierd register timeouts.

>
> > Signed-off-by: Dave Airlie <airlied@redhat.com<
>
> No need to resend, I can fix up the above (and the minor typo in the SoB)=
 on
> apply.

Thanks,
Dave.
