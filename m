From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31920] Brightness control is erratic
 (/sys/class/backlight/nv_backlight/max_brightness is wrong)
Date: Mon, 26 Sep 2011 09:24:31 -0700 (PDT)
Message-ID: <20110926162431.D131D130110@annarchy.freedesktop.org>
References: <bug-31920-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31920-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31920

--- Comment #13 from Rohan Dhruva <rohandhruva-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-26 09:24:30 PDT ---
If anything, it has become less granular now. Here are some of the outputs:

rohan@ubuntu:/sys/class/backlight/nv_backlight$ cat max_brightness 
1025
rohan@ubuntu:/sys/class/backlight/nv_backlight$ cat actual_brightness 
615
rohan@ubuntu:/sys/class/backlight/nv_backlight$ cat brightness 
615
rohan@ubuntu:/sys/class/backlight/nv_backlight$ cat bl_power 
0
rohan@ubuntu:/sys/class/backlight/nv_backlight$ cat brightness 
103
rohan@ubuntu:/sys/class/backlight/nv_backlight$ 

IIRC, the max_brightness is still same as before (1025). However, the actual
"max" looks to be something around 615.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
