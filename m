From: Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: git compile failure
Date: Sun, 1 Feb 2009 22:29:40 +1300
Message-ID: <34576580902010129v29659dfeo81ec52f9588d1560@mail.gmail.com>
References: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>
	<20090129231559.302a708e@daedalus.pq.iki.fi>
	<49830BB2.2040602@seiner.com>
	<20090130195749.4f03acb2@daedalus.pq.iki.fi>
	<4984E455.4070701@seiner.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4984E455.4070701-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Feb 1, 2009 at 12:52 PM, Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
> nouveau_drv.so built OK; the man page build crashed with
>
> Making all in man
> make[2]: Entering directory `/usr/src/nouveau/xf86-video-nouveau/man'
> make[2]: *** No rule to make target `nouveau.@DRIVER_MAN_SUFFIX@',
> needed by `all-am'.  Stop.
> make[2]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau/man'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau'

Did note from this error is causing RAOFs ppa
(https://launchpad.net/~raof/+archive/ppa) to fail on build for both
Hardy and Intrepid (apologies for using buntuisms).

Not sure what is going on here because there does appear to be a
Makefile and other stuff in the man sub dir.  Am not enough of a make
guru to work out what is meant to be happening here, looks like the
scripts are trying to build the man file for nouveau, but is
@DRIVER_MAN_SUFFIX@ meant to be 'man' or something else? '4'? ....

Cheers,

Mark
