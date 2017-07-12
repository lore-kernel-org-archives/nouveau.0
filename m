From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Wed, 12 Jul 2017 13:25:03 +0200
Message-ID: <1499858703.23742.25.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499853345.23742.8.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, 2017-07-12 at 11:55 +0200, Mike Galbraith wrote:
> On Tue, 2017-07-11 at 14:22 -0400, Ilia Mirkin wrote:
> > 
> > Some display stuff did change for 4.13 for GM20x+ boards. If it's not
> > too much trouble, a bisect would be pretty useful.
> 
> Bisection seemingly went fine, but the result is odd.
> 
> e98c58e55f68f8785aebfab1f8c9a03d8de0afe1 is the first bad commit

But it really really is bad.  Looking at gitk fork in the road leading
to it...

52d9d38c183b drm/sti:fix spelling mistake: "compoment" -> "component" - good
e4e818cc2d7c drm: make drm_panel.h self-contained                     - good
9cf8f5802f39 drm: add missing declaration to drm_blend.h              - good

Before the git highway splits, all is well.  The lane with commits
works fine at both ends, but e98c58e55f68 is busted.  Merge arfifact?

	-Mike
