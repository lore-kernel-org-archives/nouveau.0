From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42280] NVc0 generation card (0x0c1000a1) not working
Date: Thu, 27 Oct 2011 09:11:05 +0000
Message-ID: <bug-42280-8800-1BJOSEUweN@http.bugs.freedesktop.org/>
References: <bug-42280-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-42280-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42280

--- Comment #4 from Bruno Antunes <sardaukar.siet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-10-27 02:11:05 PDT ---
By "does not work" I mean I have no 3D accel :)

I'll attach the X log, but the relevant part of it appears to be:


[    15.599] (EE) NOUVEAU(0): Error creating GPU channel: -19
[    15.599] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel
[    15.602] (==) NOUVEAU(0): Backing store disabled
[    15.602] (==) NOUVEAU(0): Silken mouse enabled
[    15.602] (==) NOUVEAU(0): DPMS enabled
[    15.602] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    15.603] (--) RandR disabled

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
