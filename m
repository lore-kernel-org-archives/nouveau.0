From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60951] xf86-video-nouveau 1.0.6-1: Mouse cursor
 intermittently disappears, requiring reboot to resolve.
Date: Tue, 20 Aug 2013 01:16:17 +0000
Message-ID: <bug-60951-8800-BEpxRgEoTs@http.bugs.freedesktop.org/>
References: <bug-60951-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1911148387=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60951-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1911148387==
Content-Type: multipart/alternative; boundary="1376961377.00Af6a2.27431"; charset="us-ascii"


--1376961377.00Af6a2.27431
Date: Tue, 20 Aug 2013 01:16:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60951

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This bug doesn't really provide any information, like hardware, logs, etc.
Let's assume that it's also about a NV4E card and mark it as a dup of the other
issue. I hightly doubt that x86 vs x86_64 would make a difference here. (I
remember seeing yet-another report of NV4E cursor weirdness.)

*** This bug has been marked as a duplicate of bug 15758 ***

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376961377.00Af6a2.27431
Date: Tue, 20 Aug 2013 01:16:17 +0000
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
   title="RESOLVED DUPLICATE - xf86-video-nouveau 1.0.6-1: Mouse cursor intermittently disappears, requiring reboot to resolve."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60951">bug 60951</a>
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
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - xf86-video-nouveau 1.0.6-1: Mouse cursor intermittently disappears, requiring reboot to resolve."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60951#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - xf86-video-nouveau 1.0.6-1: Mouse cursor intermittently disappears, requiring reboot to resolve."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60951">bug 60951</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This bug doesn't really provide any information, like hardware, logs, etc.
Let's assume that it's also about a NV4E card and mark it as a dup of the other
issue. I hightly doubt that x86 vs x86_64 would make a difference here. (I
remember seeing yet-another report of NV4E cursor weirdness.)

*** This bug has been marked as a duplicate of <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Invisible mouse pointer on NV4E (C51)"
   href="show_bug.cgi?id=15758">bug 15758</a> ***</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376961377.00Af6a2.27431--

--===============1911148387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1911148387==--
