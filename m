Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E58BCD5BC8
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 13:17:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07CBF10E653;
	Tue, 26 May 2026 13:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cG214dNa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9785B46442;
	Tue, 26 May 2026 13:03:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779800618;
 b=fxU7LABTCWHISmqQiSq07llUmVgpqstSGClGfHVXIJJ2vNDj1cXAxcTAiIimA05Du/mdJ
 uHhNO0dQrVC2ZMnAXIDPzbcBLULvCKXgSloSPn1PMZu5augEban2ipkOo++wbXP3JdbFH74
 fOR9Ggm55grbd03HfFonSNis4K0P4XQQoy4oLZ3U7ldPNpvddkCreR+bzTcyW5ZkMm9crnH
 X3dhoXc5kkoqaiEGAqb0Aj1mLQ8WCilqVzUfr5YUCVmPIR8XoNLyKMvHw2KL1sGUPTwzKYU
 xoIV/CG0wdM/qveWDfpz5abPu7M6A+Q0WImOEiaUzvS4mdhdbm6K4JWPqPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779800618; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JE0l0J/Q4cmSCbkBtHlHYstq0L2VtzMwueKDyLmSf5U=;
 b=tLrJCze/zFKJAUDJMkkSTmmdAZWfr7eSc3vxo3sSMSCmclaxLyGNvr6euMUFiZqy9F+Ce
 +ns2AjH0VQDw4y3VEZnN/36O88FPYfepF19id2H/d6TVPtU701AdlMLFrf2sxi8Hz7ISaZI
 Nzf5RK4R9i50yDgMyYXK4ppqgnndgNVWFDHPpNuT677/66c0UQuuetojZKcreEnu/1t0huw
 0y4HB4pJab0hxEEvlN8EqL+jIDNfG71gY7TAq2LxGJQZ346HyZ1imUGQ4eCGT50E3iGKP8F
 EEc2+Iq/nyEKG9Ps5xtFOQ3soL9DIZqWe4hm51S6ijQnosNxSGNxusc24yVg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0B2E44641C
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 13:03:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF1310E146;
	Tue, 26 May 2026 13:16:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEFFB416A7;
	Tue, 26 May 2026 13:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B471F000E9;
	Tue, 26 May 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779801418;
	bh=JE0l0J/Q4cmSCbkBtHlHYstq0L2VtzMwueKDyLmSf5U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=cG214dNa11lOiy46AORsXkv4bUe7G6t792Zz1McUEExu49YQuzsGWtnjMFhpT/q5B
	 MrWm4yWs+7MGpCUCObANSrsl8H/A53DJXfmh/222L8XI5XR3vgOsg9FTL9a5N4RvVF
	 /IQgh/8GaVvCxaAdLesrjnrwjwBy5AMiFXGJQityPEoWKRCSgP5efR4ZjeTTgOJezo
	 PwBvoko/tjwmeO2XhNDL2BKxA1yJcrPddVH1UdV4FzAY7pxcLcCPIn4RxUalJYhNwW
	 azzU0WcX+XhCrOXM7HeDL8YEIyMvt8RdnFSmqajqRMyEIyISiN7yQG8bwpdY8bRSrW
	 +HGWRV9/6y6MA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 15:16:54 +0200
Message-Id: <DISMY2BS8E1D.Q85V8DKCPM1C@kernel.org>
Subject: Re: [PATCH] nouveau/gsp: fix NULL pointer dereference in r535
 nvenc/ofs alloc
To: "Hongling Zeng" <zenghongling@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260526014721.13299-1-zenghongling@kylinos.cn>
In-Reply-To: <20260526014721.13299-1-zenghongling@kylinos.cn>
Message-ID-Hash: NNLUZH3PNZB5PE7ZIQKKPN2DMRVOZTRL
X-Message-ID-Hash: NNLUZH3PNZB5PE7ZIQKKPN2DMRVOZTRL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NNLUZH3PNZB5PE7ZIQKKPN2DMRVOZTRL/>
Archived-At: 
 <https://lore.freedesktop.org/DISMY2BS8E1D.Q85V8DKCPM1C@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue May 26, 2026 at 3:47 AM CEST, Hongling Zeng wrote:
> nvkm_gsp_rm_alloc_get() can return NULL as well as error pointers.
> The current code only checks for error pointers with IS_ERR(), which
> would lead to a NULL pointer dereference if NULL is returned.
>
> Fix by using IS_ERR_OR_NULL() instead of IS_ERR(), matching the
> pattern used in nvkm_gsp_rm_alloc().

There was a similar patch [1] a while ago for another callsite. I replied:

	Are we sure that this can ever return NULL in the first place? I know
	that nvkm_gsp_rm_alloc_get() internally checks for IS_ERR_OR_NULL(), but
	I couldn't find anything within the callchain that would actually return
	NULL.
=09
	That said, I think IS_ERR_OR_NULL() checks are misleading.

Is there a real case where NULL can be returned? If not, let's remove the
IS_ERR_OR_NULL() throughout the whole chain instead.

[1] https://lore.kernel.org/lkml/20260418071412.86022-1-sunliming@linux.dev=
/
