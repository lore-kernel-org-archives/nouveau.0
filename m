From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34429] Failure during resume on NV50: INIT_AUXCH: rd
 auxch fail -121
Date: Fri, 25 Feb 2011 12:41:19 -0800 (PST)
Message-ID: <20110225204120.1702F130009@annarchy.freedesktop.org>
References: <bug-34429-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34429-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34429

Yuriy Khomchik <homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #4 from Yuriy Khomchik <homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-25 12:41:19 PST ---
I have a similar problem on the same hardware with Ubuntu 11.04 Alpha 2.
dmesg output contains the same lines:
  ...
  [drm] nouveau 0000:01:00.0: Restoring mode...
  [drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
  [drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
  [drm] nouveau 0000:01:00.0: 0xBDCC: auxch rd fail: -121
  [drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
  ...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
