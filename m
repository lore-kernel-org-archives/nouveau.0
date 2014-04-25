From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77230] [NV4B] NV40 PGRAPH "unknown bits" - windows
 render in white
Date: Fri, 25 Apr 2014 05:04:42 +0000
Message-ID: <bug-77230-8800-jaUqHIznLA@http.bugs.freedesktop.org/>
References: <bug-77230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097550555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77230-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1097550555==
Content-Type: multipart/alternative; boundary="1398402282.30eb1.8546"; charset="us-ascii"


--1398402282.30eb1.8546
Date: Fri, 25 Apr 2014 05:04:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77230

Troy <guinness.meredith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #3 from Troy <guinness.meredith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Well it took a while but I eventually discovered Video Memory Test (VMT) which
is like memtest but for video ram.  I downloaded the ISO version (VMTCE) from
sourceforge:

http://sourceforge.net/projects/vmtce/files/

After completing the test there were 223,834 errors.

Nice... not.

Further investigation suggests nVidia might have switched the type of solder
the year after my card was manufactured, due to high failure rates in
notebooks:

http://www.tgdaily.com/hardware-features/39045-nvidia-gpu-failures-caused-by-material-problem-sources-claim

Anyway, my problem is indeed a hardware error, most likely all those solder
joints have micro fractures.

Thanks for pointing me in the right direction.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398402282.30eb1.8546
Date: Fri, 25 Apr 2014 05:04:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:guinness.meredith&#64;gmail.com" title="Troy &lt;guinness.meredith&#64;gmail.com&gt;"> <span class="fn">Troy</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">bug 77230</a>
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
   title="RESOLVED NOTABUG - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">bug 77230</a>
              from <span class="vcard"><a class="email" href="mailto:guinness.meredith&#64;gmail.com" title="Troy &lt;guinness.meredith&#64;gmail.com&gt;"> <span class="fn">Troy</span></a>
</span></b>
        <pre>Well it took a while but I eventually discovered Video Memory Test (VMT) which
is like memtest but for video ram.  I downloaded the ISO version (VMTCE) from
sourceforge:

<a href="http://sourceforge.net/projects/vmtce/files/">http://sourceforge.net/projects/vmtce/files/</a>

After completing the test there were 223,834 errors.

Nice... not.

Further investigation suggests nVidia might have switched the type of solder
the year after my card was manufactured, due to high failure rates in
notebooks:

<a href="http://www.tgdaily.com/hardware-features/39045-nvidia-gpu-failures-caused-by-material-problem-sources-claim">http://www.tgdaily.com/hardware-features/39045-nvidia-gpu-failures-caused-by-material-problem-sources-claim</a>

Anyway, my problem is indeed a hardware error, most likely all those solder
joints have micro fractures.

Thanks for pointing me in the right direction.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398402282.30eb1.8546--

--===============1097550555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1097550555==--
