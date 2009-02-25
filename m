From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20298] Nouveau doesn't allow my modeline because of
 hardcoded value
Date: Wed, 25 Feb 2009 11:21:02 -0800 (PST)
Message-ID: <20090225192102.E0743130016@annarchy.freedesktop.org>
References: <bug-20298-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20298-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20298





--- Comment #2 from Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-25 11:21:02 PST ---
01:00.0 VGA compatible controller: nVidia Corporation NV18 [GeForce4 MX 4000]
(rev c1)

0x680520        0x00045405 (283653)

The modeline does work successfully with nouveau after removing the quoted
sanity check or reducing the value. The output from radeontool is identical for
both nvidia and patched nouveau.

nv does not support this modeline; it also arbitrarily sets the minimum clock
frequency to 12000
(http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src/nv_setup.c#n274)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
