From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [any/all(?) cards below nv50(?)] libdrm built
 with gcc4.8 causes crashes/lockups during normal operation,
 and resume from disk/memory
Date: Fri, 08 Nov 2013 08:04:57 +0000
Message-ID: <bug-71116-8800-5R0wFSciwi@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284587681=="
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


--===============1284587681==
Content-Type: multipart/alternative; boundary="1383897897.1C202.13569"; charset="us-ascii"


--1383897897.1C202.13569
Date: Fri, 8 Nov 2013 08:04:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #27 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383897897.1C202.13569
Date: Fri, 8 Nov 2013 08:04:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
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
   title="RESOLVED FIXED - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre><a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1">http://cgit.freedesktop.org/mesa/drm/commit/?id=482abbfafb56cbceaf5355c026434e638cddd0f1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383897897.1C202.13569--

--===============1284587681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1284587681==--
