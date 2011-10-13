From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xrandr or xorg.conf... help with virtual size desktop
Date: Thu, 13 Oct 2011 10:26:02 -0400
Message-ID: <CAMVNhxRQOCZS4rVgxqCfQQUxZaoxRihSw96O3-m4WXDbjFshow@mail.gmail.com>
References: <87botluh8e.fsf@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87botluh8e.fsf-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Harry Putnam <reader-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Oct 13, 2011 at 9:57 AM, Harry Putnam <reader-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org> wrote:
> I've come at this a few different ways on this list and others. =A0But not
> really getting a solution. =A0Possibly there is none until some changes
> are made upstream.
>
> Setup: Debian Wheezy (testing) 3.0.0-1-686-pae
> Video card: Nvidia XF 5700LE
> Older P4 intel cpu 3.06 (single core)
> (Using Nouveau driver)
>
> My aim is to create a large pannable desktop either with use of
> xorg.conf or xrandr.
>
> In the past, on a Gentoo linux OS using the same hardware:
> (Cpu and video card the same as now and shown above in `Setup')
>
> It worked to have this in xorg.conf inside a screen subsection.
>
> =A0 =A0[...]
> =A0 =A0Subsection "Display"
> =A0 =A0 =A0 =A0Depth =A0 =A0 =A0 24
> =A0 =A0 =A0 =A0Modes =A0 =A0 =A0 "1280x1024" #"1024x768" "800x600" "640x4=
80"
> =A0 =A0 =A0 =A0Virtual =A0 =A0 2048 1536
> =A0 =A0 =A0 =A0ViewPort =A0 =A00 0
> =A0 =A0EndSubsection
> =A0 =A0[...]
>
> Note the `Virtual' line.
>
> The end result was a pannable desktop at size 2048x1536
>
> I haven't been able to figure out how to get that to work in a current
> xorg.conf created by: `Xorg -configure' (in console mode).
>
> I have inlined an attempted xorg.conf, that seems to work so far as X
> being usable but fails to provide the virtual size.
> (the xorg.conf is inlined following Xorg.0.log)
>
> ------- =A0 =A0 =A0 =A0--------- =A0 =A0 =A0 ---=3D--- =A0 =A0 =A0 ------=
--- =A0 =A0 =A0--------
>
> So I turned to xrandr, hoping to set something similar.
>
> And I believe xrandr commands such as:
>
> =A0xrandr --output DVI-I-1 =A0--mode 1440x900 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --fb 1440x900 --panning 1680x105
>
> or even the full previously available size:
>
> =A0xrandr --output DVI-I-1 =A0--mode 1440x900 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--fb 2048x1536 --panning 2048x1536
>
> Do set the size.
>
> Either of those appears to set the larger virtual size as I see an
> image I use as background grow very noticably... and a panel set at
> the bottom of my screen is pushed down out of site.
>
> All well and good, except the mouse cannot pan into the newly created
> space and is still confined to the visible borders.
>
> It appears to be because of this bug:
> =A0 https://bugs.freedesktop.org/show_bug.cgi?id=3D39994
> reported 2011-08-08
>
> Reading the comments, there have been a few patches submitted but
> apparently no actions taken as yet.
>
> Can any of you help me figure out how to get a large panning desktop?
> Is anyone here using or able to set a large panning desktop?
>
> I've inlined both a fresh Xorg.0.log and the current xorg.conf.
> (NOTE: xorg.conf was NOT in use when Xorg.0.log was created)
> ------- =A0 =A0 =A0 =A0--------- =A0 =A0 =A0 ---=3D--- =A0 =A0 =A0 ------=
--- =A0 =A0 =A0--------
> ------- =A0 =A0 =A0 =A0--------- =A0 =A0 =A0 ---=3D--- =A0 =A0 =A0 ------=
--- =A0 =A0 =A0--------
> This Xorg.0.log created following a reboot, and with no xorg.conf
>

The bug you're talking about is actually
https://bugs.freedesktop.org/show_bug.cgi?id=3D39949 for those
interested.

I don't spend much time with the xserver or DDX code so I might be
wrong, but panning is as far as I know largely handled by the server
and is not something the driver has much control over. You'll have to
wait until this is fixed there or perhaps you can downgrade your
server to 1.10 until it's fixed. I don't think there's anything that
can be done in nouveau to work around it.
