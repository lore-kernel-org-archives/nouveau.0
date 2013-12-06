From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72399] [NVAA][NV50][Regression] Oops : nouveau:
 3.13-rc1+ probe of 0000:02:00.0 failed with error -22
Date: Fri, 06 Dec 2013 14:36:01 +0000
Message-ID: <bug-72399-8800-te9B6l7c5z@http.bugs.freedesktop.org/>
References: <bug-72399-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1429102148=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72399-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1429102148==
Content-Type: multipart/alternative; boundary="1386340561.48acef652.7381"; charset="us-ascii"


--1386340561.48acef652.7381
Date: Fri, 6 Dec 2013 14:36:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72399

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
http://lists.freedesktop.org/archives/nouveau/2013-December/015304.html

Fixed in drm-nouveau-next, or in airlied's drm-fixes, should be upstream
soonish.

The oops itself actually has nothing to do with nouveau. It is fixed by

http://lists.freedesktop.org/archives/dri-devel/2013-December/050098.html

and will hopefully be picked up in the drm-fixes branch and make its way to
3.13.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386340561.48acef652.7381
Date: Fri, 6 Dec 2013 14:36:01 +0000
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
   title="RESOLVED FIXED - [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72399">bug 72399</a>
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
   title="RESOLVED FIXED - [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72399#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72399">bug 72399</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><a href="http://lists.freedesktop.org/archives/nouveau/2013-December/015304.html">http://lists.freedesktop.org/archives/nouveau/2013-December/015304.html</a>

Fixed in drm-nouveau-next, or in airlied's drm-fixes, should be upstream
soonish.

The oops itself actually has nothing to do with nouveau. It is fixed by

<a href="http://lists.freedesktop.org/archives/dri-devel/2013-December/050098.html">http://lists.freedesktop.org/archives/dri-devel/2013-December/050098.html</a>

and will hopefully be picked up in the drm-fixes branch and make its way to
3.13.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386340561.48acef652.7381--

--===============1429102148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1429102148==--
