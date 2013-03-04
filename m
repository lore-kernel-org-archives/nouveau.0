From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40275] DPMS Blank screen turn into white mess
Date: Mon, 04 Mar 2013 22:52:14 +0000
Message-ID: <bug-40275-8800-xUIMj4HDWE@http.bugs.freedesktop.org/>
References: <bug-40275-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0698995331=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40275-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0698995331==
Content-Type: multipart/alternative; boundary="1362437534.7bEbF71C1.28831"; charset="us-ascii"


--1362437534.7bEbF71C1.28831
Date: Mon, 4 Mar 2013 22:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40275

Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org

--- Comment #8 from Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> ---
A patch referencing this bug report has been merged in Linux v3.9-rc1:

commit 89e728ce07630a5584875b8a811a8bd02844b1d3
Author: Stefan de Konink <stefan-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org>
Date:   Sat Dec 22 18:04:37 2012 +0100

    drm/nouveau: Fix DPMS 1 on G4 Snowball, from snow white to coal black.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362437534.7bEbF71C1.28831
Date: Mon, 4 Mar 2013 22:52:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:florian&#64;mickler.org" title="Florian Mickler &lt;florian&#64;mickler.org&gt;"> <span class="fn">Florian Mickler</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - DPMS Blank screen turn into white mess"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40275">bug 40275</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>florian&#64;mickler.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - DPMS Blank screen turn into white mess"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40275#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - DPMS Blank screen turn into white mess"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40275">bug 40275</a>
              from <span class="vcard"><a class="email" href="mailto:florian&#64;mickler.org" title="Florian Mickler &lt;florian&#64;mickler.org&gt;"> <span class="fn">Florian Mickler</span></a>
</span></b>
        <pre>A patch referencing this bug report has been merged in Linux v3.9-rc1:

commit 89e728ce07630a5584875b8a811a8bd02844b1d3
Author: Stefan de Konink &lt;<a href="mailto:stefan&#64;konink.de">stefan&#64;konink.de</a>&gt;
Date:   Sat Dec 22 18:04:37 2012 +0100

    drm/nouveau: Fix DPMS 1 on G4 Snowball, from snow white to coal black.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362437534.7bEbF71C1.28831--

--===============0698995331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0698995331==--
