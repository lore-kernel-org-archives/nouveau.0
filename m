From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau-cvs] xf86-video-nv: Branch 'master' - 2
	commits
Date: Wed, 10 Jun 2009 12:00:43 +0200
Message-ID: <6d4bc9fc0906100300o16c8ac53rce3c6702028ca9e0@mail.gmail.com>
References: <20090610020503.174E510051@kemper.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090610020503.174E510051-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I just realised that this mode of tiling is quite different from the
one i observed, this one is linear inside the tile, not recursively
tiled.

Also, one optimisation that you can do without fixing the xserver
(which should be done anyway), is to set pread and pwrite to the
linear passthrough functions if none of the currently prepared pixmaps
are tiled.

Maarten.
