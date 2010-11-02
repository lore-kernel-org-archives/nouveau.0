From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau exposes backlight controls in presence of ACPI
Date: Tue, 02 Nov 2010 13:58:35 +1000
Message-ID: <1288670315.6477.2.camel@nisroch>
References: <20101029154934.GA2076@aeneby.se>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101029154934.GA2076-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2010-10-29 at 17:49 +0200, Aaron Sowry wrote:
> It seems to be de facto standard to only expose kernel-level backlight controls in the absence of ACPI, however nouveau does this regardless of whether ACPI equivalents are available or not. This will confuse userspace in some situations. Does this need patching or is there some reason for this behaviour?
Yes, it appears that you're correct here.  I took a look into what is
supposed to happen, and it looks fairly trivial to implement and stop
nouveau providing nv_backlight if video.ko is already providing it.

However.  There's also the platform-specific modules (thinkpad etc) that
will provide their own backlight methods if the standard ACPI mechanism
isn't available.  I didn't see any immediately obvious way of knowing
whether or not they were being provided.

I'm not too certain the best way to deal with this, any ideas? :)

Ben.
> 
> /Aaron
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
