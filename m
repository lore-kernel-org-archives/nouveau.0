From: Greg KH <greg@kroah.com>
Subject: Re: Backport request for commit 579b7c582 (drm/nouveau/pmu: do not
 assume a PMU is present)
Date: Sun, 14 Feb 2016 14:12:01 -0800
Message-ID: <20160214221201.GA9713@kroah.com>
References: <CAKb7UvgS0E6G6s5QuFJeFm54+fhB66BOcfTXfrsAhuw-29fSpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvgS0E6G6s5QuFJeFm54+fhB66BOcfTXfrsAhuw-29fSpw@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable <stable@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jan 06, 2016 at 09:23:20AM -0500, Ilia Mirkin wrote:
> This commit should be backported to kernel 4.3 (apologies for
> line-wrapping). Without it, we get a null deref (i.e. oops) on GF117
> GPUs which for one reason or another don't have the PMU hooked up.
> That should be fixed in its own right, but that's a separate matter.
> The issue was introduced in commit e2ca4e7d6e (drm/nouveau/pmu:
> convert to new-style nvkm_subdev)
> 
> commit 579b7c58215329803ce184704463de09f0f310ac
> Author: Alexandre Courbot <acourbot@nvidia.com>
> Date:   Thu Sep 3 17:39:52 2015 +0900
> 
>     drm/nouveau/pmu: do not assume a PMU is present
> 
>     Some devices may not have a PMU. Avoid a NULL pointer dereference in
>     such cases by checking whether the pointer given to nvkm_pmu_pgob() is
>     valid.
> 
>     Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> 

Now applied, thanks.

greg k-h
