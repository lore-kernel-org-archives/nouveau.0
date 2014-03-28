From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Fri, 28 Mar 2014 03:25:31 +0000
Message-ID: <bug-76475-8800-glyLFW7sbD@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1058833531=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1058833531==
Content-Type: multipart/alternative; boundary="1395977131.4c36EbBb2.6754"; charset="us-ascii"


--1395977131.4c36EbBb2.6754
Date: Fri, 28 Mar 2014 03:25:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Erm oops. I guess 'w' is not what I wanted (perhaps because the tasks aren't
actually blocked). From powertop, seems like it's from
nouveau_connector_hotplug_work which is probably triggering more work for
itself :(

That's a separate bug though. While I'm fairly sure I've seen this before, I
don't see a bug open about it. Could you open a fresh one, and include a boot
log with the following module settings (e.g. passed in via kernel cmdline)

nouveau.debug=debug drm.debug=0xe

I'm guessing this will keep generating oodles of output, I don't need the
infinite log, but a good chunk that includes a bunch of the repeats would be
great.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395977131.4c36EbBb2.6754
Date: Fri, 28 Mar 2014 03:25:31 +0000
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
   title="RESOLVED FIXED - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
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
   title="RESOLVED FIXED - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Erm oops. I guess 'w' is not what I wanted (perhaps because the tasks aren't
actually blocked). From powertop, seems like it's from
nouveau_connector_hotplug_work which is probably triggering more work for
itself :(

That's a separate bug though. While I'm fairly sure I've seen this before, I
don't see a bug open about it. Could you open a fresh one, and include a boot
log with the following module settings (e.g. passed in via kernel cmdline)

nouveau.debug=debug drm.debug=0xe

I'm guessing this will keep generating oodles of output, I don't need the
infinite log, but a good chunk that includes a bunch of the repeats would be
great.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395977131.4c36EbBb2.6754--

--===============1058833531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1058833531==--
