From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: When will KMS be the default?
Date: Fri, 11 Dec 2009 23:47:21 +1000
Message-ID: <1260539241.4730.4.camel@nisroch>
References: <6d4bc9fc0912101157i60ddeb58s5e1810530293771d@mail.gmail.com>
	<1260483689.30293.2.camel@nisroch>
	<20091211122326.4E4B233C44E@tippex.mynet.homeunix.org>
	<1260534656.4730.1.camel@nisroch>
	<20091211132401.25D7433C44F@tippex.mynet.homeunix.org>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091211132401.25D7433C44F-ZOnKU5P2/IUVO05zmlNvLXEk6Bp1+KyB2LY78lusg7I@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2009-12-11 at 14:24 +0100, Anders Eriksson wrote:
> skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org said:
> > s not a solution by any means, but try:
> >   Option "EXAPixmaps" "false"
> > In your xorg.conf.  
> 
> That does seem to do the trick! Thanks.
Cool :)

> 
> 
> > There'll be more work done to help the situation on
> > low-mem cards. 
> 
> Anything I should look out for and test? I seem to be the only one around
> running museum class hw... :-)
Not particularly, it's fairly easy to simulate the same problem on any
other card luckily :)

Ben.
> 
> -Anders
> 
