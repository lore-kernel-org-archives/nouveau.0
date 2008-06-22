From: "Maarten Maathuis" <madman2003@gmail.com>
Subject: Initial import of NV50/g80 kernel modesetting code.
Date: Sun, 22 Jun 2008 16:47:30 +0200
Message-ID: <6d4bc9fc0806220747u70cdf289u6be11d7ffa5ebfb4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Sender: dri-devel-bounces@lists.sourceforge.net
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: dri-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

I've been talking about it for some time, but now it actually does
something, so comitted it. I always said i wouldn't use the randr-1.2
clone stuff and i didn't, so you can use this as an example how it
could also be done.

What doesn't work (for sure):
lvds with no ddc support
no fbcon yet
output/connector properties

Notes:
the bare minimum of bios code was imported (eventually the bios code
should be detached from the ddx)
I took the xorg i2c design as a bit banging interface refused to work
properly, after trying quite a few things.

My next goal will be to clean up the dri locking stuff in nouveau a
bit, as that needs cleanup. This will however have to wait a bit
(school work and such). There are minor things to fix, like the 2nd X
startup causing the rendering engine to lockup (in the past shutting
down X pulled everything down, which is not the case now). So if you
are somehow interrested in testing then please rmmod before
restarting.

Please note that you must explictly do "modprobe nouveau modeset=1".
Option "KMS" has to be passed to the X driver options.

I had to export a few functions from the core modesetting stuff, but not much.

Core design:
- A interface independent module that does al the hardware interaction.
- A wrapper to this module (nv50_kms_wrapper.c).

Any comments or questions, then don't hesitate to ask.

Sincerly,

Maarten.

-------------------------------------------------------------------------
Check out the new SourceForge.net Marketplace.
It's the best place to buy or sell services for
just about anything Open Source.
http://sourceforge.net/services/buy/index.php
--
