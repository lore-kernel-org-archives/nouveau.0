From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] drm/nouveau: fix NULL ptr dereference from
 nv50_disp_intr()
Date: Sun, 24 Mar 2013 15:57:06 +0200
Message-ID: <20130324135705.GJ14155@blackmetal.musicnaut.iki.fi>
References: <1363705988.3413.17.camel@thor.lan>
 <1364039260.3440.5.camel@thor.lan>
 <514EE9EE.9030208@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <514EE9EE.9030208@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi,

On Sun, Mar 24, 2013 at 12:56:30PM +0100, Maarten Lankhorst wrote:
> Op 23-03-13 12:47, Peter Hurley schreef:
> > On Tue, 2013-03-19 at 11:13 -0400, Peter Hurley wrote:
> >> On vanilla 3.9.0-rc3, I get this 100% repeatable oops after login when
> >> the user X session is coming up:
> > Perhaps I wasn't clear that this happens on every boot and is a
> > regression from 3.8
> >
> > I'd be happy to help resolve this but time is of the essence; it would
> > be a shame to have to revert all of this for 3.9
> 
> Well it broke on my system too, so it was easy to fix.
> 
> I didn't even need gdm to trigger it!
> 
> >8----
> This fixes regression caused by 1d7c71a3e2f7 (drm/nouveau/disp: port vblank handling to event interface),

This patch fixes the boot crashes also on my G5 iMac
(http://marc.info/?l=linux-kernel&m=136285469916031&w=2).

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.
