Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74741C44500
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 11:11:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1907810E987;
	Thu, 22 Jan 2026 11:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfBTlgMT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6DD25404B5;
	Thu, 22 Jan 2026 11:02:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769079765;
 b=DJzEKE3NX7iN2YyOTLNDHRy4RlLyjva2nkKgRtLXxblVxG3TUxqQBeIMnCMxioQAZCiYm
 FDlhjhfjz0YYXOm9iQ+ctAr4HhQiNTQxzfQoKrxAV8QwrYkDcGpXUzQv30+zX4+rS7Yl0k6
 yBhIah/caxv1YwVouoPfcfS85GdrrZc3Wg3wRZ3WV2u7x0gqaLmNiaChwNqsj/wmUyMwnW/
 n0Y8A2Z8OWen1BDhdLmsQUrt78wCexPiwYYEGKppJK5Svkc1G9Do5zSl8V+wpiRbj/vGyNK
 uY58i6DjkmDaX8gDCn8uD2DiSBeAdLBZs3j/E/fMX7Xyntoilsxmhwr3yj8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769079765; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
 b=at9YHSwj70wXvJY2xTuqtLNiz7P5fO6OeJcGubEnnUxrJvZKK4eV2X5f+aKFmJFfbmenu
 5p2bzuc4pX+6O/l8yKRJdG+IxGaB1lhhrbkaB8Uib1CXytlYflVni/u3hZc6KTw932zMAqb
 JHMDWDf15zE9e2ZwxjdDmI4npV+WrPzDB21XRnGE6dbX49gmZ079yTiTLg0uGAqOQr3/BLB
 Z+OJhQ70KvWox0I/VltZcetmZC0C/AlIh9jDn9WuvsP0WmjHy8Zo2t+bbpkxPA+mY+y5v1J
 PA0KLfYG5KsKk9cXEKYKEkACod9unnrIycBlu7IRHxpz1fuocer2weEZQlcw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E21144031A
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 11:02:42 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com
 [74.125.82.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 439C410E980
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 11:11:31 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-1233608c7e9so120848c88.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 22 Jan 2026 03:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769080290; cv=none;
        d=google.com; s=arc-20240605;
        b=i89w4wEoaGP53ale9NuECCliduVfFGIvRozPaxCciMIpP5+TsFGqcLrfUvrZgG/dPs
         THL/yDe/YJGjnmCM7yoVd+ajqN1BE1fOhiu+1SkxZiwd0r41imON99+ufxkDa6SQZHv2
         m5x3wtIx4VwQjKfELRSi8gQOsTTP18onT/DrHohEHmBmTHqM1zHN1z2VZKoY9LPHxpES
         lAGjyi6QXplG0z89sFgJ0GzYRgAgbGHBq7+djvNC81UR1lw5kPNAzR1rps3YFgiUVow/
         qDjqzDCBN27cE7PsnBTEJVBBYL8HzaacsdY9zLQt4Nl4rUzMjoyR/ZDlTWt9fxJfqKue
         mrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
        fh=5CQvOeRl14iHvpnYdKXFOH2AywUXG1OsGysxPK+AKKc=;
        b=C78zxQC2HIiwWsQvRY0bREEiV7zNZdjtU8hILaVSrmgAoCw7NjxniYguYNwKZXa6lR
         joIY0iKcI4J5o+Dq2ol5t087E0+fQ07uv01otwBDdGY7D/IzowdJ5iY29ZiNkg/8EguW
         eMFdcJX5RDt+ZNZ6blkX8s0oy6F+8T4wb9r4Gq9NxITE3t3MiWBjOnyGfu0v6N1ju/AD
         Su4rjLapbUpX8kYUNHbWxsFAil0G4P4+Up81N4Il9VzwJYDapdPkdk6fShox1ke0Vh4g
         UB6iBFJKDuctKiDL7FfJ6TSp9r/mX/dDK7x24ahh9K3K5NJicSaUvXsGpY+r1EVvUuTS
         3ysw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769080290; x=1769685090;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
        b=UfBTlgMTdWaRRNZusa2V7YCsp8Wa02UK0MaWNRzicvCPdX5BT84CHoe2e5Y4IcPSie
         rmAp6HQ8QW7pFCx6XQtdo56EMfZpdC2OnHiFMhhqbsdltR3XzPB81k0YoZTLd9qc7u9D
         pcGTuNL5ys17+pYBc392GTbFXuCGpN5whjU2rWoC8u4p6Xxw6L3QxAuUEDNf1jEZhoxY
         y0xQdnZHcUjGSs0xMz4OhBm0g/tV2+sR3UYMTotfIOGXpAXgppRUAwV+YqUNhFVs7mJ4
         +N5TaUy4+ZlCzusdFhvZFJczJrnzvCJ5kjtDZJIPI4taRn9dTeJ1pxWTP2qhGQeTOnxL
         KmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080290; x=1769685090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
        b=XlmmjnKJJbu3D3Uoxxw4EoIKWiX6Y2Iz6BHeFIOJPwz4kODzeHgLKDrZrjxjyKNxMD
         CVPFB3sbCtGcl/r5kD5P5Q2xJJHtY1GLb7atRFQSbKUvwNGmUR+cGgHvCl3cOIAogqiS
         NkTdojKVFPY/8il/3Bl5F922V9sTRq5fxqLmkRh4RqKWavED6ti31CiJl1ar5Hfsv/3h
         5ahDl6rx4fDJ/f22izoOLCys7ZDYC+g3mkCe5NXjojYsCCNfFibieZVaAZCQ0TIOr31I
         0vMl/LU0S+LEFXOO6aqu6C78LiXTpPmboIwdlyCz++wLkOB9BF4c43+p2vWdXNECVKYS
         lrgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3RUq480Hs8oSPP3hyj2322bOypANwSl4LxYIc4rph0etOYlcZKgnmeTCBab6Q+AQqwCep50Lu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8jJptrATTyCMpoGv/8BEvgSgoxiHssEsXLID82bJrAskJ0x/X
	mYRB2D1YwL71HC1+YsAp76sJZ2WG5AId/Gv3T8TbzmOP/1okP4/WLk8H4B4CQJUhTKDHOIQbxP4
	dmdAaMbUo87jVfbF2TdfuI5rC3rozyxA=
X-Gm-Gg: AZuq6aJQXo92hZPfPooKmnXWidD27OSupFuwUdxOMwnLZZdMHe/qoBBGlOzPMgVpPJA
	zKe2I6Y6gq/F9HqdrJnt20efZkWpdh/l73a8xGeZjZJXnM9U/nNS832tk9VtgydYRRJUgfRasMu
	McLTPdMLMG1H4CbK7tZFFo+64OpTl5P19RwNqcUXWtz8dGtM1vlpNL0I1GP5tXaU2sdWjoDJ3Sx
	bNr1WIK7/J1kWDCqxXeo4RncAfUtjyqF3qf+xyuHiD0wK6u+5VpWkyCmamX2WoK/QRROcpuCkxJ
	LfkCButCZYDtxtwQDPDJvj4oag3kQcM8ru+PrroNsGdQDmd+I7FIhOoa9ScPFmU0tNPy/8PBO2M
	Y85Od3n1NBZdDuw==
X-Received: by 2002:a05:7300:cb81:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b6b40e9b8emr8758758eec.7.1769080290378; Thu, 22 Jan 2026
 03:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
In-Reply-To: <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 12:11:18 +0100
X-Gm-Features: AZwV_QjN_wV0Mo2Zkx6MPAEQ8aLumlNjlfFkZ4gsw3rpfI-o6XR2aHStQu6ih-A
Message-ID: 
 <CANiq72nbfsJF_Ly2vF5OPafUMMKN-OpqHYhKvFVNEGsxs5=q+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Eliot Courtney <ecourtney@nvidia.com>, Benno Lossin <lossin@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004987f70648f81a0c"
Message-ID-Hash: RDNRCDEXPCB25ZERARIY4KK2BCSYMT36
X-Message-ID-Hash: RDNRCDEXPCB25ZERARIY4KK2BCSYMT36
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RDNRCDEXPCB25ZERARIY4KK2BCSYMT36/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nbfsJF_Ly2vF5OPafUMMKN-OpqHYhKvFVNEGsxs5=q+g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000004987f70648f81a0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jan 2026 at 06:13, Eliot Courtney <ecourtney@nvidia.com> wrote:

> On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:
> > On 1/21/26 6:59 PM, Eliot Courtney wrote:
> >> +            // The area is contiguous and we leave an empty slot
> before `rx`.
> >> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >=3D 0`
> >> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES &&
> after_tx.len() =3D=3D MSGQ_NUM_PAGES - tx`:
> >> +            //   `rx - 1 <=3D MSGQ_NUM_PAGES` -> `rx - tx - 1 <=3D
> MSGQ_NUM_PAGES - tx`
> >> +            //   -> `rx - tx - 1 <=3D after_tx.len()`
> >
> > Hi Eliot,
> >
> > Documentation nit: the proofs are great, but the above just does
> > not go into my head easily, because it's a proof, rather than a
> > sentence.
> I had a look now and I agree that it looks like plain English is the
> defacto standard for the PANIC comments, so I will update them.
>
> But, I wonder what people think about this. IMO it makes sense to have
> SAFETY and PANIC comments as rigorous proofs (where practical and
> possible) to match the level of work the compiler does for us in the
> infalliable areas of the code - if an issue occurs, unsafe or panicking
> code is often the root cause IMO. Writing these in plain English is
> easier to read but also harder to verify that the proof is correct and
> harder to verify if there are any implicit assumptions.


I am on the road, apologies for the formatting/HTML. This is something that
we have discussed back and forth. Please take a look at Benno=E2=80=99s pro=
posal at:

https://lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/

(He may have a newer link)

Cheers,
Miguel

--0000000000004987f70648f81a0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">On Thu, 22 Jan 2026 at 06:13, Eliot Courtney &lt;<a href=
=3D"mailto:ecourtney@nvidia.com">ecourtney@nvidia.com</a>&gt; wrote:<br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:<br>
&gt; On 1/21/26 6:59 PM, Eliot Courtney wrote:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // The area is contiguo=
us and we leave an empty slot before `rx`.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // PANIC: since `rx &gt=
; tx` we have `rx - tx - 1 &gt;=3D 0`<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // PANIC: since `tx &lt=
; rx &lt; MSGQ_NUM_PAGES &amp;&amp; after_tx.len() =3D=3D MSGQ_NUM_PAGES - =
tx`:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0`rx - 1 =
&lt;=3D MSGQ_NUM_PAGES` -&gt; `rx - tx - 1 &lt;=3D MSGQ_NUM_PAGES - tx`<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0-&gt; `r=
x - tx - 1 &lt;=3D after_tx.len()`<br>
&gt;<br>
&gt; Hi Eliot,<br>
&gt;<br>
&gt; Documentation nit: the proofs are great, but the above just does<br>
&gt; not go into my head easily, because it&#39;s a proof, rather than a<br=
>
&gt; sentence.<br>
I had a look now and I agree that it looks like plain English is the<br>
defacto standard for the PANIC comments, so I will update them.<br>
<br>
But, I wonder what people think about this. IMO it makes sense to have<br>
SAFETY and PANIC comments as rigorous proofs (where practical and<br>
possible) to match the level of work the compiler does for us in the<br>
infalliable areas of the code - if an issue occurs, unsafe or panicking<br>
code is often the root cause IMO. Writing these in plain English is<br>
easier to read but also harder to verify that the proof is correct and<br>
harder to verify if there are any implicit assumptions.</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div style=3D"font-size:inherit"><di=
v dir=3D"auto" style=3D"font-size:inherit;font-style:normal;font-weight:400=
;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);=
color:rgb(0,0,0)">I am on the road, apologies for the formatting/HTML.<span=
 style=3D"font-size:inherit">=C2=A0This is something that we have discussed=
 back and forth. Please take a look at Benno=E2=80=99s proposal at:</span><=
/div><div dir=3D"auto" style=3D"font-size:inherit;font-style:normal;font-we=
ight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgba(0,0,0,0);border-color:rgb=
(0,0,0);color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"font-size:in=
herit;font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)"><div style=3D"font=
-size:inherit" dir=3D"auto"><a href=3D"https://lore.kernel.org/all/20240717=
221133.459589-1-benno.lossin@proton.me/" style=3D"font-size:inherit">https:=
//lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/</a></=
div></div><div dir=3D"auto" style=3D"font-size:inherit;font-style:normal;fo=
nt-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgba(0,0,0,0);border-colo=
r:rgb(0,0,0);color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"font-si=
ze:inherit;font-style:normal;font-weight:400;letter-spacing:normal;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">(He may have =
a newer link)</div><div dir=3D"auto" style=3D"font-size:inherit;font-style:=
normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgba(0,0,0,0);bo=
rder-color:rgb(0,0,0);color:rgb(0,0,0)"><br clear=3D"all"><div dir=3D"auto"=
 style=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(=
0,0,0)"><div dir=3D"ltr" data-smartmail=3D"gmail_signature" style=3D"backgr=
ound-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)"><div dir=
=3D"ltr" style=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);co=
lor:rgb(0,0,0)">Cheers,<br>Miguel</div></div></div></div></div></div></div>=
</div>

--0000000000004987f70648f81a0c--
