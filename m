From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] Nouveau NVIDIA NV46: Freeze
Date: Thu, 29 Sep 2011 02:05:58 -0700 (PDT)
Message-ID: <20110929090558.515A1130133@annarchy.freedesktop.org>
References: <bug-40406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40406

--- Comment #12 from Marco <marco-w08N04152XNe4xh82S9ftw@public.gmane.org> 2011-09-29 02:05:58 PDT ---
Damn, I can't find the log file. It seems, I copied messages instead of
Xorg.log. Sorry. But the last few lines are always the same:

[ 78793.917] (II) Power Button: Close
[ 78793.917] (II) UnloadModule: "evdev"
[ 78793.917] (II) Unloading evdev
[ 78793.949] (II) Sleep Button: Close
[ 78793.949] (II) UnloadModule: "evdev"
[ 78793.949] (II) Unloading evdev
[ 78793.977] (II) AT Translated Set 2 keyboard: Close
[ 78793.977] (II) UnloadModule: "evdev"
[ 78793.977] (II) Unloading evdev
[ 78794.426] (II) UnloadModule: "synaptics"
[ 78794.426] (II) Unloading synaptics
[ 78794.451] (II) Logitech USB-PS/2 Optical Mouse: Close
[ 78794.451] (II) UnloadModule: "evdev"
[ 78794.451] (II) Unloading evdev
[ 78796.215] (II) NOUVEAU(0): NVLeaveVT is called.
[ 78796.216] (II) NOUVEAU(0): Closed GPU channel 1

I used SYSRESQ-R/S/R/E/I/S/U/B

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
