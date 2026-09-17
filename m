Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F23C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:56:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9416410E74B;
	Thu, 17 Sep 2026 20:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QrTMu2O1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 81BB04823C;
	Thu, 17 Sep 2026 20:38:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789677529;
 b=ERAfAMhB5kgMloeWOS05kJN95OYK2N39GqQeuID3wdPTPW7dpkWjiAr7F77fJH5lyI+fh
 fRachNkOkHPiapkh1I3JLJ+uNuEoTpBdOm5ApZ4ObZ8f1cujpc5NACyl7aQwY5cd0k2Lb4Z
 M7EZ6RJWWBoMngHFp+PW3q5+PXGDSvaqBa/sH6L/8vO2dkURwHYkgdS86o9b2Yj5ViOoePT
 vQPpTTKtQulQMIr6/1IPhQf22/dQyaJi1H5Iyj+c6KTLZoegKh9fpVfyZrf5Z0qmmzwykP1
 T9osGa8Sv4kSc/k8oEcAMnS1nB6MRKuuCnSOgXzChXw+TQPRT5Z7k/mNTeoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789677529; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bipV4xstn7KvY63lgDiB5ZykyIixgb82qyxme0sUG0w=;
 b=OVuB/PtOIL6fh2Z2csKxQ7ov7vemNjrljmz7Jd3oBigQa0L/FySxH3V655p0BemqS/Z/m
 PBFaUfiK/B1Z7BtdAO28rbv0uHGmx/AkX6xcESpJK9I7ek2VwdFPsFKkmYWJz3pgPteQMa7
 ewALM4gweFkpJjCu+eps01EfMhkAMfzqdO3xwFtyMIgR+ndQkzCba5W67DEUPvmXJ6BIW/i
 wSJMa24AzOOR5t7aj4Wu1l3Yruk5gxq/VsAStoZ1QovF5h+wArYxT7Vuq/OywuIBFM9gb9z
 hsoC2aUyQMBJcWN8QRsFIseKxkwKV0cxQAx/HrqbTxOR3tBylkzYN1R5xGrg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 81951481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:38:46 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com
 [74.125.231.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6586E10E5FC
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:56:24 +0000 (UTC)
Received: by mail-oa2-f12.google.com with SMTP id
 586e51a60fabf-482620dc91bso89572fac.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789678583; cv=none;
        d=google.com; s=arc-20260327;
        b=NPzHMcVjTKabEJrHz0Z3pUKpeuHPsesTHPqhO4G0VpOmC5GK/0SBGnxSUduQpCKgPL
         ilgesLn5kdwBnaswt6SQm9Ck+e/50LOasiL4cnhsMxK0SZrIm8VvrGEeBOnRrmFr95o2
         i08QTxTV7fIZZcJpwORk/dDBptYePrI3WYxCj+uEaFGzzTv3+HPFdhlui5Hs/XSHynNs
         2xTDLV8C9hn0FRa4gnESJm05J9T3X4OxGjzuTb4koSGPcj2ZFRU+p9a65MVCrOcLN3ey
         p6mp+JPz0L6esj5SzawWCYgemFr3RB0Qb8kWPEb49La+JFV9+5RewAEU+qhZ/Sty120x
         Asew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bipV4xstn7KvY63lgDiB5ZykyIixgb82qyxme0sUG0w=;
        fh=PAYpgVVuZaSttmnsxIp8608TVejb7BhZD7pWSMHw92E=;
        b=Wdb+CeUUN9XEpqqMFCTRatBJl/ErYAFGqrvDxqeyB75TlfbzZ5KdS+9GyTN9slEAWa
         IWfUfagr3Tvv+7wmLhlYDKITZYG7UpglYQgFw+vHuymRtNDu9gCpboBx6o8DemJ4X1MD
         DQJ97nrnne5HHuutrGQsK7KtpDoPLuvUDABLarDhU8mJsmVcFTI3vOjunQetil8ONIFh
         RlP8bjXWxSCoPfFMZLT0jY3JNW7GHF/ojQK9ONPnltssPDkw6M8580LlI8NbhBh6mbDJ
         sjIMdRkI5d9cptPCEkfaFuopcRv0cJGY4gXAWg6Ir6J6TeS2LBBXfgCmK15f6756MT7i
         /4wA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678583; x=1790283383;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bipV4xstn7KvY63lgDiB5ZykyIixgb82qyxme0sUG0w=;
        b=QrTMu2O1ow5KllXWF98+VBJAjlOLud40d6xrk57NDiQ3RFY5u27Ok9ytw6UedBH8iN
         IJwVnMYGtGPwHA3dlnd4CXcD95k6nMgApYRfPo4UHD3zDj+IaiwR8r8VCUcV8K6DrWYX
         LpaRHzeL/Whxg2+sAtLkVfRqbKhk9CZQ08BFypDzZrcK8Itg7boIhm7yLRgS+VKTMr5x
         CImGi6M6ICcj2WG+dUWaaOuCNT3ejc7JmwWSZ3itJRvF49ZU6ZtcvEF18Pqv1gaJRwGg
         51bKA5XeJlBY7k7dBkuVKv8qupto3O6kDHYsVxJTlSfd5UYp2J6Yu8+RVxjfNAC7Oxmx
         THQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678583; x=1790283383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bipV4xstn7KvY63lgDiB5ZykyIixgb82qyxme0sUG0w=;
        b=sOngZkq2D7t0UJTooKFyRdkSc6ktqYjsm7fuoIXtpHWI/4iLs3fqjv9tDb/a+E6qnR
         H4KofBHuv8s2Rshc0BDQMmzv1dbU2TEXUQCCn9OvGG7qJybb1XM+XEREBe9dCqeQ+zoq
         bWObtIrBOCJa8z4GlUAo0glbrnxsXklc4rg2f7xmXsm/JYc9tMbrVFeE61/08IpKgzPt
         uFsQ3YO0ITtR2CIAxyLobtMOIgu3u+tTPVaPb4m+NAYIC+b0DjBzcxxDYHjJpZ/9KPeX
         KxNTL2hb5q3EA4Z7hH61a85eRgm+SnFDSwJPCuO9eYbixJnB8HN/lP8cxjgQtlJ4zyqO
         ikkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhVfX0HsQq2UA7dN3+4WMSnZnCe586ZxkuKbPmFpD/lmGFhhQQQeBpqYM9+INJg9sBAAM2bO90@lists.freedesktop.org
X-Gm-Message-State: AFuF++nVZ0L580aZanWgoNH0DfME+UhKtQmHEbVG6E0vHDpeCf2Q7Pss
	adi0p4OtFZity633G1Pn0eXQwpMd0UgGWIvA/sypsSqhZebrna89VQWjnCHhdyR7Rukt+KYt7Vt
	G9GdOu5C5PbDfGYRU6flisNc3fo0DOf8=
X-Gm-Gg: AYBFou0cueXikkJGKE+Rq870bwoG/muOzdEA7uNUJOsNbF7BaiKyjPJXYHoB8ec5DLb
	GML/ANLf8tiFVRRoxtXM/66gtaCKFd2byB/tAEWc/TH72zVrrBGGTe1psartuMT5sj5mPLNgRkp
	cDxxVKHO+2wrVhTUezAmgxh14FfN6T/O8SORUVtPLdUK+nttaOWiKGqj/sj20NO1M0waFSlz/mN
	fGk0xBz6XvAxvLIsVPCLQVkdlhwzXvuxFcgKaR3BOYKGXZtgqNKE0zX3JkQVxtbrUZzLy5wOc0S
	2Ab0sxOQ9S4IBIWVN2mWkygWtJBKZtJrNJV4FHPIRvpcFNEEMZ8cbA3Rgbw21sH+wOUgM9aewGp
	5gwerqs+id8Gg41bCcKNS6uuT1N1TcvkCqwvQ
X-Received: by 2002:a05:6870:e304:b0:485:d1ab:7943 with SMTP id
 586e51a60fabf-486e7529c38mr275601fac.36.1789678583375; Thu, 17 Sep 2026
 13:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
 <4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com>
In-Reply-To: <4170733fbe8a738f925986f0a17d03c39b066c17.camel@redhat.com>
From: tanodzh <tano.dzhinski@gmail.com>
Date: Thu, 17 Sep 2026 23:56:07 +0300
X-Gm-Features: AcwNN1Vfo4dvM619sBhxteR11Pe9KDeQ_j2eDrdXEFWSeyiF4dG_J9_oKcsTxkc
Message-ID: 
 <CAJhzm-_fwJTUa_Pt22cGek0ZQHxYOUyCWZvU0QdKdNKEHfrFGg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
To: lyude@redhat.com
Content-Type: multipart/alternative; boundary="000000000000396c1c065bb404a7"
Message-ID-Hash: L27HNEIODG6ZZRVZ4KMESEIQ6GLXFNCL
X-Message-ID-Hash: L27HNEIODG6ZZRVZ4KMESEIQ6GLXFNCL
X-MailFrom: tano.dzhinski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L27HNEIODG6ZZRVZ4KMESEIQ6GLXFNCL/>
Archived-At: 
 <https://lore.freedesktop.org/CAJhzm-_fwJTUa_Pt22cGek0ZQHxYOUyCWZvU0QdKdNKEHfrFGg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--000000000000396c1c065bb404a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards
without SCDC

Hi Lyude,

Happy to - that was my intent, and I'd rather the credit sit with
Giuseppe.

The reason I sent it under my own authorship is that the public
list archive I could reach redacts his email address, so I had no
way to set From: and Signed-off-by: correctly. If you can point me
at it, or CC him on this thread, I'll resend as:

  From: Giuseppe Ranieri <...>
  Signed-off-by: Giuseppe Ranieri <...>
  Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
  Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>

For what it's worth on the testing side: I hit this on a GK104
(GTX 670MX) against a BenQ PD2700U and an EW2790U, and the uoutp.c
hunk is what restores audio there. I'll add a Tested-by to the v2.

Thanks,
Tano

=D0=9D=D0=B0 =D1=87=D1=82, 17.09.2026=E2=80=AF=D0=B3. =D0=B2 19:28 <lyude@r=
edhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:

> Hi - apologies for missing the patch previously, and thank you for
> bringing this to my attention!
>
> Would you mind re-sending with the original authorship + a Co-authored-
> by tag for yourself to make sure we give the original author credit?
>
> On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhinski wrote:
> > nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> > straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> > no
> > hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> > configuration with -EINVAL, and nv50_hdmi_enable() returns before
> > hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
> >
> > The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> > that
> > HDMI audio silently stops working. Video is unaffected, and nothing
> > is
> > logged, which makes the failure hard to attribute.
> >
> > SCDC is optional, and the hdmi->scdc() call further down is already
> > guarded against a missing callback. Requesting it on a card that
> > cannot
> > do it need not invalidate the rest of the HDMI configuration, so drop
> > that term from the condition and let the existing guard skip SCDC
> > alone.
> >
> > Giuseppe Ranieri posted a fix for this to the nouveau list on
> > 2026-01-17, which received no review:
> > https://ratatoskr.run/nouveau/2026/01/16963412
> >
> > Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> > method")
> > Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index 377d0e0cef84..9887b3898505 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> > *argv, u32 argc)
> >
> >       if (!ior->func->hdmi ||
> >           args->v0.max_ac_packet > 0x1f ||
> > -         args->v0.rekey > 0x7f ||
> > -         (args->v0.scdc && !ior->func->hdmi->scdc))
> > +         args->v0.rekey > 0x7f)
> >               return -EINVAL;
> >
> >       if (!args->v0.enable) {
>
>

--000000000000396c1c065bb404a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Subject: Re: [PATCH] drm/nouveau/disp: don&#39;t reject HD=
MI config on cards without SCDC<br><br>Hi Lyude,<br><br>Happy to - that was=
 my intent, and I&#39;d rather the credit sit with<br>Giuseppe.<br><br>The =
reason I sent it under my own authorship is that the public<br>list archive=
 I could reach redacts his email address, so I had no<br>way to set From: a=
nd Signed-off-by: correctly. If you can point me<br>at it, or CC him on thi=
s thread, I&#39;ll resend as:<br><br>=C2=A0 From: Giuseppe Ranieri &lt;...&=
gt;<br>=C2=A0 Signed-off-by: Giuseppe Ranieri &lt;...&gt;<br>=C2=A0 Co-auth=
ored-by: Tano Dzhinski &lt;<a href=3D"mailto:tano.dzhinski@gmail.com">tano.=
dzhinski@gmail.com</a>&gt;<br>=C2=A0 Signed-off-by: Tano Dzhinski &lt;<a hr=
ef=3D"mailto:tano.dzhinski@gmail.com">tano.dzhinski@gmail.com</a>&gt;<br><b=
r>For what it&#39;s worth on the testing side: I hit this on a GK104<br>(GT=
X 670MX) against a BenQ PD2700U and an EW2790U, and the uoutp.c<br>hunk is =
what restores audio there. I&#39;ll add a Tested-by to the v2.<br><br>Thank=
s,<br>Tano</div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">=D0=9D=D0=B0 =D1=87=D1=82, 17.09.2026=E2=80=
=AF=D0=B3. =D0=B2 19:28 &lt;<a href=3D"mailto:lyude@redhat.com">lyude@redha=
t.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi - apologies for missing the patch pr=
eviously, and thank you for<br>
bringing this to my attention!<br>
<br>
Would you mind re-sending with the original authorship + a Co-authored-<br>
by tag for yourself to make sure we give the original author credit?<br>
<br>
On Thu, 2026-09-17 at 13:50 +0000, Tano Dzhinski wrote:<br>
&gt; nv50_hdmi_enable() passes the sink&#39;s SCDC capability from its EDID=
<br>
&gt; straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is<=
br>
&gt; no<br>
&gt; hdmi-&gt;scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole<br=
>
&gt; configuration with -EINVAL, and nv50_hdmi_enable() returns before<br>
&gt; hdmi-&gt;ctrl() runs and before the AVI and VSI infoframes are sent.<b=
r>
&gt; <br>
&gt; The result on such a card driving an SCDC-capable HDMI 2.0 sink is<br>
&gt; that<br>
&gt; HDMI audio silently stops working. Video is unaffected, and nothing<br=
>
&gt; is<br>
&gt; logged, which makes the failure hard to attribute.<br>
&gt; <br>
&gt; SCDC is optional, and the hdmi-&gt;scdc() call further down is already=
<br>
&gt; guarded against a missing callback. Requesting it on a card that<br>
&gt; cannot<br>
&gt; do it need not invalidate the rest of the HDMI configuration, so drop<=
br>
&gt; that term from the condition and let the existing guard skip SCDC<br>
&gt; alone.<br>
&gt; <br>
&gt; Giuseppe Ranieri posted a fix for this to the nouveau list on<br>
&gt; 2026-01-17, which received no review:<br>
&gt; <a href=3D"https://ratatoskr.run/nouveau/2026/01/16963412" rel=3D"nore=
ferrer" target=3D"_blank">https://ratatoskr.run/nouveau/2026/01/16963412</a=
><br>
&gt; <br>
&gt; Fixes: 6c6abab20b99 (&quot;drm/nouveau/disp: add output hdmi config<br=
>
&gt; method&quot;)<br>
&gt; Signed-off-by: Tano Dzhinski &lt;<a href=3D"mailto:tano.dzhinski@gmail=
.com" target=3D"_blank">tano.dzhinski@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--<br>
&gt; =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>
&gt; b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>
&gt; index 377d0e0cef84..9887b3898505 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c<br>
&gt; @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void<=
br>
&gt; *argv, u32 argc)<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if (!ior-&gt;func-&gt;hdmi ||<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args-&gt;v0.max_ac_packet=
 &gt; 0x1f ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args-&gt;v0.rekey &gt; 0x7f ||=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 (args-&gt;v0.scdc &amp;&amp; !=
ior-&gt;func-&gt;hdmi-&gt;scdc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 args-&gt;v0.rekey &gt; 0x7f)<b=
r>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if (!args-&gt;v0.enable) {<br>
<br>
</blockquote></div>

--000000000000396c1c065bb404a7--
