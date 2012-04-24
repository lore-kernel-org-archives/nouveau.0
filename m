From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH 1/5] drm: add optional per device rwsem for all ioctls
Date: Tue, 24 Apr 2012 21:10:50 +0200
Message-ID: <20120424191050.GB2857@joi.lan>
References: <1335133112-8008-1-git-send-email-marcin.slusarz@gmail.com>
	<20120423075148.GC4935@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20120423075148.GC4935@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, Apr 23, 2012 at 09:51:48AM +0200, Daniel Vetter wrote:
> On Mon, Apr 23, 2012 at 12:18:28AM +0200, Marcin Slusarz wrote:
> > Nouveau, in normal circumstances, does not need device lock for every ioctl,
> > but incoming "gpu reset" code needs exclusive access to the device.
> > This commit adds drm_driver flag which turns on read lock ioctl encapsulation.
> > 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> 
> Why can't we just move this down to nouveau driver code?

Ok, I think it's easily possible by wrapping drm_ioctl.

> So why can't nouveau do the same? Also, if this is indeed necessary and we
> add this as some mandatory core infrastructure, it's not good enough: In
> i915 we go to great lengths to ensure that all processes waiting for gpu
> reset are still interruptible, in case the gpu reset dies unexpectedly
> (which happens), so this would need to be improved.

I came up with a scheme where down_read can be made interruptible.

I'll post both changes in a few days.

(Unfortunately adding proper down_read_interruptible / down_write_interruptible
require a bit of unfunny work - 8 architectures have their own code for rwsems)

Marcin
