From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Set DRIVER_ATOMIC cap earlier to fix
 debugfs
Date: Thu, 26 Jul 2018 11:48:26 -0400
Message-ID: <a0e04475abd7f0128b6180805490b7decb4f9c02.camel@redhat.com>
References: <153227752119282@kroah.com>
         <20180723171322.9677-1-lyude@redhat.com> <20180726151202.GE27305@kroah.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180726151202.GE27305@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bskeggs@redhat.com, stable@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, 2018-07-26 at 17:12 +0200, Greg KH wrote:
> On Mon, Jul 23, 2018 at 01:13:20PM -0400, Lyude Paul wrote:
> > commit eb493fbc150f4a28151ae1ee84f24395989f3600 upstream
> > 
> > Currently nouveau doesn't actually expose the state debugfs file that's
> > usually provided for any modesetting driver that supports atomic, even
> > if nouveau is loaded with atomic=1. This is due to the fact that the
> > standard debugfs files that DRM creates for atomic drivers is called
> > when drm_get_pci_dev() is called from nouveau_drm.c. This happens well
> > before we've initialized the display core, which is currently
> > responsible for setting the DRIVER_ATOMIC cap.
> > 
> > So, move the atomic option into nouveau_drm.c and just add the
> > DRIVER_ATOMIC cap whenever it's enabled on the kernel commandline. This
> > shouldn't cause any actual issues, as the atomic ioctl will still fail
> > as expected even if the display core doesn't disable it until later in
> > the init sequence. This also provides the added benefit of being able to
> > use the state debugfs file to check the current display state even if
> > clients aren't allowed to modify it through anything other than the
> > legacy ioctls.
> > 
> > Additionally, disable the DRIVER_ATOMIC cap in nv04's display core, as
> > this was already disabled there previously.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv04/disp.c | 3 +++
> >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 7 +++++++
> >  drivers/gpu/drm/nouveau/nv50_display.c  | 6 ------
> >  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> Please give me a hint as to what kernel versions you want the patches to
> be applied to, otherwise I just have to guess :)
will note for the future, sorry about that!
> 
> thanks,
> 
> greg k-h
