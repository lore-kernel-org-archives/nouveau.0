Return-Path: <SRS0=NGGM=HH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46683C433DB
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962A864FAE
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962A864FAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313476F51B;
	Fri,  5 Feb 2021 22:37:09 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF36F51B
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:37:08 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id a17so744033vko.3
 for <nouveau@lists.freedesktop.org>; Fri, 05 Feb 2021 14:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDXMI5lQwiNWBvi3R7Wjj+Moarw3Pw2wocnDik9QMPg=;
 b=XsNtkgGMtBF48BAn0UCyht56apRV4ofDmomhsG5W1Rh63fkt2Oj18kwKnY9LYn1vqk
 oQaXCC7chi104gQBO/b5qDR1ERhl3qs7EEcUIZquvljd75ltgVv4dJglCI4JrGTku98S
 aVMfJSYUt3fNdqCsqAY0zqHCHRcB6aIYE/91xT1A2RhljvzsbKU2bvhrpFaylBJ9EItT
 1VEvN11CEPIELBKi7L5MpXSoFZH752wyKGH7keHI0LhDQLpGQ93OnNKP5T4ZPDOM79oK
 4mfgorKrwZTCzXrUNR2uNMzNAPIyphWzXchxKBbLOeknEwfgv7AA29Ga1lgjDt7QpcUN
 vq0A==
X-Gm-Message-State: AOAM533pi3X7ThgpfY9Nxylc+0kJNe55ZThTk/cBB28TU2ubEcpV7ImH
 GegCERj1UTLY+nHvlACQcb2uS4y2cDDIwNw21WINMs52qU4=
X-Google-Smtp-Source: ABdhPJw5cEZhzBQo8qozFuoTGUzSM64/1/p49l3HLLglwW07m4J8BBP+rYKTVPCJVMMt3yrQvUOV2cNRJdniKoEeIME=
X-Received: by 2002:a1f:ae81:: with SMTP id x123mr4976389vke.1.1612564627322; 
 Fri, 05 Feb 2021 14:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20210205222442.19555-1-contact@emersion.fr>
In-Reply-To: <20210205222442.19555-1-contact@emersion.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 5 Feb 2021 17:36:56 -0500
Message-ID: <CAKb7Uvi0qV7MMRQ6kDw_aNtcVjcQj7zZ=TNLxxQhta9fRJ0vCA@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 5:24 PM Simon Ser <contact@emersion.fr> wrote:
>
> The hardware needs a FB which is packed. Add checks to make sure
> this is the case.
>
> While at it, add debug logs for the existing checks. This allows
> user-space to more easily figure out why a configuration is
> rejected.
>
> v2:
> - Use drm_format_info instead of hardcoding bytes-per-pixel (Ilia)
> - Remove unnecessary size check (Ilia)
>
> v3:
> - Add missing newlines in debug messages (Lyude)
> - Use NV_ATOMIC (Lyude)
> - Add missing debug log for invalid format (Ilia)
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 31 +++++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> index 54fbd6fe751d..56459cfd037e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> @@ -30,6 +30,7 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fourcc.h>

Why is this needed?

>
>  bool
>  curs507a_space(struct nv50_wndw *wndw)
> @@ -99,6 +100,8 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>                  struct nv50_head_atom *asyh)
>  {
>         struct nv50_head *head = nv50_head(asyw->state.crtc);
> +       struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
> +       struct drm_framebuffer *fb = asyw->state.fb;
>         int ret;
>
>         ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> @@ -109,14 +112,36 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>         if (ret || !asyh->curs.visible)
>                 return ret;
>
> -       if (asyw->image.w != asyw->image.h)
> +       if (asyw->image.w != asyw->image.h) {
> +               NV_ATOMIC(drm,
> +                         "Invalid cursor image size: width (%d) must match height (%d)\n",
> +                         asyw->image.w, asyw->image.h);

Maybe keep with the style of the other NV_ATOMIC's, e.g. include %s:
at the beginning with wndw->plane.name as the value?

Either way,

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>

>                 return -EINVAL;
> +       }
> +       if (asyw->image.pitch[0] != asyw->image.w * fb->format->cpp[0]) {
> +               NV_ATOMIC(drm,
> +                         "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)\n",
> +                         asyw->image.pitch[0], asyw->image.w);
> +               return -EINVAL;
> +       }
>
>         ret = head->func->curs_layout(head, asyw, asyh);
> -       if (ret)
> +       if (ret) {
> +               NV_ATOMIC(drm,
> +                         "Invalid cursor image size: unsupported size %dx%d\n",
> +                         asyw->image.w, asyw->image.h);
> +               return ret;
> +       }
> +
> +       ret = head->func->curs_format(head, asyw, asyh);
> +       if (ret) {
> +               NV_ATOMIC(drm,
> +                         "Invalid cursor image format 0x%X\n",
> +                         fb->format->format);
>                 return ret;
> +       }
>
> -       return head->func->curs_format(head, asyw, asyh);
> +       return 0;
>  }
>
>  static const u32
> --
> 2.30.0
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
