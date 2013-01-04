From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Fri, 04 Jan 2013 08:57:05 +0000
Message-ID: <bug-50121-8800-MhHbLL1H79@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312695079=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0312695079==
Content-Type: multipart/alternative; boundary="1357289825.ac3DE75.29707"; charset="us-ascii"


--1357289825.ac3DE75.29707
Date: Fri, 4 Jan 2013 08:57:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #65931|0                           |1
        is obsolete|                            |

--- Comment #44 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 72499
  --> https://bugs.freedesktop.org/attachment.cgi?id=72499&action=edit
W520-4276CTO-NVC3 dmesg 3.8.0-rc1 suspend/resumce cycle screen garbage

Tested NVC3 3.7.1 openSUSE kernel and nouveau 3.8.0-rc1 as of 2013-01-03. Both
show same screen distortion (snowy background, button background and window
border ok) on gdm when resuming. Though the system is "usable" load wise and
doesn't lock-up.

Am I still in the scope of this bug with the following endlessly repeating
errors on resume? (Which will go away if killing X.)

[ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
Xorg[1009]]
[ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357289825.ac3DE75.29707
Date: Fri, 4 Jan 2013 08:57:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #65931 is obsolete</td>
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
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72499" name="attach_72499" title="W520-4276CTO-NVC3 dmesg 3.8.0-rc1 suspend/resumce cycle screen garbage">attachment 72499</a> <a href="attachment.cgi?id=72499&amp;action=edit" title="W520-4276CTO-NVC3 dmesg 3.8.0-rc1 suspend/resumce cycle screen garbage">[details]</a></span>
W520-4276CTO-NVC3 dmesg 3.8.0-rc1 suspend/resumce cycle screen garbage

Tested NVC3 3.7.1 openSUSE kernel and nouveau 3.8.0-rc1 as of 2013-01-03. Both
show same screen distortion (snowy background, button background and window
border ok) on gdm when resuming. Though the system is &quot;usable&quot; load wise and
doesn't lock-up.

Am I still in the scope of this bug with the following endlessly repeating
errors on resume? (Which will go away if killing X.)

[ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
Xorg[1009]]
[ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357289825.ac3DE75.29707--

--===============0312695079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0312695079==--
