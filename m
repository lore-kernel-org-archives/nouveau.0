From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43029] System won't boot using nouveau and Gainward
 Phantom adapters
Date: Sun, 29 Apr 2012 05:01:44 +0000
Message-ID: <bug-43029-8800-1p3GmJtEw5@http.bugs.freedesktop.org/>
References: <bug-43029-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43029-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=43029

Robert Riches <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org

--- Comment #8 from Robert Riches <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> 2012-04-28 22:01:44 PDT ---
I have similar symptoms with an Asus ENGTX560 DC/2DI/1GD5 card running Mageia 1
(kernel 2.6.38.8-server-10.mga).  According to modinfo, "srcversion:    
7FFBFFA368D6517B0115747".  During boot with the normal kernel, nouveau said it
detected a NVc0 card, 0ce080a1 (if I wrote it down correctly).  Then, "fb:
conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver". 
Then, the machine was locked up so hard sysrq did nothing that I could discern.
 I had to use the hardware reset button.

Using the linux-nonfb GRUB option, which I understand points to a
non-framebuffer version of the non-updated kernel/initrd, I saw a nouveau stack
trace fly by on the screen, then the same hard lockup.

Using the failsafe option, which I understand is a different non-updated
kernel/initrd, booting gets farther before locking up, and sysrq is able to
reboot the machine.

Knoppix 6.4.4 produces a stack trace from drm or nouveau, and sysrq is able to
reboot the machine--blindly if I remember correctly.

Is there documentation of whether a later (Mageia 2, perhaps) kernel would work
with this card?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
