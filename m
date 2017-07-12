From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Wed, 12 Jul 2017 09:45:35 +0200
Message-ID: <1499845535.23742.4.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499799228.5315.39.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499799228.5315.39.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, 2017-07-11 at 20:53 +0200, Mike Galbraith wrote:
> On Tue, 2017-07-11 at 14:22 -0400, Ilia Mirkin wrote:
> 
> > Some display stuff did change for 4.13 for GM20x+ boards. If it's not
> > too much trouble, a bisect would be pretty useful.
> 
> Vacation -> back to work happens in the very early AM, so bisection
> will have to wait a bit.

Hm, my backup workstation (old GeForce 8600 GT box) has the same issue,
so perhaps I can bisect it as I work on backlog (multitasking: screw up
multiple tasks concurrently).

	-Mike
