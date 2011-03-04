From: Jacopo De Simoi <wilderkde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: New window pixmap initialization
Date: Fri, 4 Mar 2011 10:34:09 +0100
Message-ID: <201103041034.09766.wilderkde@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hello nouveau devs

I'd like some informations on the pixmap initialization for a new window in
a (xrender) composited setting; I'm currently trying to improve the xrender=
 backend of
kwin (i.e. kde composited window manager) and I'm facing some issues which =
might
or might not be driver related.

From what it seems, when a new window is created with geometry (x y w h)
the pixmap is first initialized with the content of the screen in the rect =
(x y w h),
is this correct?

This actually is causing glitches with effects that animate the appearance =
of the given window =

by some kind of motion, since one can see for a split second a portion of s=
creen moving for no reason
and afterwards the new window appearing (as soon as it has been first paint=
ed).

Imvho, if an argb window is created, it would  be much much cleaner to init=
 its pixmap with a fully
transparent color; trying to implement this in the wm is kind of weird; on =
the other hand
I got pretty quickly lost examining ddx code, so I have a few questions:

1=B7 Is first pixmap creation in a composited setting driver dependent?
2=B7 I assume that upon creation the contents of the pixmap should actually=
 be undefined
    and are init'd like I said for purely convenience reasons; is this corr=
ect? is there anything in the specs about that
    which I did not see?
3=B7 Would it be possible for the nouveau driver to implement the alternate=
 initialization strategy for argb windows?
    Does the new strategy make sense to you?
4=B7 I'd be happy to provide a patch for point 3, provided that somebody he=
lps me out with finding the right place =

    for it; =


Thanks a lot;
__J

P.S. I'm always on IRC, nick wilder
