From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90883] Random text characters partially or
	completely missing
Date: Tue, 09 Jun 2015 18:52:42 +0000
Message-ID: <bug-90883-8800-2GuS7gvjPY@http.bugs.freedesktop.org/>
References: <bug-90883-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1003682425=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90883-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1003682425==
Content-Type: multipart/alternative; boundary="1433850761.BBdCB61.9579"; charset="UTF-8"


--1433850761.BBdCB61.9579
Date: Tue, 9 Jun 2015 04:52:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90883

Steven Usdansky <usdanskys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Steven Usdansky <usdanskys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Using today's upgraded nouveau driver, along with (the formerly problematic)
xserver-common and xserver-xorg-core has fixed the problem.

Working configuraiton:
  xserver-common                 2:1.17.1-0ubuntu4
  xserver-xorg-core              2:1.17.1-0ubuntu4
  xserver-xorg-video-nouveau     1:1.0.11-1ubuntu3

Changing status to Resolved fixed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433850761.BBdCB61.9579
Date: Tue, 9 Jun 2015 04:52:41 -0700
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:usdanskys&#64;gmail.com" title="Steven Usdansky &lt;usdanskys&#64;gmail.com&gt;"> <span class="fn">Steven Usdansky</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Random text characters partially or completely missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90883">bug 90883</a>
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
   title="RESOLVED FIXED - Random text characters partially or completely missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90883#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Random text characters partially or completely missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90883">bug 90883</a>
              from <span class="vcard"><a class="email" href="mailto:usdanskys&#64;gmail.com" title="Steven Usdansky &lt;usdanskys&#64;gmail.com&gt;"> <span class="fn">Steven Usdansky</span></a>
</span></b>
        <pre>Using today's upgraded nouveau driver, along with (the formerly problematic)
xserver-common and xserver-xorg-core has fixed the problem.

Working configuraiton:
  xserver-common                 2:1.17.1-0ubuntu4
  xserver-xorg-core              2:1.17.1-0ubuntu4
  xserver-xorg-video-nouveau     1:1.0.11-1ubuntu3

Changing status to Resolved fixed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433850761.BBdCB61.9579--

--===============1003682425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1003682425==--
