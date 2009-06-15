From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Mon, 15 Jun 2009 09:03:56 +0200
Message-ID: <20090615070356.GA4197@feanor>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
	<3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3d374d00906141556y44d5d493j330cc1ebf79e5968-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 14, 2009 at 11:56:45PM +0100, Alistair Buxton wrote:
> Stupid question: Given the presence of a register which indicates the
> current field, why can't NVWaitVSync simply wait until the end of the
> second field, by doing whatever it does twice iff it is called during
> the first field? 

Because then you'd effectively halve the frame rate in interlaced
modes, unless you somehow queue all the information for the second
half-frame.

> This method shouldn't require any patches in player software, since
> by default they treat the two interlaced fields as a single frame,

They do? I thought they they'd just treat every half-frame as a whole
frame by scaling it up vertically. Which player actually does that?

If you just combine two adjacent half-frames, you get the typical
comb-style ragged edges on fast moving objects.

Interlace *is* actually intended to give increased temporal resolution.
With nearly the same spatial resolution, because the human brain
compensates. If you treat two half-frames as one frame, you loose
that.

- Dirk
