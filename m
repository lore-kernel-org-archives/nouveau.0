From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60516] nouveau driver graphics corrupted in 3.7
 kernel for nvidia FX5200 [NV34] hardware
Date: Thu, 04 Apr 2013 19:50:04 +0000
Message-ID: <bug-60516-8800-Uz7sHWL99y@http.bugs.freedesktop.org/>
References: <bug-60516-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526810155=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60516-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1526810155==
Content-Type: multipart/alternative; boundary="1365105004.25aaFEe5.23666"; charset="us-ascii"


--1365105004.25aaFEe5.23666
Date: Thu, 4 Apr 2013 19:50:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60516

Jiri Slaby <jirislaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Jiri Slaby <jirislaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Fixed by f6853faa85793bf23b46787e4039824d275453c2 in 3.9-rc2.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365105004.25aaFEe5.23666
Date: Thu, 4 Apr 2013 19:50:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jirislaby&#64;gmail.com" title="Jiri Slaby &lt;jirislaby&#64;gmail.com&gt;"> <span class="fn">Jiri Slaby</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516">bug 60516</a>
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
   title="RESOLVED FIXED - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516">bug 60516</a>
              from <span class="vcard"><a class="email" href="mailto:jirislaby&#64;gmail.com" title="Jiri Slaby &lt;jirislaby&#64;gmail.com&gt;"> <span class="fn">Jiri Slaby</span></a>
</span></b>
        <pre>Fixed by f6853faa85793bf23b46787e4039824d275453c2 in 3.9-rc2.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365105004.25aaFEe5.23666--

--===============1526810155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1526810155==--
