From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau and multiple video cards
Date: Sat, 18 Sep 2010 12:35:59 -0400
Message-ID: <AANLkTimWEBinSZ5mPVWhgVeHosN0Qh1N6GN8Uh_zbxZ-@mail.gmail.com>
References: <20100918160119.GA3930@scooter>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100918160119.GA3930@scooter>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Felix Blanke <felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Sep 18, 2010 at 12:01 PM, Felix Blanke <felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hi,
>
> is it possible to setup one virtual screen with 2 video cards and 3 monit=
ors?
>
>
> My setup looks like this:
>
> 01:00.0 VGA compatible controller: nVidia Corporation G72 [GeForce 7300 S=
E/7200 GS]
> (rev a1)
> 02:00.0 VGA compatible controller: nVidia Corporation G84 [GeForce 8600 G=
T] (rev a1)
>
>
> 02:00.0 is my primary video card with two monitors connected. 01:00.0 has=
 one monitor
> connected.
>
> xrandr only shows me 2 outputs :/
>
> scooter ~ # xrandr -q
> Screen 0: minimum 320 x 200, current 3760 x 1600, maximum 8192 x 8192
> DVI-I-2 connected 2560x1600+0+0 (normal left inverted right x axis y axis=
) 641mm x
> 400mm
> =A0 2560x1600 =A0 =A0 =A059.9*+
> =A0 1280x800 =A0 =A0 =A0 59.9
> DVI-I-3 connected 1200x1600+2560+0 right (normal left inverted right x ax=
is y
> axis) 408mm x 306mm
> =A0 1600x1200 =A0 =A0 =A060.0*+
> =A0 1280x1024 =A0 =A0 =A085.0 =A0 =A0 75.0 =A0 =A0 60.0
> =A0 1280x960 =A0 =A0 =A0 60.0
> =A0 1152x864 =A0 =A0 =A0 75.0
> =A0 1024x768 =A0 =A0 =A0 85.0 =A0 =A0 75.1 =A0 =A0 70.1 =A0 =A0 60.0
> =A0 832x624 =A0 =A0 =A0 =A074.6
> =A0 800x600 =A0 =A0 =A0 =A085.1 =A0 =A0 75.0 =A0 =A0 60.3
> =A0 640x480 =A0 =A0 =A0 =A085.0 =A0 =A0 75.0 =A0 =A0 60.0
> =A0 720x400 =A0 =A0 =A0 =A070.1
>
>
> Is there something special I have to do or is it not possible to use such=
 a setup
> with nouveau?
>
>
> Thanks for your help!

Currently not possible with nouveau. This is partially a limitation of
the X server, not just nouveau.
