From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [NV34] libdrm built with gcc4.8 causes
	crashes/lockups
Date: Sun, 03 Nov 2013 16:16:07 +0000
Message-ID: <bug-71116-8800-04pExU7bVb@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462539519=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1462539519==
Content-Type: multipart/alternative; boundary="1383495367.353F8D2.20307"; charset="us-ascii"


--1383495367.353F8D2.20307
Date: Sun, 3 Nov 2013 16:16:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Ubuntu userspace upgrade   |[NV34] libdrm built with
                   |13.04 -> 13.10][regression] |gcc4.8 causes
                   |NV34 card fails to properly |crashes/lockups
                   |resume.                     |

--- Comment #17 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ronald all the thanks goes to the Andreas Radke (Arch developer) for finding
and bisecting the issue. FWIW Arch has been using clang for ~3 months to build
libdrm and it seems to work great.

Ideally one of the Ubuntu/GCC devs can take a look and provide more bit more
clarity than
"This hints at something depending on undefined evaluation order between
sequence points" [1]

Would that be an issue with nouveau code, gcc and/or both will hopefully be
determined soon.

Cheers
Emil
[1] http://gcc.gnu.org/ml/gcc-help/2013-07/msg00151.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383495367.353F8D2.20307
Date: Sun, 3 Nov 2013 16:16:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] libdrm built with gcc4.8 causes crashes/lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume.
           </td>
           <td>[NV34] libdrm built with gcc4.8 causes crashes/lockups
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] libdrm built with gcc4.8 causes crashes/lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] libdrm built with gcc4.8 causes crashes/lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Ronald all the thanks goes to the Andreas Radke (Arch developer) for finding
and bisecting the issue. FWIW Arch has been using clang for ~3 months to build
libdrm and it seems to work great.

Ideally one of the Ubuntu/GCC devs can take a look and provide more bit more
clarity than
&quot;This hints at something depending on undefined evaluation order between
sequence points&quot; [1]

Would that be an issue with nouveau code, gcc and/or both will hopefully be
determined soon.

Cheers
Emil
[1] <a href="http://gcc.gnu.org/ml/gcc-help/2013-07/msg00151.html">http://gcc.gnu.org/ml/gcc-help/2013-07/msg00151.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383495367.353F8D2.20307--

--===============1462539519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1462539519==--
