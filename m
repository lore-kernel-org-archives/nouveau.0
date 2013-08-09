From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Fri, 09 Aug 2013 08:06:41 +0000
Message-ID: <bug-66177-8800-rtU6tXLsrm@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1134506228=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66177-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1134506228==
Content-Type: multipart/alternative; boundary="1376035601.376b2.14161"; charset="us-ascii"


--1376035601.376b2.14161
Date: Fri, 9 Aug 2013 08:06:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |martin.peres@ensi-bourges.f
                   |rg                          |r
  Attachment #81430|0                           |1
        is obsolete|                            |

--- Comment #10 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Created attachment 83879
  --> https://bugs.freedesktop.org/attachment.cgi?id=83879&action=edit
[PATCH 1/5] drm/nouveau/therm: Set the correct pwm_mode upon resume

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376035601.376b2.14161
Date: Fri, 9 Aug 2013 08:06:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
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
           <td>ASSIGNED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>martin.peres&#64;ensi-bourges.fr
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #81430 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83879" name="attach_83879" title="[PATCH 1/5] drm/nouveau/therm: Set the correct pwm_mode upon resume">attachment 83879</a> <a href="attachment.cgi?id=83879&amp;action=edit" title="[PATCH 1/5] drm/nouveau/therm: Set the correct pwm_mode upon resume">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=66177&amp;attachment=83879'>[review]</a>
[PATCH 1/5] drm/nouveau/therm: Set the correct pwm_mode upon resume</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376035601.376b2.14161--

--===============1134506228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1134506228==--
