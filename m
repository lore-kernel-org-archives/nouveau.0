Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBD606A31E
	for <nouveau@archiver.kernel.org>; Thu, 26 Nov 2026 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8hx3Ln2
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 313BE112767;
	Thu, 26 Nov 2026 22:04:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2D376404F7;
	Thu, 26 Nov 2026 22:04:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795730648;
 b=VHukK+YNK+ed5Facx4UXkfo4gTUR1FPSr5OxKFMhiYn3s7x2+GuVh6FI8id3PLS+kEROt
 sGfa6wU+M+CAvrBydNqFkpPK8CT6Wj80VPFJkyAf0m7IIGfSHzkTOZMkxSvxamOf/a/fbk5
 sx67tqURcf3t6teH5JviKSKlAD1smBxjJJWagt30nZ0ZxZWD4or4xZvs3jG5fcT2dUsJlF/
 0lTnOLl8NBBXlGB5LZrsS1i7+eF9vTdf1Dj0rKeUh1LnqeOnGnUlBkL/T7BHnm32JF64KiE
 Xn3OG2BT6aWqWDdOFmRncQBhtp27KAdGSggC9xipoUHhDA03gjGUNYA0FZGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795730648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2nBUpJc5iHflZDRwAMX6vbv2TQ3IkJKSBfDxCvYqDt8=;
 b=gZHzn4uxSDDJkdkLCY0ulvcfFtuD30oHiR/XW+ynhS/qpef2cJ95kFmQ2G7iH2iAW70AR
 p5pbGZiXu0a80NVAF01/LGZWazYSnH3RaS+cKSmCQM8w21u47c3j8SoOrHLKiJMxZpEqG/y
 tS6Sm9pnU67gIQvmnG/mwMWdjl0jVtlvE+8rzJAxtL2Nbwkeu1D2kuj00JzoArHBK6PoNps
 vroqp4Ws7UhUtQt7nMPHD9Fp7l0ClUeoueoBK69A99VdJZin4gIxGkRM5MJwPNy7OrJ4/9e
 30UPGy/8Oqxo/pXrkx1wrECEC0evlZY3guMo7qA82NnYIQLH02bzF9gYifIQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D286040026
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 12:39:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B946310E539
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 12:39:54 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c4cac7a7d3cso840896066b.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 25 Nov 2026 04:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795610393; cv=none;
        d=google.com; s=arc-20260327;
        b=IVxL2cKyVAOB+QfVwdHLBz45BLp7TMPcR02/Fpp9KLk+AjiJH7tAwm6tPt29gitFpu
         Uz7dF4WlONwW8hugacdEahCwbUNMzMKiIE2aP+tngGyNK+mAirN1s7hKnKw3L0Vu/zIj
         3+Ok1VUF6sDWrrW5WR495WywstgBY/WFJZ4QEhD06jAJolYtK9YnqlZ4Mvcb+2DycTmZ
         zP3A91vpwdAwXeSDos+DcIMvmlH856wUJXsMDuyJOCz1sypPkL2ZlRmpYJ8ZORtC7hg7
         IC3c//Rd0za2EBWxPvPrWYtEMRS3hf9AJZ9VDJcrkSuoCht3dVC2TNiuGMQflKhb9SqZ
         Octg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nBUpJc5iHflZDRwAMX6vbv2TQ3IkJKSBfDxCvYqDt8=;
        fh=+wm5cRTrjvA0dhwVjWOEQHO9sgEGU5eyjxPeAwMggzE=;
        b=KfBCUyra+fRgMq/o6M/K4Wj4nvkuYyRYG9n0pVwLJmt2SRSX28vfi6G70wAJXYjdja
         5oWOSBlJp3STL3JcAryhpgAIds+hX8unQvX5R+KItW4BQqI1ZloEhFesDC47YTx0dLfB
         vK5tNnC3jjJ3JdNVgYBH5deWkKr2BhCOmWf1NYC/ZnYgllCZVyBVQmNDCvsp7gUdH3R0
         9j/+iTwn+PffxDcOFbtAcjNd32oTr3Ut0hCQMqq42rV6CLluE+nwF6BNiZ/MTDMvFDRv
         5BaMWw1FcgtQAYJJCU3ZVwDmOy2fpBr1hys+p2YbSIfdsTKf9bQq9kuoiBZU33YqgYod
         wYvg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610393; x=1796215193;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nBUpJc5iHflZDRwAMX6vbv2TQ3IkJKSBfDxCvYqDt8=;
        b=r8hx3Ln2vA3enquiohyZo3l60LDljrdaAo80U75UV7ItUoIqy428aNkqZEBDTum7uA
         WjomydO9rBFbU9iuJF1+qLvsQa9r3BZ6u3m+ZfoZAZlcFmI0kgUD83+YKwJscXJ5aSpd
         S4k1Z9ef5S6ZhVvlHCMmEm0jAZFlR5jClxa93D2mS4cc2tRRnlJtBZddM+gCY8joc9Mk
         mQ7/kHizgIyQqOyzrc8jGpIMcD2TTndGTM04AlTuM4gJrOVb72fU0edE5lzGq6vyML6+
         M1YD/wxr+68HNh6pMebaXhtolxaqmeWxrQETzpKhXUJAfKDlJ2UpyD6mB6DwvqIh5EYP
         L9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610393; x=1796215193;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nBUpJc5iHflZDRwAMX6vbv2TQ3IkJKSBfDxCvYqDt8=;
        b=LWgwCByiSsBj/anb1Ok9sMjABdy+GlaqFT5Q6VFW45Lju6Gdvk6mBVuRewQC5LGADx
         PgELiMoJ92R4p3IbssQ9PNUysIqXhrE54Jd94tc33/ovu9MUOCBiFPzHmlcKFQOeF8zI
         rRcX0kMYPp7uMb2Jga7gMIfkxYusNZcPBX8qiDfYTu52NDJyrI0E33Dj7QLN4I0FMtSH
         cCi0cNgRnntMMSVQl2MvLs8kJjn4kg9iAy+fWzeZEU0UpObdQOYzCbx56MouG/htuZjy
         VjSFmn6+h6CYOkcYuJvOuCz+9t4sCsHMfm607My0r8ChrJc0PPLzycIAYbq8XiEyoP3i
         Dyog==
X-Forwarded-Encrypted: i=1;
 AL+hErG6PBuiu39bR9RA8e6DvzP5SRZeDWYQI6UfIQJBFHXCNdIGvYcccT9sgGN5uIjFdP3B8TcDDNYK@lists.freedesktop.org
X-Gm-Message-State: APuU4Z92CnESNU9iVYn7ILTCL9aPqf2ooHGzwpKjW8P7tqAT8F+QcIO7
	EW6WUlpfgzHwC/1A+q9tfbQ2q/yVwdUdqZI3CXfnM0fzj5iIUf0zQYvYqHaj/SQ8yIso++zCo6e
	xWpuLZUNB78MLkKBj5Jdz+wZCPibbvaw=
X-Gm-Gg: AZFdTZdBAFyprl9h18iJ7b85rUmeLpIMs9EsYZSo/C1GZI+THfuZBWkvsuLfP0S2+Ku
	kM6D+T7SEObUKc8fpef2hhSS/1chipI8tuAr7o7tOgAAdXGDqOeoWJxSbkEIznX9bkH1dBjA1Y4
	JkrFhoHZhAYEM+iu94BWlP0QRuLXGWZUg/EXW4SS+E6z+cm4xwZXzg35vPp1nQDvzDECw/duV38
	7BRST7lsUBPURi8/PZsA1Ixau27YkrljtwMmxjraeY+N/3dfClpPRRv/PHzrYPoNBzD7nJSGL12
	Tz5Z5pt1YUUVqIhQyRDmVJYqTqtcNQ8LRTMIR3Hcn1LHU/p+xNxFNPHk9JUdi0fsJ1/fVOyTiFk
	zFLhxeZwOwASTZQMmPc6mnegjl7VmHmwlyg7ZSzhgszOwhwP/mm+gRmA0BBm/HCiCVC9y
X-Received: by 2002:a17:906:68db:b0:c4d:4ce5:7733 with SMTP id
 a640c23a62f3a-c513ab060aamr1110265566b.30.1795610392711; Wed, 25 Nov 2026
 04:39:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260514174008.4515-1-ms.bulatov7@gmail.com>
In-Reply-To: <20260514174008.4515-1-ms.bulatov7@gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JHRg9C70LDRgtC+0LI=?= <ms.bulatov7@gmail.com>
Date: Wed, 25 Nov 2026 15:39:41 +0300
X-Gm-Features: Aa3M54ooH0fBlRnsQWPqp9LUdwyGUdym9a8GOlUrF5Dq30Z5TrH6wJZYpixCM7E
Message-ID: 
 <CAEyM3Y07hTKVVzVehHUT34XWT5g1uMvAaJGGwshgxFzPeRbYmw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: handle nouveau_hw_get_clock() return value
To: Lyude Paul <lyude@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009cd7f40661191f1d"
X-MailFrom: ms.bulatov7@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: BOFWNPOI4EILZHM2QA5F6E62LNMIGFSX
X-Message-ID-Hash: BOFWNPOI4EILZHM2QA5F6E62LNMIGFSX
X-Mailman-Approved-At: Thu, 26 Nov 2026 22:04:07 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BOFWNPOI4EILZHM2QA5F6E62LNMIGFSX/>
Archived-At: 
 <https://lore.freedesktop.org/CAEyM3Y07hTKVVzVehHUT34XWT5g1uMvAaJGGwshgxFzPeRbYmw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000009cd7f40661191f1d
Content-Type: text/plain; charset="UTF-8"

Hi,
Gentle ping on this patch. Please let me know if any changes or further
information are needed.
Thanks,
Mark.

On Thu, 14 May 2026 at 20:41, Bulatov Mark <ms.bulatov7@gmail.com> wrote:

> From: Mark Bulatov <ms.bulatov7@gmail.com>
>
> In the nv04_update_arb() function, MClk and NVClk are passed to
> nv04_calc_arb() or nv10_calc_arb(), where they are used as divisors.
> MClk and NVClk are calculated using nouveau_hw_get_clock(), which, via
> nouveau_hw_pllvals_to_clk(), can return 0, resulting in division by 0.
>
> The result of nouveau_hw_get_pllvals() in the nouveau_hw_get_clock()
> function can also return -ENOENT, which is not checked anywhere.
>
> Fix all this by adding a check.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
> Signed-off-by: Mark Bulatov <ms.bulatov7@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 1d3542d6006b..2f59b8739fc1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -202,6 +202,9 @@ nv04_update_arb(struct drm_device *dev, int VClk, int
> bpp,
>         uint32_t cfg1 = nvif_rd32(device, NV04_PFB_CFG1);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
>
> +       if (MClk <= 0 || NVClk <= 0)
> +               return;
> +
>         sim_data.pclk_khz = VClk;
>         sim_data.mclk_khz = MClk;
>         sim_data.nvclk_khz = NVClk;
> --
> 2.39.5
>
>

--0000000000009cd7f40661191f1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-n6owBd gmail-awi2gc" style=3D"font-fam=
ily:&quot;Google Sans&quot;,Arial,sans-serif,&quot;Noto Color Emoji&quot;;f=
ont-size:16px;margin:0px;border-bottom:0px rgb(10,10,10)">Hi,</div><div cla=
ss=3D"gmail-n6owBd gmail-awi2gc" style=3D"font-family:&quot;Google Sans&quo=
t;,Arial,sans-serif,&quot;Noto Color Emoji&quot;;font-size:16px;margin:0px;=
border-bottom:0px rgb(10,10,10)">Gentle ping on this patch. Please let me k=
now if any changes or further<br style=3D"margin:0px;border-bottom:0px rgb(=
10,10,10)">information are needed.</div><div class=3D"gmail-n6owBd gmail-aw=
i2gc" style=3D"font-family:&quot;Google Sans&quot;,Arial,sans-serif,&quot;N=
oto Color Emoji&quot;;font-size:16px;margin:0px;border-bottom:0px rgb(10,10=
,10)">Thanks,<br style=3D"margin:0px;border-bottom:0px rgb(10,10,10)">Mark.=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 14 May 2026 at 20:41, Bulatov Mark &l=
t;<a href=3D"mailto:ms.bulatov7@gmail.com">ms.bulatov7@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mark =
Bulatov &lt;<a href=3D"mailto:ms.bulatov7@gmail.com" target=3D"_blank">ms.b=
ulatov7@gmail.com</a>&gt;<br>
<br>
In the nv04_update_arb() function, MClk and NVClk are passed to<br>
nv04_calc_arb() or nv10_calc_arb(), where they are used as divisors.<br>
MClk and NVClk are calculated using nouveau_hw_get_clock(), which, via<br>
nouveau_hw_pllvals_to_clk(), can return 0, resulting in division by 0.<br>
<br>
The result of nouveau_hw_get_pllvals() in the nouveau_hw_get_clock()<br>
function can also return -ENOENT, which is not checked anywhere.<br>
<br>
Fix all this by adding a check.<br>
<br>
Found by Linux Verification Center (<a href=3D"http://linuxtesting.org" rel=
=3D"noreferrer" target=3D"_blank">linuxtesting.org</a>) with SVACE.<br>
<br>
Fixes: 6ee738610f41 (&quot;drm/nouveau: Add DRM driver for NVIDIA GPUs&quot=
;)<br>
Signed-off-by: Mark Bulatov &lt;<a href=3D"mailto:ms.bulatov7@gmail.com" ta=
rget=3D"_blank">ms.bulatov7@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouve=
au/dispnv04/arb.c<br>
index 1d3542d6006b..2f59b8739fc1 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c<br>
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c<br>
@@ -202,6 +202,9 @@ nv04_update_arb(struct drm_device *dev, int VClk, int b=
pp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t cfg1 =3D nvif_rd32(device, NV04_PFB_CF=
G1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pci_dev *pdev =3D to_pci_dev(dev-&gt;dev=
);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (MClk &lt;=3D 0 || NVClk &lt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sim_data.pclk_khz =3D VClk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sim_data.mclk_khz =3D MClk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sim_data.nvclk_khz =3D NVClk;<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div>

--0000000000009cd7f40661191f1d--
