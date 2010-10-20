From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50 backlight brightness
Date: Wed, 20 Oct 2010 21:17:39 +1000
Message-ID: <1287573459.24955.11.camel@araqiel>
References: <20101019091030.GA28588@aeneby.se>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101019091030.GA28588-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2010-10-19 at 11:10 +0200, Aaron Sowry wrote:
> Hi,
> 
> The NV50 codepath in nouveau_backlight.c invariably sets max_brightness to 1025, regardless of the chipset in question. The maximum brightness is not 1025 for all NV50 chipsets (for example, by setting the brightness via ACPI controls and peeking the brightness register, I find that the maximum brightness level for my a8 card is 0x4001df67 although I am unsure of the significance of the MSB).
> 
> This means when anything manipulates the backlight using nouveau controls (in my case, usually g-p-m), I get very low backlight brightnesses. 2 questions:
> 
> 1) Is this a known problem, and has it been looked at before? My affected laptop is a ThinkPad and I know that some Macbooks are also affected, so I would be surprised if it isn't fairly common.
> 
> 2) In the absence of a reliable way to determine a card's max_brightness by peeking registers or similar, is some kind of mapping table in the code an acceptable solution for assigning max_brightness values to certain chipsets?
I have a question to you that's important first:  if you fix nouveau's
max_brightness level, can you actually properly change the brightness?

I have an eDP laptop that shows the same backlight level regardless of
what's in that register.

Ben.
> 
> This has been discussed at some length on the RedHat bugzilla here:
> https://bugzilla.redhat.com/show_bug.cgi?id=625171
> 
> Cheers,
> Aaron
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
