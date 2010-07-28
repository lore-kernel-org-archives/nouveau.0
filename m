From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: mmotm 2010-07-27 - nouveau lockdep issues.
Date: Wed, 28 Jul 2010 08:03:51 +0200
Message-ID: <20100728060334.GA2756@joi.lan>
References: <201007272226.o6RMQRBm008735@imap1.linux-foundation.org>
	<31845.1280295723@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <31845.1280295723@localhost>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Valdis.Kletnieks@vt.edu
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 28, 2010 at 01:42:03AM -0400, Valdis.Kletnieks@vt.edu wrote:
> On Tue, 27 Jul 2010 14:56:50 PDT, akpm@linux-foundation.org said:
> > The mm-of-the-moment snapshot 2010-07-27-14-56 has been uploaded to
> > 
> >    http://userweb.kernel.org/~akpm/mmotm/
> 
> Hit this while the X server was on its way down during a 'shutdown -r now'. Worked fine
> in -rc5-mmotm0719. 'e16' is the Enlightenment window manager, if that matters.
> 
> [   93.181787] [drm:output_poll_execute] *ERROR* delayed enqueue failed 1
> [   99.802836] [drm] nouveau 0000:01:00.0: Allocating FIFO number 4
> [   99.808875] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 4
> [  103.262226] [drm:output_poll_execute] *ERROR* delayed enqueue failed 1
> [  113.341948] [drm:output_poll_execute] *ERROR* delayed enqueue failed 1
> [  123.421836] [drm:output_poll_execute] *ERROR* delayed enqueue failed 1
> [  123.550520] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 4
> [  123.551253] 
> [  123.551253] ======================================================
> [  123.551253] [ INFO: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected ]
> [  123.551253] 2.6.35-rc6-mmotm0727 #1
> [  123.551253] ------------------------------------------------------
> [  123.551253] e16/3822 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
> [  123.551253]  (&(&mm->unused_lock)->rlock){+.+...}, at: [<ffffffff812a94bc>] drm_mm_put_block+0x10e/0x142
> [  123.551253] 
> [  123.551253] and this task is already holding:
> [  123.551253]  (&(&dev_priv->context_switch_lock)->rlock){-.....}, at: [<ffffffff812bdbab>] nouveau_channel_free+0x10f/0x233
> [  123.551253] which would create a new lock dependency:
> [  123.551253]  (&(&dev_priv->context_switch_lock)->rlock){-.....} -> (&(&mm->unused_lock)->rlock){+.+...}
> [  123.551253] 

It's only theoritcal issue. If you want to quiet it down until it will be "fixed" properly, you can
apply patch from http://lists.freedesktop.org/archives/nouveau/2010-July/005994.html

Marcin
