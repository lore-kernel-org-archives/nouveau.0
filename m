From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38984] xorg-nouveau: Segfault after gdm3 login,
 EQ overflowing, GeForce 8600 GT (backtrace attached)
Date: Tue, 28 Feb 2012 20:00:44 +0000
Message-ID: <bug-38984-8800-NU6kzNVkrS@http.bugs.freedesktop.org/>
References: <bug-38984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38984-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38984

--- Comment #5 from RomaHagen <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-02-28 12:00:44 PST ---
I decided to help out here. I have exactly the same video card as you (NVIDIA
Corporation G84 [GeForce 8600 GT] (rev a1)).

I've installed latest kernel 3.3.0-rc5, newest nouveau kernel module and also
nouveau drivers and mesa from git.

After that I'm able to log in without problems into GNOME session. The version
of my GDM is GDM 3.2.1.1.

I can redo tests if you want.

Otherwise, shouldn't be that considered "fixed upstream"?

P.S. I'm new here, so do not trust me that much.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
