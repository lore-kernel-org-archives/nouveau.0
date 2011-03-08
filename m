From: Jacopo De Simoi <wilderkde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New window pixmap initialization
Date: Tue, 8 Mar 2011 22:30:20 +0100
Message-ID: <201103082230.20866.wilderkde@gmail.com>
References: <201103041034.09766.wilderkde@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201103041034.09766.wilderkde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Nevermind, I found out that it was a bizarre strategy of Qt for some specif=
ic window types
apologies for the noise

 _J
> Hello nouveau devs
> =

> I'd like some informations on the pixmap initialization for a new window =
in
> a (xrender) composited setting; I'm currently trying to improve the xrend=
er backend of
> kwin (i.e. kde composited window manager) and I'm facing some issues whic=
h might
> or might not be driver related.
> =

> From what it seems, when a new window is created with geometry (x y w h)
> the pixmap is first initialized with the content of the screen in the rec=
t (x y w h),
> is this correct?
> =

> This actually is causing glitches with effects that animate the appearanc=
e of the given window =

> by some kind of motion, since one can see for a split second a portion of=
 screen moving for no reason
> and afterwards the new window appearing (as soon as it has been first pai=
nted).
> =

> Imvho, if an argb window is created, it would  be much much cleaner to in=
it its pixmap with a fully
> transparent color; trying to implement this in the wm is kind of weird; o=
n the other hand
> I got pretty quickly lost examining ddx code, so I have a few questions:
> =

> 1=B7 Is first pixmap creation in a composited setting driver dependent?
> 2=B7 I assume that upon creation the contents of the pixmap should actual=
ly be undefined
>     and are init'd like I said for purely convenience reasons; is this co=
rrect? is there anything in the specs about that
>     which I did not see?
> 3=B7 Would it be possible for the nouveau driver to implement the alterna=
te initialization strategy for argb windows?
>     Does the new strategy make sense to you?
> 4=B7 I'd be happy to provide a patch for point 3, provided that somebody =
helps me out with finding the right place =

>     for it; =

> =

> Thanks a lot;
> __J
> =

> P.S. I'm always on IRC, nick wilder
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> =
