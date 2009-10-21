From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Integrated GeForce 8200
Date: Wed, 21 Oct 2009 15:14:38 +1000
Message-ID: <1256102078.2216.3.camel@nisroch>
References: <fa8771800910202126s26cf658u9cc1a35055f170e9@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <fa8771800910202126s26cf658u9cc1a35055f170e9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: John W <jwdevel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2009-10-20 at 21:26 -0700, John W wrote:
> Hello,
> 
> I have an integrated GeForce 8200 video card (motherboard: MSI K9N2G Neo-FD).
> I have tried using the nouveau driver, but with no luck so far ):
> 
> The nouveau site does say "Some GPUs integrated onto the motherboard
> do not function with nouveau for some unknown reason. These include
> the GeForce 8200/8300 ..."
> And I have seen this bug: http://bugs.freedesktop.org/show_bug.cgi?id=18286
> 
> So my hopes are not high (:
> 
> Is there anything helpful I can provide to the nouveau folks w/regard
> to this issue?
> Other than just fixing it myself and submitting the patch, of course (:
> (working up to being able to debug driver code; not there yet)
> 
> Attached my Xorg.0.log in case that's useful.
There's no chance of having your card work on FreeBSD at this time
unfortunately.  It *should* work on Linux, using the kernel modesetting
driver paths however.

I have no plans whatsoever to bring the fixes/improvements present in
the nouveau kernel module back to the userspace portion of the driver.
So unless someone does this work, or ports the latest nouveau kernel
code to FreeBSD, you're out of luck.

Sorry!
Ben.
> 
> -John
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
