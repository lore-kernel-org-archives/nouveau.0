From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54786] random crashes of X with failed to idle
 channel 0xcccc0000
Date: Fri, 30 Aug 2013 21:21:54 +0000
Message-ID: <bug-54786-8800-dznL40cNLA@http.bugs.freedesktop.org/>
References: <bug-54786-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0735660434=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54786-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0735660434==
Content-Type: multipart/alternative; boundary="1377897714.a1Ddc4.21844"; charset="us-ascii"


--1377897714.a1Ddc4.21844
Date: Fri, 30 Aug 2013 21:21:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54786

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
"failed to idle channel xxx" means "the gpu appears to not have hit a sync
point". This can happen for a variety of reasons, differing for different
hardware. It has a special propensity for showing up on a resume where
operations were going on while the gpu was suspending, but can also happen in
other circumstances.

I'm going to close this bug because the issue is reportedly fixed for the
original bug reporter, and every other commenter has vastly different hardware.
I would advise each of you to update your software (kernel, xf86-video-nouveau,
mesa) to the latest, and if problems persist file your own separate bugs,
indicate what hardware you have, and what steps to reproduce, including logs.
See http://nouveau.freedesktop.org/wiki/Bugs/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377897714.a1Ddc4.21844
Date: Fri, 30 Aug 2013 21:21:54 +0000
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
   title="RESOLVED FIXED - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
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
   title="RESOLVED FIXED - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>&quot;failed to idle channel xxx&quot; means &quot;the gpu appears to not have hit a sync
point&quot;. This can happen for a variety of reasons, differing for different
hardware. It has a special propensity for showing up on a resume where
operations were going on while the gpu was suspending, but can also happen in
other circumstances.

I'm going to close this bug because the issue is reportedly fixed for the
original bug reporter, and every other commenter has vastly different hardware.
I would advise each of you to update your software (kernel, xf86-video-nouveau,
mesa) to the latest, and if problems persist file your own separate bugs,
indicate what hardware you have, and what steps to reproduce, including logs.
See <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377897714.a1Ddc4.21844--

--===============0735660434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0735660434==--
