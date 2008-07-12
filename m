From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16684] New: renouveau runs forever on 8600GS
Date: Sat, 12 Jul 2008 11:07:58 -0700 (PDT)
Message-ID: <bug-16684-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16684

           Summary: renouveau runs forever on 8600GS
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: camaradetux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


With cvs from today (12/07/2008), renouveau runs forever. The card is a 8600GS
(pci id : 01:00.0 0300: 10de:0425 (rev a1)). NVidia driver is 173.14.09. The
kernel is 2.6.24.5, custom configured (config attached). glxgears gives me
5500fps.

This is renouveau's output :
  mkdir: cannot create directory `cards': File exists
  9/87 test_draw_buffer                                 
  No Stereo context. Skipping stereo tests
  No double buffering. Skipping double buffer tests
  No multisample buffers. Skipping ARB_multisample test         
  No GL_EXT_vertex_weighting extension.                                  
  No GL_NV_texgen_emboss extension.                                 
  GL_NV_vertex_program3 crashes up until driver 100.14.19 on G80 - skipping.
  86/87 test_arb_vertex_buffer_object_indexed                              

Then it runs at 100% forever (I mean, really 100%, not 99,99999% ; I have a
Core2Duo).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
