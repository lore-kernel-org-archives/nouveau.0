From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14403] NV17: LVDS0 is black with Randr 1.2,
 works when randr 1.  2 is disabled
Date: Mon, 11 Feb 2008 14:01:25 -0800 (PST)
Message-ID: <20080211220125.A4CCC130051@annarchy.freedesktop.org>
References: <bug-14403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14403-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14403





--- Comment #10 from Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-11 14:01:22 PST ---
So, I don't know if this is relevant, but I was looking at the log files, and
it
seems like the pitch and virtual size is screwed up (or at least different) in
the randr dump.

I'm going to try to hard code a Virtual size of 1680x1050, and see if anything
changes.

no randr:
(--) NOUVEAU(0): Virtual size is 1680x1050 (pitch 1680)
(**) NOUVEAU(0): *Driver mode "1680x1050": 119.0 MHz, 64.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"  119.00  1680 1728 1760 1840  1050 1053
1059 1080 +hsync -vsync

....

Randr:
....
(--) NOUVEAU(0): Virtual size is 1680x1680 (pitch 1728)
(**) NOUVEAU(0):  Driver mode "1680x1050": 119.1 MHz (scaled from 0.0 MHz),
64.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"  119.12  1680 1728 1760 1840  1050 1052
1058 1080 -hsync -vsync
....


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
