From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67482] No DP output when optimus activated in bios
Date: Mon, 29 Jul 2013 16:08:50 +0000
Message-ID: <bug-67482-8800-p8GQGrUfAa@http.bugs.freedesktop.org/>
References: <bug-67482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0853703544=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0853703544==
Content-Type: multipart/alternative; boundary="1375114130.70bbC21.28090"; charset="us-ascii"


--1375114130.70bbC21.28090
Date: Mon, 29 Jul 2013 16:08:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67482

Mike <michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Mike <michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
My bad it works.

I needed to give:

xrandr --setprovideroutputsource nouveau Intel

and then

xrandr --setprovideroffloadsink nouveau Intel

cheers

Mike

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375114130.70bbC21.28090
Date: Mon, 29 Jul 2013 16:08:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:michele.cane&#64;gmail.com" title="Mike &lt;michele.cane&#64;gmail.com&gt;"> <span class="fn">Mike</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - No DP output when optimus activated in bios"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67482">bug 67482</a>
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
   title="RESOLVED FIXED - No DP output when optimus activated in bios"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67482#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - No DP output when optimus activated in bios"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67482">bug 67482</a>
              from <span class="vcard"><a class="email" href="mailto:michele.cane&#64;gmail.com" title="Mike &lt;michele.cane&#64;gmail.com&gt;"> <span class="fn">Mike</span></a>
</span></b>
        <pre>My bad it works.

I needed to give:

xrandr --setprovideroutputsource nouveau Intel

and then

xrandr --setprovideroffloadsink nouveau Intel

cheers

Mike</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375114130.70bbC21.28090--

--===============0853703544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0853703544==--
