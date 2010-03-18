From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27152] New: [G72M] Screen corruption when using KMS.
 Dell Latitude D620 / Quadro NVS 110M/GeForce Go 7300
Date: Wed, 17 Mar 2010 19:50:47 -0700 (PDT)
Message-ID: <bug-27152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=27152

           Summary: [G72M] Screen corruption when using KMS. Dell Latitude
                    D620 / Quadro NVS 110M/GeForce Go 7300
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarded from Launchpad:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/539730

Nouveau seems unable to drive the LVDS on this laptop.

Nothing useful is displayed on screen in graphics mode with this laptop,
instead it seems like random data pixels and colours end up on the panel.

Xorg log: http://launchpadlibrarian.net/41045198/XorgLogOld.gz
dmesg: http://launchpadlibrarian.net/41056521/dmesg.log
Dump of video bios: http://launchpadlibrarian.net/41058076/video.bios
mmiotrace of nvidia-glx bringing up X:
http://launchpadlibrarian.net/41072914/nvidia-glx_trace


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
