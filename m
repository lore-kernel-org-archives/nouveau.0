From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51971] MacBook Pro 10, 1 Retina - Display Resets,
	No Connectors
Date: Thu, 12 Jul 2012 13:33:55 +0000
Message-ID: <bug-51971-8800-NMyeiRqlzY@http.bugs.freedesktop.org/>
References: <bug-51971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51971

--- Comment #7 from Ryan Bourgeois <bluedragonx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-12 06:33:55 PDT ---
I've discovered something new. After loading and unloading the nVidia blob
driver the nouveau driver is able to retrieve EDID from the eDP-2 connector and
sets it as connected. So it appears the nVidia blob is doing something to
initialize the connectors that nouveau isn't.

Even though nouveau is able to enable the connector, get the EDID, and
configure the mode, it still doesn't work right. It appears the mode isn't
entirely correct as the screen is still messed up. Here is the modeline that
nouveau retrieves:

Modeline 42:"2880x1800" 60 337750 2880 2928 2960 3040 1800 1803 1809 1852 0x48
0x9

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
