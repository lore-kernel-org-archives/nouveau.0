From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79946] Segmentation violation at nouveau_fence.c
Date: Thu, 19 Jun 2014 17:35:30 +0000
Message-ID: <bug-79946-8800-AQVQK6ERcl@http.bugs.freedesktop.org/>
References: <bug-79946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1351158321=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79946-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1351158321==
Content-Type: multipart/alternative; boundary="1403199330.fa2bE61A0.4007"; charset="us-ascii"


--1403199330.fa2bE61A0.4007
Date: Thu, 19 Jun 2014 17:35:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79946

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|DUPLICATE                   |---

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually this unlikely to be a duplicate of that bug. This bug might be
resolved by

http://cgit.freedesktop.org/mesa/mesa/commit/?id=c092c46b27c6f6a6674e8d67fb3afdb684811819

But I'm not 100% sure... mind trying it out?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403199330.fa2bE61A0.4007
Date: Thu, 19 Jun 2014 17:35:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Segmentation violation at nouveau_fence.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79946">bug 79946</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>DUPLICATE
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Segmentation violation at nouveau_fence.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79946#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Segmentation violation at nouveau_fence.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79946">bug 79946</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually this unlikely to be a duplicate of that bug. This bug might be
resolved by

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=c092c46b27c6f6a6674e8d67fb3afdb684811819">http://cgit.freedesktop.org/mesa/mesa/commit/?id=c092c46b27c6f6a6674e8d67fb3afdb684811819</a>

But I'm not 100% sure... mind trying it out?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403199330.fa2bE61A0.4007--

--===============1351158321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1351158321==--
