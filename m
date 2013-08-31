From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48090] Spam of system log with EDID messages
Date: Sat, 31 Aug 2013 01:49:32 +0000
Message-ID: <bug-48090-8800-T78FfTtYGy@http.bugs.freedesktop.org/>
References: <bug-48090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1574881873=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1574881873==
Content-Type: multipart/alternative; boundary="1377913772.715Bea6a2.11114"; charset="us-ascii"


--1377913772.715Bea6a2.11114
Date: Sat, 31 Aug 2013 01:49:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48090

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This seems identical to the issue in the other bug, feel free to undup it if
you think I'm wrong. Unfortunately I can't tell the linux kernel version you
used from your logs... but please try out linux 3.5 or 3.6 -- it should work
fine there, and also try with the latest kernel (e.g. 3.11-rc7) and report back
on whether things work again now (all without setting poll=0).

*** This bug has been marked as a duplicate of bug 64858 ***

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377913772.715Bea6a2.11114
Date: Sat, 31 Aug 2013 01:49:32 +0000
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
   title="RESOLVED DUPLICATE - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This seems identical to the issue in the other bug, feel free to undup it if
you think I'm wrong. Unfortunately I can't tell the linux kernel version you
used from your logs... but please try out linux 3.5 or 3.6 -- it should work
fine there, and also try with the latest kernel (e.g. 3.11-rc7) and report back
on whether things work again now (all without setting poll=0).

*** This bug has been marked as a duplicate of <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="show_bug.cgi?id=64858">bug 64858</a> ***</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377913772.715Bea6a2.11114--

--===============1574881873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1574881873==--
