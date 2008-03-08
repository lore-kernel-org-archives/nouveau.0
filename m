From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Current state - how to get gallium-stuff running?
Date: Sun, 9 Mar 2008 00:00:13 +0200
Message-ID: <20080309000013.126a89d1@daedalus.pq.iki.fi>
References: <200803072132.23321.hanno@hboeck.de>
	<1204932443.8406.21.camel@CowboyLaputopu>
	<200803081504.35171.hanno@hboeck.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200803081504.35171.hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Hanno =?ISO-8859-1?Q?B=F6ck?= <hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 8 Mar 2008 15:04:30 +0100
"Hanno B=F6ck" <hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org> wrote:

> Using Gentoo, using the nouveau-overlay. Installing git-packages of libdr=
m, =

> x11-drm, xf86-video-nouveau. Changed mesa-package to fetch nouveau/mesa g=
it =

> with gallium-0.1 branch. installed that.

Here might be the reason, maybe the ebuild is still building the wrong
branch. Git ebuild coding has a nasty feature, but you are safe if you set
*both* TREE and BRANCH. And I don't remember if it requires other changes,
too.

Anyway, I'd recommend building mesa by hand, so you are sure which branch
you build and how.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
