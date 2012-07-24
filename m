From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52398] nouveau: DPMS permanently turns off display
 when starting X.org, text console works fine
Date: Tue, 24 Jul 2012 02:36:57 +0000
Message-ID: <bug-52398-8800-a3k1bp0lAX@http.bugs.freedesktop.org/>
References: <bug-52398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52398

--- Comment #5 from John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> 2012-07-23 19:36:57 PDT ---
Just an additional remark, I can actually set the DPMS state in
/sys/class/drm/.../dpms back to "On" with (through SSH):

XAUTHORITY=/var/lib/xdm/authdir/authfiles/A\:0-4LXCpv DISPLAY=:0.0 xrandr
--newmode 1280x1024 108 1280 1328 1440 1688 1024 1025 1028 1066 +HSync +VSync
XAUTHORITY=/var/lib/xdm/authdir/authfiles/A\:0-4LXCpv DISPLAY=:0.0 xrandr
--addmode VGA-1 1280x1024
XAUTHORITY=/var/lib/xdm/authdir/authfiles/A\:0-4LXCpv DISPLAY=:0.0 xrandr
--output VGA-1 --mode 1280x1024
XAUTHORITY=/var/lib/xdm/authdir/authfiles/A\:0-4LXCpv DISPLAY=:0.0 xset dpms
force on

However, the display will stay remain turned OFF.

Adrian

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
