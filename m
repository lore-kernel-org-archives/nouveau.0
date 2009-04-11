From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16165] Multi-gpu Quadro NVS 400 (NV17a x2) fails to
 initialise xserver
Date: Sat, 11 Apr 2009 13:05:23 -0700 (PDT)
Message-ID: <20090411200523.2E6A9130058@annarchy.freedesktop.org>
References: <bug-16165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=16165





--- Comment #7 from Pete Beardmore <elbeardmorez-uAjRD0nVeow@public.gmane.org>  2009-04-11 13:05:22 PST ---
hi.

looking at my title now, i suppose someone could argue it's fixed, although i
would be a little upset! the server doesn't crash when one specifies use of
both gpus in a server layout, it just completely ignores the second screen and
hence i get a dual-screen. any attempts to get the xserver to initiate the
second-gpu have not worked.

originally, back in May 2008, the other DAC device and it's two outputs DVI-A-0
and DVI-A-1 were recognised, if not usable.

now, when isolateDevice '2nd gpu' is used in a quad setup, the xserver crashes:

#0  NVGetArchitecture (regs=0x0) at nv_driver.c:375
#1  0xb7b37365 in NVPciProbe (drv=0x81eefb0, entity_num=0, dev=0x81eac60,
match_data=0) at nv_driver.c:435

...when isolating the 2nd gpu for a dual screen only, the X server bails with
"no devices attached" -> queue a quick build of the proprietory blob just to
ensure the card's 2nd gpu was still alive (it is!! ..the blob is still useless
though).

i'm around on irc too if anyone fancies a semi-interactive debug session?!

cheers.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
