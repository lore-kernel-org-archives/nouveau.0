From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35360] New: nouveau: no space while hiding cursor
Date: Wed, 16 Mar 2011 09:00:57 -0700 (PDT)
Message-ID: <bug-35360-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35360

           Summary: nouveau: no space while hiding cursor
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


After some time with moderate to high system load I get this message:

[163104.714192] [drm] nouveau 0000:01:00.0: no space while hiding cursor

This is a dualhead setup and I get one of those messages ever when my cursor
goes from one screen to the other. Concomitant I sometimes see a stuck phantom
cursor on the "inactive" screen.

It seems this message spewing begins after this fault:
[96771.217938] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x002004e150 Put 0x002004e554 IbGet 0x00000925 IbPut 0x00000940 State
0x8000a684 (err: INVALID_CMD) Push 0x00400040
[96771.227999] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR BEGIN_END_ACTIVE
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2 (0x0000a38000) subc 5
class 0x8397 mthd 0x1360 data 0x00000000
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR BEGIN_END_ACTIVE
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2 (0x0000a38000) subc 5
class 0x8397 mthd 0x155c data 0x00000000
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR BEGIN_END_ACTIVE
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2 (0x0000a38000) subc 5
class 0x8397 mthd 0x1560 data 0x20053000
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR BEGIN_END_ACTIVE
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[96771.228001] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2 (0x0000a38000) subc 5
class 0x8397 mthd 0x1564 data 0x00000000
[103270.749001] [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400
(0x0002 0x01)

Graphics stack is:
nouveau kernel from git (7972f91c24bb66643d76cf635faea78eb184e6b6)
libdrm from git (3b04c73650b5e9bbcb602fdb8cea0b16ad82d0c0)
xorg-x11-server-Xorg-1.9.4-1.fc14
xf-video-nouveau from git (ace98a492353e6de712f4f717e6d3f562e3591f0)

Graphics adapter is a nva0.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
