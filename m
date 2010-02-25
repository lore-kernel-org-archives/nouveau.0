From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] makedepend in Mesa
Date: Thu, 25 Feb 2010 20:18:50 +0100
Message-ID: <b67489df1002251118w60d77d3dvadc284a0c59e0ee0@mail.gmail.com>
References: <b67489df1002231329v1e4411a5ncaa61eb630670f5e@mail.gmail.com>
	<91705d081002231414q3a0bef51tcf260f9f4ec4c87f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91705d081002231414q3a0bef51tcf260f9f4ec4c87f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dan Nicholson <dbn.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 23, 2010 at 11:14 PM, Dan Nicholson <dbn.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> We could use gcc directly for depends (I have a patch to do it), but:
>
> 1. I don't think it would actually help much in terms of rebuilds
> since makedepend seems to do a perfectly adequate job of finding the
> needed headers.
>
> 2. gcc expects to output a single make target for a single source
> file. mesa just tosses all the source files at makedepend which
> generates a depend file with a bunch of targets. gcc is phenomenally
> slow doing the same. Changing the build to include one dep file per
> source file would be a ton of churn.
>
> 3. The fast way automake does gcc dep tracking is to do it as a step
> during the compile. Since gcc fully preprocesses the source file
> before generating the make target, you can get it for free during the
> compile. Doing as a separate step like mesa means you're throwing away
> the preprocessing and then doing it again immediately afterward. The
> time adds up.
>
> I guess what I'm saying is that I wouldn't bother with gcc dep
> tracking unless it's coming as part of automake.
>

Thanks for all these explanations !

>
> configure checks for makedepend, but doesn't error if it's not found.
> It probably should. Likewise, the commands running makedepend should
> probably not be silenced with stderr redirected to /dev/null. That
> would break builds for people using the static configs without
> makedepend.
>

Why do we need static configs ?
If I understand correctly, we have the choice between 1 autoconf file,
and more than 100 static config files ?
And autoconf can potentially capture all these static configurations and more ?

>
> I think the problem is more that it's not used consistently since it
> has to be setup manually in the Makefile vs. automatically like
> automake.
>

My understanding of autotools is still very limited. mesa currently
doesn't use automake, does it ?
A git grep automake lets me believe that it was dropped in 5.1

So currently makedepend needs to be setup manually in all the Makefiles ?

And using automake would give a big advantage on the two sides :
1) automatic makedepend setup
2) efficient use of gcc dep tracking
?

>
> I'd be comfortable having makedepend be a hard requirement in
> configure. Otherwise, I'd rather have this be AC_MSG_WARN([your
> message]) right after the AC_PATH_PROG for makedepend.
>

Actually I wanted to propose a hard requirement but then thought some
people might complain.
If I just put a AC_MSG_WARN right after AC_PATH_PROG, I am afraid it
won't make a big difference as it won't be very visible.
To make a hard requirement, I could just use AC_MSG_ERROR instead ?

[I wonder if it wouldn't be easier to make scons work like I want to
avoid all these problems.
I believe I would just need to add nouveau support, and probably look
into this :
# TODO: Build several variants at the same time?
# http://www.scons.org/wiki/SimultaneousVariantBuilds]

diff --git a/configure.ac b/configure.ac
index 485836a..a582337 100644
--- a/configure.ac
+++ b/configure.ac
@@ -28,8 +28,11 @@ AC_PROG_CPP
 AC_PROG_CC
 AC_PROG_CXX
 AC_CHECK_PROGS([MAKE], [gmake make])
-AC_PATH_PROG([MKDEP], [makedepend])
 AC_PATH_PROG([SED], [sed])
+AC_PATH_PROG([MKDEP], [makedepend], no)
+if test "x$MKDEP" = xno; then
+    AC_MSG_ERROR([makedepend not found])
+fi

 dnl Our fallback install-sh is a symlink to minstall. Use the existing
 dnl configuration in that case.
