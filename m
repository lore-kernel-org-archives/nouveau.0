Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A78C88E77
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 00:45:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD3B10E46C;
	Wed, 16 Sep 2026 00:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aMll39V1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90C95480CE;
	Wed, 16 Sep 2026 00:27:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789518458;
 b=s3RWk+NzuslDo2Ga5lHsbn/aRVcQpho3hfOfEoFTae2moEMbUxjJ4D7ro+qYuFQD7iGwF
 jDEx+z4WNyOdmwH0m9CZZlezvpVg9XVDe1PMw23hYrkZuCpbiZgCTld5/yXC2UqjK9jMrSZ
 ZedafdRHyDovCkulxx9oQJRaORGhxq6KnxgOF+d0Di8Qk1/AoZrlSuYa7IPesWiATU/du5X
 wRy+TbY7v8se5+LYfEXIUVPN+lTkPB9c2XIDx8ziiJuq5k94pc+gYDhpxbGWcqn73WasrNN
 ssBWuukj7bYh8pujv4JrvPHZpFbpUnvWjGz2WGxx02SdTxFe8iVSvachyKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789518458; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
 b=CNGSPjxkTkoieaUd2+HXa6lkSl7IUnTRKPw/+giCjMyQly1UF4p3Sr24T+8eNBXHfHCC7
 Yd8hOK6E3EM2W0SCRb4oHg9ms0v1GpIW9bL1i84wNgXjv/iBoPyQUyF0yGd1y7qrRV8nY7X
 oLEL6CyKbAipkfMCXIvhne/Lyous0o+ORYD34P5EZ1ZPiYiWOJKIJFDCp6K7SEqg4yqa3E/
 RJJOZr6YU5MfWTLx6/v3sAgtO0eL344z9ty2lpz1mhD6PhQJE5UwsYSNpjR9fRaGlPE6Es7
 iNHbZ+fPnqg4o+Zcn3bz+H0Xc58QRZt7Thqx5+spVFAJ9VhGNjX2XncdRXZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 19478480AB
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:27:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2210E34A
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789519508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
	b=aMll39V17B/cXZAaa+OXB+lOBy7aBLqhzfS6zToqXyb6jgKRCkJJvWUzs0BnotbLjQGHAX
	QLVrGcdi8wJbY29lhtiq8XeIyBOWMgvdrnDfQquU/z50E0IiBfpYkRcvlY2iDBM9h1TmCp
	4zuKUQJ4kMlChrfQ8x1hTrT0YtAOTck=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-lEO_OP2WNQmdWNm5hIxI4Q-1; Tue, 15 Sep 2026 20:45:04 -0400
X-MC-Unique: lEO_OP2WNQmdWNm5hIxI4Q-1
X-Mimecast-MFC-AGG-ID: lEO_OP2WNQmdWNm5hIxI4Q_1789519503
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38e1118e4abso8966501a91.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 15 Sep 2026 17:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519503; x=1790124303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
        b=aTL/X/Sq3COfNSINdRs4vFk3/Gx4dX60q8AmeddyHLfAdN5ElyNtMLEgS34ISQnkk8
         OS0CQNOvkh5rmwGDx0AGTzxf0spTIZFy6qORv5UlF8Afloe9HES7r9aIFM0VCbSixs+E
         SStZAku4Te4sVdGIW78Rss083whWTr7ji+06Wn/28HRzLtYPH4mVM8niU0x02kQqthcB
         jvR8/0i63EriWK+EKmFAoG5/Kz5umGXp1QlAbxxUPxKjukcXR06mBkKJrIgkoqAM0KK7
         S8oxwV4FJEuanI8EoGsyb5gO27RfjwzEl9/i3/FmAObBw0dmQl/JlLp+TQ+PpHIlBmik
         6cnQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwewnQtNPqL2iQ6BWlNUmerjHAigHu2HcLYJ9UAOZDq6tu8NrXXa9ZhObFA2BgMwovUnqkscym1@lists.freedesktop.org
X-Gm-Message-State: AFuF++ku5FnuvD+OAtE/pjc/gz/alpjY3+y2HtPPnWWZ7WMAzm0bbNPQ
	DMv6FplhkYLopcLSMLssNconBUrjUuMHX53kwSwDiJLv3Bx/oxPdwRdL0Nwq2qY3o9rlMq6dAGd
	CYjVhol0c6pJaol/znpVrda13UPzFd4PXISIh83pCzc1w8tkkACPljGtOvzi3uA+s6Mf0mE2XFY
	rFcvMB8gSgs2g3/FCRKTidiJ68CKLhC1FYC6w9lkb9kQ==
X-Gm-Gg: AYBFou1ajqNBFy0hlA0R6xx4g7Iq9PfnhGe3UO+mlc/vEFpM5KNjhp3SsNAXYt4tH4o
	UuBmTFJu8q/2JJTvw5f7fvNZntY1usOKYlH2EzawBzQWmYgnPxiLANbb0X+kSvlYEYeXra7Fa6h
	9V+K0y6umY4dLWCXJA0jiBQxxpBZmStyDTqKEaokeOzMxCg6H/Qb/+61UBhzBVZ2k7xANC8oSiS
	VSHqtgW9GJ5d98f
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id
 98e67ed59e1d1-39e1e4aa012mr1554329a91.19.1789519503255;
        Tue, 15 Sep 2026 17:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id
 98e67ed59e1d1-39e1e4aa012mr1554271a91.19.1789519502710; Tue, 15 Sep 2026
 17:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260916001603.22394-1-lyude@redhat.com>
 <20260916001603.22394-3-lyude@redhat.com>
In-Reply-To: <20260916001603.22394-3-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Sep 2026 10:44:50 +1000
X-Gm-Features: AcwNN1U2rMYqd8tDZTEqUV094CLCyp-28AzSPzCe3dT76HzOjLGKJxyGK8p2h-Q
Message-ID: 
 <CAMwc25pBOU62TV77ZSSyH6DP=K4FMCpd9i98L4H+QWQ0=--FOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/gsp/r535: Add support for
 MEMSYS_GET_STATIC_CONFIG
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _cR9wkB_pmRQrovYkrTYWW-9pxhQJJXyZ6uaqISYHPA_1789519503
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NE23QEG32F3HC3IGPFXMFC46SHFO2NS3
X-Message-ID-Hash: NE23QEG32F3HC3IGPFXMFC46SHFO2NS3
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NE23QEG32F3HC3IGPFXMFC46SHFO2NS3/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25pBOU62TV77ZSSyH6DP=K4FMCpd9i98L4H+QWQ0=--FOg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Sep 16, 2026 at 10:22=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> This is a GSP structure describing various characteristics of the memory
> management system that GSP provides. Start by fetching it during driver
> load, but don't do anything with the information we get from it just yet.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V3
> * s/nvkm_gsp_rm_ctrl_get()/nvkm_gsp_rm_ctrl_rd()/
>
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 ++
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 +++++++
>  .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 45 +++++++++++++++++
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 +++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 +++++++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
>  6 files changed, 125 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 64fed208e4cf8..0e193baaf9bbb 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -156,6 +156,10 @@ struct nvkm_gsp {
>                 struct sg_table fbsr;
>         } sr;
>
> +       struct {
> +               bool use_raw_mode_comptagline_alloc;
> +       } memsys;
> +
>         struct {
>                 struct nvkm_gsp_mem mem;
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index 09b17b85dc1ac..5df5365e744f5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -1808,6 +1808,23 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_susp=
end_state suspend)
>         return 0;
>  }
>
> +int
> +r535_gsp_get_static_memsys_info(struct nvkm_gsp *gsp)
> +{
> +       NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS *ctrl;
> +
> +       ctrl =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +                                   NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_S=
TATIC_CONFIG,
> +                                   sizeof(*ctrl));
> +       if (IS_ERR(ctrl))
> +               return PTR_ERR(ctrl);
> +
> +       gsp->memsys.use_raw_mode_comptagline_alloc =3D ctrl->bUseRawModeC=
omptaglineAllocation;
> +
> +       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
> +       return 0;
> +}
> +
>  int
>  r535_gsp_init(struct nvkm_gsp *gsp)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> index fd1170037c030..fee5418a72a68 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> @@ -789,6 +789,51 @@ typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQ=
UISITE_PARAMS {
>      NvBool bIsGCOFFSatisfied;
>  } NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
>
> +typedef struct NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS {
> +    /*! Determines if RM should use 1 to 1 Comptagline allocation policy=
 */
> +    NvBool bOneToOneComptagLineAllocation;
> +
> +    /*! Determines if RM should use 1 to 4 Comptagline allocation policy=
 */
> +    NvBool bUseOneToFourComptagLineAllocation;
> +
> +    /*! Determines if RM should use raw Comptagline allocation policy */
> +    NvBool bUseRawModeComptaglineAllocation;
> +
> +    /*! Has COMPBIT_BACKING_SIZE been overridden to zero (i.e. disabled)=
? */
> +    NvBool bDisableCompbitBacking;
> +
> +    /*! Determine if we need to disable post L2 compression */
> +    NvBool bDisablePostL2Compression;
> +
> +    /*! Is ECC DRAM feature supported? */
> +    NvBool bEnabledEccFBPA;
> +
> +    NvBool bL2PreFill;
> +
> +    /*! L2 cache size */
> +    NV_DECLARE_ALIGNED(NvU64 l2CacheSize, 8);
> +
> +    /*! Indicate whether fpba is present or not */
> +    NvBool bFbpaPresent;
> +
> +    /*! Size covered by one comptag */
> +    NvU32  comprPageSize;
> +
> +    /*! log32(comprPageSize) */
> +    NvU32  comprPageShift;
> +
> +    /*! RAM type */
> +    NvU32  ramType;
> +
> +    /*! LTC count */
> +    NvU32  ltcCount;
> +
> +    /*! LTS per LTC count */
> +    NvU32  ltsPerLtcCount;
> +} NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS;
> +
> +#define NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_STATIC_CONFIG        (0x2080=
0a1c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID=
 << 8) | NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS_MESSAGE_ID" *=
/
> +
>  typedef union rpc_message_rpc_union_field_v03_00
>  {
>      NvU32      spare;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> index b45781cd0dfdc..5a51fe7e5ab98 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> @@ -137,6 +137,14 @@ r570_gsp_get_static_info(struct nvkm_gsp *gsp)
>                 }
>         }
>
> +       ret =3D r535_gsp_get_static_memsys_info(gsp);
> +       if (ret) {
> +               nvkm_error(&gsp->subdev, "Retrieving static memsys info f=
ailed\n");
> +               return ret;
> +       }
> +       nvkm_debug(&gsp->subdev, "memsys: Use raw mode for comptag alloca=
tions? %s\n",
> +                  str_yes_no(gsp->memsys.use_raw_mode_comptagline_alloc)=
);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> index c458569af9d72..e2d9d1949e4e1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> @@ -494,6 +494,56 @@ typedef struct
>
>  #define GSP_FW_WPR_META_REVISION  1
>
> +#define NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS_MESSAGE_ID =
(0x1CU)
> +
> +typedef struct NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS {
> +    /*! Determines if RM should use 1 to 1 Comptagline allocation policy=
 */
> +    NvBool bOneToOneComptagLineAllocation;
> +
> +    /*! Determines if RM should use 1 to 4 Comptagline allocation policy=
 */
> +    NvBool bUseOneToFourComptagLineAllocation;
> +
> +    /*! Determines if RM should use raw Comptagline allocation policy */
> +    NvBool bUseRawModeComptaglineAllocation;
> +
> +    /*! Has COMPBIT_BACKING_SIZE been overridden to zero (i.e. disabled)=
? */
> +    NvBool bDisableCompbitBacking;
> +
> +    /*! Determine if we need to disable post L2 compression */
> +    NvBool bDisablePostL2Compression;
> +
> +    /*! Is ECC DRAM feature supported? */
> +    NvBool bEnabledEccFBPA;
> +
> +    NvBool bL2PreFill;
> +
> +    /*! L2 cache size */
> +    NV_DECLARE_ALIGNED(NvU64 l2CacheSize, 8);
> +
> +    /*! Indicate whether fpba is present or not */
> +    NvBool bFbpaPresent;
> +
> +    /*! Size covered by one comptag */
> +    NvU32  comprPageSize;
> +
> +    /*! log32(comprPageSize) */
> +    NvU32  comprPageShift;
> +
> +    /*! RAM type */
> +    NvU32  ramType;
> +
> +    /*! LTC count */
> +    NvU32  ltcCount;
> +
> +    /*! LTS per LTC count */
> +    NvU32  ltsPerLtcCount;
> +} NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS;
> +

Is this used anywhere? if the 535 and 570 structs match then don't include =
it.

Dave.

