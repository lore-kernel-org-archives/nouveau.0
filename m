Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF6FEA7946
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 21:56:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 732C910E393;
	Wed,  4 Feb 2026 21:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LNIaeZEj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CCFD341B4A;
	Wed,  4 Feb 2026 21:46:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770241618;
 b=LheHcnBEOUrFD6nfqwfgnWX+6hM+krd2EMmYmeqK1nAvLAljSYBuVjN1Kg2RPVt7BQs87
 qt7iGFjdhB7X2CAb5UCHlCgVNpJf+mW32TDswnDq1jhDKqDx87S0ktNBkWE/pBkJlMnjScR
 wfCLJQVBNF1Khtf6xtRi4ktDC8FaIxLyi1PPBzHtPWNqvcw5mP7gvBjynJpfChHbzlIhX8y
 OsTmUmI/aGgUtY53XEMXpVdPrRNXw7/cbd6k4d+j8nJBxpPVtLwSeuRYLnbXRXQD38PwML9
 Z3yuwdMcns1fQjc+b8L+FOcviDbuOZ3METFYng/xz+CQ4pxw/MGpMyCA2pAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770241618; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
 b=F+41hzqx5nYvsIMrr004/PUpaufxE2lNRsIYLI49flsdtP/4nRiec5jzQYlav2nOEDghs
 nCcgj163F5cPIhCfDm/ZBkWXLhC+iqB1e2glw4MWxI4m4pOkCd9sSO2Qih8K/FMqo9ZhXwq
 ZFTkTewC8vmd+jwrAB99oCZIxgBhq8fzu3GAhQUsuTjCSwAs0vouFEERbe6CMNq66WBzncv
 9yJzm3FUNynDfG5WCj55iCTLayl2SFs7ZK2+vWQX0G2QEKUpRej7LMekWNq5Qi9+CQzVvpm
 qo+HQSbuXf7/JW0+mgy80ouc8JBA+i+eUvmKNZ9RzvytxrZJoiM7eVm2bACg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DBF6140382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 21:46:55 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49E10E322
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 21:56:14 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-895075a3be1so3901466d6.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 13:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770242173; cv=none;
        d=google.com; s=arc-20240605;
        b=bTUbqSwaMFPQ0p9STek9PgJss8v1TVeOcdMvgAVUsX2Wt5XTpwF6e58VtB6j7fTiFr
         GfJV1diyRU2daTHp7i5XzDgoHXWL40rMeHQOKzMZ77Yn6e+1cQgG8er3mz4Lus1cmZNW
         wQjc1dP1UMNfHnQcxCOGMvfFl8fKtvD1NtfLQkugYsQYmI+kt2Z8Gkhhc6tsesWoid4z
         bjfoe5qsLU1TP39tv5FnH9zYfHOIME6rc5IapAjprM8Eq/lXtFMtb2wQHD/fmNbF1AV+
         V75rwtOyP5oaO7gagqPOJh4KVpz3sGqm9eo1yfJYF/gx1/C7daRnUNIgiSYMa6DolRch
         qPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
        fh=aB+MYrPvC1bNghssGlvgLXiDaspad0afVT2GzWBHx+4=;
        b=iIxsCzJgN7EZ/oJTm7r5GDOjeezH3Rc7sGRG7YcHNEMlY+vmnHF9l388q0S/r+5snP
         kTXit2JZZvmQR6t+tZ/KWRorwL1/r0GRs8HDGEA4a0VTMiNt9hzi6PjDeixvCFSZqjOZ
         /J8MzgNxXKGKOOFryKLZzxMfJyWgDzwbSZgc12o+F8HE/AlSaSY1H6jrpa03EXv3RoZp
         IYICdru/IXJlqE4XAXyPk2iRGTm0u9lHhE2fop9XdYi/O5p7hJw9tOAGTDi9R973tx2x
         xEZQnm098Tz3TjSVwdyQuXHLO9GtFJqdWNlEVcRR/AW79YgQ6t4pfyQ+LCWZWs1lhYaw
         lXSg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770242173; x=1770846973;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
        b=LNIaeZEj6RtUroKTrX8D6/o57MhscL32GegCue8QVdoK0ytjg9G7mYlnCY8Xigg17C
         vpurBYuV4kLXtUwXIMTnJFNowiURwHjY87FKR8QGr3z6B2kjns4StGCTK6y0vQXSwGgG
         Z87JnFO+SVR9I/ElefEfWRli7OumBAPgKEH1d/WLsb2Iae2riwqX+TrR/98b4dnmkb3o
         FPPjxrdBdYzTiSPrVJySUgCPcHlWHr2YC/mbcKNBuL5F4cy+IUWB7r1zkV4RQSCwkvEJ
         TVl22Y+J5Q7S1ZBAcnWnpTfDxn7RN0q1zFCeSjkUvWJMROMCIxvrFJdUuVWIH2EdfIf4
         /ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770242173; x=1770846973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
        b=lsiBzzSiECheam+aCwdIONYuw5Q7rBkSqxthZy3sJdL+3pFQAgye4Ttnjv4mDtJlzM
         8bOEn549a9ZTLmpVQBXsjYYC7NCJKxN22hjyNC7RVpGhyLK0oqlcCWs0UetLnKiuW2tz
         0TjEc5Exa/1R4KemnZt2dftoRQgl33S5WA2nyY2pYoOcuqPNoc8+hDE/LaWHeq5oguIG
         YCbYjSKCw1rqNWV4SA4s0MgA/KhWJj2LuziOa6AAQo+vD/iQlbFrwmsj4xPyOu/aCvg0
         oC8dtPfG/jo76l2q1XmKvqtmrIkseUy9ymOvTDP7GufRm2O7uM7Lw4wY7A3Ce+w7xEmA
         Dy4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmfdqxKMRPvHIch9Z5iZu8cmwaga2YTQbKRuuWTvOLRpVhoC+cviVqUj9qxjl8TqbzngBPPkhN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFx8T8KPZpizMhsvR4UeQ69E/ZSGFTDCcHXYzuk6pCUI5vlAlU
	OW2VJKp5NAVdo9fW7yRkxWKCpTlXbEWx24I/mbDg7pbHI2hMdw5mN4vbxecRWpHozQSWnnBTtOd
	16HEh5anl+EMhMDXxNst0CcFQOz6MByM=
X-Gm-Gg: AZuq6aI8+/bZT17vJ0omBxcKVojWUSgPASfc8RwClFDaEaRGmGT8e0YPbP1yTH/a5Vs
	cPxidRgZQGyiomqeGTuqQKQge6H0OLSFF9C+59/nIMDuotgdGX+SXQDxpeIYWuDuq7n7Wa5hCg0
	cTPSZPnSjciaF86vZFgkRqdOP/43kBHLu+77+NsPix1exPnR6iUQSD7dFq84sroQalrwjAwHMgb
	r17LUxusYJolP1X070ceT6yVWcG0IR2JopKFqoEyvNKAJZKgfG6K7xh2YiMUUJuau6zlmIuap1f
	O5CZhqV2gRzJ9cI8s2R0ZdOCXZXmbpc8nmXTDLvq8Ko0b/QzF7rU6Lw=
X-Received: by 2002:ad4:5ba2:0:b0:894:63ec:39f1 with SMTP id
 6a1803df08f44-895303119f3mr11104986d6.24.1770242173088; Wed, 04 Feb 2026
 13:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
In-Reply-To: <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 07:56:01 +1000
X-Gm-Features: AZwV_QgANaijiyKJ95xPWzuwwUZNnVlnifj1C2-bThNwafmm05E87VdoEN1UqwQ
Message-ID: 
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: L4TYGH35SKXCCDHRWEKEIWT33IMTJC5A
X-Message-ID-Hash: L4TYGH35SKXCCDHRWEKEIWT33IMTJC5A
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L4TYGH35SKXCCDHRWEKEIWT33IMTJC5A/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > index 2a7e80c6d70f..6e7af2f737b7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > @@ -704,7 +704,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
> >
> >       build_registry(gsp, rpc);
> >
> > -     return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
> > +     return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOSEQ);
> >
> >  fail:
> >       clean_registry(gsp);
>
> So are you saying that some RPC commands need to have a sequence number set, and some do not?

I'm copying the behaviour of opengpu here,
src/kernel/gpu/gsp/kernel_gsp.c
if (pSequence)
        vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
    else
        vgpu_rpc_message_header_v->sequence = 0;

src/kernel/vgpu/rpc.c:_issueRpcAsync
doesn't pass pSequence
_issueRpcAndWait does pass it.

The SetSystemInfo and SetRegistry are the two async calls in nouveau.

So I'm not saying some RPC commands need to have a sequence number and
some don't, that would be up to someone who can access GSP source
code, I'm saying that opengpu does this and I'm copying it :-)

Dave.
