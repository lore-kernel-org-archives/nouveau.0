Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3AEC88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 18:23:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCC9B10F058;
	Thu, 17 Sep 2026 18:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P1oVLhe6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E97CC481E7;
	Thu, 17 Sep 2026 18:05:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789668356;
 b=jFCIODrGKhNObDRtyh0+3hsn4QaoETfzzf+g5ssxO5HCGr5bSvIeOGQd27BhsFJXqyfeZ
 yLI3M57rUf0ZI/0yj0uWDqogHXWPf3c4pCFugwhHu+DX4iaMQ3b6RFnDUzftbbzXp1pSYFP
 /EjdnZuxtYEx6Cl8U/sa1hTLdbCLmfJEzLlhAYUDzV/6N19Hqf5hVg4jURNMnmPCwVaoFLp
 6enC4O9Re1no4fzH/wd0dioR4uj/vmDVMQBpLZnbpr1dMN+DCazRilQwEgDVAuFbU2wjBhN
 htiEBmcdGpMqBYUsVWOTg54+MvYOq3eBwzkUGNzhWwjMoSJJfJkaBCNZb5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789668356; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nN+X7/soQGz+UP9W+KThO9HODN8BfebifEMis1Y5K7U=;
 b=t9rj9hwOfM17MKXdp+ubWN8xnmCuXKPaOL+LjyhUuLocSP26+1jqZwkVKeO8UKe/9XHfV
 RMd+D7s0MnmowWMxL8DgiKFKvqMeK3Kj2y0/YefDWs1qMb4Wd586OFfQUZkAHrISCpnTPL2
 9WZt9Qw0YZOC5LCdEGCI1FDqMw1EpgS0jNvkzEEwLEZ+vRS96DVZU6yd4jRAa4G/nFr+BCS
 a1HZ99B2taU2cn98+kP8n+Mh/DWuZJV7pNUFRReyMQ4wI96PfZV5nU1D7u8BkVO5HGbYSsq
 OxC+PpNfAp9op66R2nmNLFuvGASaYhhxxwolJAky+/2Xq1btQwcmgJaXRT+A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B2FFD481B7
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:05:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 424DD10F04E
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789669410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nN+X7/soQGz+UP9W+KThO9HODN8BfebifEMis1Y5K7U=;
	b=P1oVLhe6UE/Db5QSeLw5Zj7N4+jOAvg6OlFQb/M4DyOkmAtdZZXzk53R3CgEdIqHSW3sI1
	RMGkDk96CkZ7Sl51NvcHauNL59PFRu/vjJiYXzkfl2LRYskd25hA3b2JwYBZ5u90qMYt4l
	GqQWyLEAw8NEmIskHygkdMRH+VwuXD4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-CsOL2py9P_SDB4PWdouKoA-1; Thu, 17 Sep 2026 14:23:29 -0400
X-MC-Unique: CsOL2py9P_SDB4PWdouKoA-1
X-Mimecast-MFC-AGG-ID: CsOL2py9P_SDB4PWdouKoA_1789669409
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9104eedb5b0so21727876d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 11:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669409; x=1790274209;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDPWA2x/XShhRvPN2CAJ/FdnJPiyLxgST24Qp2ARue0=;
        b=ImzNvI7HT4UXL8vkNyklUyf9Kf5bYygkHR7+elID1jmPKHVdAUX4YuF4gLmS8+vJqT
         p3jVyCA/BB0pQBemupko5qeGlkx3FlVQ+gcK6Z3vy+bnc4r6pJ34OijcXu09p1luYGEQ
         0jbhFP7z+Gru8kNf5MpU0F8LjaViEXIhXC8lKlF+Tjem2yJJL3N5+Sn6/pYppXvjyOYC
         nawmIIdpfq8hNeEcis0Pzc0l4uZpKP+02ZCw2T7KRrwueKB4zM8RsIE+HogPlqsxjOt/
         SLvyhGfcTesPlul9IhPrQ3DRF9quDRslHOR8SaNJs6ExJV+rGA25+f4peOeJdwOKu6fU
         PhlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWEMANgdxmnmRj4jXM0brnSag46ruC+HyukMMxG9RZ/vtRb2Fs1zfFVxHX1d9P56tTW+gNNQkS@lists.freedesktop.org
X-Gm-Message-State: AFuF++mophdwchkm7VD7E83rWmzoYfG7Uq9lN2LJ3bMyv6eQC3Kh5xfA
	8MVq1fao2B91RdTR2dj0YArX9HLJc7ckUl3X4RJbw7P9wKKSIeeJUV/TnhTfuuUyJcP4s/5iwdU
	Fwn3m5Fvelmy6vgsuMCmlA8kukZy/M8ulx8IiGQe181eaF+QtN0eGBiBKhFSQffCr0d8=
X-Gm-Gg: AYBFou0L48CyLKmEASDXTDXtbpXBuckEIBS+oMNkjJo+XhsgHxmRbEJGAGIRM70NPug
	YVRGyba962x5AyOZDiudngX77NEOUObPiGghWBBT12g1VvtdXWZteXF8Uf00OUA+cH11PaCa/5h
	u3ZRNXc4Sr2gYj3k2oXRVjHMmRHpnuoNEq7P7ZxWhHVVA7DQHmNK9+yrb0s2UqsaQJp1C2xRdlt
	lAhkagcK0zDqU+5iZcxPz0iBuYcrOgLb74DphRGhylVzHM3UnoLXBEdJsMEeaifHyeTaRXimp0V
	XkPQCRG5Rxkmw69n1Zn922hoxSGtlDxQhbMQTpeOH0f1ZlLzATEmoPlvsYHGMSH7S7STNCfH
X-Received: by 2002:a05:6214:80d6:10b0:90e:98c9:548 with SMTP id
 6a1803df08f44-91254ba3a7dmr883516d6.1.1789669408605;
        Thu, 17 Sep 2026 11:23:28 -0700 (PDT)
X-Received: by 2002:a05:6214:80d6:10b0:90e:98c9:548 with SMTP id
 6a1803df08f44-91254ba3a7dmr883226d6.1.1789669408180;
        Thu, 17 Sep 2026 11:23:28 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252d17cecsm3762106d6.44.2026.09.17.11.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:23:26 -0700 (PDT)
Message-ID: <fc7bae477fdeab0bcbb908863b4f434dc03844f2.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix runtime PM leak in
 nouveau_connector_detect()
From: lyude@redhat.com
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Date: Thu, 17 Sep 2026 14:23:24 -0400
In-Reply-To: <20260916180342.2090360-1-vulab@iscas.ac.cn>
References: <20260916180342.2090360-1-vulab@iscas.ac.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9UjibseIy5Tl-djKjRfZT6iTjOTvl77w9dQNqtlVsnI_1789669409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Y7C57RFDZFPJJWEVDDAT3H2U5OYJSKJJ
X-Message-ID-Hash: Y7C57RFDZFPJJWEVDDAT3H2U5OYJSKJJ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y7C57RFDZFPJJWEVDDAT3H2U5OYJSKJJ/>
Archived-At: 
 <https://lore.freedesktop.org/fc7bae477fdeab0bcbb908863b4f434dc03844f2.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nice catch!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Wed, 2026-09-16 at 18:03 +0000, Wentao Liang wrote:
> If nvif_outp_edid_get() fails, nouveau_connector_detect() returns
> early without dropping the runtime PM reference taken at the start
> of the function, keeping the device powered on until the next
> successful detect.
>=20
> Balance the reference on the error path like the other exit paths
> do.
>=20
> Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch
> edid")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index cc239492c7f0..4a750d4bf1f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -600,8 +600,11 @@ nouveau_connector_detect(struct drm_connector
> *connector, bool force)
> =C2=A0=09=09=09=09new_edid =3D drm_get_edid(connector,
> nv_encoder->i2c);
> =C2=A0=09=09} else {
> =C2=A0=09=09=09ret =3D nvif_outp_edid_get(&nv_encoder->outp,
> (u8 **)&new_edid);
> -=09=09=09if (ret < 0)
> +=09=09=09if (ret < 0) {
> +=09=09=09=09pm_runtime_mark_last_busy(dev->dev);
> +=09=09=09=09pm_runtime_put_autosuspend(dev-
> >dev);
> =C2=A0=09=09=09=09return
> connector_status_disconnected;
> +=09=09=09}
> =C2=A0=09=09}
> =C2=A0
> =C2=A0=09=09nouveau_connector_set_edid(nv_connector, new_edid);

