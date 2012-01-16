From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Mon, 16 Jan 2012 17:54:12 +0100
Message-ID: <20120116175412.d690d2b9.mandin.patrice@orange.fr>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<20120114131404.3f742857.mandin.patrice@orange.fr>
	<1326672554.1672.39.camel@tellur> <1326731626.1659.12.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326731626.1659.12.camel@tellur>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le Mon, 16 Jan 2012 17:33:46 +0100
Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> a =E9crit:

> I seems Marek has just accidentally pushed the whole series. So we have
> a bit of a difficult situation here. I'm not sure if we should just
> revert or if we can leave the patches upstream.
> =

> I'm aware that this patches haven't received much testing by others than
> me and that a review of the code is still oustanding, but I like to
> stress the point that these patches are rigorously tested by me and are
> relatively low risk.
> =

> Patrice your report of this patchset not working did surprise me, so can
> you please make sure those patches are really the cause for your issues?
> I heard reports that nv3x is not working properly with mesa/master for
> some time. I tried to reproduce the problem on my nv49 setup and I don't
> see any issues besides the well known vertex corruption, which is most
> likely due to some missing reloc somewhere or the like.

Ok I'll try by cleaning and rebuilding everything in mesa. But maybe
the issue I spotted is not as severe as it seems, if I can still
reproduce it.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
