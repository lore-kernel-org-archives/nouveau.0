Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620D7C88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:16:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 246E310EFE0;
	Thu, 17 Sep 2026 21:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DbNO5hyP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 10BDC4825D;
	Thu, 17 Sep 2026 20:58:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789678704;
 b=lCkdXnKYGl0M0oKhRz2Zc3vFcJtgSqGvC3fY7ImSIpQCjnGQpm5K4r/Ne+w5tPyZucg65
 kDjifkDEU1JdNrRmqTjVUL4/YD9xcMW05cHmsUZfaUTipZYj9IKHg3Jl4h6sBW6A9MAo+5t
 6o3LiZOXJoMsAW6Oggof7yi+pjhGPy1uIzgdmgUZASIVjbFZIYpU6cYzyq0rT2s9suPUNvK
 gyAJpm8Ys5b5glVkrtrnJhv/GsoGxLqOICGZjutF5karGNcmgxNnaktXu2fbuFRc7LFxzXQ
 V+t09XNXknZcgBb4dZayjattUtbuk6vsg12UUymmlJHcRGSdU5D6el5Wg34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789678704; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U30+X8b8VCQRj2XuUuDWhtkaw9kybNJuopyq3kL9/18=;
 b=0w6eeyqGdmAyUXXAatoX2LmsmOZIU/TnEQOgURSdgNKZUbjP8W8HDoJDI8n8d2PTLdLZJ
 Hxc53cNTyKhBC8/t8dmpiDgjmi60yS6PE5hzFfGcMImZM/bHzzfGYIxHVr7F5NUWRwPwMOD
 Iq2MXEUQMI3BUSa7dqp3nYpvQEkFm3983jQH0rBM9ND0ahqD1Rn1jra8QDLKXNdf5N3NSQF
 BKl/F1eHkudaL/sEcVjgRe7W27X8Xf0mkyAspOFLoeTetB2fnujylD+Ra0BGWwKDuBF04tt
 O9Ahb7JHqIYo7kE48or1WMTP75UvJuV/yjnin3noj/uTnKuy/MjdyNBcrmTA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 85BFF481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:58:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5620A10E856
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U30+X8b8VCQRj2XuUuDWhtkaw9kybNJuopyq3kL9/18=;
	b=DbNO5hyPYw8BKxsHkx/Pn7Q5PlF2qhgzpU40aWAB8S3BTzMqLgcoB0DonBk++DVJMdWu15
	7DGCcZmAdhcPHUeerJ7VPNO4xdEO4T7ikzJdzAXyzzcWMKyp46r3YrQSiFfqHhCvbZZOlM
	JZfwBE6sKZjUIkIb6LHBdmsCm/l1YVM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-yFlCKo1AORi6s_jA0t72Aw-1; Thu, 17 Sep 2026 17:15:58 -0400
X-MC-Unique: yFlCKo1AORi6s_jA0t72Aw-1
X-Mimecast-MFC-AGG-ID: yFlCKo1AORi6s_jA0t72Aw_1789679757
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-530d028f779so194431cf.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679757; x=1790284557;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtRNevT1H99BcwMOJOoJJC1/helgpSitXQyz+o5WM/M=;
        b=LdqlP5osH+j0zqNskxw7lbwMDczKAz1XYPydBcyoSJjyoiNXxluUiYYTTU3TtvVoPM
         ALzCy6cdg3kgOZmEXocXTaocu/9/P/P8ZJ8swj5fWjgxEtuCU3SdJ3HQHT3fHw0kh9su
         nnn/9y2FZB5J0cJ9m4JPYtSQ/oW2yv7eQqLYShNkMawFTJwcOfXJ5i0Mvc/LuiypMTTb
         6r1g5qaBDI1yhZdgPttBSVlnvKJSs3XCvVYO48A1t5JIFcfVOfefD/GRF1ivWB/4Ylgw
         eY/tomH6UD/y+M7qI6JV1Vf0Tr4QXB/35A++trcTiY+qJZx00zTRp54vqdHUqun5mMVQ
         ZxEA==
X-Forwarded-Encrypted: i=1;
 AKwUvByX5fWvUptotkdSVmBnruLlp5ESc8H+y3JbNWLmBBR09taZYbfcIRY5WvW9W0B7vtK6Xnve96Z0@lists.freedesktop.org
X-Gm-Message-State: AFuF++n/d2C3BSKk2ObRSRiG7FvgaqNF1ooLtbkG3zP4eNvF2Z/2jCmV
	uab3qDdDfjqRCZx7PMOt6PhWCipP3RRnLzpOGUbqawTxv/O2WljSDpy/2Mqrc2DE/xhLWoDMCAW
	usSrmezq8Phedsc/sbaNAXLKhY9C6D/gcLFbXr4uiuhC7YXLs5/dEubL0Lf0sEX2N0ts=
X-Gm-Gg: AYBFou0XySZZCEoHTY2u6LeKwy6XBZP3ccakejsIO0kUhjNjo+umno3Dec8VMAMASEj
	ZxStI6l2TvGqyDbB/gSl7WxjEYpmKc3H/bGIKh2WR73G8ms3hUc5q51nMk1OgsWvLgWRwq3dkuO
	1BZDWYW2JtWHTr1XIHDLhgPOpxOuDzUeq1LwjUhTCi5PT6OBmuiW4pkoecQ+XoPx17HfeEs2X4g
	wK1M89XgqxKhZaxXdLmYeGxoHR5QfAkd7jso/fzv366vHYrcX197l116oy11a/ZvjqbFXzOVHZB
	aC522upWm7wBhk67n7p72tVWrjuQazW7S2LEf/wtTLxVtTQo1aYafzxLMvl+otNuvoi//Mgr
X-Received: by 2002:a05:622a:448:b0:532:8827:a9bd with SMTP id
 d75a77b69052e-5329e49522fmr8782451cf.39.1789679757466;
        Thu, 17 Sep 2026 14:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:448:b0:532:8827:a9bd with SMTP id
 d75a77b69052e-5329e49522fmr8781941cf.39.1789679756871;
        Thu, 17 Sep 2026 14:15:56 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532620b0c44sm59939841cf.26.2026.09.17.14.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:15:56 -0700 (PDT)
Message-ID: <9442921931d5c4b78d4345ff87b51b8e6e668d2c.camel@redhat.com>
Subject: Re: [PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor
 after the loop
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 17:15:55 -0400
In-Reply-To: <20260712123616.1180830-3-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-3-postadelmaga@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SH7qjpqQMKNouPM8isTJO08JmOA19tuA3jRxq7kK-Ck_1789679757
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5TRUPIXJDS5WP2CMEJEAAVZFF7E65PR7
X-Message-ID-Hash: 5TRUPIXJDS5WP2CMEJEAAVZFF7E65PR7
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5TRUPIXJDS5WP2CMEJEAAVZFF7E65PR7/>
Archived-At: 
 <https://lore.freedesktop.org/9442921931d5c4b78d4345ff87b51b8e6e668d2c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> nvkm_pstate_prog() walks clk->states looking for the entry at index
> 'pstatei' and then keeps using the list_for_each_entry cursor after
> the
> loop.=C2=A0 This is not triggerable today: every caller clamps the index
> against clk->state_nr before calling, so the loop always breaks on a
> real
> entry.=C2=A0 It is safe by virtue of what the callers happen to do, not b=
y
> anything the function itself checks.
>=20
> Should a caller ever pass an index that is not on the list, the
> cursor
> would point at the list head rather than at a pstate, and the
> pstate->base.domain[] and pstate->fanspeed accesses that follow would
> read
> past it.=C2=A0 Rather than leave that trap in place for the next caller,
> track
> whether the entry was found and return -EINVAL if it was not.
>=20
> No functional change.
>=20
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 42f3709e0..4d546b07f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -270,13 +270,19 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int
> pstatei)
> =C2=A0=09struct nvkm_fb *fb =3D subdev->device->fb;
> =C2=A0=09struct nvkm_pci *pci =3D subdev->device->pci;
> =C2=A0=09struct nvkm_pstate *pstate;
> +=09bool found =3D false;
> =C2=A0=09int ret, idx =3D 0;
> =C2=A0
> =C2=A0=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09if (idx++ =3D=3D pstatei)
> +=09=09if (idx++ =3D=3D pstatei) {
> +=09=09=09found =3D true;
> =C2=A0=09=09=09break;
> +=09=09}
> =C2=A0=09}
> =C2=A0
> +=09if (!found)
> +=09=09return -EINVAL;
> +
> =C2=A0=09nvkm_debug(subdev, "setting performance state %d\n",
> pstatei);
> =C2=A0=09clk->pstate =3D pstatei;
> =C2=A0

