From: Fernando Negro <fernando.negro-aPYA7nAdAYY@public.gmane.org>
Subject: Re: Should I dump my Nvidia card from the less known
 brand "Gainward"?
Date: Sat, 11 Jan 2014 23:48:17 +0000
Message-ID: <52D1D841.8090900@inbox.ru>
References: <52D0C155.1030902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52D0C155.1030902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi there, Emil.

Sorry for the "long story"... :)

It's just that, being an "outsider" (i.e. not a member of this 
mailing-list) and someone who just came here once before, to ask another 
question, I thought I should sort of "introduce" myself. :)

Unfortunately, (as I say in the link where I point to for my "results") 
I've already tried all sorts of different kernels, including the most 
recent ones (and I've also tried several different distributions), and 
there's really no way that I can make nouveau run on this particular card.

Besides the proprietary drivers (that run well on it), the only other 
driver that I can make run on my card is the generic "vesa" one - but, 
only if I add the "nomodeset" parameter at boot.

And, if I don't add this option to the kernel parameters (and just let 
the nouveau driver try to load), I always get black screens, when X 
loads, with every kernel that I try.

It's something in the card, itself, that makes nouveau not able to run 
on it... (Since that, as I said, people who have cards from well known 
brands that use the same chip - 
http://lists.freedesktop.org/archives/nouveau/2013-October/014677.html - 
don't have the same problem that I have.)
