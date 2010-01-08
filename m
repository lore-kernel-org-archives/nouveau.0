From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Fri, 08 Jan 2010 10:14:10 +1000
Message-ID: <1262909650.7007.1.camel@araqiel>
References: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
	<6d4bc9fc0912111604oca0be3dm7f001bb05e85084@mail.gmail.com>
	<6d4bc9fc0912121350x54cde8b5yf72552c2d89ca2ab@mail.gmail.com>
	<91752840912131235v7e2a289ap32e92ef95574ce8b@mail.gmail.com>
	<91752841001071551i22069238of23551dc4b67cf39@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752841001071551i22069238of23551dc4b67cf39-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, 2010-01-08 at 00:51 +0100, Xavier wrote:
> On Sun, Dec 13, 2009 at 9:35 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sat, Dec 12, 2009 at 10:50 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> Can you retry with the latest ddx?
> >>
> >> Maarten.
> >>
> >
> > Awesome, it works, thanks ! :)
> >
> 
> I did not update that box for 3 weeks. I just did today (drm+ddx), and
> it has regressed.
Can you update your libdrm too please, the fix was moved to there and
reverted in the DDX.

Thanks,
Ben.
> X lockup is back, but it does not seem to be as bad as before :
> alt+sysrq+k kills X, then it gets restarted (probably by gdm) and
> everything is fine again.
> Still 5 minutes of firefox browsing causing X lockups is not cool :)
> 
> I will do some bisection tomorrow, I guess I will start with ddx.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
