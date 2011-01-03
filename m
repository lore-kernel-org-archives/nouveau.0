From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32793] New: DVI-I on GeForce 6600 GT not working
Date: Mon,  3 Jan 2011 05:26:38 -0800 (PST)
Message-ID: <bug-32793-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32793

           Summary: DVI-I on GeForce 6600 GT not working
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: logicalbilly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=41584)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=41584)
dmesg log showing EDID Checksum error

Since using the nouveua driver I have not been able to use the DVI connection
to my monitor. I have been forced to use a VGA connection.

The dmesg logs show a repeating 

EDID checksum is invalid

error message.

While obtaining the attached logs I had both DVI and VGA connection to a single
monitor which had both VGA and DVI connections.

===============================================================================

$ dmesg 

[  357.339289] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 1
[  357.339292] [drm:drm_edid_block_valid] *ERROR* Raw EDID:
[  357.339294] <3>00 ff ff ff ff ff ff 00 5a 63 1e 59 93 53 00 00 
........Zc.Y.S..
[  357.339296] <3>1f 11 01 03 80 2f 1e 78 2e d0 05 a3 55 49 9a 27 
...../.x....UI.'
[  357.339298] <3>13 50 54 bf ef 80 b3 00 a9 40 95 00 90 40 81 80 
.PT......@...@..
[  357.339301] <3>81 40 71 4f 31 a1 21 39 90 30 62 1a 27 40 68 b0 
.@qO1.!9.0b.'@h.
[  357.339303] <3>36 00 da 28 11 00 00 1c 00 00 00 ff 00 51 41 35 
6..(.........QA5
[  357.339305] <3>30 a1 33 31 32 31 33 39 35 0a 00 00 00 fd 00 32 
0.3121395......2
[  357.339307] <3>4b 1e 52 0f 00 0a 20 20 20 20 20 20 00 00 00 fc  K.R...     
....
[  357.339309] <3>00 56 58 32 32 33 35 77 6d 0a 20 20 20 20 00 0b  .VX2235wm.  
 ..
[  357.339311] 
[  357.339314] nouveau 0000:02:00.0: DVI-I-1: EDID block 0 invalid.
[  357.339317] [drm] nouveau 0000:02:00.0: DDC responded, but no EDID for
DVI-I-1

$ xrandr 
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 4096 x 4096
VGA-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 474mm
x 296mm
   1680x1050      60.0*+
   1400x1050      60.0  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
DVI-I-1 disconnected (normal left inverted right x axis y axis)
TV-1 disconnected (normal left inverted right x axis y axis)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
