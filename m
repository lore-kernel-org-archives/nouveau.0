From: Kyle K <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv50/gallium patch series 2, fixes
Date: Mon, 29 Jun 2009 18:52:15 -0700
Message-ID: <aa85b9420906291852i2ca9da77he81cbe04437b0a5@mail.gmail.com>
References: <4A2FA30B.5080902@defora.org>
	<20090610164512.2259da49@daedalus.pq.iki.fi>
	<20090613000157.524d8440@laptop64.home>
	<1244857734.3791.0.camel@localhost.localdomain>
	<4A3E6E2C.10505@student.tuwien.ac.at>
	<4A428AFC.2070409@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A428AFC.2070409-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi there,
I'm getting quite good results, with your patches compared to the git
code I went from 12 GLX Visuals and 12 GLXFBConfigs to 36 for both.
glxgears magically started working, I can run pretty much all of the
demos from /progs/demos except few ones. Thanks for the patches, It
would be nice to have them reviewed and merged, it's better than
nothing ;).

On 6/24/09, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> Ah, obviously I DID introduce a few regressions in those patches,
> this should fix what I discovered so far; will be merged into
> the respective patches later.
>
> Christoph
>
