From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39866] Incorrectly detects Analog outputs as TV out
 on Apple Cards
Date: Mon, 22 Aug 2011 18:39:04 -0700 (PDT)
Message-ID: <20110823013904.0D20513009E@annarchy.freedesktop.org>
References: <bug-39866-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39866-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39866

--- Comment #9 from Jon Sturm <jonimoose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-08-22 18:39:03 PDT ---
Ok so I overpaid for the official DVI to TV adapter from Apple and the good
news is that it works. The bad news is nouveau/xrandr still thinks both DVI-I-2
and TV-1 are connected. Dmesg mentions nothing about the DVI-I-2 connector
which makes me wonder why it is saying it is connected.

[14:38 jon@ArchG5 ~]$ DISPLAY=:0 xrandr
Screen 0: minimum 320 x 200, current 640 x 480, maximum 4096 x 4096
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DVI-I-2 connected (normal left inverted right x axis y axis)
   1024x768       60.0
   800x600        60.3     56.2
   848x480        60.0
   640x480        59.9
TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   720x576        50.0 +
   1024x768       50.0
   800x600        50.0
   720x480        50.0
   640x480        50.0*
   400x300       100.0
   320x240       100.0
   320x200       100.0

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
You are the assignee for the bug.
