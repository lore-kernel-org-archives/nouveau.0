From: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Subject: Re: Fwd: [PATCH] nouveau: Fix unconditional return
 waiting on memory
Date: Tue, 9 Apr 2013 08:04:46 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1304090803240.18231@skynet.skynet.ie>
References: <20130408020117.GA6479@gmail.com>
	<CA+GA0_tm86Z7H6mGi056BhWrq2=+_69N3Xcn3HUCa_hQuB_Wqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CA+GA0_tm86Z7H6mGi056BhWrq2=+_69N3Xcn3HUCa_hQuB_Wqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-2?Q?Marcin_=A6lusarz?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


> 
> This is ridiculous. If such trivial bugfixes need to be reposted so many
> times, what does it say about the maintainer? Can we have a real one?
> 

This isn't a trivial bugfix though, if it was I'd have just merged it

When mistakes like that happen, fixing them can sometimes end causing 
wierd regressions, so don't think just because it one semicolon that it 
has only a trivial effect or needs no testing.

Dave.
