From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Tue, 12 Jan 2010 20:59:27 +0000
Message-ID: <20100112205927.GA4431@srcf.ucam.org>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
	<20100110123340.7840da75@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100110123340.7840da75-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

The real question is what you want to be controlling. The two factors 
that we can actually influence are voltage and frequency - and on some 
cards we're limited to frequency. Everything else is then constrained by 
that choice. So the only thing that it makes sense to expose to 
userspace here is the frequency. As others have suggested, policy is 
probably best described in terms of either performance (fixed maximum 
frequency) or powersave (ondemand frequency shifting).

That's not to say that there aren't other constraints people may want to 
impose, but they're orthogonal. A user may want to stop their GPU from 
running at more than a certain temperature. That can be achieved by 
leaving this interface as is, but hooking it into the kernel thermal 
zone code. The user can then set a temperature limit and the kernel will 
automatically slow the chip down whenever it gets near that temperature. 
Since this is effectively a proxy for fan speed, that also gets catered 
for.

So I think a general policy knob (like scaling_cur_governor in cpufreq) 
ought to be sufficient here, possibly along with an indication of the 
instantaneous frequency because some people seem to like that kind of 
thing. Anything else sounds like overengineering.

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
