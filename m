From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65554] CPU lock with nouveau_fan_update
Date: Fri, 14 Jun 2013 20:24:50 +0000
Message-ID: <bug-65554-8800-Qy8zlMnYMP@http.bugs.freedesktop.org/>
References: <bug-65554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1411917199=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1411917199==
Content-Type: multipart/alternative; boundary="1371241490.c41EB81.22889"; charset="us-ascii"


--1371241490.c41EB81.22889
Date: Fri, 14 Jun 2013 20:24:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65554

ddamienn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from ddamienn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I've had the debug statement active for the last few days, but the error hasn't
re-occurred. I discovered that my video card's fan was only working
intermittently, which a clean seems to have fixed. Since the inactive fan
likely caused the error I was seeing, I am closing this bug report as invalid.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371241490.c41EB81.22889
Date: Fri, 14 Jun 2013 20:24:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ddamienn&#64;gmail.com" title="ddamienn&#64;gmail.com">ddamienn&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554">bug 65554</a>
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
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554">bug 65554</a>
              from <span class="vcard"><a class="email" href="mailto:ddamienn&#64;gmail.com" title="ddamienn&#64;gmail.com">ddamienn&#64;gmail.com</a>
</span></b>
        <pre>I've had the debug statement active for the last few days, but the error hasn't
re-occurred. I discovered that my video card's fan was only working
intermittently, which a clean seems to have fixed. Since the inactive fan
likely caused the error I was seeing, I am closing this bug report as invalid.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371241490.c41EB81.22889--

--===============1411917199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1411917199==--
