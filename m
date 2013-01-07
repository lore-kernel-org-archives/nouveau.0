From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58729] [bisected] Display fails to turn on after
 suspend/resume (NV86)
Date: Mon, 07 Jan 2013 16:23:59 +0000
Message-ID: <bug-58729-8800-rZSIyPo8Rd@http.bugs.freedesktop.org/>
References: <bug-58729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1532659163=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58729-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1532659163==
Content-Type: multipart/alternative; boundary="1357575840.7B2A00.2612"; charset="us-ascii"


--1357575840.7B2A00.2612
Date: Mon, 7 Jan 2013 16:23:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58729

J Binder <wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #72634|0                           |1
        is obsolete|                            |

--- Comment #4 from J Binder <wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org> ---
Created attachment 72636
  --> https://bugs.freedesktop.org/attachment.cgi?id=72636&action=edit
correct dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's
git master

Attached incorrectly collected dmesg. Correct dmesg appended.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357575840.7B2A00.2612
Date: Mon, 7 Jan 2013 16:24:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:wheel&#64;herr-der-mails.de" title="J Binder &lt;wheel&#64;herr-der-mails.de&gt;"> <span class="fn">J Binder</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">bug 58729</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #72634 is obsolete</td>
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
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">bug 58729</a>
              from <span class="vcard"><a class="email" href="mailto:wheel&#64;herr-der-mails.de" title="J Binder &lt;wheel&#64;herr-der-mails.de&gt;"> <span class="fn">J Binder</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72636" name="attach_72636" title="correct dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git master">attachment 72636</a> <a href="attachment.cgi?id=72636&amp;action=edit" title="correct dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git master">[details]</a></span>
correct dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's
git master

Attached incorrectly collected dmesg. Correct dmesg appended.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357575840.7B2A00.2612--

--===============1532659163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1532659163==--
