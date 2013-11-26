From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48742] [NV30 gallium] fbotexture -arb misrenders on
	nv43
Date: Tue, 26 Nov 2013 03:20:47 +0000
Message-ID: <bug-48742-8800-ocRlX1Njfe@http.bugs.freedesktop.org/>
References: <bug-48742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0118856904=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48742-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0118856904==
Content-Type: multipart/alternative; boundary="1385436046.c06061.25297"; charset="us-ascii"


--1385436046.c06061.25297
Date: Tue, 26 Nov 2013 03:20:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48742

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This should be "fixed" in mesa-git. The driver no longer reports
ARB_framebuffer_object, so the -arb option shouldn't work. The hardware doesn't
support differently-sized attachments. Since that extension is only part of
OpenGL 3.0, and the HW is only OpenGL 2.1-capable, no reason to try to do a
software fallback.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385436046.c06061.25297
Date: Tue, 26 Nov 2013 03:20:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742">bug 48742</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742">bug 48742</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This should be &quot;fixed&quot; in mesa-git. The driver no longer reports
ARB_framebuffer_object, so the -arb option shouldn't work. The hardware doesn't
support differently-sized attachments. Since that extension is only part of
OpenGL 3.0, and the HW is only OpenGL 2.1-capable, no reason to try to do a
software fallback.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385436046.c06061.25297--

--===============0118856904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0118856904==--
