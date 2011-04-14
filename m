From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: 2.6.39-rc1 nouveau regression (bisected)
Date: Thu, 14 Apr 2011 21:02:01 +0200
Message-ID: <20110414190117.GA3493@joi.lan>
References: <20110403181206.GA19291@comet.dominikbrodowski.net>
 <20110407151129.GA24977@comet.dominikbrodowski.net>
 <20110414170559.GA10768@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110414170559.GA10768@comet.dominikbrodowski.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Ben Skeggs <bskeggs@redhat.com>, airlied@redhat.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, mjg@redhat.com, maciej.rutecki@gmail.com, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Apr 14, 2011 at 07:05:59PM +0200, Dominik Brodowski wrote:
> Thought about CCing Linus to show him that 2.6.39-rcX isn't as "calm"
> to everyone, but then chose to CC Maciej instead: Would you be so kind and
> add this to your regression list? Thanks!
> 
> Since commit 38f1cff
> 
>     From: Dave Airlie <airlied@redhat.com>
>     Date: Wed, 16 Mar 2011 11:34:41 +1000
>     Subject: [PATCH] Merge commit '5359533801e3dd3abca5b7d3d985b0b33fd9fe8b' into dr
> 
>     This commit changed an internal radeon structure, that meant a new driver
>     in -next had to be fixed up, merge in the commit and fix up the driver.
> 
>     Also fixes a trivial nouveau merge.
> 
>     Conflicts:
>         drivers/gpu/drm/nouveau/nouveau_mem.c
> 
> booting my atom/NM10/ION2 system crashes hard during boot, right after
> blanking the screen, and before the initramfs gets loaded. I just
> re-checked: both parent commits ( 5359533 and 4819d2e ) do indeed work
> just fine, but the merge commit ( 38f1cff ) fails, same as tip ( 85f2e68 ).

Can you activate netconsole and check whether kernel spits anything interesting?
You might try to load nouveau module after boot - maybe something will be saved
to /var/log or you could even ssh into the box and check dmesg...


Marcin
