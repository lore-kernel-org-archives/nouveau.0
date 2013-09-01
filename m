From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] [NV96] Brightness stuck to low value after
 suspend/resume on HP Elitebook 8530w
Date: Sun, 01 Sep 2013 14:42:26 +0000
Message-ID: <bug-39550-8800-nns0ixGD2C@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1642954022=="
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


--===============1642954022==
Content-Type: multipart/alternative; boundary="1378046547.b8Dbb7A58.18720"; charset="us-ascii"


--1378046547.b8Dbb7A58.18720
Date: Sun, 1 Sep 2013 14:42:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #68764|0                           |1
        is obsolete|                            |

--- Comment #45 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
Created attachment 85010
  --> https://bugs.freedesktop.org/attachment.cgi?id=85010&action=edit
drm/nv50: Fix backlight not working when PWM_DIV is uninitialised

Auke, Rick, Jesse: please test the attached patch. It should initialise PWM_DIV
on both boot and resume, solving your problems _if_ this routine is called
after running the initscripts. Please test to verify this is the case.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378046547.b8Dbb7A58.18720
Date: Sun, 1 Sep 2013 14:42:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #68764 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c45">Comment # 45</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85010" name="attach_85010" title="drm/nv50: Fix backlight not working when PWM_DIV is uninitialised">attachment 85010</a> <a href="attachment.cgi?id=85010&amp;action=edit" title="drm/nv50: Fix backlight not working when PWM_DIV is uninitialised">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=39550&amp;attachment=85010'>[review]</a>
drm/nv50: Fix backlight not working when PWM_DIV is uninitialised

Auke, Rick, Jesse: please test the attached patch. It should initialise PWM_DIV
on both boot and resume, solving your problems _if_ this routine is called
after running the initscripts. Please test to verify this is the case.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378046547.b8Dbb7A58.18720--

--===============1642954022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1642954022==--
