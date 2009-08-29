From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Debugging help needed
Date: Sun, 30 Aug 2009 00:07:50 +0300
Message-ID: <20090830000750.3f661ee1@daedalus.pq.iki.fi>
References: <20090829140813.E0D3833C2A5@tippex.mynet.homeunix.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090829140813.E0D3833C2A5-ZOnKU5P2/IUVO05zmlNvLXEk6Bp1+KyB2LY78lusg7I@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 29 Aug 2009 16:08:13 +0200
Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org> wrote:

> I once had nouveau working and stable back whem 2.6.29 was released.

That would be before we used a real memory manger, IIRC.

> Nowadays, it hangs within less tahn an hours work. The symptom is that 
> the mouse moves, but no other updates to the screen. The machine is
> otherwise working mostly ok so I can ssh to it. The "issue" I have is 
> that there is nothing interesting (afaict) in any log. Nothing in 
> Xog.0.log, nothing in dmesg.
> 
> The one intersting thing I've noticed is that with drm debuging on I get 
> a ton of these on dmesg:
> 
> host [drm:drm_ioctl], pid=2391, cmd=0x40086485, nr=0x85, dev 0xe200, auth=1

0x85 = DRM_COMMAND_BASE + 0x45, so this is DRM_NOUVEAU_GEM_CPU_PREP
(include/drm/nouveau_drm.h), i.e. nouveau_gem_ioctl_cpu_prep() in
drivers/gpu/drm/nouveau/nouveau_gem.c.

> And at, or around the hang, there seem to be a an increase of:
> 
> host [drm:drm_ioctl], ret = fffffff5

Okay, so it is spinning there for some reason, returning -11,
i.e. -EAGAIN. Assuming this is the return of the prep call.

That's all I can tell for now. Full kernel logs might help, you
could open a bug report with that.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
