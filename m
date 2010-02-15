From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] [nouveau] GeForce 8200 and 8300 not supported
 (10de:0848/0849/C77/MCP77/MCP78S)
Date: Mon, 15 Feb 2010 02:14:31 -0800 (PST)
Message-ID: <20100215101431.C4B08130087@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #34 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-02-15 02:14:29 PST ---
(In reply to comment #32)
> 
> I will say that there is no documentation at all for which specific nVidia GPU
> family my chipset belongs to -- only that it's "at least" nv50. The 8200 is
> just a downclocked 8300, and the interwebs indicate that the 8300 (GS) is an
> nv86 chip. So that's what I put in my kernel for the extra firmware:
> nv86.ctxprog/ctxvals. Maybe this is screwing things up?
> 

Just look at Stanislav last dmesg :
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x0aa280a2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
...
[drm] nouveau 0000:02:00.0: 256 MiB VRAM
[drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
nouveau 0000:02:00.0: firmware: requesting nouveau/nvaa.ctxprog
nouveau 0000:02:00.0: firmware: requesting nouveau/nvaa.ctxvals

You can see its a nvaa card (0x0aa...) and that the two nvaa firmwares are
correctly loaded. So that's not the problem.
The problem is indeed the EE in xorg log :
(EE) NOUVEAU(0): Error creating GPU channel: -16
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
