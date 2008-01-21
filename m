From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14168] New: endian bug on powerpc
Date: Mon, 21 Jan 2008 02:07:14 -0800 (PST)
Message-ID: <bug-14168-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14168

           Summary: endian bug on powerpc
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


It seems there is still a endian bug with Xv:
playing movies requesting a YV12 colorspace show wrong colors (usually green
people). It's the same for both xv ports.

For me (NV34 on ppc), it can be fixed  by applying the following patch:

--- nv_video.c~ 2008-01-21 11:33:53.000000000 +0900
+++ nv_video.c  2008-01-21 19:02:27.000000000 +0900
@@ -689,11 +689,7 @@
                        }
                if (e)  {
                        unsigned short *vud = (unsigned short *) vuvud;
-#if X_BYTE_ORDER == X_BIG_ENDIAN
-                       *vud = (vs[0]<<8) | (us[0] << 0);
-#else
                        *vud = vs[0] | (us[0]<<8);
-#endif
                        }
                dst += dstPitch ;
                src1 += srcPitch2;


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
