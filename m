From: Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau exposes backlight controls in presence of ACPI
Date: Tue, 02 Nov 2010 12:37:02 -0400
Message-ID: <1288715822.11373.6.camel@ayu>
References: <20101029154934.GA2076@aeneby.se> <1288670315.6477.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1288670315.6477.2.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2010-11-02 at 13:58 +1000, Ben Skeggs wrote:
> On Fri, 2010-10-29 at 17:49 +0200, Aaron Sowry wrote:
> > It seems to be de facto standard to only expose kernel-level
> backlight controls in the absence of ACPI, however nouveau does this
> regardless of whether ACPI equivalents are available or not. This will
> confuse userspace in some situations. Does this need patching or is
> there some reason for this behaviour?
> Yes, it appears that you're correct here.  I took a look into what is
> supposed to happen, and it looks fairly trivial to implement and stop
> nouveau providing nv_backlight if video.ko is already providing it.
> 
> However.  There's also the platform-specific modules (thinkpad etc) that
> will provide their own backlight methods if the standard ACPI mechanism
> isn't available.  I didn't see any immediately obvious way of knowing
> whether or not they were being provided.
> 
> I'm not too certain the best way to deal with this, any ideas? :)

It was my understanding that the future direction the kernel was going
to go with this is that all detected backlight devices would be
exported, with a tag in sysfs describing the type of interface
(platform, firmware, direct hardware, whichever). Then it would be up to
userspace to pick the correct backlight device to use based on the tags.
Nothing stopping a user from manipulating a different one directly, with
possible interesting side-effects, of course.

This doesn't seem to be ready yet, though... I've only seen some related
discussion on LKML a while ago.

Note that the thinkpad-acpi module at the moment is also checking for
the ACPI video device to be loaded, and will disable itself in that
case. So the case that causes problems right now is if you have e.g.
both thinkpad-acpi and nouveau, but no ACPI video device?

-- 
Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
