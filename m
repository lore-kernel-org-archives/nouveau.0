From: Edgar =?iso-8859-1?B?RnXf?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Subject: Re: TDMS bandwidth limits
Date: Fri, 4 Feb 2011 12:33:48 +0100
Message-ID: <20110204113348.GQ26554@gumme.math.uni-bonn.de>
References: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
	<87k4hg4x0b.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87k4hg4x0b.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

> They're based on what the nvidia proprietary driver itself refuses to do,
Ah, I see. Thanks.

> though, I'm not 100% sure that I had nv44 in my sample when I made
> that change.
Looks like you were correct with the 155 limit for 44.

> It might be using a reduced-blanking mode,
Indeed it does. I had regarded this as unlikely given that, after all, the driver simply can't know how much blanking reduction the monitor will be able to cope with.

> check your Xorg.0.log to be sure. See the "-logverbose" option if you don't
> get all the timings printed out with the default verbosity level.
I do get the timings printed with -logverbose 9. I also get a message to the effect that reduced blanking was used to get the pixel clock within limits. What I don't get is the timing actually being used. Looks I have to figure out the values myself (and see how to teach the nouveau fb to use it).

Thanks for your help.
