From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32855] Incorrect image stretching with Render in
 RepeatPad mode, NV50
Date: Mon, 26 Aug 2013 18:35:09 +0000
Message-ID: <bug-32855-8800-5P5SxSMCtA@http.bugs.freedesktop.org/>
References: <bug-32855-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2138516054=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32855-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2138516054==
Content-Type: multipart/alternative; boundary="1377542109.D86C1.14159"; charset="us-ascii"


--1377542109.D86C1.14159
Date: Mon, 26 Aug 2013 18:35:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=32855

Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|INVALID                     |WORKSFORME

--- Comment #9 from Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org> ---
It is user-hostile and unprofessional to mass-close bugs, even very old bugs,
without making any attempt to reproduce the problem first. 
http://www.jwz.org/doc/cadt.html

I'm willing to cut a *little* slack on this bug because it may have appeared to
require specific hardware to reproduce; however, I went to the trouble of
writing a self-contained test program and giving precise instructions for
reproduction, so I expect you to at least *try* to find the appropriate
hardware, and if you couldn't, to say so, instead of just "shrug, this might
have been fixed."  I would have been happy to test development drivers, even,
if I had ever been asked.

That said, with the latest software present in Debian unstable, the bug appears
to have been fixed, so I will leave it closed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377542109.D86C1.14159
Date: Mon, 26 Aug 2013 18:35:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:zackw&#64;panix.com" title="Zack Weinberg &lt;zackw&#64;panix.com&gt;"> <span class="fn">Zack Weinberg</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - Incorrect image stretching with Render in RepeatPad mode, NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32855">bug 32855</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - Incorrect image stretching with Render in RepeatPad mode, NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32855#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - Incorrect image stretching with Render in RepeatPad mode, NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32855">bug 32855</a>
              from <span class="vcard"><a class="email" href="mailto:zackw&#64;panix.com" title="Zack Weinberg &lt;zackw&#64;panix.com&gt;"> <span class="fn">Zack Weinberg</span></a>
</span></b>
        <pre>It is user-hostile and unprofessional to mass-close bugs, even very old bugs,
without making any attempt to reproduce the problem first. 
<a href="http://www.jwz.org/doc/cadt.html">http://www.jwz.org/doc/cadt.html</a>

I'm willing to cut a *little* slack on this bug because it may have appeared to
require specific hardware to reproduce; however, I went to the trouble of
writing a self-contained test program and giving precise instructions for
reproduction, so I expect you to at least *try* to find the appropriate
hardware, and if you couldn't, to say so, instead of just &quot;shrug, this might
have been fixed.&quot;  I would have been happy to test development drivers, even,
if I had ever been asked.

That said, with the latest software present in Debian unstable, the bug appears
to have been fixed, so I will leave it closed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377542109.D86C1.14159--

--===============2138516054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2138516054==--
