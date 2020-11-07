From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] drm/nouveau: Stable backport of DP clock fixes for
 v5.9
Date: Sat, 7 Nov 2020 16:30:27 +0100
Message-ID: <20201107153027.GB90705@kroah.com>
References: <160459060724988@kroah.com>
 <20201106233016.2481179-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201106233016.2481179-1-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Fri, Nov 06, 2020 at 06:30:13PM -0500, Lyude Paul wrote:
> Just a backport of the two patches for v5.9 that you'll want to apply.
> The first one was Cc'd to stable, but I forgot to Cc the second one as
> well.
> 
> Lyude Paul (2):
>   drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
>   drm/nouveau/kms/nv50-: Fix clock checking algorithm in
>     nv50_dp_mode_valid()
> 
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++---------------
>  drivers/gpu/drm/nouveau/nouveau_dp.c        | 21 ++++++++----
>  2 files changed, 24 insertions(+), 33 deletions(-)

Thanks for these, now queued up.

Next time if you could include what the upstream git commmit ids they
are in Linus's tree, that would help, as I have to list them.

thanks,

greg k-h
