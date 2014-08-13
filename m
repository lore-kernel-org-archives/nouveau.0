From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76788] [NVA5] Linux version 3.13 freezes X under
 nouveau GT 220 card
Date: Wed, 13 Aug 2014 18:12:31 +0000
Message-ID: <bug-76788-8800-svQNxsoOM4@http.bugs.freedesktop.org/>
References: <bug-76788-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1398150752=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76788-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1398150752==
Content-Type: multipart/alternative; boundary="1407953551.DF5CCb1.5448"; charset="us-ascii"


--1407953551.DF5CCb1.5448
Date: Wed, 13 Aug 2014 18:12:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76788

Taylor Lookabaugh <jesus.christ.i.love-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Taylor Lookabaugh <jesus.christ.i.love-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Got busy with school, and forgot to report this has been fixed(the fan.c code
changes was the fix) as of 3.14.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407953551.DF5CCb1.5448
Date: Wed, 13 Aug 2014 18:12:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jesus.christ.i.love&#64;gmail.com" title="Taylor Lookabaugh &lt;jesus.christ.i.love&#64;gmail.com&gt;"> <span class="fn">Taylor Lookabaugh</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA5] Linux version 3.13 freezes X under nouveau GT 220 card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76788">bug 76788</a>
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
   title="RESOLVED FIXED - [NVA5] Linux version 3.13 freezes X under nouveau GT 220 card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76788#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA5] Linux version 3.13 freezes X under nouveau GT 220 card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76788">bug 76788</a>
              from <span class="vcard"><a class="email" href="mailto:jesus.christ.i.love&#64;gmail.com" title="Taylor Lookabaugh &lt;jesus.christ.i.love&#64;gmail.com&gt;"> <span class="fn">Taylor Lookabaugh</span></a>
</span></b>
        <pre>Got busy with school, and forgot to report this has been fixed(the fan.c code
changes was the fix) as of 3.14.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407953551.DF5CCb1.5448--

--===============1398150752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1398150752==--
