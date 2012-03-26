From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47846] Nouveau -> overscan using HDMI
Date: Mon, 26 Mar 2012 07:13:11 +0000
Message-ID: <bug-47846-8800-FRW4OsLX3W@http.bugs.freedesktop.org/>
References: <bug-47846-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47846-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47846

--- Comment #3 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2012-03-26 07:13:11 UTC ---
(In reply to comment #1)
> Kernel 3.3 introduced underscan control
> 
> After updating, you can enable and adjust it using xrandr
> eg.
> xrandr --output HDMI-1 --set underscan on
> xrandr --output HDMI-1 --set "underscan hborder" 54 --set "underscan vborder"
> 51"
> 
> Would you mind giving it a try

Ok, those commands do help and after trial and error I can find the correct
values to use.

However, I would much rather have this working from boot time.
I can already picture myself starting X just to run xrandr and fix the overscan
and then going back to the console.

If its not possible to fix the root problem (EDID), it would be great to be
able to specify these underscan parameters to the kernel module.

The ideal situation would be to do both things :)

Now I have a new problem that I didn't have with nvidia proprietary driver.
When running a fullscreen application, I get this:

X Error of failed request:  BadValue (integer parameter out of range for
operation)
  Major opcode of failed request:  129 (XFree86-VidModeExtension)
  Minor opcode of failed request:  10 (XF86VidModeSwitchToMode)
  Value in failed request:  0x167
  Serial number of failed request:  149
  Current serial number in output stream:  151

I guess I'll open another bug report if I can't solve it by myself.

Thanks for your help, can't wait to see this fixed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
