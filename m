From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17138] New: Randr12 on nv34m causes colour
 corruption on laptop panel.
Date: Thu, 14 Aug 2008 11:13:36 -0700 (PDT)
Message-ID: <bug-17138-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17138

           Summary: Randr12 on nv34m causes colour corruption on laptop
                    panel.
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: murray-Xhi4+0Yxd7rk1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=18284)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=18284)
vbtracetool vBIOS dump

Starting X with git nouveau and Randr12 disabled works perfectly.
Enabling Randr12 gives a somewhat corrupted screen which is predominantly red.

My system is a Dell Inspiron 5150 with a 1600x1200 screen and an nv34m.

The corruption is only on the internal panel. Any external screen on the VGA
output seems to be fine.

Bug #14403 seemed to be the closest to my experience and so I messed around
with nv_bios.c.

In the function parse_lvds_manufacturer_table_init the section labeled:

   /* adjust some things if straps are invalid (implies the panel has EDID) */

resets the lvdsmanufacturerindex from 3 to 0.

Putting in a line to set this back to 3 (or indeed 1 or 2) makes everything
seem to work fine.

I did a BIOS dump with vbtracetool. Does this help?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
