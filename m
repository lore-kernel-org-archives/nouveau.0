From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46533] Firefox WebGL crash with Nouveau 3D;
 user claims it came installed by default on OpenSuse 12.1
Date: Sun, 26 Feb 2012 16:17:13 +0000
Message-ID: <bug-46533-8800-oN8nz8Mnjn@http.bugs.freedesktop.org/>
References: <bug-46533-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46533-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46533

--- Comment #9 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> 2012-02-26 08:17:13 PST ---
(In reply to comment #8)
> I can't reproduce it, for me WebGL works fine with mesa-7.11 (git branch) and
> FireFox 10.0.1 (Gentoo ebuild).

The user reports that while certain WebGL pages work fine, github.com causes a
crash. Can you try github?

(Not clear to me at all, what github might be doing with WebGL. The user on the
Mozilla bug might be able to provide more precise STR).

> 
> Things like mere context creation are just supposed to work, the "experimental"
> excuse certainly doesn't count here.

"experimental" in "experimental-webgl" just means that there still exist
browser bugs, not just driver bugs, causing conformance test failures. Once
Firefox is able to pass 100% of the conformance tests on some setup, we'll
enable the "webgl" context id.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
