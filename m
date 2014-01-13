From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70895] BUG: soft lockup - CPU#0 stuck for 22s!
 [Xorg:1292] after disable descrete card with switcheroo
Date: Mon, 13 Jan 2014 02:48:05 +0000
Message-ID: <bug-70895-8800-AdhEXl6Gow@http.bugs.freedesktop.org/>
References: <bug-70895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1327905905=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70895-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1327905905==
Content-Type: multipart/alternative; boundary="1389581285.F2cefFD2.2634"; charset="us-ascii"


--1389581285.F2cefFD2.2634
Date: Mon, 13 Jan 2014 02:48:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70895

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugzilla.kernel.org
                   |                            |/show_bug.cgi?id=64891

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
AFAICS this is the same issue as the one reported in the kernel bugzilla [1].
Can you try the patch [2] and let us know if you're still having problems.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=64891
[2] https://patchwork.kernel.org/patch/3416861/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389581285.F2cefFD2.2634
Date: Mon, 13 Jan 2014 02:48:05 +0000
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
   title="NEW --- - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">bug 70895</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugzilla.kernel.org/show_bug.cgi?id=64891
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">bug 70895</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>AFAICS this is the same issue as the one reported in the kernel bugzilla [1].
Can you try the patch [2] and let us know if you're still having problems.

[1] <a href="https://bugzilla.kernel.org/show_bug.cgi?id=64891">https://bugzilla.kernel.org/show_bug.cgi?id=64891</a>
[2] <a href="https://patchwork.kernel.org/patch/3416861/">https://patchwork.kernel.org/patch/3416861/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389581285.F2cefFD2.2634--

--===============1327905905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1327905905==--
