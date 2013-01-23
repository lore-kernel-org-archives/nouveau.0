From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Wed, 23 Jan 2013 04:36:37 +0000
Message-ID: <bug-50121-8800-u9ITatTEKc@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1457508203=="
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


--===============1457508203==
Content-Type: multipart/alternative; boundary="1358915797.fD17E5.17587"; charset="us-ascii"


--1358915797.fD17E5.17587
Date: Wed, 23 Jan 2013 04:36:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

Herton Krzesinski <herton-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #73421|0                           |1
        is obsolete|                            |

--- Comment #54 from Herton Krzesinski <herton-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> ---
Created attachment 73488
  --> https://bugs.freedesktop.org/attachment.cgi?id=73488&action=edit
Backport for 3.5 (and may be 3.6) - fixed

Sorry, the patch I posted had a small typo, this one is ok...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358915797.fD17E5.17587
Date: Wed, 23 Jan 2013 04:36:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:herton&#64;canonical.com" title="Herton Krzesinski &lt;herton&#64;canonical.com&gt;"> <span class="fn">Herton Krzesinski</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #73421 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c54">Comment # 54</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:herton&#64;canonical.com" title="Herton Krzesinski &lt;herton&#64;canonical.com&gt;"> <span class="fn">Herton Krzesinski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=73488" name="attach_73488" title="Backport for 3.5 (and may be 3.6) - fixed">attachment 73488</a> <a href="attachment.cgi?id=73488&amp;action=edit" title="Backport for 3.5 (and may be 3.6) - fixed">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=50121&amp;attachment=73488'>[review]</a>
Backport for 3.5 (and may be 3.6) - fixed

Sorry, the patch I posted had a small typo, this one is ok...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358915797.fD17E5.17587--

--===============1457508203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1457508203==--
