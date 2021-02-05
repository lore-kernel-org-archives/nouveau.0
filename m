Return-Path: <SRS0=NGGM=HH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A120C433E6
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFAF64FBA
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFAF64FBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20F4887EF;
	Fri,  5 Feb 2021 22:39:14 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F496F51B
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:39:13 +0000 (UTC)
Date: Fri, 05 Feb 2021 22:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612564751;
 bh=MThtH53+olyYkMWTufhHQ9n4R65BN+bLK17ZHDYzr58=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=LWcKGUcJKYZyAG/SahdfFpcNpspTyTB0RKqLIED0KvM8TeBKl21A3d31uZSRRoA1h
 rRT3PDtqr9lSEQur8oHDYSE5NQnNLNNJYWa6ao1YJJQkkpwC4fMrnb3mM2UFRyr5Ug
 B+OrKVz/u1qlia+pN8+Bkqy/MU0gdnrd4G2uNdtug7epwWaB+hmwg0NGKcT5lHVuHx
 keHqz9vyh5hk/HeCWlUTZwMoVMAPO+L5SRGIGEnGV0+evKy9C8+1md5RPGD4aCg1Dq
 KFjoz3ITEhsnQBS4Q3c3V30UwVZEXcaPZBdRXXELvffiG85zW1Ik8HYlc+PuNioX21
 a+KC1RTYs4Xsw==
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Simon Ser <contact@emersion.fr>
Message-ID: <ZSeE7alpbURtGHRCp2H1qh--KizDqMiVO_97OPJqnd9OfBEbiVatIR87ltr6WllVeSrTsz4-KoS0PXNzCGg9_WSj2F6SM0l0t-tPcuxFf48=@emersion.fr>
In-Reply-To: <CAKb7Uvi0qV7MMRQ6kDw_aNtcVjcQj7zZ=TNLxxQhta9fRJ0vCA@mail.gmail.com>
References: <20210205222442.19555-1-contact@emersion.fr>
 <CAKb7Uvi0qV7MMRQ6kDw_aNtcVjcQj7zZ=TNLxxQhta9fRJ0vCA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH v3] nouveau/dispnv50: add cursor pitch check
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Friday, February 5th, 2021 at 11:36 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> > --- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> > @@ -30,6 +30,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_plane_helper.h>
> > +#include <drm/drm_fourcc.h>
>
> Why is this needed?

This is needed for the definition of struct drm_format_info.

> >  bool
> >  curs507a_space(struct nv50_wndw *wndw)
> > @@ -99,6 +100,8 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
> >                  struct nv50_head_atom *asyh)
> >  {
> >         struct nv50_head *head = nv50_head(asyw->state.crtc);
> > +       struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
> > +       struct drm_framebuffer *fb = asyw->state.fb;
> >         int ret;
> >
> >         ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> > @@ -109,14 +112,36 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
> >         if (ret || !asyh->curs.visible)
> >                 return ret;
> >
> > -       if (asyw->image.w != asyw->image.h)
> > +       if (asyw->image.w != asyw->image.h) {
> > +               NV_ATOMIC(drm,
> > +                         "Invalid cursor image size: width (%d) must match height (%d)\n",
> > +                         asyw->image.w, asyw->image.h);
>
> Maybe keep with the style of the other NV_ATOMIC's, e.g. include %s:
> at the beginning with wndw->plane.name as the value?

Good idea.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
