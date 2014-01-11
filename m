From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Should I dump my Nvidia card from the less known
 brand "Gainward"?
Date: Sat, 11 Jan 2014 03:58:13 +0000
Message-ID: <52D0C155.1030902@gmail.com>
References: <1389357412.986013756@f300.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389357412.986013756-6x1OHWEv9lxsdVUOrk1QfQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Fernando Negro <fernando.negro-aPYA7nAdAYY@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10/01/14 12:36, Fernando Negro wrote:
>  Hi everyone.
> 
Hi Fernando,

> 
> I'm a big Free Software enthusiast and, therefore, I would very much like to use the nouveau free driver, instead of the proprietary one.
> 
> My problem is that, looking for the cheapest option available, when I needed to buy a new graphics card, 2 years ago, I decided for a model from a brand that I had never heard of - called "Gainward" - because I thought it had a better price/quality relationship than its ASUS equivalent with the same Nvidia chip.
> 
> My specific graphics cards is this one: http://www.gainward.com/main/product/vga/pro/p00472/p00472_datasheet_17204da7fe6add60c.pdf?s=125
> 
> Because I used to use a not completely free GNU/Linux distribution at the time, where one could easily install the proprietary driver, right after installing the distro, I've always run this last driver on it, and managed to find a version where it would run well.
> 
> But, now wanting to migrate to a completely free GNU/Linux distribution, I now notice better the problem that I have, with this specific graphics card, where I can't even make the nouveau drivers run on it, let alone run well...
> 
> I've already made several tests, with different kernels, and there's really no way that I can make this graphics card work with the nouveau driver. (My results here: http://trisquel.info/en/forum/nouveau-mi-eq-overflowing#comment-43762) And, the problem that appears, is what is listed here: http://trisquel.info/en/forum/nouveau-mi-eq-overflowing
> 
> And, after learning, in this mailing-list, that people who use this card's ASUS equivalent with the same Nvidia chip, don't have any of the problems that I have, I now know that this is a particular type/brand of card, or particular graphics card, that is not currently supported by the nouveau driver.
> 
> 
> So, my question is...
> 
> Knowing that Free Software is mainly developed to run on the most used type of computer components, and not being, apparently, my graphics card, one of this type of most used components, do the people here, in this mailing-list, know if, or think that, there's ever going to be some effort made to make the nouveau driver run on the type of graphics card that I have?
> 
> (What I want to know, in practical terms, is if it's worth keeping this graphics card for some possible use in the Future, when it will be supported, or if it's better for me to just sell it to someone who's not as interested as me in using only Free Software?)
> 
> 
> Thank you, all, in advance, for your answers.
> 
> And thank you very much, also, all of you, for the *great results* that I've already witnessed on other graphics cards.
> 

Now that was a lengthy email :)

With that said as most people working on nouveau are
volunteers/hobbyists and as such we tend to work on what interests us.

This does not mean that noone will _ever_ look your problem. I would
recommend that you go through the FAQ[1], Troubleshooting[2] and Bugs[3]
wiki.

From a quick glance I can see a few of interesting bits
* there is some missmatch between the reported amount of VRAM vs the one
calculated
[ 2.132258] [drm] nouveau 0000:02:00.0: memory controller reports 512MiB
VRAM
[ 2.132264] [drm] nouveau 0000:02:00.0: we calculated 1024MiB VRAM

* shortly after you're getting MEM_FAULT/IB_EMPTY errors (?related to
the actual amount of vram your card has?)

and last but not least
* you're using an _ancient_ kernel

Thus first and foremost I would advice that you experiment with various
kernels (older and newer) and (hopefully) you'll find one that does not
produce "PFIFO_DMA_PUSHER" style of messages.
You can easily check that even without X, just login in VT and look at
your dmesg output.

Good luck
Emil

[1] http://nouveau.freedesktop.org/wiki/FAQ/
[2] http://nouveau.freedesktop.org/wiki/TroubleShooting/
[3] http://nouveau.freedesktop.org/wiki/Bugs/

> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
