From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34430] nouveau driver does not return VGA connector
 status breaking upower
Date: Sat, 22 Sep 2012 06:46:53 +0000
Message-ID: <bug-34430-8800-5ltuTXZEZK@http.bugs.freedesktop.org/>
References: <bug-34430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34430-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34430

Ilya Basin <basinilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |basinilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Ilya Basin <basinilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-22 06:46:53 UTC ---
Similar problem here. I added to /etc/rc.local:
  echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

When Gnome tries to start, upowerd eats 100% CPU. So, to start Gnome I have to
temporarily enable the card, then disable it again.
Similarly,
  cat
"/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0/card0-VGA-1/status"

hangs when the card is OFF.


Laptop Acer Aspire 5755G
Archlinux 64
kernel 3.5.3
upower 0.9.17
gnome 3.4.2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
