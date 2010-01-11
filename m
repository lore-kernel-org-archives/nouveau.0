From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Mon, 11 Jan 2010 17:45:38 +0100
Message-ID: <4B4B55B2.9030309@student.tudelft.nl>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>	<20100110123340.7840da75@daedalus.pq.iki.fi>	<20100110104302.GB4769@x200>
	<20100110131525.56d0a892@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100110131525.56d0a892-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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

On 10-01-10 12:15, Pekka Paalanen wrote:
> On Sun, 10 Jan 2010 12:43:02 +0200
> Alexey Dobriyan<adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>
>
>>> On Thu,  7 Jan 2010 22:44:24 +0100
>>> r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org wrote:
>>>
>>>
>>>> 1. joi pointed out that procfs is deprecated, and I should use
>>>> sysfs instead.
>>>>
>> /proc is not deprecated per se, you simply shouldn't expose
>> everything you know to userspace, because it will be impossible
>> to remove later.
>>
> I think adding "random crap" to procfs is frowned upon nowadays,
> that's probably what he meant. Attributes should be in sysfs.
> What to expose is another question, you are right.
>
> If the interface is just temporary, it should probably go into
> debugfs. That way one can have the code in the kernel proper,
> not fear about freezing it, and prevent people from finding it
> by accident. And it should be guarded by an "EXPERIMENTAL, DANGEROUS"
> Kconfig option in any case.
>
>
I'm thinking long term right now for this discussion, probably for the 
short run only some debugfs interfaces are needed. For now I'll do some 
work in Debugfs.

The general opinion appears to be "communicating the least possible". In 
my opinion this means we shouldn't communicate shader speeds, voltages 
and fan speeds. Assuming each GPU clock speed is unique (eg. not 2 equal 
GPU speeds with different memory clock speeds) we could even suffice 
with just the GPU speed (like scaling_available_frequencies in CPUFreq). 
This can be done, as said, like cpufreq in sysfs. When GPU is not 
unique, it's also possible to communicate those separated by a slash 
("135/150") or anything. Any other thoughts on this, either from Nouveau 
or Radeon/Intel developers?

On Sun, Jan 10, 2010 at 12:33:40PM +0200, Pekka Paalanen wrote:
 > "btw. I think max powersaving and no performance loss are mutually
 > exclusive, since changing power modes is not free nor instantenous.
 > Or is it? How much of the card you need to stop to change clocks and
 > volts? Do you need to sync to vblank to prevent visual glitches?"

I can't tell for now, the main reason I started this "discussion" is to 
work towards a unified way of scaling (not just for nouveau, but also 
radeon and intel), so that we can hook nouveau up as soon as everything 
is figured out, without having to wait for these design choices. As for 
the clock changing. I personally expect switching modes wouldn't cost 
too much, and more important, It shouldn't occur a lot. You can never 
tell with 100% accuracy when the power is needed (I tried predicting the 
future, but I didn't get much further than predicting my dinner), so 
trying to change the clock frequency lots of times in one second will 
help nobody. What I meant with that paragraph however is that I don't 
think it's useful to design several algorithms (in nouveau) for 
different situations. It's either manually choosing a clock (as user) or 
let "some" algorithm choose based on the load or the size of the working 
queue (... and the temperature of the card). Agreed? Was this what you 
meant with GPU-ondemand (automated scaling) and GPU-performance (fixed 
user-defined speed)?

RSpliet
