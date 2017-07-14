From: Mike Galbraith <efault@gmx.de>
Subject: Re: [Nouveau] [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:15:46 +0200
Message-ID: <1500045346.5763.21.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
         <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
         <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
         <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
         <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <karolherbst@gmail.com>, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, Peter Zijlstra <peterz@infradead.org>, David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, 2017-07-14 at 17:10 +0200, Karol Herbst wrote:
> Yeah, we shouldn't let the machine die. Are there more WARN_ON_ONCE
> usage we could convert to WARN_ONCE?

Shooting the messenger is generally considered uncool :)

	-Mike
