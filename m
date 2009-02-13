From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Sat, 14 Feb 2009 00:07:34 +0100
Message-ID: <6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>
References: <49959366.2000805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49959366.2000805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Kardashevsky <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2009/2/13 Alexey Kardashevsky <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> I am newbie in this topic and I have problems trying to bring x.org up on
> the hardware I have:
> IBM QS22 BladeServer (PowerPC64 architecture) with PCI-Express connected
> nVidia 6200 video card.
> OS: Fedora 10-ppc: Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue Feb 10
> 14:55:56 EST 2009 ppc64 ppc64 ppc64 GNU/Linux
>

How many PCI domains does that machine have ? Current libpciaccess is
broken, in that PCI cards only work in the first domain. So the
solution is to put the card in a slot from the first domain if
possible. You are screwed otherwise (well, you could replace the
hardcoded first domain in pciaccess with the right domain and it might
work, I don't know...)

Stephane
