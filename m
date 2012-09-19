From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau core in userspace
Date: Wed, 19 Sep 2012 17:15:12 +1000
Message-ID: <20120919071512.GA6395@turiel.redhat.com>
References: <5058A07C.10709@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5058A07C.10709-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dmitry Eremin-Solenikov <dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Sep 18, 2012 at 08:25:32PM +0400, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> I saw in the "core" commit message that you worked on the nouveau core 
> code in userspace. I'm currently digging into some old cards support and 
> would benefit from not having to tickle with kernel/reboot/etc. on every 
> change/crash. Do you have any userspace code that you can share, or did 
> I misinterpret the commit message?
You didn't misinterpret the message.  I haven't yet released the
userspace version of the code, but I expect to in the near future after
I've tidied it up a bit.

It'll probably appear around the same time that the reworked kernel
driver goes to Linus.

Ben.

> 
> -- 
> With best wishes
> Dmitry
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
