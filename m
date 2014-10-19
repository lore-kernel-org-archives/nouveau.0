From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [Intel-gfx] v3.17,
 i915 vs nouveau: possible recursive locking detected
Date: Sun, 19 Oct 2014 13:31:24 +0200
Message-ID: <20141019113124.GN26941@phenom.ffwll.local>
References: <20141013184033.GA5526@marcin-Inspiron-7720>
 <20141016114738.GB1704@bremse.fdxtended.com>
 <20141018120432.1c061ea7@jbarnes-t420>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141018120432.1c061ea7@jbarnes-t420>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Oct 18, 2014 at 12:04:32PM +0200, Jesse Barnes wrote:
> On Thu, 16 Oct 2014 13:47:38 +0200
> Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> 
> > We need ww mutexes and need to rewrite i915 a bit fo fix this all.
> > I.e. known issue. As long as your userspace isn't nasty nothing bad
> > will ever happen though.
> 
> So do we already have a bug open with a good description of the issue?
> Eventually the streets will run with blood and we'll enter the 6th
> republic of i915, so it would be good to have it on the hit list for
> when the time comes...

https://bugzilla.kernel.org/show_bug.cgi?id=60534

I've updated the bug with latest status.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
