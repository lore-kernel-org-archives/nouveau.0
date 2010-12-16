From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31676] garbled text after loading nouveau module on
 EFI boot; X driver thinks there are no connected outputs
Date: Thu, 16 Dec 2010 06:48:05 -0800 (PST)
Message-ID: <20101216144805.75E7A13004D@annarchy.freedesktop.org>
References: <bug-31676-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31676-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31676

--- Comment #10 from Benoit Gschwind <gschwind-1YmjpbiIw0bR7s880joybQ@public.gmane.org> 2010-12-16 06:48:05 PST ---
Created an attachment (id=41174)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=41174)
dmesg kernel 2.6.37-rc6 video output corrupted in BIOS emulation


This is dmesg I made from last available kernel, this is a vanilla kernel (no
patch added) running on MacBookAir 3,1 in BIOS emulation. The screen is not
blank, I will try to decribe it :
 - on the left the screen is good over about 200 mm from left to right, then
there is garbage till 2/3 of screen, then blank. The garbage are readable
characters, but ugly.

It's lock like that hsync is wrong.

I didn't start X at all, I waiting for working console.

do mmiotrace is needed ?

Best regards.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
