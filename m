From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Tue, 28 May 2013 22:28:18 +0000
Message-ID: <bug-63135-8800-OaGLSMZxUy@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1917147768=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1917147768==
Content-Type: multipart/alternative; boundary="1369780098.2d32b1.12667"; charset="us-ascii"


--1369780098.2d32b1.12667
Date: Tue, 28 May 2013 22:28:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

Devin J. Pohly <djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #77445|0                           |1
        is obsolete|                            |

--- Comment #6 from Devin J. Pohly <djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 79921
  --> https://bugs.freedesktop.org/attachment.cgi?id=79921&action=edit
full syslog with nouveau.debug=debug

Attaching syslog with extra debug info, in case this is more useful than the
previous attachment.

(Note to poma: unless you are a Nouveau dev, gratuitously raising the sev and
prio fields to the top is likely to get a bug ignored.  Setting back.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369780098.2d32b1.12667
Date: Tue, 28 May 2013 22:28:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:djpohly+freedesktop&#64;gmail.com" title="Devin J. Pohly &lt;djpohly+freedesktop&#64;gmail.com&gt;"> <span class="fn">Devin J. Pohly</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #77445 is obsolete</td>
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:djpohly+freedesktop&#64;gmail.com" title="Devin J. Pohly &lt;djpohly+freedesktop&#64;gmail.com&gt;"> <span class="fn">Devin J. Pohly</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=79921" name="attach_79921" title="full syslog with nouveau.debug=debug">attachment 79921</a> <a href="attachment.cgi?id=79921&amp;action=edit" title="full syslog with nouveau.debug=debug">[details]</a></span>
full syslog with nouveau.debug=debug

Attaching syslog with extra debug info, in case this is more useful than the
previous attachment.

(Note to poma: unless you are a Nouveau dev, gratuitously raising the sev and
prio fields to the top is likely to get a bug ignored.  Setting back.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369780098.2d32b1.12667--

--===============1917147768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1917147768==--
