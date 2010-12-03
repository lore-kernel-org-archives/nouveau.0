From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31957] Video Noise on HDMI output
Date: Fri,  3 Dec 2010 13:38:33 -0800 (PST)
Message-ID: <20101203213833.E971413004E@annarchy.freedesktop.org>
References: <bug-31957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31957-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31957

--- Comment #7 from James <buzzbuzz22-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> 2010-12-03 13:38:33 PST ---
Here are some of the mode lines that the NVIDIA driver can be switched to.
The NVIDIA drive output does not have any "noise".
Output via xvidtune -show
"1280x1024"   135.00   1280 1296 1440 1688   1024 1025 1028 1066 +hsync +vsync

"1920x1080"   148.50   1920 2448 2492 2640   1080 1084 1089 1125 +hsync +vsync

"1920x1080"    74.16   1920 2558 2602 2750   1080 1084 1089 1125 +hsync +vsync

"1920x1080"    74.25   1920 2008 2052 2200   1080 1084 1094 1124 +hsync +vsync
interlace

"1280x1024"   108.00   1280 1328 1440 1688   1024 1025 1028 1066 +hsync +vsync

"1280x1024"   135.00   1280 1296 1440 1688   1024 1025 1028 1066 +hsync +vsync

"1920x1080"    74.25   1920 2008 2052 2200   1080 1084 1094 1124 +hsync +vsync
interlace

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
