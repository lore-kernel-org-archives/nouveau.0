Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53505C4451C
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 18:23:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC6E10EB0F;
	Tue, 21 Jul 2026 18:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aK6AGZre";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A60C4729C;
	Tue, 21 Jul 2026 18:08:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784657293;
 b=dOjJFSjaYqNxORozuH0pVmtyEPrS9DQFLNdRuXg3NqEn7mh6JtINtnpGvoyw7P3rVvZyZ
 RUqVut4RNGrHPU3k2VhTFR8pph5BXPHIrgce1nYjShxQHreoTvtqQusrBapopJLAecSlVIL
 K4D0TQWG7HA7JV2PCEh351mVpGTJJdFRWw8a0xz1voAHQ2fFEx+8Rfmk22+E/2hQEnjbnQH
 25n6Yg7a7IpMpWaZmrz6AiR3cEyE5A8jjbXp2Zc2TNgtJb+lnFLNQjjQ8q5zNGEe0ZLXq0O
 e0ktDmTuLyB/qo+3MPL3OwzOWEsBqYqAFwn/feIsByufPMI/E/FQ+47b4apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784657293; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EDSz62jCk0OzsKXSSKAgLcWpgh9OgrJcskErIfIIIWw=;
 b=KqpqTuyS4qK0cCbgAl8J6vo6pGthhUMcV3iV57uuwyPxzUzbk+BLn657GdC7w3MM1K7QL
 ck2Y6E6MUifggkN0mLUk63BfEUya8jgC6T9SUnxdPk5r4C9Akubdb/GRepjrWj3v0KsEE6X
 2aQAHWt9DZeBlwhXW/YetXiU1ahJXe4Oi3ikGhBJWuaHIrVWv310/c0WclpQ/ytl7jFUrqm
 32P89ypQycqma38wN1+xKrMzJMF7/QqrvUzREU9Y9hlwpOBZfqtnBEay9PlU8/a3XGrmN7O
 olOC+XmTA8bwNXUtARMah0lfwz4d9EjdUZg2pPLYS7Ms7F+Cbufe6AJkbZ8A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0E9A647289
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 18:08:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7910EB03
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784658219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDSz62jCk0OzsKXSSKAgLcWpgh9OgrJcskErIfIIIWw=;
	b=aK6AGZredzWNVGTF/77lpjm8w/qV5XuSvQVQAyqe+sJO87bq8U4R+aDUjudmfJwOSeayxN
	ne9Iwv9Kid22Zjv6lYSYQ0oC4mcFPEjQmmXyuzN114Gd7vBxFCMX6xdBnZxHf09wI55Ij/
	ph2Ay6ylyJmH42LvXZyXQivZMsVeQog=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-3S35zIVEMLaVpZIbUq5u9g-1; Tue, 21 Jul 2026 14:23:37 -0400
X-MC-Unique: 3S35zIVEMLaVpZIbUq5u9g-1
X-Mimecast-MFC-AGG-ID: 3S35zIVEMLaVpZIbUq5u9g_1784658217
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-930a098ea19so786900285a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 11:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658217; x=1785263017;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf89HWE5FEb29AybdiEPsxsfpgf+Ik6TKAe6jF03lFU=;
        b=ZGyFmeVD0zNGek79ICqu3eaEtUMvch4+0KO3IovvKzevGonEFNcCVFvEB0reJWX6Dh
         dvMKB2t8XoK1iRE04O5qqpEXRuwT6ikKD3j8coudoBORQyiaecEpLs6ClYVztIPUv2/O
         52Ej6A5HBA7X+mLmb033f/HCIrrO59kQK6YYcJW4f6yLjGCBKgMMHrmo4vDJfnOeLKnJ
         d1zj+orWzUvNnTp9XsVBUAcxJC06DBQf1Q9JaGDgqwKIorre5F5+zAjXtWLueM9hPVpP
         SCuk3yF8JXssfgjOEQ719tkIifxhhjqQk5e96uZ3f+is5B37HlFJUf7vUS4VBQDsj8BY
         7d6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqSkdnp81priXwr3Xtk6efmj7EHAKiztTCsFwi9/03n31TAUtnIbKs6TH/8v7xuGI/+770EVHUa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycB/brAiDuHSqcU9+rfBExaJRVBRFh15SGCnZtKmDfyMyRPaWW
	WpL0eRvVDwpjVgAJ+b3DVWi1eFQMM22N0wnTGa7b1IWHHY6Fr9u4yJjsaQzNiV/9a23Pk5EZ+zX
	8/0NG2385tit18r8zB80QbAW8xBAJWUCEFUnPsRjhHfbegmNg7k5giA8zSsWYQy361Lo=
X-Gm-Gg: AR+sD10GaRY2l50Dmug4KDTjuwu8p3K5T5403ILgVgSzkFxUEGuIdKhd5FU/hscc3WZ
	85Fc+8XeXXY96OPeMfWyD9/IJ+MehEF1iKK2j7wa42p2Lxy6+buL4ATZHS6FKvswGDhpuhb5OGe
	S5bL/HnNMsqu4/zlcMBCvqLKT+eWM0Vvh0IfeGB7OgXSgXiZMHOVj++O3iImpmSL4YZmbcuoGZC
	0LZ6jyyxItGFFLaOefetjoWoH6wcG79uDDoubZbLTguim15L3JrFbGTjQZ1RTdTgpyapIie1SQV
	iUGFpU7gH1WCBRos63DiVki8PisH1NyJVXd56XqQHaSR2+vXudkO8OtDHk+Fzmpops1IGM3F
X-Received: by 2002:a05:6214:61cc:20b0:907:b32f:9b79 with SMTP id
 6a1803df08f44-907b32f9c56mr27883066d6.6.1784658217230;
        Tue, 21 Jul 2026 11:23:37 -0700 (PDT)
X-Received: by 2002:a05:6214:61cc:20b0:907:b32f:9b79 with SMTP id
 6a1803df08f44-907b32f9c56mr27881156d6.6.1784658214438;
        Tue, 21 Jul 2026 11:23:34 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907ba8df5d0sm2230206d6.18.2026.07.21.11.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:23:33 -0700 (PDT)
Message-ID: <174e6951bd8216b76c2bc5fb42f1be8138b345ac.camel@redhat.com>
Subject: Re: [PATCH 2/6] drm/nouveau/gsp: add RUSD telemetry support
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 14:23:33 -0400
In-Reply-To: <20260714211429.238355-3-mohamedahmedegypt2001@gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
	 <20260714211429.238355-3-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bpocb6o52xtNknTKvIZbUnN851YvZ3kyGAnSqThULsM_1784658217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HBFWZ7AU6DXSR2I7RIBVZT2FCPQTAUHQ
X-Message-ID-Hash: HBFWZ7AU6DXSR2I7RIBVZT2FCPQTAUHQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HBFWZ7AU6DXSR2I7RIBVZT2FCPQTAUHQ/>
Archived-At: 
 <https://lore.freedesktop.org/174e6951bd8216b76c2bc5fb42f1be8138b345ac.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some lil nitpicks

On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> +=09case NVKM_GSP_RUSD_ROWREMAP_HIST_MAX ... NVKM_GSP_RUSD_ROWREMAP_FAILU=
RE: {
> +=09=09RUSD_MEM_ROW_REMAP remap;
> +
> +=09=09ret =3D r570_rusd_read_section(gsp,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 offsetof(NV00DE_SHARED_DATA, mem=
RowRemap),
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(remap), &remap);
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09switch (item) {
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_HIST_MAX:
> +=09=09=09*val =3D remap.info.histogramMax;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_HIST_HIGH:
> +=09=09=09*val =3D remap.info.histogramHigh;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_HIST_PARTIAL:
> +=09=09=09*val =3D remap.info.histogramPartial;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_HIST_LOW:
> +=09=09=09*val =3D remap.info.histogramLow;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_HIST_NONE:
> +=09=09=09*val =3D remap.info.histogramNone;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_CORRECTABLE:
> +=09=09=09*val =3D remap.info.correctableRows;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_UNCORRECTABLE:
> +=09=09=09*val =3D remap.info.uncorrectableRows;
> +=09=09=09break;
> +=09=09case NVKM_GSP_RUSD_ROWREMAP_PENDING:
> +=09=09=09*val =3D remap.info.isPending;
> +=09=09=09break;
> +=09=09default: /* NVKM_GSP_RUSD_ROWREMAP_FAILURE */
> +=09=09=09*val =3D remap.info.hasFailureOccurred;
> +=09=09=09break;

Maybe this should be an explicit case instead of default, so we can
drm_WARN_ON_ONCE unknown values?

> +=09=09}
> +=09=09return 0;
> +=09}
> +=09case NVKM_GSP_RUSD_PCIE_GEN ... NVKM_GSP_RUSD_PCIE_UNSUPPORTED_REQUES=
TS: {
> +=09=09RUSD_PCIE_DATA pcie;
> +
> +=09=09int idx =3D item - NVKM_GSP_RUSD_PCIE_GEN;
> +
> +=09=09ret =3D r570_rusd_read_section(gsp,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 offsetof(NV00DE_SHARED_DATA, pci=
BusData),
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(pcie), &pcie);
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09*val =3D pcie.info.data[idx];
> +=09=09return 0;
> +=09}
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09/* A reading of 0 mW is indistinguishable from "not supported on this
> +=09 * board" (e.g. module power on Ampere/Hopper).
> +=09 */
> +=09if (!mw)
> +=09=09return -ENODATA;
> +
> +=09*val =3D (s64)mw * 1000;
> +=09return 0;
> +}
> +
> +const struct nvkm_rm_api_rusd
> +r570_rusd =3D {
> +=09.init =3D r570_rusd_init,
> +=09.resume =3D r570_rusd_resume,
> +=09.read =3D r570_rusd_read,
> +};
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> index a9af94adf9ef..1338b4a88f95 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> @@ -130,6 +130,12 @@ struct nvkm_rm_api {
> =C2=A0=09=09=09void (*fini)(struct r535_gr *);
> =C2=A0=09=09} scrubber;
> =C2=A0=09} *gr;
> +
> +=09const struct nvkm_rm_api_rusd {
> +=09=09int (*init)(struct nvkm_gsp *);
> +=09=09void (*resume)(struct nvkm_gsp *);
> +=09=09int (*read)(struct nvkm_gsp *, enum nvkm_gsp_rusd_item, s64 *);
> +=09} *rusd;
> =C2=A0};
> =C2=A0
> =C2=A0extern const struct nvkm_rm_impl r535_rm_tu102;
> @@ -188,4 +194,5 @@ extern const struct nvkm_rm_api_gr r570_gr;
> =C2=A0int r570_gr_gpc_mask(struct nvkm_gsp *, u32 *mask);
> =C2=A0int r570_gr_tpc_mask(struct nvkm_gsp *, int gpc, u32 *mask);
> =C2=A0extern const struct nvkm_rm_api_engine r570_ofa;
> +extern const struct nvkm_rm_api_rusd r570_rusd;
> =C2=A0#endif

