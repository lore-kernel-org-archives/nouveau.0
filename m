From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45299] fullscreen GL window flickering with updates
 in other windows
Date: Thu, 01 Nov 2012 21:44:31 +0000
Message-ID: <bug-45299-8800-YIfJ9rU2mQ@http.bugs.freedesktop.org/>
References: <bug-45299-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563061003=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-45299-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1563061003==
Content-Type: multipart/alternative; boundary="1351806271.CeCed2.24543"; charset="us-ascii"


--1351806271.CeCed2.24543
Date: Thu, 1 Nov 2012 21:44:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=45299

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED
         QA Contact|                            |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
            Product|Mesa                        |xorg
          Component|Drivers/DRI/nouveau         |Driver/nouveau

--- Comment #1 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This bug was fixed in march on xf86-video-nouveau side.

If you can't update xf86-video-nouveau, you can workaround it by disabling
pageflipping in xorg.conf (see man nouveau).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351806271.CeCed2.24543
Date: Thu, 1 Nov 2012 21:44:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - fullscreen GL window flickering with updates in other windows"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45299">bug 45299</a>
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
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Product</td>
           <td>Mesa
           </td>
           <td>xorg
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Driver/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - fullscreen GL window flickering with updates in other windows"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45299#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - fullscreen GL window flickering with updates in other windows"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45299">bug 45299</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>This bug was fixed in march on xf86-video-nouveau side.

If you can't update xf86-video-nouveau, you can workaround it by disabling
pageflipping in xorg.conf (see man nouveau).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351806271.CeCed2.24543--

--===============1563061003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1563061003==--
