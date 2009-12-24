From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing text and icons with NV25
Date: Thu, 24 Dec 2009 10:12:47 +0100
Message-ID: <91752840912240112ud844995ub24afadfd9edbf5f@mail.gmail.com>
References: <1261610943.15419.0@ffortso4>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261610943.15419.0@ffortso4>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 24, 2009 at 12:29 AM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:
> Hello,
>
> I'm using nouveau xf86-video-nouveau 0.0.10_git20091101-1 and
> nouveau-drm 0.0.15_20091120-1 under Arch Linux with xorg-server
> 1.7.3.901-1. =A0My video card is recognized as "nVidia Corporation NV25GL
> [Quadro4 750 XGL]".
>

I am not sure there has been a lot of changes for nv25, but 1-2 months
can be a lot in nouveau development.
You should try newer packages first. Btw arch has up-to-date nouveau
packages in testing (built for kernel 2.6.32 also in testing). They
should move soon but you can always try them now.

> X starts (with no apparent errors) but it's essentially unusable, since
> it's missing all the icons on all the panels and toolbars, and no text
> shows up at all. =A0For example, I can start an xterm, since I know where
> the icon is on the panel, and I can type commands, which by the cursor
> movement seem to be working correctly, but there is no visible text in
> the term. =A0Popups (such as right-clicking on the main window) have some
> clutter/video noise - but no text or icons. =A0I see no obvious error
> messages in the log or dmesg.
>
> This seems similar to the report in Bug 14092
> (https://bugs.freedesktop.org/show_bug.cgi?id=3D14092) but that was from
> March 2008, so I figure the fix would be in the version I'm running.
>
> If this is a known issue, feel free to point me to the documentation
> I've obviously missed. =A0Otherwise, what else should I post to assist
> with troubleshooting? =A0(I'll defer posting even xorg.conf and the Xorg
> log until someone claims they will be of use.)
>
> Thanks for any suggestions or assistance.
>

If newer packages do not work, you should definitely post dmesg and Xorg lo=
g.
About xorg.conf , if you have a complex one, you could try with a
minimalistic one first.
See http://nouveau.freedesktop.org/wiki/InstallNouveau
or http://wiki.archlinux.org/index.php/Nouveau#Configuration
