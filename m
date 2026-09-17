Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A767C982D6
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 16:28:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0C10E63F;
	Thu, 17 Sep 2026 16:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GiRaOsne";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 97F2B481AC;
	Thu, 17 Sep 2026 16:10:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789661453;
 b=ZVypvSZNZfb/0OOCsqSXo+e8Pun4bKS1qM+QVhRaTzpX6O54DTOiQ7AniZbgY8ehuS7be
 TJFZvMrRxCMQ+a/jmIoiKXmVb1JXA0eRdMBmN/VB3u9q0wbENNuNE7vVdyMT9wcwdH/Lsk3
 aIJ/fJUiVx0+DhDjUJhzoE7sP/UP0WlCJIy70CyqQZKEZ3PSP1eVWoxDpxAMSgACef0TVnj
 WWMCmXq1NOXGbEbLi/QfCXSM71IdmmnqpZxnSKFTNCK1legFNmRh2x842VFnX1MHvL1kQAU
 KkDG1xnm+A69Mv/B3Y5z/0CZ0n2JX1DE/2+iaV33QpM9fy+3mdFMVvAPtHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789661453; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nI01nierIQhKdbu+9MV6yfFxFnly7TF1DFNzMzDFFYs=;
 b=pwjRldhQnuIRew9Ngp1qVsQ5U4VHZFpnzSaYTaq+fbvjNPuPvENK2sly797c9/cajHf+9
 GqWNrSU+hz4kGTTGRPeV3pcMEohj0+kQ474WMI3Z8exlWlR4DrCsgFUNPI+7SfWrG7ZNKxf
 SMiJIcvvZyjbdVz6ISXeSzG1gOKu8L//gsGCZa/rODysQpCvVnpHVi9wMCjuoLy8vUJAvcZ
 Il7XpuI6sTtmo++tIjKQjpeZU2M5Dbodo3vzw73N39qc+sYjVzDCEo2qiVy21fXeJ/vfEEV
 oIOgVFnwMIO7mMT6mRP4c/+gxpJabk960J9YezBP3ogv6bx2+0eHxWAKboDA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A62E1481A1
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:10:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1710E0AE
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789662507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI01nierIQhKdbu+9MV6yfFxFnly7TF1DFNzMzDFFYs=;
	b=GiRaOsnew0pnW28b6Fl6Yew89HPZJkGJvQYFIqCI8Xyts+Mqe4rHGbNS6I8Ih/5BghPpOJ
	8A/9+UP949rJQFowEbCg7uj/KIhloDtFzzAvwS0A+K4QZbnC9VPKzAnxwg6tDJ3/KLS3CX
	HsyNHhTwgWj+ltGMkOCs5wuvAoUlI4I=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-CQymBieuMk-w7gtagz5DCg-1; Thu, 17 Sep 2026 12:28:25 -0400
X-MC-Unique: CQymBieuMk-w7gtagz5DCg-1
X-Mimecast-MFC-AGG-ID: CQymBieuMk-w7gtagz5DCg_1789662504
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66ce3040ea9so996328d50.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 09:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662504; x=1790267304;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9Zesbadxeg7oTrWei3JYdZLdaxPsolNq8bf7iCfLoA=;
        b=sYCUOpvuHJxTGn0w6Rqf+i9OoAnPmlQZMC6CXsCI6JX5pL08H+K/40XSPiWhhwiKYL
         gEpI8YxaIpMgBjZk3DhycmZsdj/IqdfsmcxYPnmBAYZpVZeDd1f1VivjjU2IsAIcqeZh
         VXFyEWm1aBQpJHUyJHfMzvqgNVJNtslwKpKuKRHEMHPDBJ35eW0L8cqAlsSdITY+Euqg
         Giqjy7nC7kZ3yW1aLqBAqv78IfgbOyXVKNK9ojMPeTdMWyvAIQeEDOwm8z2NFC78SnYJ
         oRNDOvdie/wM4c1oLEC6yy92ZfslRr2GHcuZV75X4b4QvleENGCQe6dTOwM6xyPTCi+p
         +KMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWC4n75GLlFsV7zDbRm8Lf2ps9R9oWGhaYAv4jK1pf4HxXyQ0W844Rrw67E5rvdRLe1yQdGkNn@lists.freedesktop.org
X-Gm-Message-State: AFuF++n7V+ib6hf8Z1XsiXP5Cr4102x7/mk0Ao14mdSGPyLQP3OhZ0hl
	YRkP4r5nvlTOe27PL8LnWf4RZzSFnmbBaSDVy2Vv5u+kIhVCsiO/ESb7jP9F+md4JqAcbxsD8k8
	oEY3ekYuDiIWffxErEVnQCvPZT0EtXpd5eu5hQPyqVv3XjbmOyIEjCmWp0hjPsJSLJT0=
X-Gm-Gg: AYBFou0uJBFX5t9feIIq3NLfbB4HKnNuS3DHFq+Ckdmv3HTycA6zvfF2dlzQPB3dE+0
	tYEuSPqeOxQRx6v4qOxJICO+YXxAGTNC+hcK2H/2brFyF5P3YC+5jjsic1bcdTWZb++VM0HxHQ4
	/wiCXbLHOPhap2g4py1oWTKkY5VQq40GtmkqDOAcC2gT178c1GhFJxEYQhE4TOyKZLlCj4LIoPW
	FlTGUTH7W7E0FDq24q5HvLDxTmWokwUsoieVMvjRlIO/Ks+faMQ+W5EGaIYQBEg9yKexuRStfvQ
	/61wcNNeT1seFPy29T6UfuLvINuTuTwqFIWWivHQDmI+p/x+l+K6aeHsExnVVA85HUOKCjp9
X-Received: by 2002:a05:690e:480c:b0:66f:c1bc:4099 with SMTP id
 956f58d0204a3-671632fcb0dmr1856042d50.92.1789662504423;
        Thu, 17 Sep 2026 09:28:24 -0700 (PDT)
X-Received: by 2002:a05:690e:480c:b0:66f:c1bc:4099 with SMTP id
 956f58d0204a3-671632fcb0dmr1856033d50.92.1789662503824;
        Thu, 17 Sep 2026 09:28:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 00721157ae682-896ca03f345sm1229717b3.20.2026.09.17.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:28:22 -0700 (PDT)
Message-ID: <4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
From: lyude@redhat.com
To: Tano Dzhinski <tano.dzhinski@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 12:28:21 -0400
In-Reply-To: <20260917135051.47683-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Rn1sIumHJAWW22NR9c6qIMWnPDCkfvZpnovdrcH_Us_1789662504
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OYUSERZS6UDDFMYO6ORWWSVQI2CFT6DC
X-Message-ID-Hash: OYUSERZS6UDDFMYO6ORWWSVQI2CFT6DC
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Ben Skeggs <bskeggs@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OYUSERZS6UDDFMYO6ORWWSVQI2CFT6DC/>
Archived-At: 
 <https://lore.freedesktop.org/4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi - apologies for missing the patch previously, and thank you for
bringing this to my attention!

Would you mind re-sending with the original authorship + a Co-authored-
by tag for yourself to make sure we give the original author credit?

On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhinski wrote:
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>=20
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> that
> HDMI audio silently stops working. Video is unaffected, and nothing
> is
> logged, which makes the failure hard to attribute.
>=20
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that
> cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC
> alone.
>=20
> Giuseppe Ranieri posted a fix for this to the nouveau list on
> 2026-01-17, which received no review:
> https://ratatoskr.run/nouveau/2026/01/16963412
>=20
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> method")
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> *argv, u32 argc)
> =C2=A0
> =C2=A0=09if (!ior->func->hdmi ||
> =C2=A0=09=C2=A0=C2=A0=C2=A0 args->v0.max_ac_packet > 0x1f ||
> -=09=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f ||
> -=09=C2=A0=C2=A0=C2=A0 (args->v0.scdc && !ior->func->hdmi->scdc))
> +=09=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f)
> =C2=A0=09=09return -EINVAL;
> =C2=A0
> =C2=A0=09if (!args->v0.enable) {

