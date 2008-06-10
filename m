From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16285] New: First display corrupted when second
 screen plugged at boot
Date: Mon,  9 Jun 2008 17:21:10 -0700 (PDT)
Message-ID: <bug-16285-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16285

           Summary: First display corrupted when second screen plugged at
                    boot
           Product: xorg
           Version: 7.3
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: benoar-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=17019)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17019)
drm messages

With card :
0000:00:10.0 VGA compatible controller: nVidia Corporation NV34M [GeForce FX
Go5200] (rev a1)
On a 12" powerbook G4.

When I don't plug my second monitor at boot (LCD on DVI), I only see one
available screen with xrandr. My internal monitor is OK but I don't get any
output on the second one.
When plugging the second monitor at boot, I have a clone on it but the first
display becomes corrupted when X starts. Xrandr still shows me only one output
:

Screen 0: minimum 640 x 400, current 1024 x 768, maximum 1024 x 768
default connected 1024x768+0+0 0mm x 0mm
   1024x768       75.0*    72.0     70.0     60.0  
   832x624        75.0  
   800x600        75.0     72.0     60.0     56.0  
   640x480        75.0     73.0     67.0     60.0  
   720x400        70.0  

Tried by using both nvidiafb and offb (after some advices by marcheu on IRC)
but got the same result.

The "corrupted" screen looks like pixels are too evenly spaced, showing wired
colors, and no meaningfull kind of windows.

Part of my xorg.conf :

Section "Device"
        Identifier      "nVidia Corporation NV34M [GeForce FX Go5200]"
        Driver          "nouveau"
        BusID           "PCI:0:16:0"
        Option          "UseFBDev"              "true"
        Option          "AccelMethod"           "EXA"
EndSection


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
