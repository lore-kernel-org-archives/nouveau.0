From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] [NV96] Brightness stuck to low value after
 suspend/resume on HP Elitebook 8530w
Date: Sun, 01 Sep 2013 15:28:20 +0000
Message-ID: <bug-39550-8800-8dLEBxfpEk@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1387010696=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1387010696==
Content-Type: multipart/alternative; boundary="1378049301.B0caac608.28112"; charset="us-ascii"


--1378049301.B0caac608.28112
Date: Sun, 1 Sep 2013 15:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org
                   |rg                          |
  Attachment #85010|0                           |1
        is obsolete|                            |

--- Comment #46 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
Created attachment 85012
  --> https://bugs.freedesktop.org/attachment.cgi?id=85012&action=edit
drm/nv50: Fix backlight not working when PWM_DIV is uninitialised (v2)

V2 fixes the reach of this patch.
From what I can tell the PWM_DIV is simply a divider for the initial PWM clock
or something, it does not affect the scope of the duty cycle. I therefore
assume 0x5e is always a good value to set. Traces from NV50:NVA0 would help
verify whether NVIDIA always sets this value or not.
This patch requires acpi_backlight=vendor to be set because it tests for the
presence of a backlight by testing drm->backlight. An alternative to this test
would be checking for the GPIO to be present and routed to SOR, but I wouldn't
be surprised if there is at least one device that expects our driver to route
it manually. How should we go about this?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378049301.B0caac608.28112
Date: Sun, 1 Sep 2013 15:28:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
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
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>r.spliet&#64;student.tudelft.nl
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #85010 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85012" name="attach_85012" title="drm/nv50: Fix backlight not working when PWM_DIV is uninitialised (v2)">attachment 85012</a> <a href="attachment.cgi?id=85012&amp;action=edit" title="drm/nv50: Fix backlight not working when PWM_DIV is uninitialised (v2)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=39550&amp;attachment=85012'>[review]</a>
drm/nv50: Fix backlight not working when PWM_DIV is uninitialised (v2)

V2 fixes the reach of this patch.
From what I can tell the PWM_DIV is simply a divider for the initial PWM clock
or something, it does not affect the scope of the duty cycle. I therefore
assume 0x5e is always a good value to set. Traces from NV50:NVA0 would help
verify whether NVIDIA always sets this value or not.
This patch requires acpi_backlight=vendor to be set because it tests for the
presence of a backlight by testing drm-&gt;backlight. An alternative to this test
would be checking for the GPIO to be present and routed to SOR, but I wouldn't
be surprised if there is at least one device that expects our driver to route
it manually. How should we go about this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378049301.B0caac608.28112--

--===============1387010696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1387010696==--
