From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH] nvfx: fix nv3x fallout from state validation
	changes
Date: Thu, 26 Jan 2012 20:59:42 +0100
Message-ID: <20120126205942.7416fabb.mandin.patrice@orange.fr>
References: <1327395271.4520.2.camel@antimon>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1327395271.4520.2.camel@antimon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le Tue, 24 Jan 2012 09:54:31 +0100
Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> a =E9crit:

> From c998f732d42da5e962fe5da294493132c3e8dc5f Mon Sep 17 00:00:00 2001
> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> Date: Tue, 24 Jan 2012 09:46:32 +0100
> Subject: [PATCH] nvfx: fix nv3x fallout from state validation changes
> =

> Apparently nv3x needs some curde hacks to work properly. This
> is clearly not the right fix, but it's the behaviour of the old
> code and fixes regressions seen by users.

Hello,

Sorry Lucas, but I finally found a test case I have forgotten, that
would maybe need reverting your patches.

In mesa-demos/src/demos you'll find fbo_firecube test program that have
the scene misrenderered (the scene part that is rendered and used as
texture on the cube).

As far as I remember now, render temp stuff was used to handle fbo
combinations supported on nv40 but not on nv30, or something like that.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
