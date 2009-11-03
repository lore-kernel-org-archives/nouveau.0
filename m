From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24780] 2 second delay during boot using nouveau
Date: Tue,  3 Nov 2009 13:17:14 -0800 (PST)
Message-ID: <20091103211715.6B64C1300C4@annarchy.freedesktop.org>
References: <bug-24780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24780


Amadeusz <amade-dvG7DYx+7LWsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Amadeusz <amade-dvG7DYx+7LWsTnJN9+BGXg@public.gmane.org>  2009-11-03 13:17:01 PST ---
Fixed in today's commit by Ben Skeggs

http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=a649fb5fdf24336cc68454fdd249c787b2aeca19

[    0.269169] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xCE73
[    0.269173] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xCED8
[    0.290325] [drm] nouveau 0000:01:00.0: 0xCED8: Condition still not met
after 20ms, skipping following opcodes
[    0.290334] [drm] nouveau 0000:01:00.0: 0xAED4: parsing output script 0
[    0.290338] [drm] nouveau 0000:01:00.0: 0xA564: parsing output script 0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
