From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68254] [NVC3] [Regression] no green channel since
 linux 3.10.x upgrade from 3.8
Date: Mon, 19 Aug 2013 11:28:38 +0000
Message-ID: <bug-68254-8800-eg5DEtvbLE@http.bugs.freedesktop.org/>
References: <bug-68254-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273886365=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68254-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1273886365==
Content-Type: multipart/alternative; boundary="1376911718.25ADbC2.15603"; charset="us-ascii"


--1376911718.25ADbC2.15603
Date: Mon, 19 Aug 2013 11:28:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68254

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Regression] no green       |[NVC3] [Regression] no
                   |channel since linux 3.10.x  |green channel since linux
                   |upgrade                     |3.10.x upgrade from 3.8

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This looks like a prime candidate for a bisect, should be quite obvious whether
the kernel is successful or not. You should only need to bisect in the
drivers/gpu/drm/nouveau directory (it's an argument to git bisect start, so
that it only considers commits that touched that path).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376911718.25ADbC2.15603
Date: Mon, 19 Aug 2013 11:28:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] [Regression] no green channel since linux 3.10.x upgrade from 3.8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68254">bug 68254</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Regression] no green channel since linux 3.10.x upgrade
           </td>
           <td>[NVC3] [Regression] no green channel since linux 3.10.x upgrade from 3.8
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] [Regression] no green channel since linux 3.10.x upgrade from 3.8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68254#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] [Regression] no green channel since linux 3.10.x upgrade from 3.8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68254">bug 68254</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This looks like a prime candidate for a bisect, should be quite obvious whether
the kernel is successful or not. You should only need to bisect in the
drivers/gpu/drm/nouveau directory (it's an argument to git bisect start, so
that it only considers commits that touched that path).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376911718.25ADbC2.15603--

--===============1273886365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1273886365==--
