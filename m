From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19356] DPMS does not turn off LCD backlight on NV34M
 [ GeForce FX Go5200]
Date: Sun,  4 Jan 2009 04:33:53 -0800 (PST)
Message-ID: <20090104123353.8C757130054@annarchy.freedesktop.org>
References: <bug-19356-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19356-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19356





--- Comment #8 from Markus Tacker <m@tacker.org>  2009-01-04 04:33:53 PST ---
(In reply to comment #7)
> then examine the contents of the following 2 regs:
> ./radeontool regmatch 0x0060081c
> ./radeontool regmatch 0x000010f0

++ nouveau

dpms force on

(changes between those two)
0x0060081c      0x22265055 (572936277)
0x0060081c      0x22265051 (572936273)

0x000010f0      0x83e60535 (-2082077387)

dpms force off

(changes between those two)
0x0060081c      0x22265055 (572936277)
0x0060081c      0x22265051 (572936273)

0x000010f0      0x83e60535 (-2082077387)

++ nv

dpms force on

(changes between those two)
0x0060081c      0x22265055 (572936277)
0x0060081c      0x22265051 (572936273)

0x000010f0      0x83e60535 (-2082077387)

dpms force off

0x0060081c      0x22265050 (572936272)

0x000010f0      0x03e60535 (65406261)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
