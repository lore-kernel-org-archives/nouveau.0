From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39866] Incorrectly detects Analog outputs as TV out
 on Apple Cards
Date: Fri,  5 Aug 2011 14:36:34 -0700 (PDT)
Message-ID: <20110805213634.316F61301A4@annarchy.freedesktop.org>
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

--- Comment #2 from Jon Sturm <jasturm002-YDxpq3io04c@public.gmane.org> 2011-08-05 14:36:33 PDT ---
Xrandr output from non working setup.
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 4096 x 4096
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DVI-I-2 connected (normal left inverted right x axis y axis)
   1024x768       60.0 +   75.1     70.1
   832x624        74.6
   800x600        72.2     75.0     60.3
   640x480        72.8     75.0     60.0
   720x400        70.1
TV-1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
   720x576        50.0 +
   1024x768       50.0*
   800x600        50.0
   720x480        50.0
   640x480        50.0
   400x300       100.0
   320x240       100.0
   320x200       100.0

To me it looks like the VGA monitor's EDID is being mistaken for a DVI one and
the TV-1 modes are generated internally by the driver. The real apple adapter
includes its own EDID that can be used for detection and its modes should be
used if I understand correctly.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
