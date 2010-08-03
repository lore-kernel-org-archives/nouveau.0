From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 29386] New: 2D performance drops drastically
	when enabling a 2nd monitor
Date: Tue, 3 Aug 2010 14:09:09 -0400
Message-ID: <AANLkTikqowu0i0fR7781uzaUPPwn9obMB0-BYxukTmSS@mail.gmail.com>
References: <bug-29386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Aug 3, 2010 at 1:37 PM,  <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=3D29386
>
> =A0 =A0 =A0 =A0 =A0 Summary: 2D performance drops drastically when enabli=
ng a 2nd
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0monitor
> =A0 =A0 =A0 =A0 =A0 Product: xorg
> =A0 =A0 =A0 =A0 =A0 Version: git
> =A0 =A0 =A0 =A0 =A0Platform: x86 (IA32)
> =A0 =A0 =A0 =A0OS/Version: Linux (All)
> =A0 =A0 =A0 =A0 =A0 =A0Status: NEW
> =A0 =A0 =A0 =A0 =A0Severity: normal
> =A0 =A0 =A0 =A0 =A0Priority: medium
> =A0 =A0 =A0 =A0 Component: Driver/nouveau
> =A0 =A0 =A0 =A0AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> =A0 =A0 =A0 =A0ReportedBy: malsaqer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> =A0 =A0 =A0 =A0 QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>
>
> Created an attachment (id=3D37547)
> =A0--> (https://bugs.freedesktop.org/attachment.cgi?id=3D37547)
> Xorg.0.log
>
> I have two 1280x1024 identical monitor and nv18 MX 440 older nvidia card.=
 The
> card has one VGA-1 and one DVI-I outputs. The operating system is Fedora =
13 and
> xorg-x11-server-Xorg-1.8.2-2.fc13.i686
> xorg-x11-drv-nouveau-0.0.16-7.20100423git13c1043.fc13.i686
> ___________________________
> $ lspci -vnn | grep nVidia
> VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX 44=
0 AGP
> 8x] [10de:0181] (rev a2) (prog-if 00 [VGA controller])
> ___________________________
> $ xrandr -q
> Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 4096 x 4096
> VGA-1 connected (normal left inverted right x axis y axis)
> =A0 1280x1024 =A0 =A0 =A060.0 + =A0 75.0
> =A0 1280x960 =A0 =A0 =A0 60.0
> =A0 1152x864 =A0 =A0 =A0 75.0
> =A0 1024x768 =A0 =A0 =A0 85.0 =A0 =A0 75.1 =A0 =A0 70.1 =A0 =A0 60.0
> =A0 832x624 =A0 =A0 =A0 =A074.6
> =A0 800x600 =A0 =A0 =A0 =A085.1 =A0 =A0 72.2 =A0 =A0 75.0 =A0 =A0 60.3 =
=A0 =A0 56.2
> =A0 640x480 =A0 =A0 =A0 =A085.0 =A0 =A0 72.8 =A0 =A0 75.0 =A0 =A0 66.7 =
=A0 =A0 60.0
> =A0 720x400 =A0 =A0 =A0 =A070.1
> DVI-I-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)
> 376mm x 301mm
> =A0 1280x1024 =A0 =A0 =A060.0*+ =A0 75.0
> =A0 1280x960 =A0 =A0 =A0 60.0
> =A0 1152x864 =A0 =A0 =A0 75.0
> =A0 1024x768 =A0 =A0 =A0 85.0 =A0 =A0 75.1 =A0 =A0 70.1 =A0 =A0 60.0
> =A0 832x624 =A0 =A0 =A0 =A074.6
> =A0 800x600 =A0 =A0 =A0 =A085.1 =A0 =A0 72.2 =A0 =A0 75.0 =A0 =A0 60.3 =
=A0 =A0 56.2
> =A0 640x480 =A0 =A0 =A0 =A085.0 =A0 =A0 72.8 =A0 =A0 75.0 =A0 =A0 66.7 =
=A0 =A0 60.0
> =A0 720x400 =A0 =A0 =A0 =A070.1
> TV-1 disconnected (normal left inverted right x axis y axis)
> _____________________________________________________________
>
> If I enable the VGA-1 at auto resolution, the 2D performance drops so bad=
 that
> when I raise a window, I see it gets painted on the screen for a couple of
> seconds. browser scrolling is so slow and all gui apps as well. Desktop e=
ffects
> are disabled.
> The commands I use are:
> ____________________________________________________
> $ xrandr --screen 0 --output VGA-1 --auto
> $ xrandr --screen 0 --output VGA-1 --left-of DVI-I-1
> ____________________________________________________
>
> Direct rendering is enabled according to glxinfo
> _______________________________________________
> $ glxinfo | grep -i render
> direct rendering: Yes
> OpenGL renderer string: Mesa DRI nv18 20091015
> _______________________________________________
>
> If I clone the monitors, however, performance is not dropped. I also tried
> lowering the resolutions of the monitors until performance did not drop w=
hen I
> reached the 1024x768 resolution for each screen.
>
> So it is probably the buffer size needed to accommodate the two outputs i=
n one
> big screen of size.
>
> I know this is an older card, but I also know it can handle two screens b=
ecause
> I have used it with FC12 and under with nVidia drivers with no performance
> problems.
>
> --

You're probably hitting fallbacks due to hardware limits. IIRC that
card's 3D engine has a 2k*2k limit for textures and two 1280x1024
screens side by side is well over 2k width. The nvidia driver 'works'
because they probably use the 2D engine instead of the 3D engine to do
X rendering and maybe break up their rendering into chunks if that
card's 2D engine has similar limits. Nouveau uses the 3D engine even
for 2D in order to support Xrender.
