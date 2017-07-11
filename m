From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Tue, 11 Jul 2017 20:53:48 +0200
Message-ID: <1499799228.5315.39.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, 2017-07-11 at 14:22 -0400, Ilia Mirkin wrote:
> 
> OK, thanks. So in other words, a fairly standard desktop with a PCIe
> board plugged in. No funny business. (Laptops can create a ton of
> additional weirdness, which I assumed you had since you were talking
> about STR.)

Yup, garden variety deskside box.

> My best guess is that gf119_head_vblank_put either has a bogus head id
> (should be in the 0..3 range) which causes it to do an out-of-bounds
> read on MMIO space, or that the MMIO mapping has already been removed
> by the time nouveau_display_suspend runs. Adding Ben Skeggs for
> additional insight.
> 
> Some display stuff did change for 4.13 for GM20x+ boards. If it's not
> too much trouble, a bisect would be pretty useful.

Vacation -> back to work happens in the very early AM, so bisection
will have to wait a bit.

	-Mike
