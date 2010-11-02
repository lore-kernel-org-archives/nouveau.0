From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau exposes backlight controls in presence of ACPI
Date: Wed, 03 Nov 2010 08:37:51 +1000
Message-ID: <1288737471.6100.0.camel@nisroch>
References: <20101029154934.GA2076@aeneby.se>
	<1288670315.6477.2.camel@nisroch>  <20101102145153.GA4075@aeneby.se>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101102145153.GA4075-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
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

On Tue, 2010-11-02 at 15:51 +0100, Aaron Sowry wrote:
> > However.  There's also the platform-specific modules (thinkpad etc) that
> > will provide their own backlight methods if the standard ACPI mechanism
> > isn't available.  I didn't see any immediately obvious way of knowing
> > whether or not they were being provided.
> > 
> > I'm not too certain the best way to deal with this, any ideas? :)
> 
> See attached patch, which prevents nouveau registering a backlight control if ACPI already provides one. If there are no glaring errors in the code/implementation then I would like to submit it.
This is much like what I intended to commit.  I guess it doesn't hurt to
do so, it doesn't help with all cases yet but if it fixes issues for
some people, why not.

Ben.
> 
> Dealing with platform-specific modules is tricky because it looks like nouveau initialises itself quite early on in the boot process:
> 
> [aaron@jules ~]$ dmesg | grep ACPI
> ...
> [    3.359377] nouveau 0000:01:00.0: power state changed by ACPI to D0
> [    3.359560] nouveau 0000:01:00.0: power state changed by ACPI to D0
> [    4.860678] [drm] nouveau 0000:01:00.0: Detected ACPI backlight support, not registering control
> [   14.206997] ACPI: WMI: Skipping duplicate GUID 05901221-D566-11D1-B2F0-00A0C9062910
> [   14.207693] ACPI: WMI: Mapper loaded
> [   17.686907] thinkpad_acpi: ThinkPad ACPI Extras v0.24
> [   17.689517] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
> [   17.756039] thinkpad_acpi: Standard ACPI backlight interface available, not loading native one.
> 
> My suggestion would be that it is the responsibility of user-space to select an appropriate ACPI backlight control.
> 
> /Aaron
