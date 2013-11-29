From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] Distorted graphics on NVIDIA GeForce 8400M G
 after upgrade the kernel to 3.7.0 version
Date: Fri, 29 Nov 2013 10:48:58 +0000
Message-ID: <bug-58378-8800-W8XygsThd9@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0204294986=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0204294986==
Content-Type: multipart/alternative; boundary="1385722138.C20Fc4eF5.1585"; charset="us-ascii"


--1385722138.C20Fc4eF5.1585
Date: Fri, 29 Nov 2013 10:48:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #14 from torsten.stocklossa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
HI again, in addition some error messages 

Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.215782] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304180] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000004 warp
10, opcode ffb9c1d8 ffbac2d9
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304188] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304193] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304477] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000004 warp
10, opcode ffb9c1d8 ffbac2d9
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304483] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304487] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000


and 

Nov 29 11:26:04 torsten-LIFEBOOK-E8410 kernel: [  323.106306] nouveau E[    
DRM] GPU lockup - switching to software fbcon
Nov 29 11:27:07 torsten-LIFEBOOK-E8410 kernel: [  386.736037] nouveau E[   
3431] failed to idle channel 0xcccc0001
Nov 29 11:27:09 torsten-LIFEBOOK-E8410 kernel: [  388.735098] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:27:12 torsten-LIFEBOOK-E8410 kernel: [  391.732025] nouveau E[   
3431] failed to idle channel 0xcccc0000
Nov 29 11:27:14 torsten-LIFEBOOK-E8410 kernel: [  393.731221] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout
Nov 29 11:28:09 torsten-LIFEBOOK-E8410 kernel: [  448.580025] nouveau E[   
4056] failed to idle channel 0xcccc0001
Nov 29 11:28:11 torsten-LIFEBOOK-E8410 kernel: [  450.579162] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:28:14 torsten-LIFEBOOK-E8410 kernel: [  453.576022] nouveau E[   
4056] failed to idle channel 0xcccc0000
Nov 29 11:28:16 torsten-LIFEBOOK-E8410 kernel: [  455.575198] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout
Nov 29 11:29:17 torsten-LIFEBOOK-E8410 kernel: [  516.552036] nouveau E[   
4211] failed to idle channel 0xcccc0001
Nov 29 11:29:19 torsten-LIFEBOOK-E8410 kernel: [  518.553893] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:29:22 torsten-LIFEBOOK-E8410 kernel: [  521.556024] nouveau E[   
4211] failed to idle channel 0xcccc0000
Nov 29 11:29:24 torsten-LIFEBOOK-E8410 kernel: [  523.555077] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout


For both the session is Gnome. Now when running on Gnome (no effects ) ist is
slighly more stable.

As mentioned I also tried NVIDIA drivers .... with the effect that the system
was unusable at all. 

Since the issue seems to be quite old . . . there should be an appropriate
solution by now !

cheers
TS

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385722138.C20Fc4eF5.1585
Date: Fri, 29 Nov 2013 10:48:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:torsten.stocklossa&#64;gmail.com" title="torsten.stocklossa&#64;gmail.com">torsten.stocklossa&#64;gmail.com</a>
</span></b>
        <pre>HI again, in addition some error messages 

Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.215782] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304180] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000004 warp
10, opcode ffb9c1d8 ffbac2d9
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304188] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304193] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304477] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 000004 warp
10, opcode ffb9c1d8 ffbac2d9
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304483] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Nov 29 11:21:47 torsten-LIFEBOOK-E8410 kernel: [   66.304487] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000] subc 7 class 0x8297 mthd 0x15e0 data
0x00000000


and 

Nov 29 11:26:04 torsten-LIFEBOOK-E8410 kernel: [  323.106306] nouveau E[    
DRM] GPU lockup - switching to software fbcon
Nov 29 11:27:07 torsten-LIFEBOOK-E8410 kernel: [  386.736037] nouveau E[   
3431] failed to idle channel 0xcccc0001
Nov 29 11:27:09 torsten-LIFEBOOK-E8410 kernel: [  388.735098] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:27:12 torsten-LIFEBOOK-E8410 kernel: [  391.732025] nouveau E[   
3431] failed to idle channel 0xcccc0000
Nov 29 11:27:14 torsten-LIFEBOOK-E8410 kernel: [  393.731221] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout
Nov 29 11:28:09 torsten-LIFEBOOK-E8410 kernel: [  448.580025] nouveau E[   
4056] failed to idle channel 0xcccc0001
Nov 29 11:28:11 torsten-LIFEBOOK-E8410 kernel: [  450.579162] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:28:14 torsten-LIFEBOOK-E8410 kernel: [  453.576022] nouveau E[   
4056] failed to idle channel 0xcccc0000
Nov 29 11:28:16 torsten-LIFEBOOK-E8410 kernel: [  455.575198] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout
Nov 29 11:29:17 torsten-LIFEBOOK-E8410 kernel: [  516.552036] nouveau E[   
4211] failed to idle channel 0xcccc0001
Nov 29 11:29:19 torsten-LIFEBOOK-E8410 kernel: [  518.553893] nouveau E[  
PFIFO][0000:01:00.0] channel 3 unload timeout
Nov 29 11:29:22 torsten-LIFEBOOK-E8410 kernel: [  521.556024] nouveau E[   
4211] failed to idle channel 0xcccc0000
Nov 29 11:29:24 torsten-LIFEBOOK-E8410 kernel: [  523.555077] nouveau E[  
PFIFO][0000:01:00.0] channel 2 unload timeout


For both the session is Gnome. Now when running on Gnome (no effects ) ist is
slighly more stable.

As mentioned I also tried NVIDIA drivers .... with the effect that the system
was unusable at all. 

Since the issue seems to be quite old . . . there should be an appropriate
solution by now !

cheers
TS</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385722138.C20Fc4eF5.1585--

--===============0204294986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0204294986==--
