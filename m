From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24831] XRandR multihead fails on NV50
Date: Sat, 31 Oct 2009 09:49:04 -0700 (PDT)
Message-ID: <20091031164904.B7F93130085@annarchy.freedesktop.org>
References: <bug-24831-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24831-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24831





--- Comment #2 from William Keaney <keaneyw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-10-31 09:49:04 PST ---
The command I ran was 'xrandr --output VGA-0 --left-of LVDS-0.  The output of
xrandr is:
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 8192 x 8192
LVDS-0 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 331mm
x 207mm
   1680x1050      60.0*+   50.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
VGA-0 disconnected 800x600+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
DVI-D-0 disconnected (normal left inverted right x axis y axis)
  800x600 (0x43)   56.2MHz
        h: width   800 start  832 end  896 total 1048 skew    0 clock   53.7KHz
        v: height  600 start  601 end  604 total  631           clock   85.1Hz


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
