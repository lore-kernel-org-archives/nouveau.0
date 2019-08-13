From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: CRTC Runtime PM ref tracking fixes
Date: Tue, 13 Aug 2019 14:42:17 +1000
Message-ID: <CACAvsv760Jtzubm2faimEY1z1tfNPBcsOJg6Ns0wL8W-9fxRXw@mail.gmail.com>
References: <20190807234709.6076-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807234709.6076-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: nouveau.vger.kernel.org

On Thu, 8 Aug 2019 at 09:47, Lyude Paul <lyude@redhat.com> wrote:
>
> Just some runtime PM fixes for some much less noticeable runtime PM ref
> tracking issues that I got reminded of when fixing some unrelated issues
> with nouveau.
>
> Changes since v1:
> * Don't fix CRTC RPM code in dispnv04, because it's not actually doing
>   anything in the first place. Just get rid of it. - imirkin
>
> Lyude Paul (2):
>   drm/nouveau/dispnv04: Remove runtime PM
>   drm/nouveau/dispnv50: Fix runtime PM ref tracking for non-blocking
>     modesets
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 51 +------------------------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 38 +++++++++---------
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 --
>  3 files changed, 18 insertions(+), 74 deletions(-)
For the series:  Acked-by: Ben Skeggs <bskeggs@redhat.com>

>
> --
> 2.21.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
