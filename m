From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: Re: When will KMS be the default?
Date: Wed, 16 Dec 2009 09:05:40 +0100
Message-ID: <20091216080540.68D7633C458@tippex.mynet.homeunix.org>
References: <6d4bc9fc0912101157i60ddeb58s5e1810530293771d@mail.gmail.com>
	<1260483689.30293.2.camel@nisroch>
	<20091211122326.4E4B233C44E@tippex.mynet.homeunix.org>
	<1260534656.4730.1.camel@nisroch>
	<20091211132401.25D7433C44F@tippex.mynet.homeunix.org>
	<1260539241.4730.4.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <1260539241.4730.4.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org said:
> skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org said:
> > > s not a solution by any means, but try:
> > >   Option "EXAPixmaps" "false"
> > > In your xorg.conf.  
> >
> > That does seem to do the trick! Thanks. 
> Cool :) 

FYI. I just did a update of the kernel and ddx to latest git versions (seeing 
the traffic on fixing low mem situations). Now I can run with EXAPixmas 
enabled and scrolling is fast again! :-)

Thanks guys!
