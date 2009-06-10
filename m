From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau-cvs] xf86-video-nv: Branch 'master' - 2
	commits
Date: Wed, 10 Jun 2009 20:53:48 +1000
Message-ID: <1244631228.5714.3.camel@localhost.localdomain>
References: <20090610020503.174E510051@kemper.freedesktop.org>
	<6d4bc9fc0906100300o16c8ac53rce3c6702028ca9e0@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0906100300o16c8ac53rce3c6702028ca9e0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2009-06-10 at 12:00 +0200, Maarten Maathuis wrote:
> I just realised that this mode of tiling is quite different from the
> one i observed, this one is linear inside the tile, not recursively
> tiled.
Ah right, yeah, I should've mentioned that earlier.  The GPU deals with
all the weirdness, and it becomes regular old tiling from the CPU's
point of view.

> 
> Also, one optimisation that you can do without fixing the xserver
> (which should be done anyway), is to set pread and pwrite to the
> linear passthrough functions if none of the currently prepared pixmaps
> are tiled.
Yup, that thought occurred to me, didn't get around to it yet though.  I
took a bit of a look at what's required to fix things server-side too,
and it's not going to be even remotely straight-forward.  There's even
cases where the accessors get called on buffers that haven't had
setupWrap called on them etc.. It looks like quite a rewrite of the fb
layer (and I'm not even sure pixman's quite up to the task, but didn't
spend too much time looking there yet) would be in order..

Ben.
> 
> Maarten.
