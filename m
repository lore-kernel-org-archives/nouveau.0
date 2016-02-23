From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] [NV67] GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Tue, 23 Feb 2016 07:39:36 +0000
Message-ID: <bug-90569-8800-RxAEWXnzwg@http.bugs.freedesktop.org/>
References: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2114926627=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2114926627==
Content-Type: multipart/alternative; boundary="14562131761.cFB89bC.17957";
 charset="UTF-8"


--14562131761.cFB89bC.17957
Date: Tue, 23 Feb 2016 07:39:36 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=90569

Christopher M. Penalver <christopher.m.penalver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #7 from Christopher M. Penalver <christopher.m.penalver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Jadet Ilrihm, 15.04 is EOL as of February 4, 2016. For more on this, please see
https://wiki.ubuntu.com/Releases .

If this is reproducible in a supported release, it will help immensely if you
filed a new report with the Ubuntu repository kernel (not mainline/upstream)
via a terminal:
ubuntu-bug linux

Please feel free to subscribe me to it.

For more on why this is helpful, please see
https://wiki.ubuntu.com/ReportingBugs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14562131761.cFB89bC.17957
Date: Tue, 23 Feb 2016 07:39:36 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:christopher.m.penalver&#64;gmail.com" title="Christopher M. Penalver &lt;christopher.m.penalver&#64;gmail.com&gt;"> <span class="fn">Christopher M. Penalver</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">bug 90569</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90569">bug 90569</a>
              from <span class="vcard"><a class="email" href="mailto:christopher.m.penalver&#64;gmail.com" title="Christopher M. Penalver &lt;christopher.m.penalver&#64;gmail.com&gt;"> <span class="fn">Christopher M. Penalver</span></a>
</span></b>
        <pre>Jadet Ilrihm, 15.04 is EOL as of February 4, 2016. For more on this, please see
<a href="https://wiki.ubuntu.com/Releases">https://wiki.ubuntu.com/Releases</a> .

If this is reproducible in a supported release, it will help immensely if you
filed a new report with the Ubuntu repository kernel (not mainline/upstream)
via a terminal:
ubuntu-bug linux

Please feel free to subscribe me to it.

For more on why this is helpful, please see
<a href="https://wiki.ubuntu.com/ReportingBugs">https://wiki.ubuntu.com/ReportingBugs</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14562131761.cFB89bC.17957--

--===============2114926627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2114926627==--
