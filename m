From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18638] Nouveau fails totally on new Macbook Unibody
 13.3" Ubuntu ( xorg.0.log included)
Date: Tue, 23 Dec 2008 03:41:59 -0800 (PST)
Message-ID: <20081223114159.C9818130054@annarchy.freedesktop.org>
References: <bug-18638-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18638-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18638


Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org




--- Comment #5 from Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>  2008-12-23 03:41:59 PST ---
Just FYI, since I just tried, the current drm git
(b48bd3a036efa3c3aa759759a5be4f80f1c3ac72) and nouveau git
(31c9958779d95ae84993f4772607367927a0e313) doesn't work, but for me it just
disables the X server and nothing crashes. The kernel also printed some
warnings, will attach complete log of both.

Mind you, my memory was fragmented enough yesterday that an order-5 allocation
failed, I didn't see a memory allocation failure here though.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
