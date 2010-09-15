From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Wed, 15 Sep 2010 16:32:35 -0700 (PDT)
Message-ID: <20100915233235.B11EF1300CD@annarchy.freedesktop.org>
References: <bug-30158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30158

--- Comment #6 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-15 16:32:35 PDT ---
(In reply to comment #5)
> try to blacklist vga16fb first - see
> https://wiki.ubuntu.com/X/Troubleshooting/Nouveau#Disable%20vga16fb
> 
> (the log says it is "not registering due to another framebuffer present", but
> it's not completely true)

I have blacklisted vga16fb via adding [ blacklist vga16fb ] to
/etc/modprobe.d/blacklist-framebuffer.conf and verified with [ lsmod |grep -i
vga16fb ] and [ hwinfo --gfx |grep -i vga16fb ] that it is not present (I hope
that was sufficient?).

Now, if starting with a xorg.conf without error I receive the same result as
before - blank screen with a non blinking cursor in the upper left, but
terminals accessible.

So as far as I can see, blacklisting vga16fb does not make any difference. I
still need an intentional error in xorg.conf to make X working. Do you need new
log files for the case with vga16fb disabled?

Best regards, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
