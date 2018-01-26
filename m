From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v3] drm/nouveau: Move irq setup/teardown to pci ctor/dtor
Date: Fri, 26 Jan 2018 02:20:26 +0100
Message-ID: <20180126012026.kx5ijte72ch67oyi@angband.pl>
References: <20180125232955.14574-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180125232955.14574-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mike Galbraith <efault@gmx.de>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, Jan 25, 2018 at 06:29:53PM -0500, Lyude Paul wrote:
> This was made apparent by what appeared to be a regression in the
> mainline kernel that started introducing suspend/resume issues for
> nouveau:
> 
>         a0c9259dc4e1 (irq/matrix: Spread interrupts on allocation)

I'm just a dumb user here, but I confirm:
CPU: AMD Phenom II X6 1055T, GPU: GTX 560 Ti
100% fail to resume GPU on 4.15-rc*, 100% ok with your patch.

And that spinning rust hates being repeatedly powered off and on... :/

> ---
> Changes since v2:
>  - Remove teardown, just reuse pci->irq to indicate when we're tearing
>    down the driver
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c | 44 +++++++++++++++++---------
>  1 file changed, 29 insertions(+), 15 deletions(-)

Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀ 
⣾⠁⢰⠒⠀⣿⡁ Imagine there are bandits in your house, your kid is bleeding out,
⢿⡄⠘⠷⠚⠋⠀ the house is on fire, and seven big-ass trumpets are playing in the
⠈⠳⣄⠀⠀⠀⠀ sky.  Your cat demands food.  The priority should be obvious...
