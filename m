From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Lots of bugs in xubuntu lucid
Date: Wed, 16 Jun 2010 13:11:13 -0400
Message-ID: <AANLkTim8MKHZXKW0ybHVHqWTXgXQ3zwQxZiv1tJDIkyf@mail.gmail.com>
References: <1276634288.1379.45.camel@lynn>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1276634288.1379.45.camel@lynn>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexandr Revin <lyssdod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jun 15, 2010 at 4:38 PM, Alexandr Revin <lyssdod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello guys,
> i've decided to test nouveau driver and installed it recently from
> official repos. My videocard is GeForce 4 with additional S-video and
> Composite outputs, 64 MB of memory. I installed xubuntu, and tried to
> use nouveau driver instead of official nvidia's. After switching driver,
> the boot splash xubuntu logo turned into poor coloured low-resolutioned
> one, but X loaded normally. Xfce worked fine, but i decided to try LXDE
> with SLiM login manager.
>
> So, here's bugs:
>
> 1) X server is loading normally, but when i try to switch to virtual
> terminal (Ctrl-Fx) my monitor shows me "Out of range" message, keyboard
> and mouse are switching off too and it makes me to reboot pc to get
> back.
>
> 2) When i trying to boot into kernel single mode, my root console does
> not show the characters i typing, but generally it works, with the need
> of double-entered confirmation.
>
> 3) Corrupted colors! Especially black - i see a set of random sized huge
> gray pixels instead of solid black area. Other colors are suffering too,
> see http://imagebin.ca/view/ay3nrec.html.
>
>
> $uname -a
> Linux lynn 2.6.32-22-generic #36-Ubuntu SMP Thu Jun 3 22:02:19 UTC 2010
> i686 GNU/Linux
>
>
> $glxinfo
> $ glxinfo
> name of display: :0.0
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Error: couldn't find RGB GLX visual or fbconfig
>
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> Xlib: =A0extension "GLX" missing on display ":0.0".
> 2 GLXFBConfigs:
> =A0 visual =A0x =A0bf lv rg d st colorbuffer ax dp st accumbuffer =A0ms =
=A0cav
> =A0id dep cl sp sz l =A0ci b ro =A0r =A0g =A0b =A0a bf th cl =A0r =A0g =
=A0b =A0a ns b eat
> ----------------------------------------------------------------------
> Segmentation fault

Try without the monitor section in your xorg.conf. The driver should
be able to get you to the preferred mode of your monitor without much
help from your xorg.conf if the monitor has an accurate EDID.

Re glxinfo, you have bits of the Nvidia driver still installed:

(II) Loading /usr/lib/xorg/extra-modules/libglx.so
(II) Module glx: vendor=3D"NVIDIA Corporation"
	compiled for 4.0.2, module version =3D 1.0.0
	Module class: X.Org Server Extension

Re colors, I don't know about that one. Gamma or overlay related
maybe? Are colors washed out everywhere or just mplayer? If it's just
mplayer can you try a different output mode? (Something like -vo x11
on the command line.)
