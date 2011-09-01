From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40541] New: unable to handle kernel NULL pointer
 dereference at (null)
Date: Thu,  1 Sep 2011 03:03:18 -0700 (PDT)
Message-ID: <bug-40541-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40541

           Summary: unable to handle kernel NULL pointer dereference at
                           (null)
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bugs.freedesktop.org-0dECgsrgJpy+5WzXG67F4EEOCMrvLtNR@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50801)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50801)
Important parts of my logs.

I am getting the attached Errors since I am using kwin 4.7.0 with OpenGL-ES.

I am not sure if the following is related: When I am changing window sizes
several times my memory gets filled up. The memory is not released by
restarting kwin or X. When I filled my memory by doing this, I do not have to
wait long for the attached Error, but I do not know what triggers it exactly.

Occasionally, I also have thousands of messages of the following form in my
logs:

Aug 08 18:06:09 [kernel] [ 3810.714471] [TTM] Failed to find memory space for
buffer 0xffff8800bc392000 eviction.
Aug 08 18:06:09 [kernel] [ 3810.714476] [TTM] No space for ffff8800bc392000 (96
pages, 384K, 0M)
Aug 08 18:06:09 [kernel] [ 3810.714479] [TTM]   placement[0]=0x00070002 (1)
Aug 08 18:06:09 [kernel] [ 3810.714480] [TTM]     has_type: 1
Aug 08 18:06:09 [kernel] [ 3810.714482] [TTM]     use_type: 1
Aug 08 18:06:09 [kernel] [ 3810.714484] [TTM]     flags: 0x0000000A
Aug 08 18:06:09 [kernel] [ 3810.714485] [TTM]     gpu_offset: 0x00000000
Aug 08 18:06:09 [kernel] [ 3810.714487] [TTM]     size: 131072
Aug 08 18:06:09 [kernel] [ 3810.714489] [TTM]     available_caching: 0x00070000
Aug 08 18:06:09 [kernel] [ 3810.714491] [TTM]     default_caching: 0x00010000

This is the reason, why I did not upload full logs (all in all 40MB).
Nevertheless, I can upload more logs if you wish so.

As you can see in the logs, I have this problem since several kernel versions.

My graphics card: GeForce 8600 GT

Some version information (only applicable for the last logged crash):

sys-kernel/gentoo-sources-3.0.1
x11-base/xorg-x11-7.4-r1
x11-drivers/xf86-video-nouveau-0.0.16_pre20110801
x11-libs/libdrm-2.4.26
media-libs/mesa-7.11

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
