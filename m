From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Build failure in Mesa
Date: Tue, 16 Feb 2010 11:00:48 +0100
Message-ID: <201002161100.48712.johannesobermayr@gmx.de>
References: <201002160925.27160.johannesobermayr@gmx.de>
	<1266310438.2256.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1266310438.2256.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am Dienstag, 16. Februar 2010 09:53:58 schrieb Ben Skeggs:
> On Tue, 2010-02-16 at 09:25 +0100, Johannes Obermayr wrote:
> > Hi,
> > 
> > Ben Skeggs latest changes in Mesa cause a build failure (libdrm is latest git ...).
> Rebuild latest libdrm from git, you'll also need an updated kernel
> module.
> 
> Ben.
<snip>

What does it mean? Do I need kernel-source for compiling Mesa now? Must kernel modules be installed at build time?

I use a script:
1. git pull -> libdrm Mesa nouveau/linux-2.6 nouveau/xf86-video-nouveau and all other xf86-video-*
2. git archive *.tar.bz2 (and mesa.diff) in specific sources for packages
3. apply current date by me (I do not know how to do it automatically ...)
4. upload sources to OBS
5. OBS builds the packages in dependency order ...

The same build failure is on openSUSE 11.2 and Factory for i586 and x86_64. I think 4 (re)builds should show that it does not build at all ...

Here is a full build log: http://www.mediafire.com/?n0mjimjtmlq
(xorg packages are only named 7.4 but they are already 7.5 or newer ...)

libdrm:
author	Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>	2010-02-16 05:42:00 (GMT)
committer	Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>	2010-02-16 05:42:00 (GMT)
commit	88e8a8bbaf026aa10225880001ab7ca1c392168a

Mesa:
author	Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>	2010-02-16 05:43:51 (GMT)
committer	Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>	2010-02-16 05:57:59 (GMT)
commit	828f545274a6da9b5d05aa23ae31959b121c38a2

Thanks again.
Johannes
