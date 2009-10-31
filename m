From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24831] XRandR multihead fails on NV50
Date: Sat, 31 Oct 2009 09:51:59 -0700 (PDT)
Message-ID: <20091031165159.EF2E8130085@annarchy.freedesktop.org>
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





--- Comment #3 from William Keaney <keaneyw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-10-31 09:51:59 PST ---
Sorry, correction to the last post - I had run xrandr without the external
display connected accidentally:
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 8192 x 8192
LVDS-0 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 331mm
x 207mm
   1680x1050      60.0*+   50.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
VGA-0 connected 800x600+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
   800x600        85.1*    72.2     75.0     60.3     56.2  
   640x480        85.0     75.0     72.8     59.9  
   720x400        85.0  
   640x400        85.1  
   640x350        85.1  
DVI-D-0 disconnected (normal left inverted right x axis y axis)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
