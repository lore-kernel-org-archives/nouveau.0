Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B124FC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:05:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A31D10E8EC;
	Thu, 17 Sep 2026 21:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HUiMmUID";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72B7648248;
	Thu, 17 Sep 2026 20:48:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789678098;
 b=ZRE+5sdqv4r0Hj6DP3hJTxiaB5HAd+fbgzZ6K0EeZ0b/7XlwJpk9d2rXzmvMG6pFyE2cp
 40ao57wFKpr2XZgHscyaZvhwj2ydCXkjibKUtjIjrwWa8uMVNLoN8kK01fmesamy6QC7iZv
 4OEvG/4XY4BNWz1qLXdq2h465F8CabRfuq1vmQg8M5pSCX82dT3hkVurVk0l8Z6u1ksLGHe
 CpPJP0jhmmRBCFIS5b8w9tjeAuC8Ui2WTMeZ0mm3MUWt8aNNPkE2x8/JucSj8V58J8Egj9l
 1tiMhGEaqroMASPwy4DjCGHNhSg4KMGYNPFGv5hdkgAqIvIX2zGvUivaMZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789678098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oBv2rkX57Nn855JMqaWKszQ94o53D3ytZe/vFNcYBko=;
 b=oU3apkjX9+Ypg/XATLMJ2+69SF09TF00PsJj867GQ+GOd9cGuXvfOcAPkLb0O46T8Vx1P
 77qPU6r6ClRDCoSRlxOpl7hdQsReHNdKIE8zedfCj+PRxQ1HjjmLH3ggqLPJ8gfBHsOLg99
 UaHTIiGbtGYvk65WszdiPPZ4n7Ac8HwEGojBjyXK8fMilYKbBFHe7+dMxUykv3Np4cKaGGf
 7Jud6+xpzrNZlzR/nHUcddsWzOdMomTvOq6tjmKVKdts5O33KmeWfe3Rd05EbqvYYmPyzlk
 LfQLPwStICNpYy+gHs1IlEmUXNCQVVYaXb3YVvZpnv6S76jUCBYIXceeCoQQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0274348233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:48:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE79110E7A8
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oBv2rkX57Nn855JMqaWKszQ94o53D3ytZe/vFNcYBko=;
	b=HUiMmUID4r77PQ41iHXpKJbqt8D+9IXoBG1FnCVn5L6PD6krUy27+5XS4FBB6IYUGTOL2C
	YPugFRHpzLYdeLsCf1UhSdoHsmNXb4Spbx0p6TP8FMKJEjPAJnSqbzprFVOKk6W3k9ye2a
	kUM621W33UkBxZuU0VU4UDLFGQTqPtw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-ohbMG9axOZmwJzgGado0GQ-1; Thu, 17 Sep 2026 17:05:51 -0400
X-MC-Unique: ohbMG9axOZmwJzgGado0GQ-1
X-Mimecast-MFC-AGG-ID: ohbMG9axOZmwJzgGado0GQ_1789679151
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52ffe24490bso517691cf.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679151; x=1790283951;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oBv2rkX57Nn855JMqaWKszQ94o53D3ytZe/vFNcYBko=;
        b=U22OzwQ/HSD4cuteJqH1ibkuN2szIf6qJHxDkZIrhwNhzDaVsxcfa1Zf3CAa5z4ghK
         mboHootfYFii1PrFsOfkMNJgKJAM9G4hq1FvddUWhbMQyqcaXL34MnUXTgg1D8kM/llL
         tdnIVshNvhZl60Qh1rJcfKSiLoQcSe2DfLvaoHl8uVhyQ+EhpwX9NK4DAakfMfK6H9u6
         sPRTijUaelbHZ37myJGAm+bcSitj0jhgWWJIq/wrXmIn0lREHml9zay5cXeke60dMchF
         MyccuEFpksiDQX9dOk0w0P9IevruQC4lJl4UV6q0WM8gzMb9ngM/IxJF+sku75s1m5Xu
         3Dtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmXDoq/3570BCW7CIMBH++8TY8Yw0Zaoek9LuRsvIFNKIdpmKRNuUVCo5S8+REI+ZzB39xCLAQ@lists.freedesktop.org
X-Gm-Message-State: AFuF++n4Lj7r27WjKiqa1XV90mcNwKHbBKQFHDbU/V00k3StmDWUePf2
	LKFGq8F8NK6iZv2CLnnzc8o0jfMvQ7/geXBM5ExlksTv8321qGWIysjnMsLiFNYCApx1hV04qto
	ALwAjjXsuM2o4p4XM773ePRy8Ywpi7aIYqQrgecRtD6Thn+dCEJ8BJekTybZU1iLyA64=
X-Gm-Gg: AYBFou3pD+ZDPp8isWdjV4wQ5f+UX5BeIDxJShHqSkZ7Zuo9YBQgdiXq92EuTPJwEoL
	IWhGYkXNaAVO0LYybqV5Y+BzDC4rAqLwLPMtEJygw7gxSsZtLMIOWcBP/1IfBWnzSzqRNn7Qc1Z
	ftG9JDy+GSRRVX1R4uejAA2nG+CjLvv67Fe7LLWIT/9E8ZWhz2ogL0SQSUTJRYc2iJwGO0fTZvh
	sA28UPdyQGar3RMvpYvjd1b/UMqff3KvPo6n6kS1TJGUJeV8gF9xuoPCRvbtIHw0+RcxLhA2IGx
	RaE/3+5sCTH0kQIs1N9zjz52qFjfmlG77Mf3HrC/jiHqWNACS6L9JFUSXDZHCoyWTd099QNZ
X-Received: by 2002:a05:622a:410d:b0:532:9add:cde2 with SMTP id
 d75a77b69052e-5329e3fddc8mr8848921cf.71.1789679150752;
        Thu, 17 Sep 2026 14:05:50 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:532:9add:cde2 with SMTP id
 d75a77b69052e-5329e3fddc8mr8848211cf.71.1789679150024;
        Thu, 17 Sep 2026 14:05:50 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53262008855sm57660831cf.11.2026.09.17.14.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:05:49 -0700 (PDT)
Message-ID: <758da7db4ac3b1b36608e29f5bee752f38b37a65.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
From: lyude@redhat.com
To: tanodzh <tano.dzhinski@gmail.com>
Date: Thu, 17 Sep 2026 17:05:48 -0400
In-Reply-To: 
 <CAJhzm-_fwJTUa_Pt22cGek0ZQHxYOUyCWZvU0QdKdNKEHfrFGg@mail.gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
	 <4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com>
	 <CAJhzm-_fwJTUa_Pt22cGek0ZQHxYOUyCWZvU0QdKdNKEHfrFGg@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b5PHWOHdNxnsj0vytfill5LCBBpl-uolFL5D5D7NLq4_1789679151
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-Y+33hzVw9jWkmO67eF+b"
Message-ID-Hash: PEICHJNBAW62DHF2Z72D4BVMTTVLY2AG
X-Message-ID-Hash: PEICHJNBAW62DHF2Z72D4BVMTTVLY2AG
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Danilo Krummrich <dakr@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PEICHJNBAW62DHF2Z72D4BVMTTVLY2AG/>
Archived-At: 
 <https://lore.freedesktop.org/758da7db4ac3b1b36608e29f5bee752f38b37a65.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--=-Y+33hzVw9jWkmO67eF+b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

JFYI - Be careful when sending HTML emails, I think the kernel list
rejects them so it's usually better to send plain-text.

Anyway - I think it's fine to unanonymize the email IMO? He's posted
the patch once, which means I'm pretty sure his email is already out
there (unless it's somehow hidden from public list archives already?)

On Thu, 2026-09-17 at 23:56 +0300, tanodzh wrote:
> Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on
> cards without SCDC
>=20
> Hi Lyude,
>=20
> Happy to - that was my intent, and I'd rather the credit sit with
> Giuseppe.
>=20
> The reason I sent it under my own authorship is that the public
> list archive I could reach redacts his email address, so I had no
> way to set From: and Signed-off-by: correctly. If you can point me
> at it, or CC him on this thread, I'll resend as:
>=20
> =C2=A0 From: Giuseppe Ranieri <...>
> =C2=A0 Signed-off-by: Giuseppe Ranieri <...>
> =C2=A0 Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> =C2=A0 Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
>=20
> For what it's worth on the testing side: I hit this on a GK104
> (GTX 670MX) against a BenQ PD2700U and an EW2790U, and the uoutp.c
> hunk is what restores audio there. I'll add a Tested-by to the v2.
>=20
> Thanks,
> Tano
>=20
> =D0=9D=D0=B0 =D1=87=D1=82, 17.09.2026=E2=80=AF=D0=B3. =D0=B2 19:28 <lyude=
@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
> > Hi - apologies for missing the patch previously, and thank you for
> > bringing this to my attention!
> >=20
> > Would you mind re-sending with the original authorship + a Co-
> > authored-
> > by tag for yourself to make sure we give the original author
> > credit?
> >=20
> > On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhinski wrote:
> > > nv50_hdmi_enable() passes the sink's SCDC capability from its
> > EDID
> > > straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards
> > there is
> > > no
> > > hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> > > configuration with -EINVAL, and nv50_hdmi_enable() returns before
> > > hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
> > >=20
> > > The result on such a card driving an SCDC-capable HDMI 2.0 sink
> > is
> > > that
> > > HDMI audio silently stops working. Video is unaffected, and
> > nothing
> > > is
> > > logged, which makes the failure hard to attribute.
> > >=20
> > > SCDC is optional, and the hdmi->scdc() call further down is
> > already
> > > guarded against a missing callback. Requesting it on a card that
> > > cannot
> > > do it need not invalidate the rest of the HDMI configuration, so
> > drop
> > > that term from the condition and let the existing guard skip SCDC
> > > alone.
> > >=20
> > > Giuseppe Ranieri posted a fix for this to the nouveau list on
> > > 2026-01-17, which received no review:
> > > https://ratatoskr.run/nouveau/2026/01/16963412
> > >=20
> > > Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> > > method")
> > > Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> > > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > > index 377d0e0cef84..9887b3898505 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > > @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp,
> > void
> > > *argv, u32 argc)
> > > =C2=A0
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0if (!ior->func->hdmi ||
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args->v0.max_ac_packet >=
 0x1f ||
> > > -=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f ||
> > > -=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 (args->v0.scdc && !ior->func-=
>hdmi->scdc))
> > > +=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
> > > =C2=A0
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0if (!args->v0.enable) {
> >=20

--=-Y+33hzVw9jWkmO67eF+b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>JFYI - Be careful when sending HTML emails, I thi=
nk the kernel list rejects them so it's usually better to send plain-text.<=
/div><div><br></div><div>Anyway - I think it's fine to unanonymize the emai=
l IMO? He's posted the patch once, which means I'm pretty sure his email is=
 already out there (unless it's somehow hidden from public list archives al=
ready?)</div><div><br></div><div>On Thu, 2026-09-17 at 23:56 +0300, tanodzh=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">Subject: Re: [PATC=
H] drm/nouveau/disp: don't reject HDMI config on cards without SCDC<br><br>=
Hi Lyude,<br><br>Happy to - that was my intent, and I'd rather the credit s=
it with<br>Giuseppe.<br><br>The reason I sent it under my own authorship is=
 that the public<br>list archive I could reach redacts his email address, s=
o I had no<br>way to set From: and Signed-off-by: correctly. If you can poi=
nt me<br>at it, or CC him on this thread, I'll resend as:<br><br>&nbsp; Fro=
m: Giuseppe Ranieri &lt;...&gt;<br>&nbsp; Signed-off-by: Giuseppe Ranieri &=
lt;...&gt;<br>&nbsp; Co-authored-by: Tano Dzhinski &lt;<a href=3D"mailto:ta=
no.dzhinski@gmail.com">tano.dzhinski@gmail.com</a>&gt;<br>&nbsp; Signed-off=
-by: Tano Dzhinski &lt;<a href=3D"mailto:tano.dzhinski@gmail.com">tano.dzhi=
nski@gmail.com</a>&gt;<br><br>For what it's worth on the testing side: I hi=
t this on a GK104<br>(GTX 670MX) against a BenQ PD2700U and an EW2790U, and=
 the uoutp.c<br>hunk is what restores audio there. I'll add a Tested-by to =
the v2.<br><br>Thanks,<br>Tano</div><div><br></div><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">=D0=9D=D0=B0=
 =D1=87=D1=82, 17.09.2026=E2=80=AF=D0=B3. =D0=B2 19:28 &lt;<a href=3D"mailt=
o:lyude@redhat.com">lyude@redhat.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><div>Hi - apologies for missing=
 the patch previously, and thank you for<br>bringing this to my attention!<=
br></div><div><br>Would you mind re-sending with the original authorship + =
a Co-authored-<br>by tag for yourself to make sure we give the original aut=
hor credit?<br></div><div><br>On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhin=
ski wrote:<br>&gt; nv50_hdmi_enable() passes the sink's SCDC capability fro=
m its EDID<br>&gt; straight through to nvif_outp_hdmi(). On pre-Maxwell-2 c=
ards there is<br>&gt; no<br>&gt; hdmi-&gt;scdc callback, so nvkm_uoutp_mthd=
_hdmi() rejects the whole<br>&gt; configuration with -EINVAL, and nv50_hdmi=
_enable() returns before<br>&gt; hdmi-&gt;ctrl() runs and before the AVI an=
d VSI infoframes are sent.<br>&gt; <br>&gt; The result on such a card drivi=
ng an SCDC-capable HDMI 2.0 sink is<br>&gt; that<br>&gt; HDMI audio silentl=
y stops working. Video is unaffected, and nothing<br>&gt; is<br>&gt; logged=
, which makes the failure hard to attribute.<br>&gt; <br>&gt; SCDC is optio=
nal, and the hdmi-&gt;scdc() call further down is already<br>&gt; guarded a=
gainst a missing callback. Requesting it on a card that<br>&gt; cannot<br>&=
gt; do it need not invalidate the rest of the HDMI configuration, so drop<b=
r>&gt; that term from the condition and let the existing guard skip SCDC<br=
>&gt; alone.<br>&gt; <br>&gt; Giuseppe Ranieri posted a fix for this to the=
 nouveau list on<br>&gt; 2026-01-17, which received no review:<br>&gt; <a h=
ref=3D"https://ratatoskr.run/nouveau/2026/01/16963412" rel=3D"noreferrer" t=
arget=3D"_blank">https://ratatoskr.run/nouveau/2026/01/16963412</a><br>&gt;=
 <br>&gt; Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config<br=
>&gt; method")<br>&gt; Signed-off-by: Tano Dzhinski &lt;<a href=3D"mailto:t=
ano.dzhinski@gmail.com" target=3D"_blank">tano.dzhinski@gmail.com</a>&gt;<b=
r>&gt; ---<br>&gt; &nbsp;drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c |=
 3 +--<br>&gt; &nbsp;1 file changed, 1 insertion(+), 2 deletions(-)<br>&gt;=
 <br>&gt; diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>=
&gt; b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>&gt; index 377d0=
e0cef84..9887b3898505 100644<br>&gt; --- a/drivers/gpu/drm/nouveau/nvkm/eng=
ine/disp/uoutp.c<br>&gt; +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uou=
tp.c<br>&gt; @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *out=
p, void<br>&gt; *argv, u32 argc)<br>&gt; &nbsp;<br>&gt; &nbsp;&nbsp; &nbsp;=
 &nbsp;if (!ior-&gt;func-&gt;hdmi ||<br>&gt; &nbsp;&nbsp; &nbsp; &nbsp;&nbs=
p;&nbsp;&nbsp; args-&gt;v0.max_ac_packet &gt; 0x1f ||<br>&gt; -&nbsp; &nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp; args-&gt;v0.rekey &gt; 0x7f ||<br>&gt; -&nbsp; &=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp; (args-&gt;v0.scdc &amp;&amp; !ior-&gt;func-&=
gt;hdmi-&gt;scdc))<br>&gt; +&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; args-&gt=
;v0.rekey &gt; 0x7f)<br>&gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;return -EINVAL;<br>&gt; &nbsp;<br>&gt; &nbsp;&nbsp; &nbsp; &nbsp;if=
 (!args-&gt;v0.enable) {<br></div><div><br></div></blockquote></div></block=
quote><div><br></div><div><span></span></div></body></html>

--=-Y+33hzVw9jWkmO67eF+b--

