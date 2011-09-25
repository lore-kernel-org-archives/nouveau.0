From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Sun, 25 Sep 2011 05:08:36 -0700 (PDT)
Message-ID: <20110925120836.024C51300C8@annarchy.freedesktop.org>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #13 from rick <rick.hendricksen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-25 05:08:35 PDT ---
(In reply to comment #12)
> Rik
> 
> Can you please indicate what exactly do you mean with
> 
> "Brightness control does not work with this option for me."
>
> Does it work before suspending the system?
Brightness control does not work before suspend, I did not try suspending. So
no.
> Can you please attach your dmesg log, as it is the one relevant in this case
> (whereas xf86-video-nouveau, mesa and libdrm are not)

will post in a few minutes (need to get laptop)

> 
> Auke, Rik
> 
> AFAIK brightness/backlight is(can be) controlled via
> 1. ACPI
> 2. platform specific - (asus-laptop, samsung-laptop, thinkpad ...)
> 3. the gpu/card itself
> 
> On various system different ones work correctly
> 
> By default nouveau does not register it's device if an ACPI one exists
> Note that the blob has similar behaviour but they have an option to override
> it.
> 
> If you suspect that the ACPI backlight control is buggy you can disable it by
> appending "acpi_backlight=vendor" to your kernel command line

I tried that. It works exactly the same as without this option. Brightness
control works fine before suspend, fails after.

> This will fall back to either 2. or 3. - dmesg will tell you which one
> 
> Feel free to give it a try
> 
> Cheers
> Emil

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
