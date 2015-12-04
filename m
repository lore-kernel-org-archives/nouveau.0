From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93250] After VGA change monitor do not detects
	properly
Date: Fri, 04 Dec 2015 17:13:32 +0000
Message-ID: <bug-93250-8800-0jHbGmTEnI@http.bugs.freedesktop.org/>
References: <bug-93250-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2031248799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93250-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2031248799==
Content-Type: multipart/alternative; boundary="1449249211.cdBBB8b2.13334"; charset="UTF-8"


--1449249211.cdBBB8b2.13334
Date: Fri, 4 Dec 2015 17:13:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93250

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[    0.000000] Linux version 3.16.7-29-desktop (geeko@buildhost) (gcc version
4.8.3 20140627 [gcc-4_8-branch revision 212064] (SUSE Linux) ) #1 SMP PREEMPT
Fri Oct 23 00:46:04 UTC 2015 (6be6a97)

I believe nouveau gained modesetting support for GM20x in Kernel 3.19.
Additional fixes were made in later kernel versions too. Feel free to reopen if
it doesn't work with kernel 4.2 or later.

Note that 'nomodeset' completely prevents nouveau from doing anything at all,
so you end up using vesa or whatnot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449249211.cdBBB8b2.13334
Date: Fri, 4 Dec 2015 17:13:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - After VGA change monitor do not detects properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93250">bug 93250</a>
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
   title="RESOLVED FIXED - After VGA change monitor do not detects properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93250#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - After VGA change monitor do not detects properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93250">bug 93250</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[    0.000000] Linux version 3.16.7-29-desktop (geeko&#64;buildhost) (gcc version
4.8.3 20140627 [gcc-4_8-branch revision 212064] (SUSE Linux) ) #1 SMP PREEMPT
Fri Oct 23 00:46:04 UTC 2015 (6be6a97)

I believe nouveau gained modesetting support for GM20x in Kernel 3.19.
Additional fixes were made in later kernel versions too. Feel free to reopen if
it doesn't work with kernel 4.2 or later.

Note that 'nomodeset' completely prevents nouveau from doing anything at all,
so you end up using vesa or whatnot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449249211.cdBBB8b2.13334--

--===============2031248799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2031248799==--
