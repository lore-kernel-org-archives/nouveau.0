From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Wed, 05 Aug 2015 13:50:57 +0000
Message-ID: <bug-59069-8800-cBbjTNVgBI@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1813761910=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1813761910==
Content-Type: multipart/alternative; boundary="1438782657.323Ba3.12402"; charset="UTF-8"


--1438782657.323Ba3.12402
Date: Wed, 5 Aug 2015 13:50:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---
           Severity|major                       |critical

--- Comment #29 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi, the bug is alive and kicking on Ubuntu 15.04 kernel 3.19 with both mesa
10.6.x and 11.0.0devel.

It seams to specifically affect GeForce 61xx and GeForce 70xx
Attaching new logs, if possible

Mauro

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438782657.323Ba3.12402
Date: Wed, 5 Aug 2015 13:50:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
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
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>major
           </td>
           <td>critical
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span></b>
        <pre>Hi, the bug is alive and kicking on Ubuntu 15.04 kernel 3.19 with both mesa
10.6.x and 11.0.0devel.

It seams to specifically affect GeForce 61xx and GeForce 70xx
Attaching new logs, if possible

Mauro</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438782657.323Ba3.12402--

--===============1813761910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1813761910==--
