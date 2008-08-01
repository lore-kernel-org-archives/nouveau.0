From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16952] New: Bad video modes
Date: Fri,  1 Aug 2008 14:21:04 -0700 (PDT)
Message-ID: <bug-16952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16952

           Summary: Bad video modes
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=18068)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=18068)
X log

I'm not sure when, but I recently found that X is generating a lot of bad
modes. This is xrandr output:

Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 1400 x 1400
VGA-0 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 338mm
x 270mm
   1280x1024      60.0*+   75.0     60.0* 
   1400x1050      60.0  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       85.0     75.0     70.1     60.0  
   832x624        74.6  
   800x600       130.0    120.0     85.1     85.1     72.2     75.0     60.3   
 56.2  
   700x525       149.5    120.0  
   640x512       150.0    120.0  
   640x480       120.0     85.0     75.0     72.8     75.0     66.7     59.9  
   720x400        85.0     70.1  
   640x400        85.1  
   576x432       150.0  
   640x350        85.1  
   512x384       170.0    150.1    140.1    120.0  
   416x312       149.3  
   400x300       170.5    144.4    150.2    120.6    112.7  
   320x240       170.4    145.6    150.0    120.1  
   360x200       170.1  
   320x200       170.5  
   320x175       170.5  

This is a flat panel, and I'm quite sure it cannot accept modes above 85Hz,
maybe even lower. Furthermore, according to the log, there are lots of
doublescan modes. When anything switches to 800x600 mode, X picks a doublescan
mode, which won't work. If I manually do 'xrandr -s 800x600 -r 60' the mode is
good.

Additionally, the included X log contains a line like the following for every
mode switch:

(II) NOUVEAU(0): Modeline "(null)"x0.0  108.00  1280 1328 1440 1688  1024 1025
1028 1066 +hsync +vsync (64.0 kHz)

which is clearly a NULL dereference, but the gnu vsnprintf is so cool it
doesn't crash.

I'm running xorg-server and nouveau from git as of 1.8.2008.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
