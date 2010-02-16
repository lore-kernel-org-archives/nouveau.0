From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Build failure in Mesa
Date: Tue, 16 Feb 2010 11:13:06 +0100
Message-ID: <6d4bc9fc1002160213k132a91fbi5446a041c1ad00ed@mail.gmail.com>
References: <201002160925.27160.johannesobermayr@gmx.de>
	<1266310438.2256.0.camel@nisroch>
	<201002161100.48712.johannesobermayr@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201002161100.48712.johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 16, 2010 at 11:00 AM, Johannes Obermayr
<johannesobermayr-Mmb7MZpHnFY@public.gmane.org> wrote:
> Am Dienstag, 16. Februar 2010 09:53:58 schrieb Ben Skeggs:
>> On Tue, 2010-02-16 at 09:25 +0100, Johannes Obermayr wrote:
>> > Hi,
>> >
>> > Ben Skeggs latest changes in Mesa cause a build failure (libdrm is lat=
est git ...).
>> Rebuild latest libdrm from git, you'll also need an updated kernel
>> module.
>>
>> Ben.
> <snip>
>
> What does it mean? Do I need kernel-source for compiling Mesa now? Must k=
ernel modules be installed at build time?

He meant, you need a new libdrm (and the latest requires a new kernel
module to actually run). In reality that part of mesa needs to be
updated to the latest libdrm api, because you already have the latest
libdrm.

>
> I use a script:
> 1. git pull -> libdrm Mesa nouveau/linux-2.6 nouveau/xf86-video-nouveau a=
nd all other xf86-video-*
> 2. git archive *.tar.bz2 (and mesa.diff) in specific sources for packages
> 3. apply current date by me (I do not know how to do it automatically ...)
> 4. upload sources to OBS
> 5. OBS builds the packages in dependency order ...
>
> The same build failure is on openSUSE 11.2 and Factory for i586 and x86_6=
4. I think 4 (re)builds should show that it does not build at all ...
>
> Here is a full build log: http://www.mediafire.com/?n0mjimjtmlq
> (xorg packages are only named 7.4 but they are already 7.5 or newer ...)
>
> libdrm:
> author =A0Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> 2010-02-16 05:42:00 (GMT)
> committer =A0 =A0 =A0 Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> 2010-02-16 05:42:00=
 (GMT)
> commit =A088e8a8bbaf026aa10225880001ab7ca1c392168a
>
> Mesa:
> author =A0Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> 2010-02-16 05:43:51 (GMT)
> committer =A0 =A0 =A0 Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> 2010-02-16 05:57:59=
 (GMT)
> commit =A0828f545274a6da9b5d05aa23ae31959b121c38a2
>
> Thanks again.
> Johannes
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
