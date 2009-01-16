From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19620] New: At first start of X,
 secondary display doesn'  t come up properly.
Date: Fri, 16 Jan 2009 13:33:51 -0800 (PST)
Message-ID: <bug-19620-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19620

           Summary: At first start of X, secondary display doesn't come up
                    properly.
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=22036)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22036)
Config

Problem :

first start of X : primary screen work fine, secondary screen stay blue
(mandriva make root X window blue instead of grey by default). 
The screen seems to be properly configured (1024x768@85) and I can drag
something on this screen (but obviously I don't see it anymore)
If I try this in clone mode, the second screen is blue, the first display
properly.

Second start of X or after a switch to VT and come back, the second screen is
perfectly fine, and I can use it



Configuration :

xserver : 1.4.0.90 from mandriva 2008.1

Card (NV4B, 10de:02e1) on AGP bus :
01:00.0 VGA compatible controller: nVidia Corporation G73 [GeForce 7600 GS]
(rev a2)

Primary screen on DVI (with DVI to VGA adaptor) : IIYAMA A705MT (Vision master
pro 411) 

Secondary screen on VGA : IIYAMA S704HT (Vision master 404), this screen alone
had worked fine with nouveau on VGA since 18 months.

xrandr -q :
Screen 0: minimum 320 x 200, current 2048 x 768, maximum 3000 x 1024
DVI-I-0 connected 1024x768+1024+0 (normal left inverted right x axis y axis)
320mm x 240mm
   1024x768_85.00   84.9*+
   1352x1014      59.9  
   1280x1024      75.0  
   1152x864       75.0  
   1024x768_100.00  100.0  
   1024x768       75.1     70.1     60.0  
   832x665        97.7  
   832x624        74.6  
   800x600_85.00   84.9  
   800x600        72.2     75.0     60.3     56.2  
   640x480_85.00   84.6  
   640x480        75.0     72.8     66.7     69.6     60.0     59.9  
   512x384       120.0  
   400x300       120.6  
   320x240       120.1  
VGA-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 320mm x
240mm
   1024x768_85.00   84.9*+
   1280x1024      75.0  
   1152x864       75.0  
   1024x768       74.9     75.1     70.1     60.0  
   832x624        74.6     74.8  
   800x600_85.00   84.9  
   800x600        72.2     75.0     60.3     56.2  
   640x480_85.00   84.6  
   640x480        75.0     72.8     66.7     69.6     60.0     59.9  
   512x384       120.0  
   400x300       120.6  
   320x240       120.1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
