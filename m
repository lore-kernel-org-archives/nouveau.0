From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Fri, 18 Jul 2014 21:56:50 +0000
Message-ID: <bug-78530-8800-IEJzERy4FN@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0227960074=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0227960074==
Content-Type: multipart/alternative; boundary="1405720609.06E33.4566"; charset="us-ascii"


--1405720609.06E33.4566
Date: Fri, 18 Jul 2014 21:56:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78530

Nikolay Amiantov <nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #11 from Nikolay Amiantov <nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Unfortunately, it wasn't a fix -- we've got another ACPI problem which
prevented nvidia from disabling at all, so everything "started to work". You
can find more about new problem at
https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-48768044.
I don't think we need another bug for this, do we?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405720609.06E33.4566
Date: Fri, 18 Jul 2014 21:56:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nikoamia&#64;gmail.com" title="Nikolay Amiantov &lt;nikoamia&#64;gmail.com&gt;"> <span class="fn">Nikolay Amiantov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">bug 78530</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">bug 78530</a>
              from <span class="vcard"><a class="email" href="mailto:nikoamia&#64;gmail.com" title="Nikolay Amiantov &lt;nikoamia&#64;gmail.com&gt;"> <span class="fn">Nikolay Amiantov</span></a>
</span></b>
        <pre>Unfortunately, it wasn't a fix -- we've got another ACPI problem which
prevented nvidia from disabling at all, so everything &quot;started to work&quot;. You
can find more about new problem at
<a href="https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-48768044">https://github.com/Bumblebee-Project/bbswitch/issues/78#issuecomment-48768044</a>.
I don't think we need another bug for this, do we?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405720609.06E33.4566--

--===============0227960074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0227960074==--
