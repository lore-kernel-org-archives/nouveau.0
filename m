From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Wed, 29 Oct 2008 00:57:35 -0700 (PDT)
Message-ID: <20081029075735.417E11300CB@annarchy.freedesktop.org>
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





--- Comment #2 from Sebastian Brandt <sbrandt-Mmb7MZpHnFY@public.gmane.org>  2008-10-29 00:57:34 PST ---
Created an attachment (id=19926)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=19926)
messages from load drm/nouveau.ko till reboot

Excerpt of /var/log/messages:
- loading the current git drm.ko and nouveau.ko
- starting X
- SysRQ: show Tasks, shoW blocking tasks
  (no usable information, there, I belive)
- SysRQ: unRaw (did not help)
- SysRQ: S-U-S-B

Initialized drm 1.1.0 20060810
Initialized nouveau 0.0.11 libdrm-2.4.0-12-ge47ab7a5081e178ba on minor 0

By the way ...
System is opensuse 11.0/x86_64/2.6.25.18-0.2-default
Phenom X4 9750 2.4GHz 4GB
ASUS M3N-H/HDMI w/ GeForce 8300 chipset (of course ;-), 256 MB shared mem


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
