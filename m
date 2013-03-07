From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61947] nullpointer dereference causes xorg-server
 segfault when nouveau DRI driver is loaded
Date: Thu, 07 Mar 2013 19:00:48 +0000
Message-ID: <bug-61947-8800-fhEXKFQwlk@http.bugs.freedesktop.org/>
References: <bug-61947-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0749215560=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61947-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0749215560==
Content-Type: multipart/alternative; boundary="1362682848.EF4DFF1.6989"; charset="us-ascii"


--1362682848.EF4DFF1.6989
Date: Thu, 7 Mar 2013 19:00:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61947

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks. I pushed it to master and marked as stable candidate.

http://cgit.freedesktop.org/mesa/mesa/commit/?id=17f1cb1d99e66227d1e05925ef937643f5c1089a

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362682848.EF4DFF1.6989
Date: Thu, 7 Mar 2013 19:00:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nullpointer dereference causes xorg-server segfault when nouveau DRI driver is loaded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61947">bug 61947</a>
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
   title="RESOLVED FIXED - nullpointer dereference causes xorg-server segfault when nouveau DRI driver is loaded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61947#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nullpointer dereference causes xorg-server segfault when nouveau DRI driver is loaded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61947">bug 61947</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Thanks. I pushed it to master and marked as stable candidate.

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=17f1cb1d99e66227d1e05925ef937643f5c1089a">http://cgit.freedesktop.org/mesa/mesa/commit/?id=17f1cb1d99e66227d1e05925ef937643f5c1089a</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362682848.EF4DFF1.6989--

--===============0749215560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0749215560==--
