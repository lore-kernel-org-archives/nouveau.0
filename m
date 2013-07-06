From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: IMPORTANT : Regression since kernel > 3.4 as regards
 suspend to RAM while using 3D accel
Date: Sat, 6 Jul 2013 16:57:10 -0400
Message-ID: <CAKb7UvjXnY4uc-zAFYnoZ_wrN7t2GAGbMRusgaDzzT4hYLhLaw@mail.gmail.com>
References: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ@mail.gmail.com>
	<CA+T9nP9cBcUmMZXNWVWCEacp=-BVRWNuiz8YeiWOVsyP5WDK=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CA+T9nP9cBcUmMZXNWVWCEacp=-BVRWNuiz8YeiWOVsyP5WDK=g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jul 6, 2013 at 3:27 AM, Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> After bisection I found the first bad commit :
>
> 5e120f6e4b3f35b741c5445dfc755f50128c3c44 is the first bad commit
> commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Apr 30 13:55:29 2012 +1000
>
>     drm/nouveau/fence: convert to exec engine, and improve channel sync
>
>     Now have a somewhat simpler semaphore sync implementation for nv17:nv84,
>     and a switched to using semaphores as fences on nv84+ and making use of
>     the hardware's >= acquire operation.
>
>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> :040000 040000 8f2ca4ddf4969c75f688a96fdb152e449fda4852
> da67a1bd8d608577e659a26715cf8af3644d8efe M    drivers
>
> bad kernel name : 3.4.0-1-ARCH-00591-g5e120f6-dirty
>
> Strangely, when I git checkout with the bad commit, it says :
> "HEAD is now at 5e120f6... drm/nouveau/fence: convert to exec engine, and
> improve channel sync"
>
> But I checked, this commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44 is the
> first bad one.

It looks as though there were a few follow-on fixes to the nvc0 fence
code, at least one of them directly suspend-related. What if you try
them together, i.e. something like

git branch testing 5e120f6e4
git checkout testing
git cherry-pick 906c033e2
git cherry-pick d6ba6d215

and then test that kernel? Do you still see the issues? If so, then
the fixes were incomplete. If the issues go away, then some second
issue was introduced at some later point.

  -ilia
