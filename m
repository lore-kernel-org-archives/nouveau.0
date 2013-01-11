From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58806] failed to create kernel channel, -12 on G4 PPC
Date: Fri, 11 Jan 2013 21:32:39 +0000
Message-ID: <bug-58806-8800-aYJsg90NcF@http.bugs.freedesktop.org/>
References: <bug-58806-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052957026=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58806-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1052957026==
Content-Type: multipart/alternative; boundary="1357939959.11c1a67e1.7609"; charset="us-ascii"


--1357939959.11c1a67e1.7609
Date: Fri, 11 Jan 2013 21:32:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58806

Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org

--- Comment #7 from Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> ---
A patch referencing this bug report has been merged in Linux v3.8-rc3:

commit eda85d6ad490923152544fba0473798b6cc0edf6
Author: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Date:   Mon Dec 31 03:34:59 2012 +0200

    drm/nouveau: fix init with agpgart-uninorth

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357939959.11c1a67e1.7609
Date: Fri, 11 Jan 2013 21:32:39 +0000
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
   title="RESOLVED FIXED - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806">bug 58806</a>
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
   title="RESOLVED FIXED - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806">bug 58806</a>
              from <span class="vcard"><a class="email" href="mailto:florian&#64;mickler.org" title="Florian Mickler &lt;florian&#64;mickler.org&gt;"> <span class="fn">Florian Mickler</span></a>
</span></b>
        <pre>A patch referencing this bug report has been merged in Linux v3.8-rc3:

commit eda85d6ad490923152544fba0473798b6cc0edf6
Author: Aaro Koskinen &lt;<a href="mailto:aaro.koskinen&#64;iki.fi">aaro.koskinen&#64;iki.fi</a>&gt;
Date:   Mon Dec 31 03:34:59 2012 +0200

    drm/nouveau: fix init with agpgart-uninorth</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357939959.11c1a67e1.7609--

--===============1052957026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1052957026==--
