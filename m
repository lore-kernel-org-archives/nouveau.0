From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57278] [NV50 gallium] flightgear crash when loading
 scenary: nv50_pc.h:351: nv_alloc_instruction: Assertion
 `pc->num_instructions < 2048
Date: Fri, 30 Aug 2013 23:26:30 +0000
Message-ID: <bug-57278-8800-15CfkoIwWZ@http.bugs.freedesktop.org/>
References: <bug-57278-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1176054555=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57278-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1176054555==
Content-Type: multipart/alternative; boundary="1377905190.CdCA1.14972"; charset="us-ascii"


--1377905190.CdCA1.14972
Date: Fri, 30 Aug 2013 23:26:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57278

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[xf86-video-nouveau]        |[NV50 gallium] flightgear
                   |flightgear crash when       |crash when loading scenary:
                   |loading scenary             |nv50_pc.h:351:
                   |                            |nv_alloc_instruction:
                   |                            |Assertion
                   |                            |`pc->num_instructions <
                   |                            |2048

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please retest with mesa 9.2. If problem continues, please make sure to mention
what hardware you're using.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377905190.CdCA1.14972
Date: Fri, 30 Aug 2013 23:26:30 +0000
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
   title="NEW --- - [NV50 gallium] flightgear crash when loading scenary: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc-&gt;num_instructions &lt; 2048"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278">bug 57278</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[xf86-video-nouveau] flightgear crash when loading scenary
           </td>
           <td>[NV50 gallium] flightgear crash when loading scenary: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc-&gt;num_instructions &lt; 2048
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] flightgear crash when loading scenary: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc-&gt;num_instructions &lt; 2048"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] flightgear crash when loading scenary: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc-&gt;num_instructions &lt; 2048"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278">bug 57278</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please retest with mesa 9.2. If problem continues, please make sure to mention
what hardware you're using.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377905190.CdCA1.14972--

--===============1176054555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1176054555==--
