From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50 backlight brightness
Date: Thu, 21 Oct 2010 20:45:20 +1000
Message-ID: <1287657920.3245.1.camel@nisroch>
References: <20101019091030.GA28588@aeneby.se>
	<1287573459.24955.11.camel@araqiel> <20101021091621.GA29567@aeneby.se>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101021091621.GA29567-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
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

On Thu, 2010-10-21 at 11:16 +0200, Aaron Sowry wrote:
> On Wed, Oct 20, 2010 at 09:17:39PM +1000, Ben Skeggs wrote:
> > I have a question to you that's important first:  if you fix nouveau's
> > max_brightness level, can you actually properly change the brightness?
> > 
> > I have an eDP laptop that shows the same backlight level regardless of
> > what's in that register.
> > 
> 
> By applying the attached patch I can properly change the brightness levels using g-p-m. The only question is what the 0x40000000 bit represents as set by BIOS/ACPI - both 0x40001fff and 0x00001fff seem to work fine as far as brightness levels are concerned.
Ok.  I'll look at all the kmmio/vbios data I have tomorrow, and come up
with some kind of "solution", it'll likely require tweaking as we see
more data.

What value does 0x610084 contain on boot for you?

Ben.
