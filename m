From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29553] corrupted output on KDE status bar
Date: Fri, 13 Aug 2010 01:36:55 -0700 (PDT)
Message-ID: <20100813083656.8DB941300F5@annarchy.freedesktop.org>
References: <bug-29553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29553

--- Comment #2 from Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org> 2010-08-13 01:36:55 PDT ---
Apologies for the incomplete message (mis-clicked submit while adding
attachment).

I am using OpenSUSE 11.3, with KDE version 4.4.4. By default, the system is
using nouveau driver version 0.0.15 20100401 (this is taken from the YaST
repository). The video card is Quadro NVS 295. I am also attaching my XOrg.log
for additional version information. If any more information is needed, please
let me know.

Basically, the taskbar is the only part of the screen that I've noticed so far
as being corrupted (is KDE using some transparency effect there?). If I replace
the driver with the proprietary one, the taskbar shows up correctly (light
gray, icons are no longer corrupted).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
