From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Tested nouveau on a Quadro NVS 140M
Date: Thu, 4 Sep 2008 19:21:13 +0200
Message-ID: <6d4bc9fc0809041021q1837be17m784a67b5a76bbc9a@mail.gmail.com>
References: <f11ad1180809040836p4500eda4l3072e6af00d62fcf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f11ad1180809040836p4500eda4l3072e6af00d62fcf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?S=E9bastien_Mazy?= <melyadon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2008/9/4 S=E9bastien Mazy <melyadon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi,
>
> I've just tried nouveau for the first time and I'd like to thank you
> all for your hard work. It works well, and I'm especially impressed to
> see xv running on my card (NV50 generation). Here is a brief report of
> my test.
>
> Details:
> - Card is Quadro NVS 140M
> - nouveau-drm and xf86-video-nouveau are from today's git
> - linux 2.6.26.3 from archlinux
> - X.Org X Server 1.4.99.906 (1.5.0 RC 6) from archlinux (testing repo)
> - minimalist xorg.conf attached
> - Xorg log attached
>
> What works:
> - auto-detection of my LVDS screen resolution (1680x1050)
> - 2d seems fast, scrolling in firefox isn't laggy
> - xv works \o/ unlike with nv
> - xcompmgr
>
> What doesn't:
> - "Overbold", hardly readable nautilus window title sometime
> - The character 'j' vanishes sometime in gajim (and maybe in other someti=
mes)
> - The character '3' looks weird sometime in gajim (and maybe in other
> softwares). See capture attached. This problem does not appear at the
> same moment as the 'j' problem.

I've seen issues with fonts turning white, but not just a single letter.
I also haven't seen your 3 issue.

> - gnome screenshot utility freezes when saving screenshots (doesn't
> affect gimp). See capture attached (not very useful, though).

Is this a seperate package (i don't want to install a whole gnome)?

> - black square in firefox instead of an image. See capture attached
> (unlike in other captures, the black square was displayed on the
> screen, I did not add it). Launching xcompmgr made the image display
> as it should (but I don't know if it's related).
> - I've lots of "[drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
> [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x08dc Data
> 0x00000000:0x00000000" in dmesg

These errors mean something went wrong during blitting, what
precisely, i do not know.

>
>
> Please tell me if you want me to perform new tests or give more debug inf=
o.
>
> Cheers,
>
> --
> S=E9bastien Mazy
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
