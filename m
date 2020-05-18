From: Nick Desaulniers <ndesaulniers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] x86: mmiotrace: Use cpumask_available for
 cpumask_var_t variables
Date: Mon, 18 May 2020 11:52:47 -0700
Message-ID: <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, clang-built-linux <clang-built-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, May 18, 2020 at 2:31 AM Nathan Chancellor
<natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Apr 08, 2020 at 01:53:23PM -0700, Nathan Chancellor wrote:
> > When building with Clang + -Wtautological-compare and
> > CONFIG_CPUMASK_OFFSTACK unset:
> >
> > arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
> > equal to a null pointer is always false [-Wtautological-pointer-compare]
> >         if (downed_cpus == NULL &&
> >             ^~~~~~~~~~~    ~~~~
> > arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
> > equal to a null pointer is always false [-Wtautological-pointer-compare]
> >         if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> >             ^~~~~~~~~~~    ~~~~
> > 2 warnings generated.
> >
> > Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
> > cpumask_available to fix warnings of this nature. Use that here so that
> > clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/982
> > Reported-by: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks for the patch, sorry I'm falling behind on code review!
Reviewed-by: Nick Desaulniers <ndesaulniers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

> > ---
> >  arch/x86/mm/mmio-mod.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> > index 109325d77b3e..43fd19b3f118 100644
> > --- a/arch/x86/mm/mmio-mod.c
> > +++ b/arch/x86/mm/mmio-mod.c
> > @@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
> >       int cpu;
> >       int err;
> >
> > -     if (downed_cpus == NULL &&
> > +     if (!cpumask_available(downed_cpus) &&
> >           !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
> >               pr_notice("Failed to allocate mask\n");
> >               goto out;
> > @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
> >       int cpu;
> >       int err;
> >
> > -     if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> > +     if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
> >               return;
> >       pr_notice("Re-enabling CPUs...\n");
> >       for_each_cpu(cpu, downed_cpus) {
> >
> > base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> > --
> > 2.26.0
> >
>
> Gentle ping for acceptance, I am not sure who should take this.

Looks like Steven or Ingo are the listed maintainers for MMIOTRACE?

-- 
Thanks,
~Nick Desaulniers
