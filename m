From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70130] unable to compile fragment shader program
Date: Fri, 04 Oct 2013 16:08:08 +0000
Message-ID: <bug-70130-8800-AfqGbsUqYn@http.bugs.freedesktop.org/>
References: <bug-70130-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1210827452=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70130-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1210827452==
Content-Type: multipart/alternative; boundary="1380902887.Bc413D0b1.8032"; charset="us-ascii"


--1380902887.Bc413D0b1.8032
Date: Fri, 4 Oct 2013 16:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70130

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe this should be fixed in
http://cgit.freedesktop.org/mesa/mesa/commit/?h=9.2&id=3b852f9d52732066bffd498313b3ccae4b615481
on the 9.2 branch, and
http://cgit.freedesktop.org/mesa/mesa/commit/?id=3282697621241e646247b85327c50747416a766b
on master. Whenever 9.2.1 comes out, it should include the fix.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380902887.Bc413D0b1.8032
Date: Fri, 4 Oct 2013 16:08:07 +0000
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
   title="RESOLVED FIXED - unable to compile fragment shader program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70130">bug 70130</a>
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
   title="RESOLVED FIXED - unable to compile fragment shader program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70130#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - unable to compile fragment shader program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70130">bug 70130</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe this should be fixed in
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?h=9.2&amp;id=3b852f9d52732066bffd498313b3ccae4b615481">http://cgit.freedesktop.org/mesa/mesa/commit/?h=9.2&amp;id=3b852f9d52732066bffd498313b3ccae4b615481</a>
on the 9.2 branch, and
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=3282697621241e646247b85327c50747416a766b">http://cgit.freedesktop.org/mesa/mesa/commit/?id=3282697621241e646247b85327c50747416a766b</a>
on master. Whenever 9.2.1 comes out, it should include the fix.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380902887.Bc413D0b1.8032--

--===============1210827452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1210827452==--
