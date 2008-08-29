From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17347] New: NV34M (12" powerbook G4) LVDS not
	supported
Date: Thu, 28 Aug 2008 20:31:44 -0700 (PDT)
Message-ID: <bug-17347-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17347

           Summary: NV34M (12" powerbook G4) LVDS not supported
           Product: xorg
           Version: git
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Happy nouveau user for some time now.  I have a 12" PowerBook G4 with a NV34M. 
Just updated to latest git DRM and DDX a few hours ago, and now X won't start. 
The relevant error appears to be:

(EE) NOUVEAU(0): LVDS table revision 11.0 not currently supported
(EE) NOUVEAU(0): Pointer to flat panel table invalid

It then attempts to set up my VGA port, but there's nothing connected, and
quits with 'no screens'.  There are a bunch of '(EE)' lines before the lines
above, as well.  My last nouveau git snapshot that I was using (which worked
fine) was from 8 August, so bisecting might take some time... so I'd rather not
have to go that route unless necessary.

Xorg.log attached; anything else I can provide that would be useful?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
