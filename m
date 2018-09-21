From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 0/2] drm/nouveau: Allow parsing vbios.rom with
 nvbios from debugfs
Date: Fri, 21 Sep 2018 21:05:22 +0200
Message-ID: <CACO55tsma8=OKB-wLAqE_fD+Ao05PWPsiJEsb3jzT+XU1RRjzQ@mail.gmail.com>
References: <20180919171353.29648-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919171353.29648-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Both patches are Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Wed, Sep 19, 2018 at 7:13 PM, Lyude Paul <lyude@redhat.com> wrote:
> This is a small patch series that adds a strap_peek file into our
> debugfs, and sets the size of the vbios.rom debugfs file so that nvbios
> can easily be used to parse the vbios even on systems where the normal
> BIOS retrieval methods (for example, laptops that need ACPI to access
> the vbios for the nvidia GPU) won't work. This should make it a little
> easier to collect vbioses.
>
> Lyude Paul (2):
>   drm/nouveau: Add strap_peek to debugfs
>   drm/nouveau: Add size to vbios.rom file in debugfs
>
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 46 ++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 5 deletions(-)
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
