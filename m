From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39980] New: freezing nouveau
Date: Wed, 10 Aug 2011 06:44:42 -0700 (PDT)
Message-ID: <bug-39980-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39980

           Summary: freezing nouveau
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50095)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50095)
xorg log 

Hi.

I experience quite frequent freezes of the system since I've switched over to
nouveau... :(

This system here runs Debian unstable on AMD64, the GPU is a G86 [GeForce 8400M
G].

Symptom is that X suddenly freezes (although the system seems to keep running
in the back). Mouse continues to work, keyboard doesn't although SysRq is
possible to some extent (well sync/umount/boot).
Going back to console does not work.

I've attached an Xorg.log (although this didn't contain any errors).


Also some kernel log messages, collected from various events:
kern.log.2.xz:Jul 30 20:19:44 heisenberg kernel: [16890.395990] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 30 20:19:44 heisenberg kernel: [16890.395995] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 30 20:19:44 heisenberg kernel: [16890.396031] [drm] nouveau
0000:01:00.0: validate: -12
kern.log.2.xz:Jul 30 20:21:38 heisenberg kernel: [17004.414063] [drm] nouveau
0000:01:00.0: EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x000b 0x05)
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.482834] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.482840] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.482867] [drm] nouveau
0000:01:00.0: validate: -12
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.495997] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.496136] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 30 20:22:55 heisenberg kernel: [17081.496155] [drm] nouveau
0000:01:00.0: validate: -12
kern.log.2.xz:Jul 30 20:22:58 heisenberg kernel: [17084.554033] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 30 20:22:58 heisenberg kernel: [17084.554036] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 30 20:22:58 heisenberg kernel: [17084.554056] [drm] nouveau
0000:01:00.0: validate: -16


kern.log.3.xz:Jul 21 20:12:56 heisenberg kernel: [29940.042744] [drm] nouveau
0000:01:00.0: Error allocating channel PRAMIN: -28
kern.log.3.xz:Jul 21 20:12:56 heisenberg kernel: [29940.042748] [drm] nouveau
0000:01:00.0: init pramin
kern.log.3.xz:Jul 21 20:12:56 heisenberg kernel: [29940.042750] [drm] nouveau
0000:01:00.0: gpuobj -28


kern.log.2.xz:Jul 29 20:48:19 heisenberg kernel: [ 5362.017674] [drm] nouveau
0000:01:00.0: PFIFO_CACHE_ERROR - Ch 4/1 Mthd 0x0060 Data 0xbeef0201


kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.943625] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.943627] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.943632] [drm] nouveau
0000:01:00.0: validate: -12
kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.981260] [drm] nouveau
0000:01:00.0: fail ttm_validate
kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.981261] [drm] nouveau
0000:01:00.0: validate vram_list
kern.log.2.xz:Jul 29 12:39:11 heisenberg kernel: [ 5129.981267] [drm] nouveau
0000:01:00.0: validate: -12


kern.log.1:Aug  5 21:14:12 heisenberg kernel: [11333.244292] [drm] nouveau
0000:01:00.0: PFIFO_CACHE_ERROR - Ch 2/1 Mthd 0x0060 Data 0xd8000001


kern.log.1:Aug  5 16:34:38 heisenberg kernel: [12607.195869] [drm] nouveau
0000:01:00.0: PFIFO_CACHE_ERROR - Ch 4/1 Mthd 0x0060 Data 0xbeef0201
k



In this case, it apparently just killed my window manager, falling back to
metacity, and I could somehow cleanly reboot the system
Aug 10 14:43:40 heisenberg kernel: [ 1061.085190] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Aug 10 14:43:40 heisenberg kernel: [ 1061.085195] [drm] nouveau 0000:01:00.0:
validate vram_list
Aug 10 14:43:40 heisenberg kernel: [ 1061.085200] [drm] nouveau 0000:01:00.0:
validate: -12
Aug 10 14:53:25 heisenberg kernel: [ 1646.803467] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Aug 10 14:53:25 heisenberg kernel: [ 1646.803472] [drm] nouveau 0000:01:00.0:
validate vram_list
Aug 10 14:53:25 heisenberg kernel: [ 1646.803477] [drm] nouveau 0000:01:00.0:
validate: -12
Aug 10 14:53:25 heisenberg kernel: [ 1646.861090] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Aug 10 14:53:25 heisenberg kernel: [ 1646.861096] [drm] nouveau 0000:01:00.0:
validate vram_list
Aug 10 14:53:25 heisenberg kernel: [ 1646.861102] [drm] nouveau 0000:01:00.0:
validate: -12
Aug 10 15:10:38 heisenberg kernel: [ 2679.960989] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Aug 10 15:10:38 heisenberg kernel: [ 2679.960994] [drm] nouveau 0000:01:00.0:
validate vram_list
Aug 10 15:10:38 heisenberg kernel: [ 2679.961027] [drm] nouveau 0000:01:00.0:
validate: -12
Aug 10 15:10:44 heisenberg kernel: [ 2685.310110] [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000000 warp 0, opcode
00000000 00000000
Aug 10 15:10:44 heisenberg kernel: [ 2685.310117] [drm] nouveau 0000:01:00.0:
PGRAPH - TRAP 
Aug 10 15:10:44 heisenberg kernel: [ 2685.310121] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 5 (0x0006496000) subc 7 class 0x8297 mthd 0x1a1c data 0x00001111
Aug 10 15:10:44 heisenberg kernel: [ 2685.346157] [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000000 warp 0, opcode
00000000 00000000
Aug 10 15:10:44 heisenberg kernel: [ 2685.346165] [drm] nouveau 0000:01:00.0:
PGRAPH - TRAP
Aug 10 15:10:44 heisenberg kernel: [ 2685.346169] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 5 (0x0006496000) subc 7 class 0x8297 mthd 0x1a1c data 0x00001111

(was just doing some libreoffice stuff,... so there shouldn't have been any 3D
problems included!?)



There usually follows some filesystem corruption from this...
Which makes the whole thing barely usable.


Not sure whether this is related, but I had some severe problems of freezing
nouveau, which seemed to be related with the system going out of main memory.
(Had several VirtualBox VMs started,...) This was quite easily reproduceable.



Any ideas? Or is there at least some way to certainly kill nouveau/X and go
back to a working console?


If you need further data, please tell me which.


Cheers,
Chris.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
