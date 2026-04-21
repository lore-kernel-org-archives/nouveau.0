Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A213BF8FA9A
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 16:34:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACE6310ED4A;
	Tue, 21 Apr 2026 16:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEJvqlW7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0xZuM53";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A76F945AAF;
	Tue, 21 Apr 2026 16:22:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776788537;
 b=sUbVf2JkTWrjp1sSLwujoBMc3Nv2lqsv3a1wYk+iaxzYJ0Pb5Lb6QEonSbH2qrNS7BuT2
 LfOnNpDWJyZnFE6UO6iP+lMDorouWMW63D0xQ1Z2SsAaPe/Enbv4LHMfIcm7CPi/elRcfe1
 peIp7G+EmuQ4Fnay+Pj5mIm9iKPiThmWcAYLKd0GhNGVWG9hwaxORC3wJKlIk+V8GqLG9Ws
 ZxvpGEwOf6DwF1wHCIHOVn5hC+4rKNxSKsDzdBagxYAZYQq1Y1zY0T56sHn5g/gqLInAGby
 7DBro0ssbBUZLsK2PX1UgO9+GoHBbYB/J0nS9OZxQqUSVanvMj8rP3Ze/p4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776788537; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
 b=llLGV+JDhV0RrcxWOPGwH4d6pW5chHfRZOqe7sXsGw4r/WL8CzY9xexlRMem/l5Jkm1Lb
 5Y1G1KQW+6JtNaBeUetXjIXih9XQOCjgGcvbD5U8NjNt1jWLPtfJ4DBL28xusmUSN6RcJ6j
 SMumsPKpMWMIKwmD0fld87Lmef171V2IK9oU3nsKJ0VWYij9rzEeuGQmRNogMVQ/N0fXze3
 hxVlw+v+Rro/Zg88SKTqtIFx2tB1ut3Qwt73QkBXKPNv2skE5GdXYViLL3NJr/hCfKhH56H
 KVHDcW2eAa8gsC4U8Oq7ENauTz3URgyqVq98TF5OYYuv8y8lRXm2bnp6h3+Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=qualcomm.com;
  arc=pass;
  dmarc=pass (Used Org Domain Record) header.from=oss.qualcomm.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=qualcomm.com;
 arc=pass;
 dmarc=pass (Used Org Domain Record) header.from=oss.qualcomm.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BBD0E45A58
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 16:22:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6843910ED34
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 16:34:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63L9XTf53164674
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 16:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=; b=pE
	JvqlW7R7Tmh6LF7j7YPy7aZuZtlgPRLI8/PUXp1dsthLWQt3shP3g2zxSSjmdBhW
	9q4knPSH4yjHuNI8AYqC/PAUexjXKhy9P5EfguG3yf1edcc1m1nUF+Vf85RhTuUK
	E6InWvod0PUyDNpXWdkPVWqbKdLUoXOPvxKmK4ZmbUxwFmAvBSqxXPzt7wrrqb4K
	H0FHFNhOEpret6YZ75DuhPJuEqa1WqfTbYeD/rN0pf/9P+ZlwVBeCS2nBlIQu7zW
	EZEaRxeJiFWvSKFRJxmrFO7xi2PgDC1xuMF2oviFcS/7gHCMufT3b+X0KP1A9r8Y
	ZJtGj8o543CnaGH7rpZw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q81fqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 16:34:20 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-415e1e9aa5dso6513583fac.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Apr 2026 09:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776789260; cv=none;
        d=google.com; s=arc-20240605;
        b=Ociqtn8+RwIjF5zXxSX8mqcVQHDa6ZHwfThEUBnEbkWU7um8LS4Q1Te+Ayolx45cow
         hp7G2M1Fq6Vw3NU3SC5DFR8eDQKesC5cLSZ/yVuUdSFMxnuWK1SC6TBYRJCwUi32QEFI
         GbepnagGWBwVHUpyBE+eA2BWWc6wtPujiPIR12hzZSFmTPiEvH1n5iIU5GZzICkgvVyF
         llUO/YlgiaUU1N0Rlkq3rd1sXjC4h0KY23KCasSKpd21FIM1qXIgNnSnN8wuazZUN0cx
         /AamR1O316cUWb2TAYnEFQOiKV1TUkYMPqkJWUDK+/pzOadO03QXlXX3j5PLDYWqwX8k
         bXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        fh=wpdu1QDxwSBlWNyCiA8xGnEB7o4G8MSZqYKmbwuV1JQ=;
        b=VTbuXyJNHY/sJG3xG35C7KcmKHNPH6JYYvwbxGtiXhztOlzwsN5/r/u4I/eClxpmJB
         jDpphtCXNAdxOyfngLz1714Zrth858p6y9v/Mz7G0i9x8sxJgwaL8lsCE5CJpYZhM/YC
         TsYxSqrOdCbxgy+K78zgqNFlkRVeH5XwbJHrpCNifFp4xtSUIrmtK9a0kbRnUJTxrJQP
         gqAiDgfQard27aPeZRsB4nJ7Gt+xANx9J1h0M/drfMrjmyfR2WLOCqjIUYzUJE1vUfOD
         wfvMY7uQZ1m9Er9uk4UlZVHzg73Qubajb1Lln4sOPkpEOipAlg5mVobVOaueNe/t/XJU
         uPQA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776789260; x=1777394060;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        b=c0xZuM53edV6bkDrAKXHQrZv1DVqFEFodcY2kzojY0sM9nHwcclo37qqBqUdEzRkae
         krmddGlTOugjKGvE6SsrMi7ELeKbRrfefMsG9ogDV35HdA8yroL7MrizII8aTUgTeQ+X
         XQJXZadW+GgjtfPoUuta2bJV5Q+QneMoYY+rwIuqh+UVZ8vc/wAbA5Tb/YhnAg0P60l8
         /0YOLhwNgzCdcejkifvqqvBMBb5uW0s3C4BPEAmX+uqKMAoIR0Lz7tN0ZGcdd6EIcn3v
         QjVCtiTNANyyBXBZW6fsux5jfbJvU2go9fdBJo8u42Wrs/WTG+XSXep0yEsrcBlz65OZ
         jzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776789260; x=1777394060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OG03RLbkVQGi1m7r2kUY2OMQR5crtiM3OubK9GwayjU=;
        b=HgaJGqW9UZwZT01voWnF4VqRCcKEqurh1DtibBnrNBF0kDhCFUtdFjmsHoQURxlkcD
         WvwmMwgE/8jyXImZjlBjvYHbAZq2LU2mnjboPpRbB6Y13+Ds8S4keq2HxcJ+m6F7mVIc
         kWCxCyZn49LAeVEOrlUgMN60UGp2tSrAP2KBdSO/rWwbH2NwSfzEwWYBGa/b1XTGOaeO
         lRXo7ANJ6gKtXAscQWPoc1W7QzbPGkNs/VgKiAMqF2vCYvLp7gpLufpyKNRcHB3Kvtlf
         hVzDIQJzq8S6Qw5CufgnFuTAfkPI6HrQarpAsqx8XUJFf5ivbpG0WSb5fog+wAv/mS6q
         W13g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dewEOIfBEd6DV1risDTFPa5V2vp+4uf4XMPVVt9LXvNmCSCx33UcCH89buQK1BYzY04u3gtoR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHnzaagUW4+5kFDGUhe1NiBstArsoO6n09oU9EVBon4SfSHlIm
	mtZCwEgizab9l6Ho09wK9ruWcaWkAdIYLV75dBr1CL2b1LLMYNZ5qS5usXDdRsR8Js/OEzc5NZ/
	BeEuTbK+T0X9MJa6c/6AtFqJlCr7r2kAnfCEzzKdIv5SjHxaoTH6m0bdiG0d8Hd3n7Djt+Mcmjc
	HlAm4fw0922726MBY4iAyCuGs0kHkEsisTP72BkwIS5L4=
X-Gm-Gg: AeBDievV+vKO9oFJfAPWfaKVJrgXIodNNBAFytXeBS9eQpxRLc9Z7iWSkryk50iCPX0
	3UuoQZKQgHoDkZjZ6j/Btx1gMKY+kpEVyXiUcRwGyvvoqDm+9M46P3sR7i7gIgdyfdOrrKxJIrU
	+HHIKnA5wYNkssbZPFkWxWQ7yXohLx3MGxlv9wBT/UrdW/XF6ldWHQcDrDkyoR0A44p0JjYO4KJ
	rzNsP2HEIno4d15VTbIbgcKr0cRIIyPUdk796azJN2aP2Bq
X-Received: by 2002:a05:6870:6390:b0:417:23f2:6d77 with SMTP id
 586e51a60fabf-42abf2ecb41mr10830942fac.16.1776789259811;
        Tue, 21 Apr 2026 09:34:19 -0700 (PDT)
X-Received: by 2002:a05:6870:6390:b0:417:23f2:6d77 with SMTP id
 586e51a60fabf-42abf2ecb41mr10830914fac.16.1776789259378; Tue, 21 Apr 2026
 09:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260421084701.24227-1-laura.nao@collabora.com>
In-Reply-To: <20260421084701.24227-1-laura.nao@collabora.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 09:34:08 -0700
X-Gm-Features: AQROBzArUGDXn57yy7hiM7ct4lrQxadoBQMLBR3Cb8jVRGpfyvO4Z6UZBx6yzNM
Message-ID: 
 <CACSVV01Kh5w1t26FEzKAVRxnKz=GCKjRvXe4KOKSLs-FkwkuBg@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
To: Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2NCBTYWx0ZWRfXzB5E3vRdEcXy
 HVGI1NLL7ku4rcK5pgmZ2dt5Rx2wm+GeSTTVCGYC236jsut1lIZK9lYrhTD98BDUQavTN6CwyWE
 a4owqhiMPOUEKIFxDoPin8iq3f60R/E4Nuiio5wPXzLadcP6+qq1wu6D6VvdsUhQCXKqzm1vEqm
 Z8x8d/3LLFAbnrOz6F14+cf/GSEUxX/OevwbLmzkUiK+6e32/KrQ/tOKjBn4hdGsnvaDbRAGCdw
 lYPCuzTabcZNIuIfWlj4KbgajWm1Osa6fsAK+yGQouGiqYVF76fx3BecvrTHKTWDroyNLCsdhgY
 4ARjNGyJoBpuD+XZ80DkCVbQs6L/bw/EVjzlR8UhItwAETQVoSZgj1fXFpGoE0fq/pYlLZAW57d
 jSBPNoXiC3ufUR42FoLgnYC33yoanGmg/1dZ/UtLSXCg5OrtDyMgWQKLS/t8612pamLPnWaLySC
 G7zhgzbvOjM/eGftbBw==
X-Proofpoint-ORIG-GUID: 07UcD--AVOomaHZk2hzwcvsps0ZC_3-k
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e7a70c cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3M9eerblpL4TRhbo7qwA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 07UcD--AVOomaHZk2hzwcvsps0ZC_3-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210164
Message-ID-Hash: 5UDF5CNFDSH3BXRUUANMPSW4UKARUOS6
X-Message-ID-Hash: 5UDF5CNFDSH3BXRUUANMPSW4UKARUOS6
X-MailFrom: robin.clark@oss.qualcomm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org, boris.brezillon@collabora.com, steven.price@arm.com,
 liviu.dudau@arm.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: rob.clark@oss.qualcomm.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5UDF5CNFDSH3BXRUUANMPSW4UKARUOS6/>
Archived-At: 
 <https://lore.freedesktop.org/CACSVV01Kh5w1t26FEzKAVRxnKz=GCKjRvXe4KOKSLs-FkwkuBg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 21, 2026 at 1:47=E2=80=AFAM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> The DRIVER_GEM_GPUVA feature flag is currently only used to control two
> behaviors within the DRM core:
> - calling  drm_gem_gpuva_init() during
>   GEM object initialization
> - creating the "gpuvas" debugfs entry
>
> drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is cheap
> to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
> referenced by GPU-VA capable drivers, so clearing the feature bit does
> not cause any unrelated drivers to get the "gpuvas" debugfs node. The
> flag doesn't have any relevant purpose (e.g. gating ioctl handlers or MM
> logic) and doesn't provide any practical benefit.
>
> Remove the flag definition and drop it from all drivers that use it,
> call drm_gem_gpuva_init() unconditionally and clear the driver features
> bit in DRM_DEBUGFS_GPUVA_INFO.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Acked-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/drm_gem.c             | 3 +--
>  drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c         | 2 --
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
>  drivers/gpu/drm/xe/xe_device.c        | 2 +-
>  include/drm/drm_debugfs.h             | 2 +-
>  include/drm/drm_drv.h                 | 6 ------
>  include/drm/drm_gem.h                 | 3 ---
>  9 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0377a5fd402d..cb703d0072aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct drm_device *d=
ev,
>         if (!obj->resv)
>                 obj->resv =3D &obj->_resv;
>
> -       if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> -               drm_gem_gpuva_init(obj);
> +       drm_gem_gpuva_init(obj);
>
>         drm_vma_node_reset(&obj->vma_node);
>         INIT_LIST_HEAD(&obj->lru_node);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
> index 268900464ab6..80033d4cb66a 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct drm=
_device *drm_dev,
>  DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
>
>  static struct drm_driver pvr_drm_driver =3D {
> -       .driver_features =3D DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDE=
R |
> +       .driver_features =3D DRIVER_GEM | DRIVER_RENDER |
>                            DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D pvr_drm_driver_open,
>         .postclose =3D pvr_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 195f40e331e5..ee38c18715f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -825,7 +825,6 @@ static const struct file_operations fops =3D {
>
>  #define DRIVER_FEATURES_GPU ( \
>                 DRIVER_GEM | \
> -               DRIVER_GEM_GPUVA | \
>                 DRIVER_RENDER | \
>                 DRIVER_SYNCOBJ | \
>                 DRIVER_SYNCOBJ_TIMELINE | \
> @@ -833,7 +832,6 @@ static const struct file_operations fops =3D {
>
>  #define DRIVER_FEATURES_KMS ( \
>                 DRIVER_GEM | \
> -               DRIVER_GEM_GPUVA | \
>                 DRIVER_ATOMIC | \
>                 DRIVER_MODESET | \
>                 0 )
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 5d8475e4895e..0f5f662e5429 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1364,7 +1364,6 @@ static struct drm_driver
>  driver_stub =3D {
>         .driver_features =3D DRIVER_GEM |
>                            DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
> -                          DRIVER_GEM_GPUVA |
>                            DRIVER_MODESET |
>                            DRIVER_RENDER,
>         .open =3D nouveau_drm_open,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 87d27c3c1456..1a1d40a744db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct drm_minor *=
minor)
>   */
>  static const struct drm_driver panthor_drm_driver =3D {
>         .driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ =
|
> -                          DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +                          DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D panthor_open,
>         .postclose =3D panthor_postclose,
>         .show_fdinfo =3D panthor_show_fdinfo,
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index ffea4a453c01..b3acc202df76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -393,7 +393,7 @@ static struct drm_driver driver =3D {
>         .driver_features =3D
>             DRIVER_GEM |
>             DRIVER_RENDER | DRIVER_SYNCOBJ |
> -           DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> +           DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D xe_file_open,
>         .postclose =3D xe_file_close,
>
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index ea8cba94208a..eb93512b0f23 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -48,7 +48,7 @@
>   * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info(=
) from
>   * their @show callback.
>   */
> -#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_G=
PUVA, data}
> +#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
>
>  /**
>   * struct drm_info_list - debugfs info list entry
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..e09559495c5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -107,12 +107,6 @@ enum drm_driver_feature {
>          * acceleration should be handled by two drivers that are connect=
ed using auxiliary bus.
>          */
>         DRIVER_COMPUTE_ACCEL            =3D BIT(7),
> -       /**
> -        * @DRIVER_GEM_GPUVA:
> -        *
> -        * Driver supports user defined GPU VA bindings for GEM objects.
> -        */
> -       DRIVER_GEM_GPUVA                =3D BIT(8),
>         /**
>          * @DRIVER_CURSOR_HOTSPOT:
>          *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..996aa418dce9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const struct d=
rm_gem_object *obj)
>   *
>   * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
>   *
> - * Calling this function is only necessary for drivers intending to supp=
ort the
> - * &drm_driver_feature DRIVER_GEM_GPUVA.
> - *
>   * See also drm_gem_gpuva_set_lock().
>   */
>  static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> --
> 2.39.5
>
