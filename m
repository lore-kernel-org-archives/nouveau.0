Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9339DC982D7
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 21:40:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E98EA10E2E5;
	Fri, 18 Sep 2026 21:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="brHveIcU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78FC54830B;
	Fri, 18 Sep 2026 21:23:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789766588;
 b=I7wzirvtskrbS8Gxbm0tTpwZfAOpGoeef7/zxwRS97tiTnXarFWTSDBb5sSyfu6mKf3xc
 BpFySJCTJ2AK6wcTGztpf51GHasZ7qe4g89M4TMrKlrh1a/91XZkeXMckqUb9sQGoErsmIz
 s2OrVboK83FKiujC8S4A/yWhonjxAa0jXAV/3/qUleCao45Ja+eR6rPV8RE3hyCnH6w+IvL
 1rOpXqxX8rJDy+Lcgk9KJKc2Wi1/SYQATqZdQnY0iM++jPRMD7dAnlvXt1boRs9Bz/z7YoX
 Aq9720Jaypn3AX6MopXqEg5eeCAF4f9zMVjCkz/ZEoVMqHXnLhjOBuC/qEBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789766588; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eVjYFi4juTcm+rsW63IVvlO0wPLOf9bPjkkjpmm0xMQ=;
 b=KjXTk8/5fE8o3J+JbcU5Ie2E8CU0cvBgHyAG72WLprWndeu/kxboP4d0EkzLzR/aLB4OR
 Uhg6FRdTYF5kj+CUrPuy53MunhkyZpVj5SDX/FdgqA1pu/HKUjNVDxVWfibpgObrtmjEybd
 teboC5O2K/p+RUEyZweeOmXcd17KBH9rE9nodX0kz9M0hvU2byuwmiVXiBXz+ROzfbLDuT3
 mCbQEj7XsOx/SkBPoPKI0qImYADt9FKv3OB83UG9FHz99F3yQVozW0z/oaO89BM6Vl0zV3M
 hAgcQ8gloqC8YtlFy1XDHf8wcO9IL6jBR3q3cWdccd2gMKx6o6Re88BV431g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 29003482C7
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 21:23:04 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com
 [74.125.228.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC410E196
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 21:40:44 +0000 (UTC)
Received: by mail-pz2-f41.google.com with SMTP id
 d2e1a72fcca58-85f0fc1fd8eso912946b3a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 14:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789767644; cv=none;
        d=google.com; s=arc-20260327;
        b=a2VMFJqekq1X3XHoI92ewptkxyGYRxiA5pf6Ur/2MdheuI31FlyZDeTOrIBaB9Jyvg
         YFst3/8fh5cCeNqrt9Xl6nVqNh9wKZ1Ao5GGZToYVi5oTYfWW+ARiemrEZT6a8tB217d
         6Q/FCvJX5YgGfc60y0zXimiH0l2olMKEnUQ/5FNr+sqd3ViMFe1NdxTwahPJbhwTWhnA
         0WgRBbXHnNPE6jteuSllv9F0l/FWljx307i2rbd6PZ6VJZiufYlHgUJXYnqNunfGuPt9
         3Tjlt7t76vKjZ5h6DKjZ5OySl/8lPHAYhg76YLx5vFa8VwLzLFLPF4wZ/+000vL00kf3
         E2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eVjYFi4juTcm+rsW63IVvlO0wPLOf9bPjkkjpmm0xMQ=;
        fh=El83917ITV87f0OA0H139Yl5ZMtPm2NbxdzmUE/Cf2I=;
        b=VBNgR0GYBOIvINZoLyljUUCqoJikVLrTyCfJgqa+AIVwxOA6/VccaOBs7WPsyl/obT
         QzHMMppeCdnJshze1xkC6JyDv4JjtaTe7yR0hnxN3AAz0v+qfcOMPrSsVOF3pyY8htKQ
         6f7Buod8qW79KUI013MLlS2Gp2vxtLo3KlVaq08snPqH2rgrPxQj4/b42+Fu/6gM8Wr7
         iNaCtQjGAyNuz/ddA/0jlT3T3cOKTY9wL95e/Qu3xJA2tJGxJ/pd433RUx+ZNegPjKAp
         oaMoiuMU/diO5eFKapNd/OMjBuKUPMZk1Mhjj1AN0y69rMkl+aM+2U6b6gQVxGjmIlAy
         ZMgg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789767644; x=1790372444;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVjYFi4juTcm+rsW63IVvlO0wPLOf9bPjkkjpmm0xMQ=;
        b=brHveIcUGC6Ep0cWblifeJuyVZ3+AHSGV8X3E2lh+L84jbJZ1hJXznO5iKm8h40wZF
         sjXiox7dtNdZdbHXt0Wa/teAjEBMTnyQCSq/PV9oWiJTIxImLCcpU5kmUwpvCUeTAy6X
         EeoTRSOPfJKYDrdk7sCRdcNkJojd8FrKV8CytuYWRpnfuSSArwR9DGsW0ZGjsmgs/nI2
         mJjCr9eGkcfCIDUFY3niHqg8GftFPz3MyAociQ/N/88eqCisD1vsdBy7pDFNvcdptAJf
         r7VoS8QxMh2djxwHT+nKwQ90IGHkX8xUXHS11NNmPNWyaDwcjeS7xiTzgBH0WgAui2oA
         rFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767644; x=1790372444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eVjYFi4juTcm+rsW63IVvlO0wPLOf9bPjkkjpmm0xMQ=;
        b=X6n1dqOliHeQjIKoL6pYGwFIF2Jd2p+5A8SAhAxDm37IOXhcbRxWtt0BsAZJstuDYp
         h811PlkfsFeNjiZjaNnewbtdyD1svOOeTqlKvWDg7ZDitrO4IMQt/cFFnDOq4NbdQkbK
         JP9vtqmLojO5eGvGgei/jMxpH5o9fKjShEqjICfFUpDzqS1r2UVqYiTxjc/ELgX1Cmbn
         37pwiGAr1//CbDF4SjYxjWy0Rt5wktOfTckC9o459jnjx+MT0urFlNCV4i+glBjXipI3
         sfWKtbxmP9zTitiU/amP3EQZcdlz83HmaVDOiXxgk9WQ55A0iYIUp2Q3UzTwxKpSTqAB
         nepg==
X-Forwarded-Encrypted: i=1;
 AKwUvByd0ppdQ3eYGqbFJkVHDOcocDoFkzTSpL0vOvt4MgzwUCi5aIv7MpOJ8+LOTFAbdCplMiLCZU1a@lists.freedesktop.org
X-Gm-Message-State: AFuF++lQyBioIHjJPOht3ibni+REtQAIn/MfwG6xnhtX80yTSeblO7fb
	bbM1mrPo/hTkiRhb5g5Prh2CestewM6u4h0JXQDFCw1QUpeWLkWJdHNAxTDgIyPudS/wOXirfG3
	KwITKU2Q9zV68MQSQqRMPqaq0icU7+/PcV1N9J98=
X-Gm-Gg: AYBFou1UsAz1X7O8GU0PL8LpYWLE/yip/20trKcNrF5g9dVt52b4ivX/ne0zM/GWCCM
	yeFysrI27+v5tAn+OCVLvtAWIonzaeteJGVVj5Vk99vRbZ3wHO11JoIeT4XfYJmMdR3nUxjYkFf
	wBBtMH6ARH0egCX6vFpv6ho4HnOir5tfyIeNVYKQqhQRdZ8WjsM94GIwpztsv+FuqIsEPSebFhK
	9WCva/GLaQOLngk1VadzSjUulpdEz5FDwITA6Bqr0pqfQDqO3f4c4zq3xS2WMpLcTFaBMxYrzZG
	3p9cytIKrDrUMRRfzf+M29qxXzJsDnXjVVirWPBVmcHHI84wJN8jsAY=
X-Received: by 2002:a05:6a00:91a8:b0:877:c77d:af8d with SMTP id
 d2e1a72fcca58-877c78cfc98mr589453b3a.13.1789767643638; Fri, 18 Sep 2026
 14:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260918131620.405133-1-postadelmaga@gmail.com>
 <20260918131620.405133-2-postadelmaga@gmail.com>
 <fa3a44fa852c8fd3b86eeb7e03ba87692056fc3e.camel@redhat.com>
In-Reply-To: <fa3a44fa852c8fd3b86eeb7e03ba87692056fc3e.camel@redhat.com>
From: Francesco <postadelmaga@gmail.com>
Date: Fri, 18 Sep 2026 23:40:31 +0200
X-Gm-Features: AcwNN1WkGwQapgIvU0wW05aI28ChAAPb89xFrPrCg3f4MGxXxjaz8TlioID0Pls
Message-ID: 
 <CAHwn+vnS7=ikU=VYx536AS9SEquN4UEOHj4zeoYVM6zNLW6DTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/nouveau/clk: fix list cursor use after loop in
 nvkm_clk_ustate_update
To: lyude@redhat.com
Content-Type: multipart/alternative; boundary="000000000000a12ff0065bc8c099"
Message-ID-Hash: ISS35IQCHHDMIBHDBPBNNXT4XBNQGZEC
X-Message-ID-Hash: ISS35IQCHHDMIBHDBPBNNXT4XBNQGZEC
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ISS35IQCHHDMIBHDBPBNNXT4XBNQGZEC/>
Archived-At: 
 <https://lore.freedesktop.org/CAHwn+vnS7=ikU=VYx536AS9SEquN4UEOHj4zeoYVM6zNLW6DTA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--000000000000a12ff0065bc8c099
Content-Type: text/plain; charset="UTF-8"

All things for all people
Thanks you, peace

Il giorno ven 18 set 2026 alle ore 20:05 <lyude@redhat.com> ha scritto:

> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-fixes in just a moment, thank you for the fixes!
>
> On Fri, 2026-09-18 at 15:16 +0200, Francesco Magazzu wrote:
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > If list_for_each_entry() exits without hitting a break then "pstate"
> > is
> > not a valid pstate pointer.  Introduce a "found" variable instead.
> >
> > The check is reachable from userspace: nvkm_clk_ustate_update() takes
> > the
> > pstate id straight from the 'pstate' debugfs file, so requesting an
> > id
> > that is not in clk->states - or any id at all when the perf tables
> > are
> > broken and the list is empty - makes the pstate->pstate != req test
> > dereference the list head cast to a struct nvkm_pstate, which is an
> > out-of-bounds read.
> >
> > Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and
> > engine clock control in core")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > [Francesco: rebased on drm-misc-next, expanded the commit message]
> > Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> > ---
> > This is Dan's 2022 patch, reposted with his authorship restored as
> > asked
> > in the review of v2.  The diff is byte for byte what he sent; the
> > commit
> > message keeps his original two sentences and adds a paragraph on how
> > the
> > check is reached from userspace.
> > Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/
> >
> >  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > index 572e63846..5da82db71 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > @@ -473,6 +473,7 @@ static int
> >  nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
> >  {
> >       struct nvkm_pstate *pstate;
> > +     bool found = false;
> >       int i = 0;
> >
> >       if (!clk->allow_reclock)
> > @@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,
> > int req)
> >
> >       if (req != -1 && req != -2) {
> >               list_for_each_entry(pstate, &clk->states, head) {
> > -                     if (pstate->pstate == req)
> > +                     if (pstate->pstate == req) {
> > +                             found = true;
> >                               break;
> > +                     }
> >                       i++;
> >               }
> >
> > -             if (pstate->pstate != req)
> > +             if (!found)
> >                       return -EINVAL;
> >               req = i;
> >       }
>
>

--000000000000a12ff0065bc8c099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All things for all people=C2=A0<br>Thanks you, peace=C2=A0=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">Il giorno ven 18 set 2026 alle ore 20:05 &lt;<a href=
=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; ha scritto:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Reviewed-by: Lyude Paul &=
lt;<a href=3D"mailto:lyude@redhat.com" target=3D"_blank">lyude@redhat.com</=
a>&gt;<br>
<br>
Will push to drm-misc-fixes in just a moment, thank you for the fixes!<br>
<br>
On Fri, 2026-09-18 at 15:16 +0200, Francesco Magazzu wrote:<br>
&gt; From: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@oracle.com" ta=
rget=3D"_blank">dan.carpenter@oracle.com</a>&gt;<br>
&gt; <br>
&gt; If list_for_each_entry() exits without hitting a break then &quot;psta=
te&quot;<br>
&gt; is<br>
&gt; not a valid pstate pointer.=C2=A0 Introduce a &quot;found&quot; variab=
le instead.<br>
&gt; <br>
&gt; The check is reachable from userspace: nvkm_clk_ustate_update() takes<=
br>
&gt; the<br>
&gt; pstate id straight from the &#39;pstate&#39; debugfs file, so requesti=
ng an<br>
&gt; id<br>
&gt; that is not in clk-&gt;states - or any id at all when the perf tables<=
br>
&gt; are<br>
&gt; broken and the list is empty - makes the pstate-&gt;pstate !=3D req te=
st<br>
&gt; dereference the list head cast to a struct nvkm_pstate, which is an<br=
>
&gt; out-of-bounds read.<br>
&gt; <br>
&gt; Fixes: 7c8565220697 (&quot;drm/nouveau/clk: implement power state and<=
br>
&gt; engine clock control in core&quot;)<br>
&gt; Signed-off-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@oracl=
e.com" target=3D"_blank">dan.carpenter@oracle.com</a>&gt;<br>
&gt; [Francesco: rebased on drm-misc-next, expanded the commit message]<br>
&gt; Signed-off-by: Francesco Magazzu &lt;<a href=3D"mailto:postadelmaga@gm=
ail.com" target=3D"_blank">postadelmaga@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; This is Dan&#39;s 2022 patch, reposted with his authorship restored as=
<br>
&gt; asked<br>
&gt; in the review of v2.=C2=A0 The diff is byte for byte what he sent; the=
<br>
&gt; commit<br>
&gt; message keeps his original two sentences and adds a paragraph on how<b=
r>
&gt; the<br>
&gt; check is reached from userspace.<br>
&gt; Link: <a href=3D"https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@ki=
li/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/dri-devel=
/YvSkKAdk8Pe0g2K9@kili/</a><br>
&gt; <br>
&gt; =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--<br>
&gt; =C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>
&gt; b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>
&gt; index 572e63846..5da82db71 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c<br>
&gt; @@ -473,6 +473,7 @@ static int<br>
&gt; =C2=A0nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0struct nvkm_pstate *pstate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if (!clk-&gt;allow_reclock)<br>
&gt; @@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,<br>
&gt; int req)<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if (req !=3D -1 &amp;&amp; req !=3D -2) {<br=
>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_en=
try(pstate, &amp;clk-&gt;states, head) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (pstate-&gt;pstate =3D=3D req)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (pstate-&gt;pstate =3D=3D req) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D true;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0i++;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pstate-&gt;pstate=
 !=3D req)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!found)<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -EINVAL;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req =3D i;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</blockquote></div>

--000000000000a12ff0065bc8c099--
