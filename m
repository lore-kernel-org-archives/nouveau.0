From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39010] New: better handling of large pixmaps
Date: Wed,  6 Jul 2011 12:18:05 -0700 (PDT)
Message-ID: <bug-39010-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39010

           Summary: better handling of large pixmaps
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=48831)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=48831)
possible workaround for 64mb vram cards

Large images in Firefox only show up as black rectangles.

At the same time, the following errors appear in dmesg :
[  590.075369] [drm] nouveau 0000:01:00.0: fail ttm_validate
[  590.075371] [drm] nouveau 0000:01:00.0: validate vram_list
[  590.075374] [drm] nouveau 0000:01:00.0: validate: -12

Test cases :
-
http://geoeyemediaportal.s3.amazonaws.com/assets/images/gallery/ge1/hires/tehran_iran_02_11_10.jpg
- http://xkcd.com/802_large/
-
http://upload.wikimedia.org/wikipedia/commons/5/55/Futuregen_DOE_Concept_art.jpg

References :
- https://bugs.freedesktop.org/show_bug.cgi?id=28763#c15
- http://lists.freedesktop.org/archives/nouveau/2010-February/005125.html

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
