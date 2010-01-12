From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Tue, 12 Jan 2010 11:39:16 -0500
Message-ID: <jwvd41fcmde.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
	<20100110123340.7840da75@daedalus.pq.iki.fi>
	<20100110104302.GB4769@x200>
	<20100110131525.56d0a892@daedalus.pq.iki.fi>
	<4B4B5538.1050601@nimrod-online.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

> The general opinion appears to be "communicating the least possible". In 
> my opinion this means we shouldn't communicate shader speeds, voltages 
> and fan speeds. Assuming each GPU clock speed is unique (eg. not 2 equal 
> GPU speeds with different memory clock speeds) we could even suffice 
> with just the GPU speed (like scaling_available_frequencies in CPUFreq). 
> This can be done, as said, like cpufreq in sysfs. When GPU is not 
> unique, it's also possible to communicate those separated by a slash 
> ("135/150") or anything. Any other thoughts on this, either from Nouveau 
> or Radeon/Intel developers?

W.r.t showing the current state, I don't have much opinion.  But w.r.t
what can be changed via sysfs, I agree there should just be very few
settings: performance and powersave (where I'd expect powersave to use
an ondemand strategy since it's usually the most efficient power-wise,
tho if needed we could have an extra one for "ondemand").


        Stefan
