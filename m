From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42703] New: [NV17] Reduce GL_MAX_TEXTURE_SIZE to
 avoid memory overflow
Date: Tue, 08 Nov 2011 13:44:58 +0000
Message-ID: <bug-42703-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42703

             Bug #: 42703
           Summary: [NV17] Reduce GL_MAX_TEXTURE_SIZE to avoid memory
                    overflow
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ballogy-HLx8PRj2pn30Br+ELjv3iA@public.gmane.org


Created attachment 53293
  --> https://bugs.freedesktop.org/attachment.cgi?id=53293
Reduce GL_MAX_TEXTURE_SIZE to avoid memory overflow

I have a GeForce4 MX 440-SE card with 64 MB RAM, and I have the following
problems:
1. When I maximize the windows of Clutter-based apps (quadrapassel,
emerillon...), their contents are disappear, and some other parts of the screen
are corrupted. 
2. When I start a new game in extremetuxracer second or third time, some
textures are corrupted.

When it happens, I get the following messages in dmesg several times:
[21415.164810] [drm] nouveau 0000:01:00.0: fail ttm_validate
[21415.164821] [drm] nouveau 0000:01:00.0: validate vram_list
[21415.165831] [drm] nouveau 0000:01:00.0: validate: -12
[21415.878743] nouveau_ratelimit: 4 callbacks suppressed
[21415.878750] [drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[21415.878763] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/4 class 0x0089 mthd
0x0304 data 0x02b5b500


I found that these problems can be fixed by reducing MaxTextureLevels value:
- Reducing from 12 to 11 resolves the first problem.
- Reducing to 10 resolves the second problem also.

I attached a patch which makes this change.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
