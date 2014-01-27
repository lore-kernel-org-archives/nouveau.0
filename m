From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74062] [NVE4] Artifacts in 3D games.
Date: Mon, 27 Jan 2014 22:44:20 +0000
Message-ID: <bug-74062-8800-a2Xsc0KDVo@http.bugs.freedesktop.org/>
References: <bug-74062-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1249366536=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74062-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1249366536==
Content-Type: multipart/alternative; boundary="1390862660.e7Ff2eC1.28211"; charset="us-ascii"


--1390862660.e7Ff2eC1.28211
Date: Mon, 27 Jan 2014 22:44:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74062

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Artifacts in 3D games.      |[NVE4] Artifacts in 3D
                   |                            |games.

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think I remember someone else having this style of corruption... e.g.
https://bugs.freedesktop.org/attachment.cgi?id=87845 from bug #70326 (for nvf0,
but they're sorta similar and the reporter mentions that he saw that issue on a
gtx650, which is nve7 probably). Sadly, not the slightest clue as to what's
wrong :( Feels like it's just not rendering certain triangles, or doesn't have
time to do it, or we're not waiting for it properly... or something else
entirely.

I was going to recommend that you try to use blob graph fw, but I see you're
already doing that. I suppose going back to the nouveau one causes even worse
issues...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390862660.e7Ff2eC1.28211
Date: Mon, 27 Jan 2014 22:44:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Artifacts in 3D games."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74062">bug 74062</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Artifacts in 3D games.
           </td>
           <td>[NVE4] Artifacts in 3D games.
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Artifacts in 3D games."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74062#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Artifacts in 3D games."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74062">bug 74062</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think I remember someone else having this style of corruption... e.g.
<a href="https://bugs.freedesktop.org/attachment.cgi?id=87845">https://bugs.freedesktop.org/attachment.cgi?id=87845</a> from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="show_bug.cgi?id=70326">bug #70326</a> (for nvf0,
but they're sorta similar and the reporter mentions that he saw that issue on a
gtx650, which is nve7 probably). Sadly, not the slightest clue as to what's
wrong :( Feels like it's just not rendering certain triangles, or doesn't have
time to do it, or we're not waiting for it properly... or something else
entirely.

I was going to recommend that you try to use blob graph fw, but I see you're
already doing that. I suppose going back to the nouveau one causes even worse
issues...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390862660.e7Ff2eC1.28211--

--===============1249366536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1249366536==--
