From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39843] New: HDMI output not detected on Point of
 View R-VGA150904 (nv96, 9500gt)
Date: Thu,  4 Aug 2011 14:28:41 -0700 (PDT)
Message-ID: <bug-39843-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39843

           Summary: HDMI output not detected on Point of View R-VGA150904
                    (nv96, 9500gt)
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nido-6YVbXssdEwM7gj3q02eW9A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=49928)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=49928)
dmesg output

this card physically posesses a s-video out, DVI, and HDMI out. S-VIDEO out is
not working correctly, but not directly relevant to this bug. DVI port is
detected and working correctly, HDMI port is not deteted and the TV outputs 'No
Signal'. If started with only the HDMI cable attached, video works up until the
console switches to high resolution.

Despite not giving output, the HDMI's EDID data fetched by X seems correct. 

Kernel in question is commit 4fc2e2fc0157433883f10e0d7327c73069c66d63, Thu Jul
21 16:12:58 2011 +1000
xf86-video-nouveau version is commit de9d1ba7efeba64f319efa00df183d3cb78f24af,
Tue Jul 19 00:35:38 2011 +0100
drm commit ce317a6d09bb93cff73703b06e5a5bc3cc0b1c6a, Wed Jul 20 16:08:51 2011
+0800

reverted commit f786eea4de502937dafb8f644fc0e6ce93522a6c without succes;
problem remained.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
