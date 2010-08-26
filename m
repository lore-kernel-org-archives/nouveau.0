From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29820] New: Nouveau doesn't handle VGA-OUT correctly
 on a 9400M (Macbook Unibody), but DVI-OUT works !?!?!
Date: Thu, 26 Aug 2010 06:56:00 -0700 (PDT)
Message-ID: <bug-29820-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29820

           Summary: Nouveau doesn't handle VGA-OUT correctly on a 9400M
                    (Macbook Unibody), but DVI-OUT works !?!?!
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: yerazunis-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


On the Macbooks there are two display adapters you can plug into the 
Mini DisplayPort socket- one yields DVI, the other VGA.

DVI output works fine on all monitors tested.  Yeah team!

VGA does not.  Although Linux sees the external display and gets the external
monitor information correctly (i.e. EDID seems to work), but the VGA signal
generated is only non-syncing artifacts; different monitors show different  
results, but none succeed in syncing up to what should be reasonable 
resolutions and frame rates.

There is no relevant results on this in the Xorg.0.log file, so no attachments.

The machine is a late 2008 Macbook Unibody (5,1) running Fedora Core 13, but
the same behavior is seen on Core 11 and Ubuntu, and booting via ReFIT.  

It's not a broken-hardware problem; both the ->VGA and ->DVI adapters work fine
when booted into MacOS.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
