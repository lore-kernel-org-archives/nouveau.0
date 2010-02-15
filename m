From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [git pull] drm
Date: Mon, 15 Feb 2010 21:12:01 +0100
Message-ID: <20100215201201.GA3332@joi.lan>
References: <alpine.DEB.2.00.1002110417200.516@skynet.skynet.ie>
 <201002151053.48681.borntraeger@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201002151053.48681.borntraeger@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Dave Airlie <airlied@linux.ie>, torvalds@linux-foundation.org, dri-devel@lists.sf.net, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Maarten Maathuis <madman2003@gmail.com>
List-Id: nouveau.vger.kernel.org

On Mon, Feb 15, 2010 at 10:53:48AM +0100, Christian Borntraeger wrote:
> Am Donnerstag 11 Februar 2010 05:20:07 schrieb Dave Airlie:
> 
> Dave,
> 
> I just updated from to rc8 and got the a scheduling while atomic warning in
> nouveau. (see below).

Linus' tree is missing two fixes:

drm/nouveau: don't hold spin lock while calling kzalloc with GFP_KERNEL
drm/nouveau: spin_lock_init after memset'ing the bios struct

The first one fixes your bug.

http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=ed64797d153ecf0da79b8b849642d7a109fd97fd
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9da76700072a00c39e21553df0998c7b3b620d88

If they won't go into 2.6.33, they are perfect candidates for -stable.

Marcin
