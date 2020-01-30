From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: nv50_disp_chan_mthd: ensure mthd is not NULL
Date: Thu, 30 Jan 2020 07:54:50 +0100
Message-ID: <20200130065450.GA629439@kroah.com>
References: <8a82672e-1a8d-b08e-b387-11ffecd5ba07@qubes-os.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8a82672e-1a8d-b08e-b387-11ffecd5ba07@qubes-os.org>
Sender: stable-owner@vger.kernel.org
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Wed, Jan 29, 2020 at 05:22:13PM +0100, Frédéric Pierret wrote:
> Dear Ben Skeggs,
> 
> Please find attached a patch solving a blocking issue I encountered:
> https://bugzilla.kernel.org/show_bug.cgi?id=206299
> 
> Basically, running at least a RTX2080TI on Xen makes a bad mmio error
> which causes having 'mthd' pointer to be NULL in 'channv50.c'. From the
> code, it's assumed to be not NULL by accessing directly 'mthd->data[0]'
> which is the reason of the kernel panic. I simply check if the pointer
> is not NULL before continuing.
> 
> Best regards,
> 
> Frédéric Pierret
> 

> From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?=
>  <frederic.pierret@qubes-os.org>
> Date: Sun, 26 Jan 2020 23:24:33 +0100
> Subject: [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Pointer to structure array is assumed not NULL by default. It has
> the consequence to raise a kernel panic when it's not the case.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206299
> Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> index bcf32d92ee5a..50e3539f33d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> @@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int debug)
>  
>  	if (debug > subdev->debug)
>  		return;
> +	if (!mthd)
> +		return;
>  
>  	for (i = 0; (list = mthd->data[i].mthd) != NULL; i++) {
>  		u32 base = chan->head * mthd->addr;
> -- 
> 2.21.0
> 




<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
