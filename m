From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Thu, 13 Feb 2014 21:58:20 +0000
Message-ID: <bug-67628-8800-9Ex3iVZT2c@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1384624811=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1384624811==
Content-Type: multipart/alternative; boundary="1392328700.a31ee8C3.24177"; charset="us-ascii"


--1392328700.a31ee8C3.24177
Date: Thu, 13 Feb 2014 21:58:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, those two boots are WAY more similar. Which makes the differences stand
out.

working:

[    4.217706] nouveau  [     DRM] 4 lanes at 270000 KB/s
[    4.217708] nouveau T[   VBIOS][0000:03:00.0] 0x577f[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    4.217709] nouveau T[   VBIOS][0000:03:00.0] 0x5788[0]: DONE
[    4.218118] nouveau  [     DRM] training pattern 1
[    4.218991] nouveau  [     DRM] config lane 0 00
[    4.219000] nouveau  [     DRM] config lane 1 00
[    4.219007] nouveau  [     DRM] config lane 2 00
[    4.219014] nouveau  [     DRM] config lane 3 00
[    4.219980] nouveau  [     DRM] status 00 00 80 02 22 22
[    4.219981] nouveau  [     DRM] config lane 0 02
[    4.219990] nouveau  [     DRM] config lane 1 02
[    4.219999] nouveau  [     DRM] config lane 2 02
[    4.220008] nouveau  [     DRM] config lane 3 02
[    4.220995] nouveau  [     DRM] status 11 11 80 02 22 22
[    4.220996] nouveau  [     DRM] training pattern 2
[    4.222708] nouveau  [     DRM] status 11 11 80 02 66 66
[    4.222708] nouveau  [     DRM] config lane 0 0a
[    4.222717] nouveau  [     DRM] config lane 1 0a
[    4.222723] nouveau  [     DRM] config lane 2 0a
[    4.222730] nouveau  [     DRM] config lane 3 0a
[    4.223994] nouveau  [     DRM] status 77 77 81 02 66 66
[    4.223994] nouveau  [     DRM] config lane 0 0a
[    4.224001] nouveau  [     DRM] config lane 1 0a
[    4.224008] nouveau  [     DRM] config lane 2 0a
[    4.224015] nouveau  [     DRM] config lane 3 0a
[    4.224440] nouveau  [     DRM] training pattern 0

non-working:

[    4.371173] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: 2 lanes at
270000 KB/s
[    4.371589] nouveau T[   VBIOS][0000:03:00.0] 0x577f[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    4.371590] nouveau T[   VBIOS][0000:03:00.0] 0x5788[0]: DONE
[    4.371596] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
1
[    4.372470] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 00
[    4.372478] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 00
[    4.373451] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 00 00 80
02 22 00
[    4.373465] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 02
[    4.373473] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 02
[    4.374475] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 11 00 80
02 22 00
[    4.374476] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
2
[    4.376205] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 11 00 80
02 66 00
[    4.376207] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 0a
[    4.376218] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 0a
[    4.377498] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 77 00 81
02 66 00
[    4.377499] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 0a
[    4.377508] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 0a
[    4.377934] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
0

Note the difference in the quantity of lanes detected. No idea if this actually
matters. But that's the only difference of any significance that I can see.

Could you just fudge your nouveau_dp_train function to determine that you need
4 lanes and see if that helps?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392328700.a31ee8C3.24177
Date: Thu, 13 Feb 2014 21:58:20 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, those two boots are WAY more similar. Which makes the differences stand
out.

working:

[    4.217706] nouveau  [     DRM] 4 lanes at 270000 KB/s
[    4.217708] nouveau T[   VBIOS][0000:03:00.0] 0x577f[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    4.217709] nouveau T[   VBIOS][0000:03:00.0] 0x5788[0]: DONE
[    4.218118] nouveau  [     DRM] training pattern 1
[    4.218991] nouveau  [     DRM] config lane 0 00
[    4.219000] nouveau  [     DRM] config lane 1 00
[    4.219007] nouveau  [     DRM] config lane 2 00
[    4.219014] nouveau  [     DRM] config lane 3 00
[    4.219980] nouveau  [     DRM] status 00 00 80 02 22 22
[    4.219981] nouveau  [     DRM] config lane 0 02
[    4.219990] nouveau  [     DRM] config lane 1 02
[    4.219999] nouveau  [     DRM] config lane 2 02
[    4.220008] nouveau  [     DRM] config lane 3 02
[    4.220995] nouveau  [     DRM] status 11 11 80 02 22 22
[    4.220996] nouveau  [     DRM] training pattern 2
[    4.222708] nouveau  [     DRM] status 11 11 80 02 66 66
[    4.222708] nouveau  [     DRM] config lane 0 0a
[    4.222717] nouveau  [     DRM] config lane 1 0a
[    4.222723] nouveau  [     DRM] config lane 2 0a
[    4.222730] nouveau  [     DRM] config lane 3 0a
[    4.223994] nouveau  [     DRM] status 77 77 81 02 66 66
[    4.223994] nouveau  [     DRM] config lane 0 0a
[    4.224001] nouveau  [     DRM] config lane 1 0a
[    4.224008] nouveau  [     DRM] config lane 2 0a
[    4.224015] nouveau  [     DRM] config lane 3 0a
[    4.224440] nouveau  [     DRM] training pattern 0

non-working:

[    4.371173] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: 2 lanes at
270000 KB/s
[    4.371589] nouveau T[   VBIOS][0000:03:00.0] 0x577f[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    4.371590] nouveau T[   VBIOS][0000:03:00.0] 0x5788[0]: DONE
[    4.371596] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
1
[    4.372470] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 00
[    4.372478] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 00
[    4.373451] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 00 00 80
02 22 00
[    4.373465] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 02
[    4.373473] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 02
[    4.374475] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 11 00 80
02 22 00
[    4.374476] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
2
[    4.376205] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 11 00 80
02 66 00
[    4.376207] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 0a
[    4.376218] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 0a
[    4.377498] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: status 77 00 81
02 66 00
[    4.377499] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 0 0a
[    4.377508] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: config lane 1 0a
[    4.377934] nouveau D[   PDISP][0000:03:00.0] DP:0006:0342: training pattern
0

Note the difference in the quantity of lanes detected. No idea if this actually
matters. But that's the only difference of any significance that I can see.

Could you just fudge your nouveau_dp_train function to determine that you need
4 lanes and see if that helps?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392328700.a31ee8C3.24177--

--===============1384624811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1384624811==--
