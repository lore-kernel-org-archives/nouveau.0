From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16148] primary display is borked with RandR12 enabled
Date: Mon, 18 Aug 2008 02:24:52 -0700 (PDT)
Message-ID: <20080818092717.6A97A2DC4FE@annarchy.freedesktop.org>
References: <bug-16148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16148





--- Comment #5 from Ritesh Khadgaray <khadgaray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-08-18 02:24:43 PST ---
> * can you check the problem is still present on the latest version in git?
Will do. the h/w should be available with me by coming monday

> * am I correct to understand that when RandR12 is enabled, the laptop display
> is incorrect, even without having the external DVI screen plugged in? Also, by
Yes

> running with `Option "Randr12" "off"' in xorg.conf and starting from a fresh
> boot, the problem is not present?
Yes

> assuming the problem can be reproduced using only the laptop screen, is the
> display still broken on returning to VT (either by Ctrl+Alt+F(n) or by closing
> X)?
Yes. If i restart X after disabling RandR12, i end with with a "telly" like
screen ( horizontal rolling strips )

-- ritz


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
