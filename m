From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Sat, 14 Jan 2012 13:14:04 +0100
Message-ID: <20120114131404.3f742857.mandin.patrice@orange.fr>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326195664-28384-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
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

Le Tue, 10 Jan 2012 12:41:00 +0100
Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> a =E9crit:

> This patch series silences some unknown cap warnings and fixes up
> coding style (patch 1+4).
> =

> The most important part of this series are the two patches in the       =

> middle. They rework the state_fb code, so that we are able to   =

> render to not 64 byte aligned targets, as this is the only real
> use-case for render temporaries this allows us to drop temp code
> completely and simplifies a lot of cases.
> =

> This is only tested on nv49, but there should be nothing different
> in this area for other nv3x or nv4x gpus.
> =

> I plan on working on top of that in the following days, so please
> review and apply as time permits.
> =

> Thanks,
> Lucas

Hello,

I just tried on my NV34 the whole series. Here is what I noticed:

- Seems rendering is a bit slower (in ioquake3, in the first map q3dm0,
rendering the mirror and the portal causes more audio stuttering) but
it it just my feeling.

- ut2004demo hangs at start (display just one frame in the nvidia
licence plate part), but the system does not crash, and the game can be
killed.

Do you want me to check which of your patches makes ut2004 hanging?

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
