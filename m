From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49731] wine 1.5.2 and 3Dmark2001se on nv43 hits
 assertion in simplify_cmp: Assertion `inst->dst.index < 4096' failed
Date: Tue, 20 Aug 2013 22:29:02 +0000
Message-ID: <bug-49731-8800-zd2b3kmqHy@http.bugs.freedesktop.org/>
References: <bug-49731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0343490511=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0343490511==
Content-Type: multipart/alternative; boundary="1377037742.37FF1.7219"; charset="us-ascii"


--1377037742.37FF1.7219
Date: Tue, 20 Aug 2013 22:29:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49731

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
From a quick look at the assertion, it's in the "generic" part of mesa
(converting glsl -> tgsi). Please re-test with a fresh version of mesa, and if
the issue persists, please reopen/file under something not-nouveau-related.
(Not sure what categories they use in the tracker.) They'll probably want a
dump of the shader that causes the problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377037742.37FF1.7219
Date: Tue, 20 Aug 2013 22:29:02 +0000
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
   title="RESOLVED NOTOURBUG - wine 1.5.2 and 3Dmark2001se on nv43 hits assertion in simplify_cmp: Assertion `inst-&gt;dst.index &lt; 4096' failed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49731">bug 49731</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - wine 1.5.2 and 3Dmark2001se on nv43 hits assertion in simplify_cmp: Assertion `inst-&gt;dst.index &lt; 4096' failed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49731#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - wine 1.5.2 and 3Dmark2001se on nv43 hits assertion in simplify_cmp: Assertion `inst-&gt;dst.index &lt; 4096' failed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49731">bug 49731</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>From a quick look at the assertion, it's in the &quot;generic&quot; part of mesa
(converting glsl -&gt; tgsi). Please re-test with a fresh version of mesa, and if
the issue persists, please reopen/file under something not-nouveau-related.
(Not sure what categories they use in the tracker.) They'll probably want a
dump of the shader that causes the problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377037742.37FF1.7219--

--===============0343490511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0343490511==--
