From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: makedepend in Mesa
Date: Tue, 23 Feb 2010 22:29:06 +0100
Message-ID: <b67489df1002231329v1e4411a5ncaa61eb630670f5e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa3d-dev <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

While keeping up-to-date the nouveau mesa driver (either classic or
gallium), or doing regression testing, the big majority of my rebuilds
resulted in segfaults.
I am not talking about autogen or configure detection. I believe this
also works automatically in other projects and doesn't with mesa, but
forgetting to do this usually causes a build failure. Then
autogen/configure can be run and make can resume the build.
What is more problematic is when an apparently successful build does
not work. The reply I used to get is just to make clean or
distclean/realclean. clean is usually works, but rebuilding everything
takes time. And regression testing needs a lot of rebuilding :)
Anyway I found this IRC discussion yesterday quite interesting :

20:30  * jbarnes curses the mesa build system
20:31 < jbarnes> change intel_fbo.h, nothing rebuilds
20:32 < Dr_Jakob> makedepend installed?
20:33 < jbarnes> yeah but it looks like we don't symlink intel_fbo.h
into i915 and include it in the makefile
20:33 < jbarnes> so I guess the deps don't get picked up
20:34 < Dr_Jakob> Hmm
20:34 < jbarnes> oh no I guess I don't have makedepend
20:34 -!- jsgf [~jeremy-ZcXrCSuhvlktFdR4KeJ2yPcEJKo2Qz8o1NOjf9nqTsILN5Mb03AwvQ@public.gmane.org] has
joined #dri-devel
20:34  * jbarnes tries again with that installed
20:35 < jbarnes> don't most projects just use gcc's dep tracking?
20:35 < Dr_Jakob> yes
20:36 < Dr_Jakob> I tried to add that but it mostly turned into fail.
20:37 < jbarnes> Dr_Jakob: you guys mostly build with scons these days right?
20:37 < jbarnes> and that has a separate set of files for tracking sources?
20:37 < Dr_Jakob> For windows yes, but I use make for linux.
20:37 < Dr_Jakob> Then again I'm pretty good at installing makedepend ;-)
20:37 < jbarnes> heh
20:39 < Dr_Jakob> I don't often have to do a make clean.
20:40 < suokko> I guess there is something broken in radeon makefiles
because make clean is required quite often
20:40 < suokko> Luckily ccache is very fast
20:40 < MostAwesomeDude> Yeah, ccache is a much better friend than makedepend.


21:48 < shining> still not very clear to me, should everyone have
makedepend installed for building mesa ?
21:49 < Dr_Jakob> it is higly recommended yes.
21:51 < shining> does it help with mesa build failures ? I have seen
many many times in #nouveau weird mesa behavior
                 because of build failure, and a make
distclean/realclean fixed it
21:51 < shining> sorry its not build failure
21:51 < Dr_Jakob> yes
21:51 < shining> it *seems* to build fun but it doesnt work correctly,
most of the time it simply segfaults
21:52 < shining> huh
21:52 < shining> s/fun/fine
21:54 < suokko> shining: Problem without makedepend is that in rebuild
make doesn't build all files that should be
                rebuild because it doesn't know about included files.
So if you link old and new object files and
                some memory layout changed you will get segfaults

22:49 < shining> then I would workaround it by requiring makedepend
22:51 < zackr> we don't have a configure step so you'll need to most
likely rewrite the build system to do that


I probably should look into ccache (and I probably will), but if
makedepend improves the rebuild situation, I believe it should be
better advertised.
And unless I am mistaken, mesa does have a configure step, I even
believed most people use that.
So my simple suggestion would be to simply print a warning if
makedepend is not detected.

I saw a report saying make clean was still needed with makedepend
installed, but maybe not every parts of mesa uses makedepend
correctly, like the nouveau driver ?

diff --git a/configure.ac b/configure.ac
index 485836a..ba5f267 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1441,6 +1441,11 @@ echo "        CFLAGS:          $cflags"
 echo "        CXXFLAGS:        $cxxflags"
 echo "        Macros:          $defines"

+if test "x$MKDEP" = x; then
+       echo ""
+       echo "        warning: makedepend is not installed, so it is
recommended to make distclean after any code change."
+fi
+
 echo ""
 echo "        Run '${MAKE-make}' to build Mesa"
 echo ""
