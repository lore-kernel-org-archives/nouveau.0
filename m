From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: RFC: TTM extra bo space
Date: Thu, 5 Nov 2009 20:04:36 +0200
Message-ID: <20091105200436.47e28b79@daedalus.pq.iki.fi>
References: <1257350332.2829.8.camel@localhost>
	<53E09666-8D2D-4DFD-AE06-DCDD963B6114@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53E09666-8D2D-4DFD-AE06-DCDD963B6114-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jakob Bornecrantz <jakob-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org" <dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 4 Nov 2009 17:42:26 +0000
Jakob Bornecrantz <jakob-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org> wrote:

> Hi Jerome
> 
> On 4 nov 2009, at 15.58, Jerome Glisse wrote:
> >
> > Note: For reference my issue is with cursor on old radeon hw,
> > cursor must be in the next 128M from the crtc scanout buffer. We
> > got issue when someone start to resize their screen at which
> > point the scanout buffer can endup after the cursor in vram.
> > Other solution would be to add multiple bo adjacent validation
> > function to ttm (likely less ttm change).
> 
> Can you solve your problem by being able to place the buffer at  
> certain location? We had the same need but managed to work around
> it with a quick and dirty hack.
> 
> Implementing that would mostly be about changing drm_mm.c to
> handle placing buffers at certain locations. And in TTM core
> being able to evict buffers that are in that place.

That sounds like something that could solve an issue in Nouveau
with nv04 card family. The following is hearsay, but I try to
describe it.

Of 32 MB of VRAM, the scanout buffer must reside within the
first 16 MB. Any(?) other buffers do not have this limitation
e.g. textures. Setting up separate memory spaces for these
halves, say, TTM VRAM and TTM PRIV1, would be inconvenient,
because buffers could not be laid accross the boundary.

Does this make sense?
Nouveau people, did I get this right?

-- 
Pekka Paalanen
http://www.iki.fi/pq/
