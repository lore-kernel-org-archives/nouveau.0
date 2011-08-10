From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39980] freezing nouveau
Date: Wed, 10 Aug 2011 11:53:54 -0700 (PDT)
Message-ID: <20110810185354.DF679130193@annarchy.freedesktop.org>
References: <bug-39980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39980

--- Comment #3 from Christoph Anton Mitterer <calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org> 2011-08-10 11:53:54 PDT ---
Hi.

>Would you mind removing the following package in order to
>establish if it's related/triggers the issue
>libgl1-mesa-dri-experimental
I feared you'd ask this ^^...
Well I can give it a try, of course I'll loose compiz, which I'm particularly
used to... might very well happen that it doesn't happen without this.

>For future reference would you mind attaching the whole log (dmesg)
>rather than pasting fragments of it in the report
ok,.. that was just a huge mess... and apart for the usual log messages
detection the card/etc. there was not DRI related output at all.


I just hat the same(?) issue on a nother machine, with basically the same
software config but a G94 (Geforce 9600 GT) with two monitors attached.
But this time,.. no output to the logs at all. Neither xorg.log, nor kernel
log.
And even the SysRq messages made it into the syslog before the system rebooted.
This particular system shows also a very easily reproducable bug, but I'll
report that in a spearate bug report.


>Can you please take a look at our Bugs [1] and FAQ [2]
>section to eliminite one of the most common root cause
I've actually read them,.. but honestly,... some things you suggest there are
rather "difficult" (and I've studied computer science) for end users to do...
especially using git head for everything is quite an effort, especially when
you want to keep rather in sync with your distro.


Cheers,
Chris.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
