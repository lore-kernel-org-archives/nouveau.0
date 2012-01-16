From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Mon, 16 Jan 2012 11:48:25 -0500
Message-ID: <CAMVNhxQ4GGs7zCxBhzGTMa6H6rpitSsd=GcH-NraJv7MpuXFGg@mail.gmail.com>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<20120114131404.3f742857.mandin.patrice@orange.fr>
	<1326672554.1672.39.camel@tellur> <1326731626.1659.12.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 16, 2012 at 11:33 AM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> I seems Marek has just accidentally pushed the whole series. So we have
> a bit of a difficult situation here. I'm not sure if we should just
> revert or if we can leave the patches upstream.
>
> I'm aware that this patches haven't received much testing by others than
> me and that a review of the code is still oustanding, but I like to
> stress the point that these patches are rigorously tested by me and are
> relatively low risk.
>
> Patrice your report of this patchset not working did surprise me, so can
> you please make sure those patches are really the cause for your issues?
> I heard reports that nv3x is not working properly with mesa/master for
> some time. I tried to reproduce the problem on my nv49 setup and I don't
> see any issues besides the well known vertex corruption, which is most
> likely due to some missing reloc somewhere or the like.
>
> Regards,
> Lucas
>

This should not have been pushed without at least having been tried on
nv30. You can test every application on earth if you want, but there
are nv30 code paths/limits/behaviours both in userspace and kernel
that you'll never hit running on an nv40, so rigorous testing is
irrelevant in that regard.

Of course the userbase for these cards is dwindling anyway so it's not
a big deal as long as it can be fixed before it gets released.
