From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77729] [NVE6] Screen freeze then X crash, GTX 660
Date: Mon, 28 Apr 2014 12:06:53 +0000
Message-ID: <bug-77729-8800-IMXuXKxxTt@http.bugs.freedesktop.org/>
References: <bug-77729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1122247903=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77729-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1122247903==
Content-Type: multipart/alternative; boundary="1398686813.2B781.5046"; charset="us-ascii"


--1398686813.2B781.5046
Date: Mon, 28 Apr 2014 12:06:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77729

soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #5 from soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
(In reply to comment #1)
> Can you check if this is the same as bug #72180 ? i.e. do the problems go
> away if using blob pgraph fw?

Using the blobg pgraph firmware solved my problem, I didn't have a single
lockup since then.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398686813.2B781.5046
Date: Mon, 28 Apr 2014 12:06:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:soundx94&#64;hotmail.com" title="soundx94&#64;hotmail.com">soundx94&#64;hotmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVE6] Screen freeze then X crash, GTX 660"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729">bug 77729</a>
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
   title="RESOLVED NOTABUG - [NVE6] Screen freeze then X crash, GTX 660"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVE6] Screen freeze then X crash, GTX 660"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729">bug 77729</a>
              from <span class="vcard"><a class="email" href="mailto:soundx94&#64;hotmail.com" title="soundx94&#64;hotmail.com">soundx94&#64;hotmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77729#c1">comment #1</a>)
<span class="quote">&gt; Can you check if this is the same as <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="show_bug.cgi?id=72180">bug #72180</a> ? i.e. do the problems go
&gt; away if using blob pgraph fw?</span >

Using the blobg pgraph firmware solved my problem, I didn't have a single
lockup since then.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398686813.2B781.5046--

--===============1122247903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1122247903==--
