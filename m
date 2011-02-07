From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33967] No image on a VGA screen attached to DVI with
 a dvi to vga adaptor on NVa3 card..
Date: Mon,  7 Feb 2011 12:34:46 -0800 (PST)
Message-ID: <20110207203446.94A0D13004E@annarchy.freedesktop.org>
References: <bug-33967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33967-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33967

--- Comment #5 from Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-07 12:34:46 PST ---
Taken from dmesg log:

Found Display Configuration Block version 4.0
Raw DCB entry 0: 02000300 00020030
Raw DCB entry 1: 01011312 00020030
Raw DCB entry 2: 01011310 00000000
Raw DCB entry 3: 02022362 00020010
Raw DCB entry 4: 0000000e 00000000
DCB connector table: VHER 0x40 5 16 4
0: 0x00001030: type 0x30 idx 0 tag 0x07
1: 0x00000100: type 0x00 idx 1 tag 0xff
2: 0x00002261: type 0x61 idx 2 tag 0x08

Conclusion:

It seems that the DCB connector table or DCB output table is wrong. VGA
connector is linked to an digital and analog output, while the DVI is only
linked to an analog. Very small chance it's being misparsed, but more likely
it's a broken DCB connector table.

I'll try to see if can get the attention of Ben Skeggs, maybe you need a quirk
for this broken bios table.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
