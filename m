From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89910] Max resolution of 1024x768 with nouveau
Date: Sun, 05 Apr 2015 18:59:48 +0000
Message-ID: <bug-89910-8800-cowmWzLXeB@http.bugs.freedesktop.org/>
References: <bug-89910-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1655508461=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89910-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1655508461==
Content-Type: multipart/alternative; boundary="1428260387.4A6B1.20424"; charset="UTF-8"


--1428260387.4A6B1.20424
Date: Sun, 5 Apr 2015 18:59:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89910

Tom Winterhalder <tom.winterhalder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #4 from Tom Winterhalder <tom.winterhalder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It seems that the nomodeset was added during installation. 

The nouveau.config was added by me trying to find solve the issue.

Finally removing both settings solved the resoulution problem.

Thank you very much.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428260387.4A6B1.20424
Date: Sun, 5 Apr 2015 18:59:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:tom.winterhalder&#64;gmail.com" title="Tom Winterhalder &lt;tom.winterhalder&#64;gmail.com&gt;"> <span class="fn">Tom Winterhalder</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Max resolution of 1024x768 with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89910">bug 89910</a>
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
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Max resolution of 1024x768 with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89910#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Max resolution of 1024x768 with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89910">bug 89910</a>
              from <span class="vcard"><a class="email" href="mailto:tom.winterhalder&#64;gmail.com" title="Tom Winterhalder &lt;tom.winterhalder&#64;gmail.com&gt;"> <span class="fn">Tom Winterhalder</span></a>
</span></b>
        <pre>It seems that the nomodeset was added during installation. 

The nouveau.config was added by me trying to find solve the issue.

Finally removing both settings solved the resoulution problem.

Thank you very much.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428260387.4A6B1.20424--

--===============1655508461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1655508461==--
