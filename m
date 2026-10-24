Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E963606A31A
	for <nouveau@archiver.kernel.org>; Sat, 24 Oct 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dsTk01wf
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4BFC10E3E4;
	Sat, 24 Oct 2026 20:50:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D574948B8A;
	Sat, 24 Oct 2026 20:31:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792873892;
 b=bZRfbWE0C9LyhF79gw33K7RiyEBUaAPrdrERF1ZJPi+wumJ3/iUxbn8UuwsMwgqnnTGP6
 iHWXXD1lgIw+XgGK/To+jR/HGNdGTkPHmYOoLH44CI1J520eyWSKpKT2mErOATpMviTm4lY
 dNmho0Uj+kZ/T3iU4RVlfjGl46XRpKfeRdzUm/3I1sm3oEdi1BFCV0aocDLNpDLj7H8TFgn
 lwfU7hHojJvnYQlQLg/y/AXwjzgkzoIDhpzbWk+uw1M4WKpyQ//MpwXBOWJimISXPGPoZMU
 2fSG2yeo84d4LrDnwfoC3E0HifYTRDXFIlQWKOMHL0sVa7Jzw7Q9wPSZbqMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792873892; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2pheqrYFv+zl32Mdi/C5xZhVx+kYgPr7R76e3E4UtAg=;
 b=YThoTiapfC3Fqic5ahRqtv4OeY3xWCVjHQlwSSUo6Yni1fOiQgCzqslRZBFSP1/twu2O5
 jMeCzAPJEcvqREbhM90c4gOE1eEeKfJ9gWC143L0rGb3SEZvg1NcDvAov9wF2rUPucge+i4
 WLCsUeBvd31hCuwxMTGrnlvuSF4W+A33wrE/YPXe9eGG7fCQW1NnzoqOo9tnzFa4N2VtM8y
 rtC7LxV5WkL4XNlj5GSWBA6M1p5JrphM2gHRlCw704YGNoqzLqE9bSFPQXAtDyrlPb3499J
 nRe6apWiHQJfrPuBoIxMtBhlNF1+a2ZyV9A4mTCEYFd7K4XYs9irHzSewzLA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B8C5548B74
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 20:31:29 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEB410E1D2
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 20:50:24 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-8b0a921ee46so14669027b3.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 24 Oct 2026 13:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792875023; cv=none;
        d=google.com; s=arc-20260327;
        b=YGekvYJhQ1XqZyf3bbNyVzKsZf1iK977YFEGc/02kJLAlYOrn9dBD5hdc/sCr97heI
         +yttf+90WRv78VEAstVW+65xdbf/AZUpej4JyWtB+55SU3UAqyqFmlBb7VOpFOG4qzbs
         XP7e8wpCFv5DVdSwtjt2QzdHY8JKnC9VQLjOf03MJmHXovvSPi8HTPDoGXg/2RZQP+t8
         lQpdh0X+ovp7FHebtzgngyd59HBRtFLsoVPFoMJ0frGGG/04fEngu2hiYnQGFl1xndJ/
         tjGdKeXaSu+vBNXfnOMryE04Yki/jrzf0ALJLmsPxxeICmLZNEhEmTbQqplyvkJ7pqgM
         Wc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2pheqrYFv+zl32Mdi/C5xZhVx+kYgPr7R76e3E4UtAg=;
        fh=x1Ku8XkHllA2oXsyz202rqLrt9pcbCDXyooCZk7PBv8=;
        b=RRFwELlVwqccvQvP06u9epVncv+lxNwtZvIxQWb+FiCwBZGNFfNwPU3K3wTAiHV1P2
         fGO2IgG+5GSzNqlyto9E367yW3AylIcwqsryl6D7/oBXXaMTatKQZl1d6YWIJylR9TNI
         p0D2iyGeZr8OXsloxmp7JAoVTsElX+jOA7Zrg5sPTpCj+LW7k1iDNe5WVdKH05Mc+5Go
         hyXHnzZtP9weUo06T09YMaALzKBWssxwSiRtoTiU1QAlSyLTaq6NfWvX0U3+2k1zp0Xc
         FyxC+MV8+dHWgrCFWCqCIBDrq+EnIaFKXbXkmZNkKodBtJpmbJQEV4Rai0rYzIy0cndO
         09DQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875023; x=1793479823;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pheqrYFv+zl32Mdi/C5xZhVx+kYgPr7R76e3E4UtAg=;
        b=dsTk01wf+bxh+xr9LHjn3unDH5qxxJwaCaLi9kJQxaGcxWF/jgxrsstAeK8OGuVqpG
         Hko33491AiP+xfoHKkmUsvBxtHOGAdjXCKSOdubYR2y4zPaahwkoxk/lHg4pm4aNK8S2
         XqEPn5GvRnLd4j8K2WqhTdpbLby5tj16OFa30vGFUPNYPo/lSusBRF7fSleywuCuhR4Y
         RtOfGYFagImACV5vFoFj80QQHh5jS5jOdRYuaIcOdHxoBh/0u8uf8ne09qIyHS5Fv0eW
         sAmphKZ0sizBT/8Nx5N9xdUHpZEyDC6wZUTcixBhfel2+9xKRC6HXjF/5zgrGy2/ml+6
         Jsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875023; x=1793479823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2pheqrYFv+zl32Mdi/C5xZhVx+kYgPr7R76e3E4UtAg=;
        b=orcgbdmGCpx2Kl4dlhVNIkQjAH49+tyDf+HhPJlDEUwadAGYZnlVGjIPQZ1TsFNPI3
         dpw1zdeExECb6kUFm4rf/EyiC7yMDhNsrs8IgifuR9UEzVTZbZ0ivrvFj7eLLAMDZSiG
         fGkI66r1ZTp+uF/PeUSepg764BQrnpiVVal4dihrZ9DOOvcZVv/waI7xWw0Sqf0OIbOz
         nvXBcdAka4I1cwzqVc+GzxHh3tPhytMIZW4UDU67aCHKW9zPDmAfYKd+miXLPBDcN2S6
         IxHldPzdXkfGAz88u2gbrQgPX/CVRUQnSooSgHUkUL683ZaOSvgFcclYWIu8qa7DVbGq
         6hKQ==
X-Gm-Message-State: AFq9FYJm7+82JWiSc/AmB5p6Hqlog80+nj/Ujz9pPDHZplmvSOrDinvR
	ojqqXTY6KZWimNmRxeXNqbGtlqkEAlEwTPqyetq6BlA6P+awEJqPygBnuvtq0yD6qNH+hVS+Yp/
	b1lZjhsIPuOX6kKkAnSRTO4qHwSNTKBiIZZW7YtRimg==
X-Gm-Gg: AYBFou14usVtudnTyGOn8Sizw1Ounpbyp91aKH4YiyiEH4mEF4jmcXV65qcw+EEQeQq
	SwY+WfBan4mJmbY9rLHvNT4XJUfz6CyCruLJI9akC5IllPfHakId0CLZ5bdrSlXD/VNKrx7DH2v
	jxKU1VNKIzLRDd8n/H+baqZpvXjQ3ykR7HlVNmcHp8FHqUR6i+0J/LsmoX6aPUUHKIwp+78tjRI
	Gze1ivYS6x3hO/JWn8pGThW+Z6rZw6nwgWBkptGqTX39Wboc5vyGRPY1Q3alekb3869iAM4JIn4
	yUIkmQBxZ4KBfiUbFh0aA2Fatoy0svTlQALHxCNJxfHoD8W6ii0FXXaLxxEEfHCNvP2Ve2f9Ugv
	LmymEnnjaaAiayn8FL4qNyu9nkJiG8RrdEwU=
X-Received: by 2002:a05:690c:82:b0:8b0:7900:1405 with SMTP id
 00721157ae682-8b166c44200mr20324627b3.81.1792875023277; Sat, 24 Oct 2026
 13:50:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925175819.3699225-1-qwe.aldo@gmail.com>
In-Reply-To: <20260925175819.3699225-1-qwe.aldo@gmail.com>
From: Aldo Ariel <qwe.aldo@gmail.com>
Date: Sat, 24 Oct 2026 17:50:11 -0300
X-Gm-Features: AclHuK8RPndl3rBceGJ5GKds9BPkshpzDsHBMfwP3_8uyDds3AYrJ126aWi66_M
Message-ID: 
 <CAP48Hfu=LTGfajcgceqbjNtE4oM+2WsA_4GgFQfSqEfub6jOzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: cancel irq_work before freeing connector
To: dakr@kernel.org, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e3a357065e9c3ebf"
Message-ID-Hash: 7EJSMS5PR7A4QTTWYBD6EIIRQSJQ6N2P
X-Message-ID-Hash: 7EJSMS5PR7A4QTTWYBD6EIIRQSJQ6N2P
X-MailFrom: qwe.aldo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7EJSMS5PR7A4QTTWYBD6EIIRQSJQ6N2P/>
Archived-At: 
 <https://lore.freedesktop.org/CAP48Hfu=LTGfajcgceqbjNtE4oM+2WsA_4GgFQfSqEfub6jOzQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000e3a357065e9c3ebf
Content-Type: text/plain; charset="UTF-8"

Hi Danilo, Dave,

Following up on this connector teardown fix sent September 25.

Would any additional validation or changes help with the review?
I'm happy to investigate further or revise the patch if needed.

Thanks,
Aldo



On Fri, 25 Sep 2026 14:58:19 -0300, Aldo Ariel Panzardo <qwe.aldo@gmail.com>
wrote:
> nouveau_connector_irq() schedules irq_work on the system workqueue.
> nouveau_connector_destroy() calls nvif_event_dtor() which unregisters
> the interrupt event source so no new callbacks will fire, but it does
> not drain the system workqueue.  If a work item was already queued,
> nouveau_dp_irq() can run after kfree(connector) and dereference freed
> memory.
>
> Add cancel_work_sync() after nvif_event_dtor() so any in-flight or
> pending irq_work completes before the connector is freed.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index XXXXXXX..YYYYYYY 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -395,6 +395,7 @@ nouveau_connector_destroy(struct drm_connector
*connector)
>       struct nouveau_connector *nv_connector =
nouveau_connector(connector);
>       nvif_event_dtor(&nv_connector->irq);
>       nvif_event_dtor(&nv_connector->hpd);
> +     cancel_work_sync(&nv_connector->irq_work);
>       kfree(nv_connector->edid);
>       drm_connector_unregister(connector);
>       drm_connector_cleanup(connector);

--000000000000e3a357065e9c3ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Danilo, Dave,<br>
<br>
Following up on this connector teardown fix sent September 25.<br>
<br>
Would any additional validation or changes help with the review?<br>
I&#39;m happy to investigate further or revise the patch if needed.<br>
<br>
Thanks,<br>
Aldo</div><br>
<br>
<br>
On Fri, 25 Sep 2026 14:58:19 -0300, Aldo Ariel Panzardo &lt;<a href=3D"mail=
to:qwe.aldo@gmail.com" target=3D"_blank" rel=3D"noreferrer">qwe.aldo@gmail.=
com</a>&gt; wrote:<br>
&gt; nouveau_connector_irq() schedules irq_work on the system workqueue.<br=
>
&gt; nouveau_connector_destroy() calls nvif_event_dtor() which unregisters<=
br>
&gt; the interrupt event source so no new callbacks will fire, but it does<=
br>
&gt; not drain the system workqueue.=C2=A0 If a work item was already queue=
d,<br>
&gt; nouveau_dp_irq() can run after kfree(connector) and dereference freed<=
br>
&gt; memory.<br>
&gt; <br>
&gt; Add cancel_work_sync() after nvif_event_dtor() so any in-flight or<br>
&gt; pending irq_work completes before the connector is freed.<br>
&gt; <br>
&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank" rel=3D=
"noreferrer">stable@vger.kernel.org</a><br>
&gt; Signed-off-by: Aldo Ariel Panzardo &lt;<a href=3D"mailto:qwe.aldo@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">qwe.aldo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu=
/drm/nouveau/nouveau_connector.c<br>
&gt; index XXXXXXX..YYYYYYY 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_connector.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c<br>
&gt; @@ -395,6 +395,7 @@ nouveau_connector_destroy(struct drm_connector *co=
nnector)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_connector *nv_connector =3D n=
ouveau_connector(connector);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nvif_event_dtor(&amp;nv_connector-&gt;irq);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nvif_event_dtor(&amp;nv_connector-&gt;hpd);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0cancel_work_sync(&amp;nv_connector-&gt;irq_work);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(nv_connector-&gt;edid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_unregister(connector);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_cleanup(connector);

--000000000000e3a357065e9c3ebf--
