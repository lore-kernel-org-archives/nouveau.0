From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66650] [regression][NVD0] 'drm/nve0-/gr: some new
 gpc registers can have multiple copies' causes lockups
Date: Wed, 10 Jul 2013 14:10:18 +0000
Message-ID: <bug-66650-8800-CrU4M0PmWr@http.bugs.freedesktop.org/>
References: <bug-66650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1876220563=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66650-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1876220563==
Content-Type: multipart/alternative; boundary="1373465418.B75b42.14569"; charset="us-ascii"


--1373465418.B75b42.14569
Date: Wed, 10 Jul 2013 14:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66650

Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Fixed with commit d2989b534ef6834ebf2425aecc040b894b567c91 "drm/nvc0/gr: fix
gpc firmware regression" .

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373465418.B75b42.14569
Date: Wed, 10 Jul 2013 14:10:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650">bug 66650</a>
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
   title="RESOLVED FIXED - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650">bug 66650</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Fixed with commit d2989b534ef6834ebf2425aecc040b894b567c91 &quot;drm/nvc0/gr: fix
gpc firmware regression&quot; .</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373465418.B75b42.14569--

--===============1876220563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1876220563==--
