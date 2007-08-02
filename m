From: "Christopher Halse Rogers" <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel module indispensable?
Date: Thu, 2 Aug 2007 14:15:18 +1000
Message-ID: <38afb7ef0708012115s7b962a37pf21f1055103dab8d@mail.gmail.com>
References: <jwvtzrj2kts.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
	<38afb7ef0708011737p353d1099se54f910837801078@mail.gmail.com>
	<jwv643y37lx.fsf-monnier+inbox@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <jwv643y37lx.fsf-monnier+inbox-mXXj517/zsQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 8/2/07, Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org> wrote:
> >> PS: I see that the avivo guys already have a Debian package (in
> >> experimental), whereas that is still missing for the nouveau driver.
> >>
> > Probably because the nouveau drivers require a (moving) git snapshot
> > of drm in order to work, which potentially breaks all sorts of
> > non-nouveau stuff (and you can't really restrict it to just nouveau
> > users).
>
> Of course, there could be a "new-drm" Debian package as well, installed with
> module-assistant.

Except that you need to replace libdrm as well (IIRC), not just the
kernel modules.
>
> > I'm currently working on making some nightly snapshot Ubuntu packages
> > using Launchpad's new PPA infrastructure.  If there's enough demand I
> > could also build debian packages from the same source.
>
> That would be helpful, yes,
>
I'll see what my sid schroot can do.
